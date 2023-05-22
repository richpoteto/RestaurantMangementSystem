<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\Helpers;
use App\CentralLogics\CouponLogic;
use App\CentralLogics\CustomerLogic;
use App\Http\Controllers\Controller;
use App\Models\BusinessSetting;
use App\Models\Order;
use App\Models\Coupon;
use App\Models\OrderDetail;
use App\Models\Food;
use App\Models\Restaurant;
use App\Models\Reservation;
use App\Models\Tables;
use App\Models\ItemCampaign;
use App\Models\Zone;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Grimzy\LaravelMysqlSpatial\Types\Point;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class OrderController extends Controller
{
    public function track_order(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        $order = Order::with(['restaurant', 'delivery_man.rating'])->withCount('details')->where(['id' => $request['order_id'], 'user_id' => $request->user()->id])->Notpos()->first();
        if($order)
        {
            $order['restaurant'] = $order['restaurant']?Helpers::restaurant_data_formatting($order['restaurant']):$order['restaurant'];
            $order['delivery_address'] = $order['delivery_address']?json_decode($order['delivery_address']):$order['delivery_address'];
            $order['delivery_man'] = $order['delivery_man']?Helpers::deliverymen_data_formatting([$order['delivery_man']]):$order['delivery_man'];
            unset($order['details']);
        }
        else
        {
            return response()->json([
                'errors' => [
                    ['code' => 'schedule_at', 'message' => trans('messages.not_found')]
                ]
            ], 404);
        }
        return response()->json($order, 200);
    }

    public function place_order(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_amount' => 'required',
            'payment_method'=>'required|in:cash_on_delivery,digital_payment,wallet',
            'order_type' => 'required|in:take_away,delivery',
            'restaurant_id' => 'required',
            'distance' => 'required_if:order_type,delivery',
            'address' => 'required_if:order_type,delivery',
            'longitude' => 'required_if:order_type,delivery',
            'latitude' => 'required_if:order_type,delivery',
            'dm_tips' => 'nullable|numeric'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        if($request->payment_method == 'wallet' && Helpers::get_business_settings('wallet_status', false) != 1)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'payment_method', 'message' => trans('messages.customer_wallet_disable_warning')]
                ]
            ], 203);
        }
        
        $coupon = null;
        $delivery_charge = null;
        $schedule_at = $request->schedule_at?\Carbon\Carbon::parse($request->schedule_at):now();
        
        if($request->schedule_at && $schedule_at < now())
        {
            return response()->json([
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.you_can_not_schedule_a_order_in_past')]
                ]
            ], 406);
        }
        
        $restaurant = Restaurant::selectRaw('*, IF(((select count(*) from `restaurant_schedule` where `restaurants`.`id` = `restaurant_schedule`.`restaurant_id` and `restaurant_schedule`.`day` = '.$schedule_at->format('w').' and `restaurant_schedule`.`opening_time` < "'.$schedule_at->format('H:i:s').'" and `restaurant_schedule`.`closing_time` >"'.$schedule_at->format('H:i:s').'") > 0), true, false) as open')->where('id', $request->restaurant_id)->first();
        if(!$restaurant)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.restaurant_not_found')]
                ]
            ], 404);
        }

        if($request->schedule_at && !$restaurant->schedule_order)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'schedule_at', 'message' => trans('messages.schedule_order_not_available')]
                ]
            ], 406);
        }

        if($restaurant->open == false)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.restaurant_is_closed_at_order_time')]
                ]
            ], 406);
        }

        if ($request['coupon_code']) {
            $coupon = Coupon::active()->where(['code' => $request['coupon_code']])->first();
            if (isset($coupon)) {
                $staus = CouponLogic::is_valide($coupon, $request->user()->id ,$request['restaurant_id']);
                if($staus==407)
                {
                    return response()->json([
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.coupon_expire')]
                        ]
                    ], 407);
                }
                else if($staus==406)
                {
                    return response()->json([
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.coupon_usage_limit_over')]
                        ]
                    ], 406);
                }
                else if($staus==404)
                {
                    return response()->json([
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.not_found')]
                        ]
                    ], 404);
                }
                if($coupon->coupon_type == 'free_delivery')
                {
                    $delivery_charge = 0;
                    $coupon = null;
                }
            } else {
                return response()->json([
                    'errors' => [
                        ['code' => 'coupon', 'message' => trans('messages.not_found')]
                    ]
                ], 401);
            }
        }
        
        $per_km_shipping_charge = (float)BusinessSetting::where(['key' => 'per_km_shipping_charge'])->first()->value;
        $minimum_shipping_charge = (float)BusinessSetting::where(['key' => 'minimum_shipping_charge'])->first()->value;
        $original_delivery_charge = ($request->distance * $per_km_shipping_charge > $minimum_shipping_charge) ? $request->distance * $per_km_shipping_charge : $minimum_shipping_charge;
        
        if($request['order_type'] != 'take_away' && !$restaurant->free_delivery && !isset($delivery_charge))
        {
            if($restaurant->self_delivery_system)
            {
                $delivery_charge = $restaurant->delivery_charge;
                $original_delivery_charge = $restaurant->delivery_charge;
            }
            else
            {
                $delivery_charge = ($request->distance * $per_km_shipping_charge > $minimum_shipping_charge) ? $request->distance * $per_km_shipping_charge : $minimum_shipping_charge;
            }
        }

        if($request->latitude && $request->longitude)
        {
            $point = new Point($request->latitude,$request->longitude);
            $zone = Zone::where('id', $restaurant->zone_id)->contains('coordinates', $point)->first();
            if(!$zone)
            {
                $errors = [];
                array_push($errors, ['code' => 'coordinates', 'message' => trans('messages.out_of_coverage')]);
                return response()->json([
                    'errors' => $errors
                ], 403);
            }
        }

        $address = [
            'contact_person_name' => $request->contact_person_name?$request->contact_person_name:$request->user()->f_name.' '.$request->user()->f_name,
            'contact_person_number' => $request->contact_person_number?$request->contact_person_number:$request->user()->phone,
            'company_name' => $request->company_name?$request->company_name:'',
            'address_type' => $request->address_type?$request->address_type:'Delivery',
            'house' => $request->house,
            'road' => $request->road,
            'village_name' => $request->village_name,
            'apt_number' => $request->apt_number,
            'floor' => $request->floor,
            'address' => $request->address,
            'longitude' => (string)$request->longitude,
            'latitude' => (string)$request->latitude,
        ];

        $total_addon_price = 0;
        $product_price = 0;

        $order_details = [];
        $order = new Order();
        $order->id = 100000 + Order::all()->count() + 1;
        if (Order::find($order->id)) {
            $order->id = Order::orderBy('id','desc')->first()->id + 1;
        }

        $order->user_id = $request->user()->id;
        $order->device_id = $request->device_id;
        
        $order->order_amount = $request['order_amount'];
        $order->server_tip_method = $request->server_tip_method;

        $order->payment_method = $request->payment_method;
        $order->payment_status = $request['payment_method']=='wallet'?'paid':'unpaid';
        $order->order_status = $request['payment_method']=='digital_payment'?'failed':($request->payment_method == 'wallet'?'confirmed':'pending');
        $order->coupon_code = $request['coupon_code'];
        $order->transaction_reference = null;
        $order->order_note = $request['order_note'];
        $order->order_type = $request['order_type'];
        $order->restaurant_id = $request['restaurant_id'];
        $order->delivery_charge = round($delivery_charge, 2)??0;
        $order->original_delivery_charge = round($original_delivery_charge, 2);
        $order->delivery_address = json_encode($address);
        $order->schedule_at = $schedule_at;
        $order->scheduled = $request->schedule_at?1:0;
        $order->otp = rand(1000, 9999);
        $order->zone_id = $restaurant->zone_id;
        $dm_tips_manage_status = BusinessSetting::where('key', 'dm_tips_status')->first()->value;
        if ($dm_tips_manage_status == 1) {
            $order->dm_tips = $request->dm_tips ?? 0;
        } else {
            $order->dm_tips = 0;
        }
        $order->pending = now();
        $order->confirmed = $request->payment_method == 'wallet' ? now() : null;
        $order->created_at = now();
        $order->updated_at = now();
        foreach ($request['cart'] as $c) {
            if ($c['item_campaign_id'] != null) {
                $product = ItemCampaign::active()->find($c['item_campaign_id']);
                if ($product) {
                    $price = $product['price'];
                    $product->tax = $restaurant->tax;
                    $product = Helpers::product_data_formatting($product, false, false, app()->getLocale());
                    $addon_data = Helpers::calculate_addon_price(\App\Models\AddOn::whereIn('id',$c['add_on_ids'])->get(), $c['add_on_qtys']);
                    $or_d = [
                        'food_id' => null,
                        'item_campaign_id' => $c['item_campaign_id'],
                        'food_details' => json_encode($product),
                        'quantity' => $c['quantity'],
                        'price' => $price,
                        'tax_amount' => Helpers::tax_calculate($product, $price),
                        'discount_on_food' => Helpers::product_discount_calculate($product, $price, $restaurant),
                        'discount_type' => 'discount_on_product',
                        'variant' => json_encode($c['variant']),
                        'variation' => json_encode($c['variation']),
                        'add_ons' => json_encode($addon_data['addons']),
                        'total_add_on_price' => $addon_data['total_add_on_price'],
                        'created_at' => now(),
                        'updated_at' => now()
                    ];
                    $order_details[] = $or_d;
                    $total_addon_price += $or_d['total_add_on_price'];
                    $product_price += $price*$or_d['quantity'];
                } else {
                    return response()->json([
                        'errors' => [
                            ['code' => 'campaign', 'message' => trans('messages.product_unavailable_warning')]
                        ]
                    ], 401);
                }
            } else {
                $product = Food::active()->find($c['food_id']);
                if ($product) {
                    $price = $product['price'];
                    $product->tax = $restaurant->tax;
                    $product = Helpers::product_data_formatting($product, false, false, app()->getLocale());
                    $addon_data = Helpers::calculate_addon_price(\App\Models\AddOn::whereIn('id',$c['add_on_ids'])->get(), $c['add_on_qtys']);
                    $or_d = [
                        'food_id' => $c['food_id'],
                        'item_campaign_id' => null,
                        'food_details' => json_encode($product),
                        'quantity' => $c['quantity'],
                        'price' => round($price, 2),
                        'tax_amount' => round(Helpers::tax_calculate($product, $price), 2),
                        'discount_on_food' => Helpers::product_discount_calculate($product, $price, $restaurant),
                        'discount_type' => 'discount_on_product',
                        'variant' => json_encode($c['variant']),
                        'variation' => json_encode($c['variation']),
                        'add_ons' => json_encode($addon_data['addons']),
                        'total_add_on_price' => round($addon_data['total_add_on_price'], 2),
                        'created_at' => now(),
                        'updated_at' => now()
                    ];
                    $total_addon_price += $or_d['total_add_on_price'];
                    $product_price += $price*$or_d['quantity'];
                    $order_details[] = $or_d;
                } else {
                    return response()->json([
                        'errors' => [
                            ['code' => 'food', 'message' => trans('messages.product_unavailable_warning')]
                        ]
                    ], 401);
                }
            }
        }
        
        $total_price = $product_price + $total_addon_price;

        $tax = $restaurant->tax;
        $tax_amount= ($tax > 0)?(($total_price * $tax)/100):0;
        
        $service_charge = $restaurant->service_charge;
        $service_charge_amount= ($service_charge > 0)?(($total_price * $service_charge)/100):0;
        
        $promo = $restaurant->promo;
        $promo_amount= ($promo > 0)?(($total_price * $promo)/100):0;
        
        $server_tip_amount = 0;
        $serverTipMethod = $request->server_tip_method;
        if($serverTipMethod > 0){
            $server_tip = $restaurant->server_tip;
            $server_tip_amount= ($server_tip > 0)?(($total_price * $server_tip)/100):0;
        }
        
        $total_tax_amount= $tax_amount + $service_charge_amount + $promo_amount + $server_tip_amount;

        if($restaurant->minimum_order > $product_price + $total_addon_price)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.you_need_to_order_at_least', ['amount'=>$restaurant->minimum_order.' '.Helpers::currency_code()])]
                ]
            ], 406);
        }

        $free_delivery_over = BusinessSetting::where('key', 'free_delivery_over')->first()->value;
        if(isset($free_delivery_over))
        {
            if($free_delivery_over <= $product_price + $total_addon_price)
            {
                $order->delivery_charge = 0;
            }
        }

        if($coupon)
        {
            $coupon->increment('total_uses');
        }

        $order_amount = round($total_price + $total_tax_amount + $order->delivery_charge , 2);

        if($request->payment_method == 'wallet' && $request->user()->wallet_balance < $order_amount)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'order_amount', 'message' => trans('messages.insufficient_balance')]
                ]
            ], 203);
        }
        
        try {
            $order->coupon_discount_amount = round(0, 2);
            $order->coupon_discount_title = $coupon ? $coupon->title : '';

            $order->restaurant_discount_amount = round(0, 2);
            $order->total_tax_amount= round($total_tax_amount, 2);
            $order->order_amount = $order_amount + $order->dm_tips;
            $order->save();
            $order_id = $order->id;
            
            foreach ($order_details as $key => $item) {
                $order_details[$key]['order_id'] = $order->id;
            }
            OrderDetail::insert($order_details);
            Helpers::send_order_notification($order);

            $customer = $request->user();
            $customer->zone_id = $restaurant->zone_id;
            $customer->save();

            $restaurant->increment('total_order');
            if($request->payment_method == 'wallet') CustomerLogic::create_wallet_transaction($order->user_id, $order->order_amount, 'order_place', $order->id);

            if($order->order_status == 'pending')
            {
                Mail::to($customer['email'])->send(new \App\Mail\OrderPlaced($order->id));
            }
            
            return response()->json([
                'message' => trans('messages.order_placed_successfully'),
                'order_id' => $order->id,
                'total_ammount' => $total_price+$order->delivery_charge+$total_tax_amount
            ], 200);
            
        } catch (\Exception $e) {
            if($order_id){
                return response()->json([
                    'message' => $e->getMessage(),
                    'order_id' => $order->id,
                    'total_ammount' => $order->order_amount
                ], 201);
            }else{
                return response()->json([
                    'error' => $e->getMessage(),
                ], 403);
            }
        }
    }

    public function place_reserve_order(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_amount' => 'required',
            'payment_method'=>'required|in:cash_on_delivery,digital_payment,wallet',
            'order_type' => 'required|in:reservation',
            'restaurant_id' => 'required',
            'longitude' => 'required_if:order_type,delivery',
            'latitude' => 'required_if:order_type,delivery',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $coupon = null;
        $delivery_charge = null;
        $schedule_at = $request->schedule_at?\Carbon\Carbon::parse($request->schedule_at):now();
        
        if($schedule_at && $schedule_at < now())
        {
            return response()->json([
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.you_can_not_schedule_a_order_in_past')]
                ]
            ], 406);
        }
        $restaurant = Restaurant::selectRaw('*, IF(((select count(*) from `restaurant_schedule` where `restaurants`.`id` = `restaurant_schedule`.`restaurant_id` and `restaurant_schedule`.`day` = '.$schedule_at->format('w').' and `restaurant_schedule`.`opening_time` < "'.$schedule_at->format('H:i:s').'" and `restaurant_schedule`.`closing_time` >"'.$schedule_at->format('H:i:s').'") > 0), true, false) as open')->where('id', $request->restaurant_id)->first();

        if(!$restaurant)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.restaurant_not_found')]
                ]
            ], 404);
        }

        if($request->schedule_at && !$restaurant->schedule_order)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'schedule_at', 'message' => trans('messages.schedule_order_not_available')]
                ]
            ], 406);
        }

        if($restaurant->open == false)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.restaurant_is_closed_at_order_time')]
                ]
            ], 406);
        }

        if ($request['coupon_code']) {
            $coupon = Coupon::active()->where(['code' => $request['coupon_code']])->first();
            if (isset($coupon)) {
                $staus = CouponLogic::is_valide($coupon, $request->user_id ,$request['restaurant_id']);
                if($staus==407)
                {
                    return response()->json([
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.coupon_expire')]
                        ]
                    ], 407);
                }
                else if($staus==406)
                {
                    return response()->json([
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.coupon_usage_limit_over')]
                        ]
                    ], 406);
                }
                else if($staus==404)
                {
                    return response()->json([
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.not_found')]
                        ]
                    ], 404);
                }
                if($coupon->coupon_type == 'free_delivery')
                {
                    $delivery_charge = 0;
                    $coupon = null;
                }
            } else {
                return response()->json([
                    'errors' => [
                        ['code' => 'coupon', 'message' => trans('messages.not_found')]
                    ]
                ], 401);
            }
        }
        
        $delivery_charge = 0;
        $original_delivery_charge = 0;

        $address = [
            'contact_person_name' => $request->contact_person_name,
            'contact_person_number' => $request->contact_person_number,
            'company_name' => '',
            'address_type' => 'other',
            'house' => '',
            'road' => '',
            'village_name' => '',
            'apt_number' => '',
            'floor' => '',
            'address' => $request->address,
            'longitude' => (string)$request->longitude,
            'latitude' => (string)$request->latitude,
        ];

        $total_addon_price = 0;
        $product_price = 0;

        $order_details = [];
        $order = new Order();
        $order->id = 100000 + Order::all()->count() + 1;
        if (Order::find($order->id)) {
            $order->id = Order::orderBy('id','desc')->first()->id + 1;
        }

        $order->user_id = $request->user_id;
        $order->device_id = $request->device_id;

        $order->payment_method = $request->payment_method;
        $order->payment_status = $request['payment_method']=='wallet'?'paid':'unpaid';
        $order->confirmed = $request->payment_method == 'wallet' ? now() : null;
        $order->order_status = $request['payment_method']=='digital_payment'?'failed':($request->payment_method == 'wallet'?'confirmed':'pending');
        $order->coupon_code = $request['coupon_code'];
        $order->transaction_reference = null;
        $order->order_note = $request['order_note'];
        $order->order_type = 'reservation';
        $order->restaurant_id = $request['restaurant_id'];
        $order->dm_tips = 0;
        $order->delivery_charge = 0;
        $order->original_delivery_charge = 0;
        $order->delivery_address = json_encode($address);
        $order->schedule_at = $schedule_at;
        $order->scheduled = $request->schedule_at?1:0;
        $order->otp = rand(1000, 9999);
        $order->zone_id = $restaurant->zone_id;
        $order->pending = now();
        $order->created_at = now();
        $order->updated_at = now();
        foreach ($request['cart'] as $c) {
            $product = Food::active()->find($c['food_id']);
            if ($product) {
                $price = $product['price'];
                $product->tax = $restaurant->tax;
                $product = Helpers::product_data_formatting($product, false, false, app()->getLocale());
                $addon_data = Helpers::calculate_addon_price(\App\Models\AddOn::whereIn('id',$c['add_on_ids'])->get(), $c['add_on_qtys']);
                $or_d = [
                    'food_id' => $c['food_id'],
                    'item_campaign_id' => null,
                    'food_details' => json_encode($product),
                    'quantity' => $c['quantity'],
                    'price' => round($price, 2),
                    'tax_amount' => round(Helpers::tax_calculate($product, $price), 2),
                    'discount_on_food' => Helpers::product_discount_calculate($product, $price, $restaurant),
                    'discount_type' => 'discount_on_product',
                    'variant' => json_encode($c['variant']),
                    'variation' => json_encode($c['variation']),
                    'add_ons' => json_encode($addon_data['addons']),
                    'total_add_on_price' => round($addon_data['total_add_on_price'], 2),
                    'created_at' => now(),
                    'updated_at' => now()
                ];
                $total_addon_price += $or_d['total_add_on_price'];
                $product_price += $price*$or_d['quantity'];
                $order_details[] = $or_d;
            } else {
                return response()->json([
                    'errors' => [
                        ['code' => 'food', 'message' => trans('messages.product_unavailable_warning')]
                    ]
                ], 401);
            }
        }

        try {
            $order->tax = $restaurant->tax;
            $order->service_charge = $restaurant->service_charge;
            $order->server_tip_amount = $restaurant->server_tip;
            $order->promo = $restaurant->promo;
            $order->server_tip_method = $request->server_tip_method;
            
            $order->total_tax_amount = round($request->total_tax_amount , 2);
            $order->order_amount = round($request->order_amount , 2);
            
            $order->coupon_discount_amount = 0;
            $order->coupon_discount_title = $coupon ? $coupon->title : '';

            $order->restaurant_discount_amount = round(0, 2);
            $order->save();
            $order_id = $order->id;
            
            foreach ($order_details as $key => $item) {
                $order_details[$key]['order_id'] = $order->id;
            }
            
            OrderDetail::insert($order_details);
            Helpers::send_reserve_notification($order);
            
            $customer = User::find($order->user_id);
            $customer->zone_id = $restaurant->zone_id;
            $customer->save();

            $restaurant->increment('total_order');
            if($order->order_status == 'pending')
            {
               Mail::to($customer['email'])->send(new \App\Mail\OrderPlaced($order->id));
            }
        
            return response()->json([
                'message' => trans('messages.order_placed_successfully'),
                'order_id' => $order->id,
                'total_ammount' => $order->order_amount
            ], 200);
            
        } catch (\Exception $e) {
            if($order_id){
                return response()->json([
                    'message' => $e->getMessage(),
                    'order_id' => $order->id,
                    'total_ammount' => $order->order_amount
                ], 201);
            }else{
                return response()->json([
                    'error' => $e->getMessage(),
                ], 403);
            }
           
        }
    }

    public function place_reserve_place_order(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_amount' => 'required',
            'payment_method'=>'required|in:cash_on_delivery,digital_payment,wallet',
            'order_type' => 'required|in:reserveplace',
            'restaurant_id' => 'required',
            'address' => 'required_if:order_type,delivery',
            'longitude' => 'required_if:order_type,delivery',
            'latitude' => 'required_if:order_type,delivery',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $coupon = null;
        $delivery_charge = null;
        $schedule_at = $request->schedule_at?\Carbon\Carbon::parse($request->schedule_at):now();
        
        $restaurant = Restaurant::selectRaw('*, IF(((select count(*) from `restaurant_schedule` where `restaurants`.`id` = `restaurant_schedule`.`restaurant_id` and `restaurant_schedule`.`day` = '.$schedule_at->format('w').' and `restaurant_schedule`.`opening_time` < "'.$schedule_at->format('H:i:s').'" and `restaurant_schedule`.`closing_time` >"'.$schedule_at->format('H:i:s').'") > 0), true, false) as open')->where('id', $request->restaurant_id)->first();
        if(!$restaurant)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.restaurant_not_found')]
                ]
            ], 404);
        }

        if($request->schedule_at && !$restaurant->schedule_order)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'schedule_at', 'message' => trans('messages.schedule_order_not_available')]
                ]
            ], 406);
        }

        if($restaurant->open == false)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.restaurant_is_closed_at_order_time')]
                ]
            ], 406);
        }

        if ($request['coupon_code']) {
            $coupon = Coupon::active()->where(['code' => $request['coupon_code']])->first();
            if (isset($coupon)) {
                $staus = CouponLogic::is_valide($coupon, $request->user_id ,$request['restaurant_id']);
                if($staus==407)
                {
                    return response()->json([
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.coupon_expire')]
                        ]
                    ], 407);
                }
                else if($staus==406)
                {
                    return response()->json([
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.coupon_usage_limit_over')]
                        ]
                    ], 406);
                }
                else if($staus==404)
                {
                    return response()->json([
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.not_found')]
                        ]
                    ], 404);
                }
                if($coupon->coupon_type == 'free_delivery')
                {
                    $delivery_charge = 0;
                    $coupon = null;
                }
            } else {
                return response()->json([
                    'errors' => [
                        ['code' => 'coupon', 'message' => trans('messages.not_found')]
                    ]
                ], 401);
            }
        }
        
        $delivery_charge = 0;
        $original_delivery_charge = 0;

        $address = [
            'contact_person_name' => $request->contact_person_name,
            'contact_person_number' => $request->contact_person_number,
            'address_type' => $request->address_type?$request->address_type:'Reservation',
            'address' => $request->address,
            'floor' => $request->floor,
            'road' => $request->road,
            'house' => $request->house,
            'longitude' => (string)$request->longitude,
            'latitude' => (string)$request->latitude,
        ];

        $total_addon_price = 0;
        $product_price = 0;

        $order_details = [];
        $order = new Order();
        $order->id = 100000 + Order::all()->count() + 1;
        if (Order::find($order->id)) {
            $order->id = Order::orderBy('id','desc')->first()->id + 1;
        }

        $order->user_id = $request->user_id;
        $order->device_id = $request->device_id;

        $order->payment_method = $request->payment_method;
        $order->payment_status = $request['payment_method']=='wallet'?'paid':'unpaid';
        $order->confirmed = $request->payment_method == 'wallet' ? now() : null;
        $order->order_status = $request['payment_method']=='digital_payment'?'failed':($request->payment_method == 'wallet'?'confirmed':'pending');
        $order->coupon_code = $request['coupon_code'];
        $order->transaction_reference = null;
        $order->order_note = $request['order_note'];
        $order->order_type = 'reserveplace';
        $order->restaurant_id = $request['restaurant_id'];
        $order->dm_tips = 0;
        $order->delivery_charge = 0;
        $order->original_delivery_charge = 0;
        $order->delivery_address = json_encode($address);
        $order->schedule_at = $schedule_at;
        $order->scheduled = $request->schedule_at?1:0;
        $order->otp = rand(1000, 9999);
        $order->zone_id = $restaurant->zone_id;
        $order->pending = now();
        $order->created_at = now();
        $order->updated_at = now();
        foreach ($request['cart'] as $c) {
            $product = Food::active()->find($c['food_id']);
            if ($product) {
                $price = $product['price'];
                $product->tax = $restaurant->tax;
                $product = Helpers::product_data_formatting($product, false, false, app()->getLocale());
                $addon_data = Helpers::calculate_addon_price(\App\Models\AddOn::whereIn('id',$c['add_on_ids'])->get(), $c['add_on_qtys']);
                $or_d = [
                    'food_id' => $c['food_id'],
                    'item_campaign_id' => null,
                    'food_details' => json_encode($product),
                    'quantity' => $c['quantity'],
                    'price' => round($price, 2),
                    'tax_amount' => round(Helpers::tax_calculate($product, $price), 2),
                    'discount_on_food' => Helpers::product_discount_calculate($product, $price, $restaurant),
                    'discount_type' => 'discount_on_product',
                    'variant' => json_encode($c['variant']),
                    'variation' => json_encode($c['variation']),
                    'add_ons' => json_encode($addon_data['addons']),
                    'total_add_on_price' => round($addon_data['total_add_on_price'], 2),
                    'created_at' => now(),
                    'updated_at' => now()
                ];
                $total_addon_price += $or_d['total_add_on_price'];
                $product_price += $price*$or_d['quantity'];
                $order_details[] = $or_d;
            } else {
                return response()->json([
                    'errors' => [
                        ['code' => 'food', 'message' => trans('messages.product_unavailable_warning')]
                    ]
                ], 401);
            }
        }

        $order->tax = $restaurant->tax;
        $order->service_charge = $restaurant->service_charge;
        $order->server_tip_amount = $restaurant->server_tip;
        $order->promo = $restaurant->promo;
        $order->server_tip_method = $request->server_tip_method;
        
        $order->total_tax_amount = round($request->total_tax_amount , 2);
        $order->order_amount = round($request->order_amount , 2);
        
        $order->coupon_discount_amount = 0;
        $order->coupon_discount_title = $coupon ? $coupon->title : '';

        $order->restaurant_discount_amount = round(0, 2);
        $order->save();
        
        foreach ($order_details as $key => $item) {
            $order_details[$key]['order_id'] = $order->id;
        }
        
        OrderDetail::insert($order_details);
        Helpers::send_reserve_notification($order);
        
        $customer = User::find($order->user_id);
        $customer->zone_id = $restaurant->zone_id;
        $customer->save();

        $restaurant->increment('total_order');
        
        try{
            if($order->order_status == 'pending')
            {
                Mail::to($customer->email)->send(new \App\Mail\OrderPlaced($order->id));
            }
            return response()->json([
                'message' => trans('messages.order_placed_successfully'),
                'order_id' => $order->id,
                'total_ammount' => $order->order_amount
            ], 200);
        }
        catch (\Exception $e) {
           return response()->json([
                'message' => trans('messages.order_placed_successfully'),
                'order_id' => $order->id,
                'total_ammount' => $order->order_amount
            ], 200);
        }
    }

    public function get_order_list(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $paginator = Order::with(['restaurant', 'delivery_man.rating'])->withCount('details')
        ->where(['user_id' => $request->user()->id])
        ->whereIn('order_type', ['take_away','delivery'])
        ->whereIn('order_status', ['delivered','canceled','refund_requested','refunded','failed', 'confirmed'])->Notpos()->latest()
        ->paginate($request['limit'], ['*'], 'page', $request['offset']);
        $orders = array_map(function ($data) {
            $data['delivery_address'] = $data['delivery_address']?json_decode($data['delivery_address']):$data['delivery_address'];
            $data['restaurant'] = $data['restaurant']?Helpers::restaurant_data_formatting($data['restaurant']):$data['restaurant'];
            $data['delivery_man'] = $data['delivery_man']?Helpers::deliverymen_data_formatting([$data['delivery_man']]):$data['delivery_man'];
            return $data;
        }, $paginator->items());
        $data = [
            'total_size' => $paginator->total(),
            'limit' => $request['limit'],
            'offset' => $request['offset'],
            'orders' => $orders
        ];
        return response()->json($data, 200);
    }

    public function get_running_orders(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'limit' => 'required',
            'offset' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $paginator = Order::with(['restaurant', 'delivery_man.rating'])
        ->withCount('details')
        ->where(['user_id' => $request->user()->id])
        ->whereIn('order_type', ['take_away','delivery'])
        ->whereNotIn('order_status', ['delivered', 'confirmed','canceled','refund_requested','refunded','failed'])
        ->Notpos()->latest()
        ->paginate($request['limit'], ['*'], 'page', $request['offset']);

        $orders = array_map(function ($data) {
            $data['delivery_address'] = $data['delivery_address']?json_decode($data['delivery_address']):$data['delivery_address'];
            $data['restaurant'] = $data['restaurant']?Helpers::restaurant_data_formatting($data['restaurant']):$data['restaurant'];
            $data['delivery_man'] = $data['delivery_man']?Helpers::deliverymen_data_formatting([$data['delivery_man']]):$data['delivery_man'];
            return $data;
        }, $paginator->items());
        $data = [
            'total_size' => $paginator->total(),
            'limit' => $request['limit'],
            'offset' => $request['offset'],
            'orders' => $orders
        ];
        return response()->json($data, 200);
    }

    public function get_reserve_order_list(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $paginator = Order::withCount('details')
        ->where('user_id', $request->user()->id)
        ->whereIn('order_type',['reservation', 'reserveplace'])
        ->Notpos()->latest()->paginate($request['limit'], ['*'], 'page', $request['offset']);
        $orders = array_map(function ($data) {
            $data['delivery_address'] = $data['delivery_address']?json_decode($data['delivery_address']):$data['delivery_address'];
            $data['restaurant'] = $data['restaurant']?Helpers::restaurant_data_formatting($data['restaurant']):$data['restaurant'];
            $data['delivery_man'] = $data['delivery_man']?Helpers::deliverymen_data_formatting([$data['delivery_man']]):$data['delivery_man'];
            return $data;
        }, $paginator->items());
        $data = [
            'total_size' => $paginator->total(),
            'limit' => $request['limit'],
            'offset' => $request['offset'],
            'orders' => $orders
        ];
        return response()->json($data, 200);
    }

    public function get_order_details(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $details = OrderDetail::whereHas('order', function($query)use($request){
            return $query->where('user_id', $request->user()->id);
        })->where(['order_id' => $request['order_id']])->get();
        if ($details->count() > 0) {
            $details = $details = Helpers::order_details_data_formatting($details);
            return response()->json($details, 200);
        } else {
            return response()->json([
                'errors' => [
                    ['code' => 'order', 'message' => trans('messages.not_found')]
                ]
            ], 401);
        }
    }

    public function cancel_order(Request $request)
    {
        $order = Order::where(['user_id' => $request->user()->id, 'id' => $request['order_id']])->Notpos()->first();
        if(!$order){
                return response()->json([
                    'errors' => [
                        ['code' => 'order', 'message' => trans('messages.not_found')]
                    ]
                ], 401);
        }
        else if ($order->order_status == 'pending') {

            $order->order_status = 'canceled';
            $order->canceled = now();
            $order->save();
            Helpers::send_order_notification($order);
            return response()->json(['message' => trans('messages.order_canceled_successfully')], 200);
        }
        return response()->json([
            'errors' => [
                ['code' => 'order', 'message' => trans('messages.you_can_not_cancel_after_confirm')]
            ]
        ], 401);
    }

    public function refund_request(Request $request)
    {
        $order = Order::where(['user_id' => $request->user()->id, 'id' => $request['order_id']])->Notpos()->first();
        if(!$order){
                return response()->json([
                    'errors' => [
                        ['code' => 'order', 'message' => trans('messages.not_found')]
                    ]
                ], 401);
        }
        else if ($order->order_status == 'delivered') {

            $order->order_status = 'refund_requested';
            $order->refund_requested = now();
            $order->save();
            return response()->json(['message' => trans('messages.refund_request_placed_successfully')], 200);
        }
        return response()->json([
            'errors' => [
                ['code' => 'order', 'message' => trans('messages.you_can_not_request_for_refund_after_delivery')]
            ]
        ], 401);
    }

    public function update_payment_method(Request $request)
    {
        $config=Helpers::get_business_settings('cash_on_delivery');
        if($config['status']==0)
        {
            return response()->json([
                'errors' => [
                    ['code' => 'cod', 'message' => trans('messages.Cash on delivery order not available at this time')]
                ]
            ], 403);
        }
        $order = Order::where(['user_id' => $request->user()->id, 'id' => $request['order_id']])->Notpos()->first();
        if ($order) {
            Order::where(['user_id' => $request->user()->id, 'id' => $request['order_id']])->update([
                'payment_method' => 'cash_on_delivery', 'order_status'=>'pending', 'pending'=> now()
            ]);

            $fcm_token = $request->user()->cm_firebase_token;
            $value = Helpers::order_status_update_message('pending');
            try {
                if ($value) {
                    $data = [
                        'title' =>trans('messages.order_placed_successfully'),
                        'description' => $value,
                        'order_id' => $order->id,
                        'image' => '',
                        'type'=>'order_status',
                    ];
                    Helpers::send_push_notif_to_device($fcm_token, $data);
                    DB::table('user_notifications')->insert([
                        'data'=> json_encode($data),
                        'user_id'=>$request->user()->id,
                        'created_at'=>now(),
                        'updated_at'=>now()
                    ]);
                }
                if($order->order_type == 'delivery' && !$order->scheduled)
                {
                    $data = [
                        'title' =>trans('messages.order_placed_successfully'),
                        'description' => trans('messages.new_order_push_description'),
                        'order_id' => $order->id,
                        'image' => '',
                    ];
                    Helpers::send_push_notif_to_topic($data, $order->restaurant->zone->deliveryman_wise_topic, 'order_request');
                }

            } catch (\Exception $e) {
                info($e);
            }
            return response()->json(['message' => trans('messages.payment').' '.trans('messages.method').' '.trans('messages.updated_successfully')], 200);
        }
        return response()->json([
            'errors' => [
                ['code' => 'order', 'message' => trans('messages.not_found')]
            ]
        ], 404);
    }
    
    public function complete_order(Request $request){
        try{
            $order = Order::where(['user_id' => $request->user_id, 'id' => $request['order_id']])->first();
            if(!$order){
                    return response()->json([
                        'errors' => [
                            ['code' => 'order', 'message' => trans('messages.not_found')]
                        ]
                    ], 401);
            }
            else {
                $order->order_status = 'delivered';
                $order->save();
                
                $reservation = Reservation::where('id', $request['reservation_id'])->first();
                if($reservation){
                    $reservation->reserve_status = 3;
                    $reservation->save();
                    
                    $table = Tables::where('id', $reservation->table_id)->first();
                    if($table){
                        try{
                            $schedules = [];
                            $schedules = json_decode($table['schedules']);
                            $newSchedules = [];
                            foreach ($schedules as $sch) {
                                $schedule = [];
                                $schedule = json_decode($sch);
                                if($schedule->date != $reservation->reserve_date && $schedule->start_time != $reservation->start_time && $schedule->end_time != $reservation->end_time){
                                    $today = new DateTime('now');
                                    $date1 = new DateTime($schedule->date);
                                    $diff = $date1->diff($today);
                                    
                                    if($diff >= -7){
                                        array_push($newSchedules, [
                                            'date' => $schedule['date'], 
                                            'start_time' => $schedule['start_time'], 
                                            'end_time' => $schedule['end_time']
                                        ]);
                                    }
                                    
                                }
                            }
                        }
                        catch (\Exception $e) {
                            return response()->json([
                                'errors' => [
                                    ['code' => $e->getMessage()]
                                ]
                            ], 404);
                        }
                        
                        $table->schedules = json_encode($newSchedules);
                        
                        try{
                            $table->save();
                        }
                        catch (\Exception $e) {
                            return response()->json([
                                'errors' => [
                                    ['code' => $e->getMessage()]
                                ]
                            ], 404);
                        }
                        
                        
                    }
                }
                
                Helpers::send_order_notification($order);
                return response()->json(['message' => 'This order completed successfully.'], 200);
            }
            return response()->json([
                'errors' => [
                    ['code' => 'order', 'message' => 'You can not complete this order now.']
                ]
            ], 401);
        }
        catch (\Exception $e) {
            return response()->json([
                'errors' => [
                    ['code' => $e->getMessage()]
                ]
            ], 404);
        }
    }
}
