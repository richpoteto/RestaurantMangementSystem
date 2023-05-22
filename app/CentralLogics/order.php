<?php

namespace App\CentralLogics;

use App\Models\Food;
use App\Models\Admin;
use App\Models\Order;
use App\Models\AdminWallet;
use App\Models\BusinessSetting;
use App\Models\OrderTransaction;
use App\Models\RestaurantWallet;
use App\Models\DeliveryManWallet;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class OrderLogic
{
    public static function gen_unique_id()
    {
        return rand(1000, 9999) . '-' . Str::random(5) . '-' . time();
    }

    public static function track_order($order_id)
    {
        return Helpers::order_data_formatting(Order::with(['details', 'delivery_man.rating'])->where(['id' => $order_id])->first(), false);
    }

    public static function place_order($customer_id, $email, $customer_info, $cart, $payment_method, $discount, $coupon_code = null)
    {
        try {
            $or = [
                'id' => 100000 + Order::all()->count() + 1,
                'user_id' => $customer_id,
                'order_amount' => CartManager::cart_grand_total($cart) - $discount,
                'payment_status' => 'unpaid',
                'order_status' => 'pending',
                'payment_method' => $payment_method,
                'transaction_ref' => null,
                'discount_amount' => $discount,
                'coupon_code' => $coupon_code,
                'discount_type' => $discount == 0 ? null : 'coupon_discount',
                'shipping_address' => $customer_info['address_id'],
                'created_at' => now(),
                'updated_at' => now()
            ];

            $o_id = DB::table('orders')->insertGetId($or);

            foreach ($cart as $c) {
                $product = Food::where('id', $c['id'])->first();
                $or_d = [
                    'order_id' => $o_id,
                    'food_id' => $c['id'],
                    'seller_id' => $product->added_by == 'seller' ? $product->user_id : '0',
                    'product_details' => $product,
                    'qty' => $c['quantity'],
                    'price' => $c['price'],
                    'tax' => $c['tax'] * $c['quantity'],
                    'discount' => $c['discount'] * $c['quantity'],
                    'discount_type' => 'discount_on_product',
                    'variant' => $c['variant'],
                    'variation' => json_encode($c['variations']),
                    'delivery_status' => 'pending',
                    'shipping_method_id' => $c['shipping_method_id'],
                    'payment_status' => 'unpaid',
                    'created_at' => now(),
                    'updated_at' => now()
                ];
                DB::table('order_details')->insert($or_d);
            }
            if(config('mail.status'))
            {
                Mail::to($email)->send(new \App\Mail\OrderPlaced($o_id));
            }

        } catch (\Exception $e) {

        }

        return $o_id;
    }

    public static function updated_order_calculation($order)
    {
        return true;
    }
    
    public static function create_transaction($order, $received_by=false, $status = null)  
    {
        $order_amount = $order->order_amount - $order->delivery_charge - $order->total_tax_amount;
        $comission_amount = 0;
        
        $comission = \App\Models\BusinessSetting::where('key','admin_commission')->first()->value;
        if($comission > 0){
            $comission_amount = ($order_amount/ 100) * $comission;
        }
        
        $card_comission = \App\Models\BusinessSetting::where('key','card_commission')->first()->value;
        if($card_comission > 0){
            $comission_amount += ($order_amount/ 100) * $card_comission;
        }
        
        $flat_card_comission = \App\Models\BusinessSetting::where('key','flat_card_commission')->first()->value;
        if($flat_card_comission > 0){
            $comission_amount += ($order_amount/ 100) * $flat_card_comission;
        }
        
        $foreign_card_comission = \App\Models\BusinessSetting::where('key','foreign_card_commission')->first()->value;
        if($foreign_card_comission > 0){
            $comission_amount += ($order_amount/ 100) * $foreign_card_comission;
        }
        
        $dm_tips_manage_status = BusinessSetting::where('key', 'dm_tips_status')->first()->value;
        try{
            OrderTransaction::insert([
                'vendor_id' =>$order->restaurant->vendor->id,
                'delivery_man_id'=>$order->delivery_man_id,
                'order_id' =>$order->id,
                'order_amount'=>$order->order_amount,
                'restaurant_amount'=>$order_amount + $order->total_tax_amount - $comission_amount,
                'admin_commission'=>$comission_amount,
                'delivery_charge'=>$order->delivery_charge,
                'original_delivery_charge'=>$order->original_delivery_charge,
                'tax'=>$order->total_tax_amount,
                'received_by'=> $received_by?$received_by:'admin',
                'zone_id'=>$order->zone_id,
                'status'=> $status,
                'dm_tips'=> $dm_tips_manage_status == 1 ? $order->dm_tips : 0,
                'created_at' => now(),
                'updated_at' => now()
            ]);
            $adminWallet = AdminWallet::firstOrNew(
                ['admin_id' => Admin::where('role_id', 1)->first()->id]
            );

            $vendorWallet = RestaurantWallet::firstOrNew(
                ['vendor_id' => $order->restaurant->vendor->id]
            );

            $adminWallet->total_commission_earning = $adminWallet->total_commission_earning+$comission_amount;

            if($order->restaurant->self_delivery_system)
            {
                $vendorWallet->total_earning = $vendorWallet->total_earning + $order->delivery_charge;
                $vendorWallet->total_earning = $vendorWallet->total_earning + ($dm_tips_manage_status == 1 ? $order->dm_tips : 0);
            }
            else{
                $adminWallet->delivery_charge = $adminWallet->delivery_charge+$order->delivery_charge;
            }

            $vendorWallet->total_earning = $vendorWallet->total_earning+($order_amount + $order->total_tax_amount - $comission_amount -($dm_tips_manage_status == 1 ? $order->dm_tips : 0));
            try
            {
                DB::beginTransaction();
                if($received_by=='admin')
                {
                    $adminWallet->digital_received = $adminWallet->digital_received+$order->order_amount;
                }
                else if($received_by=='restaurant' && $order->payment_method == 'cash_on_delivery')
                {
                    $vendorWallet->collected_cash = $vendorWallet->collected_cash + $order->order_amount;
                    if($order->restaurant->self_delivery_system)
                    {
                        $vendorWallet->collected_cash = $vendorWallet->collected_cash + $order->delivery_charge;
                        $vendorWallet->collected_cash = $vendorWallet->collected_cash + ($dm_tips_manage_status == 1 ? $order->dm_tips : 0);
                    }
                }
                else if($received_by==false)
                {
                    $adminWallet->manual_received = $adminWallet->manual_received + $order->order_amount;
                }
                else if($received_by=='deliveryman' && $order->delivery_man->type == 'zone_wise' && $order->payment_method == 'cash_on_delivery')
                {
                    $dmWallet = DeliveryManWallet::firstOrNew(
                        ['delivery_man_id' => $order->delivery_man_id]
                    );
                    $dmWallet->collected_cash=$dmWallet->collected_cash+$order->order_amount;
                    if($dm_tips_manage_status == 1){
                        $dmWallet->total_earning = $dmWallet->total_earning + $order->dm_tips;
                    }
                    $dmWallet->save();
                }

                $adminWallet->save();
                $vendorWallet->save();
                DB::commit();
                if($order->user_id) CustomerLogic::create_loyalty_point_transaction($order->user_id, $order->id, $order->order_amount, 'order_place');

            }
            catch(\Exception $e)
            {
                DB::rollBack();
                info($e);
                return false;
            }
        }
        catch(\Exception $e){
            info($e);
            return false;
        }

        return true;
    }
    
    public static function create_reserve_transaction($order, $received_by=false, $status = null)  
    {
        $order_amount = $order->order_amount - $order->total_tax_amount;
        $comission_amount = 0;
        
        $comission = \App\Models\BusinessSetting::where('key','admin_commission')->first()->value;
        if($comission > 0){
            $comission_amount = ($order_amount/ 100) * $comission;
        }
        
        $card_comission = \App\Models\BusinessSetting::where('key','card_commission')->first()->value;
        if($card_comission > 0){
            $comission_amount += ($order_amount/ 100) * $card_comission;
        }
        
        $flat_card_comission = \App\Models\BusinessSetting::where('key','flat_card_commission')->first()->value;
        if($flat_card_comission > 0){
            $comission_amount += ($order_amount/ 100) * $flat_card_comission;
        }
        
        $foreign_card_comission = \App\Models\BusinessSetting::where('key','foreign_card_commission')->first()->value;
        if($foreign_card_comission > 0){
            $comission_amount += ($order_amount/ 100) * $foreign_card_comission;
        }
        
        try{
            OrderTransaction::insert([
                'vendor_id' =>$order->restaurant->vendor->id,
                'order_id' =>$order->id,
                'order_amount'=>$order->order_amount,
                'restaurant_amount'=>$order_amount + $order->total_tax_amount - $comission_amount,
                'admin_commission'=>$comission_amount,
                'delivery_charge'=>0,
                'original_delivery_charge'=>0,
                'tax'=>$order->total_tax_amount,
                'received_by'=> $received_by?$received_by:'admin',
                'zone_id'=>$order->zone_id,
                'status'=> $status,
                'delivery_man_id'=>0,
                'dm_tips'=> 0,
                'created_at' => now(),
                'updated_at' => now()
            ]);
            $adminWallet = AdminWallet::firstOrNew(
                ['admin_id' => Admin::where('role_id', 1)->first()->id]
            );

            $vendorWallet = RestaurantWallet::firstOrNew(
                ['vendor_id' => $order->restaurant->vendor->id]
            );

            $adminWallet->total_commission_earning = $adminWallet->total_commission_earning+$comission_amount;
            $vendorWallet->total_earning = $vendorWallet->total_earning+($order_amount + $order->total_tax_amount - $comission_amount);
            
            try
            {
                DB::beginTransaction();
                if($received_by=='admin')
                {
                    $adminWallet->digital_received = $adminWallet->digital_received+$order->order_amount;
                }
                else if($received_by=='restaurant' && $order->payment_method == 'cash_on_delivery')
                {
                    $vendorWallet->collected_cash = $vendorWallet->collected_cash + $order->order_amount;
                }
                else if($received_by==false)
                {
                    $adminWallet->manual_received = $adminWallet->manual_received + $order->order_amount;
                }

                $adminWallet->save();
                $vendorWallet->save();
                DB::commit();
                if($order->user_id) CustomerLogic::create_loyalty_point_transaction($order->user_id, $order->id, $order->order_amount, 'order_place');

            }
            catch(\Exception $e)
            {
                DB::rollBack();
                info($e);
                return false;
            }
        }
        catch(\Exception $e){
            info($e);
            return false;
        }

        return true;
    }

    public static function refund_order($order)
    {
        $order_transaction = $order->transaction;
        if($order_transaction == null || $order->restaurant == null)
        {
            return false;
        }
        $received_by = $order_transaction->received_by;

        $adminWallet = AdminWallet::firstOrNew(
            ['admin_id' => Admin::where('role_id', 1)->first()->id]
        );

        $vendorWallet = RestaurantWallet::firstOrNew(
            ['vendor_id' => $order->restaurant->vendor->id]
        );


        $adminWallet->total_commission_earning = $adminWallet->total_commission_earning - $order_transaction->admin_commission;

        $vendorWallet->total_earning = $vendorWallet->total_earning - $order_transaction->restaurant_amount;

        $refund_amount = $order->order_amount;

        $status = 'refunded_with_delivery_charge';
        if($order->order_status == 'delivered')
        {
            $refund_amount = $order->order_amount - $order->delivery_charge;
            $status = 'refunded_without_delivery_charge';
        }
        else
        {
            $adminWallet->delivery_charge = $adminWallet->delivery_charge - $order_transaction->delivery_charge;
        }
        try
        {
            DB::beginTransaction();
            if($received_by=='admin')
            {
                if($order->delivery_man_id && $order->payment_method != "cash_on_delivery")
                {
                    $adminWallet->digital_received = $adminWallet->digital_received - $refund_amount;
                }
                else
                {
                    $adminWallet->manual_received = $adminWallet->manual_received - $refund_amount;
                }

            }
            else if($received_by=='restaurant')
            {
                $vendorWallet->collected_cash = $vendorWallet->collected_cash - $refund_amount;
            }

                // DB::table('account_transactions')->insert([
                //     'from_type'=>'customer',
                //     'from_id'=>$order->user_id,
                //     'current_balance'=> 0,
                //     'amount'=> $refund_amount,
                //     'method'=>'CASH',
                //     'created_at' => now(),
                //     'updated_at' => now()
                // ]);

            else if($received_by=='deliveryman')
            {
                $dmWallet = DeliveryManWallet::firstOrNew(
                    ['delivery_man_id' => $order->delivery_man_id]
                );
                $dmWallet->collected_cash=$dmWallet->collected_cash - $refund_amount;
                $dmWallet->save();
            }
            $order_transaction->status = $status;
            $order_transaction->save();
            $adminWallet->save();
            $vendorWallet->save();
            DB::commit();
        }
        catch(\Exception $e)
        {
            DB::rollBack();
            info($e);
            return false;
        }
        return true;

    }

    public static function format_export_data($orders)
    {
        $data = [];
        foreach($orders as $key=>$order)
        {

            $data[]=[
                '#'=>$key+1,
                trans('messages.order')=>$order['id'],
                trans('messages.date')=>date('d M Y',strtotime($order['created_at'])),
                trans('messages.customer')=>$order->customer?$order->customer['f_name'].' '.$order->customer['l_name']:__('messages.invalid').' '.__('messages.customer').' '.__('messages.data'),
                trans('messages.Restaurant')=>\Str::limit($order->restaurant?$order->restaurant->name:__('messages.Restaurant deleted!'),20,'...'),
                trans('messages.payment').' '.trans('messages.status')=>$order->payment_status=='paid'?__('messages.paid'):__('messages.unpaid'),
                trans('messages.total')=>\App\CentralLogics\Helpers::format_currency($order['order_amount']),
                trans('messages.order').' '.trans('messages.status')=>trans('messages.'. $order['order_status']),
                trans('messages.order').' '.trans('messages.type')=>trans('messages.'.$order['order_type'])
            ];
        }
        return $data;
    }
}
