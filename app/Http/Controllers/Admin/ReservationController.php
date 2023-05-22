<?php

namespace App\Http\Controllers\Admin;

use App\Models\Reservation;
use App\Models\FoodOrder;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Zone;
use App\Models\DeliveryManWallet;
use App\Models\DeliveryMan;
use App\Models\Category;
use App\Models\Food;
use App\Models\BusinessSetting;
use App\Models\Coupon;
use App\Models\ItemCampaign;
use App\Models\Review;
use App\Models\AddOn;
use App\Models\Tables;
use App\Models\Vendor;
use App\Models\Restaurant;
use App\Models\User;
use App\Models\RestaurantSchedule;
use App\CentralLogics\CustomerLogic;
use App\CentralLogics\Helpers;
use App\CentralLogics\OrderLogic;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
use Brian2694\Toastr\Facades\Toastr;
use Grimzy\LaravelMysqlSpatial\Types\Point;
use Illuminate\Support\Facades\DB;
use App\Scopes\RestaurantScope;
use Rap2hpoutre\FastExcel\FastExcel;

class ReservationController extends Controller
{
    public function index()
    {
        try{
            $reservations = Reservation::whereIn('reserve_status', [0])->latest()->paginate(config('default_pagination'));
            return view('admin-views.reservation.index',compact('reservations'));
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function processing_view(){
        try{
            $reservations = Reservation::whereIn('reserve_status', [1])->latest()->paginate(config('default_pagination'));
            return view('admin-views.reservation.processing',compact('reservations'));
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function completed_view(){
        try{
            $reservations = Reservation::whereIn('reserve_status', [2])->latest()->paginate(config('default_pagination'));
            return view('admin-views.reservation.completed-view',compact('reservations'));
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function reserve_table(){
        $restaurants = Restaurant::all();
        $curDate = date("dd-MM-YYYY HH:mm");
        return view('admin-views.reservation.add_views.reserve_table',compact('restaurants', 'curDate'));
    }
    
    public function add_reservation(Request $request){
        $validator = Validator::make($request->all(), [
            'venue_id' => 'required',
            'table_id' => 'required',
            'number_in_party' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',
            'reserve_date' => 'required',
        ], [
            'venue_id.required' => 'Please select Venue',
            'table_id.required' => 'Please select a table',
            'start_time.required' => 'Please pick start time',
            'end_time.required' => 'Please pick end time'
        ]);
        
        try{
            if ($validator->fails())
            {
                Toastr::warning('Failed to create reservation, please check the information you entered.');
            }else{
                $reservation = new Reservation;
                $reservation->venue_id = $request->venue_id;
                
                $venue = Restaurant::where('id', $request->venue_id)->first();
                $reservation->venue_name = $venue->name;
                $reservation->venue_address = $venue->address;
                
                $vendor = Vendor::where('id', $venue->vendor_id)->first();
                $reservation->chef_id = $vendor->id;
                $reservation->chef_name = $vendor->f_name .' ' . $vendor->l_name;
                $reservation->chef_phone = $vendor->phone;
                
                $table = Tables::where('id', $request->table_id)->first();
                $reservation->table_id = $table->id;
                $reservation->table_name = $table->table_name;
                $reservation->table_image = $table->image;
                
                $reservation->number_in_party = $request->number_in_party;
                $reservation->reserve_date = $request->reserve_date;
                $reservation->start_time = $request->start_time;
                $reservation->end_time = $request->end_time;
                $reservation->save();
                
                $reservation->order_name = '#ORD' . $reservation->id;
                $reservation->save();
                
                return redirect(route('admin.reservation.add-guest-view', ['reservation_id' => $reservation->id]));
            }
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function add_guest_view($reservation_id){
        return view('admin-views.reservation.add_views.add_guest', compact('reservation_id'));
    }
    
    public function add_guest(Request $request){
        $validator = Validator::make($request->all(), [
            'customer_name' => 'required',
            'customer_email' => 'required',
            'customer_phone' => 'required',
        ], [
            'customer_name.required' => 'Please enter guest name',
            'customer_email.required' => 'Please enter guest email',
            'customer_phone.required' => 'Please enter phone number',
        ]);
        
        if ($validator->fails())
        {
            Toastr::warning('Failed to create guest information, please check the information you entered.');
        }else{
            try{
                $guest = User::where('phone', $request->customer_phone)->where('is_guest', 1)->first();
                if($guest!=null){
                    $guest->f_name = $request->customer_name;
                    $guest->l_name = '';
                    $guest->email = $request->customer_email;
                    $guest->save();
                    
                    $reservation = Reservation::where('id', $request->reservation_id)->first();
                    $reservation->customer_id = $guest->id;
                    $reservation->customer_name = $guest->f_name;
                    $reservation->customer_email = $guest->email;
                    $reservation->customer_phone = $guest->phone;
                    $reservation->special_notes = $request->special_notes;
                    $reservation->save();
                    
                    return redirect(route('admin.reservation.choose-foods-view', ['reservation_id' => $reservation->id]));
                }else{
                    $guest = new User;
                    $guest->f_name = $request->customer_name;
                    $guest->l_name = '';
                    $guest->password = '123456';
                    $guest->email = $request->customer_email;
                    $guest->phone = $request->customer_phone;
                    $guest->is_guest = 1;
                    $guest->save();
                    
                    $reservation = Reservation::where('id', $request->reservation_id)->first();
                    $reservation->customer_id = $guest->id;
                    $reservation->customer_name = $guest->f_name;
                    $reservation->customer_email = $guest->email;
                    $reservation->customer_phone = $guest->phone;
                    $reservation->special_notes = $request->special_notes;
                    $reservation->save();
                    
                    return redirect(route('admin.reservation.choose-foods-view', ['reservation_id' => $reservation->id]));
                }
            }
            catch(\Exception $e){
                return response()->json(['error' => $e], 201);
            }
            return response()->json([], 200); 
        }
    }
    
    public function choose_foods_view($reservation_id){
        $reserve = Reservation::where('id', $reservation_id)->first();
        $foods = Food::where('restaurant_id', $reserve->venue_id)->latest()->paginate(config('default_pagination'));
        return view('admin-views.reservation.add_views.choose_foods', compact('foods', 'reservation_id'));
    }
    
    public function add_food_cart($food_id, $reservation_id){
        $food = Food::where('id', $food_id)->first();
        $category = Category::where('id', $food->category_id)->first();
        $foods = [];
        
        $foodOrder = FoodOrder::where('reservation_id', $reservation_id)->first();
        
        if(isset($foodOrder)){
            if(isset($foodOrder->foods)){
                $foods = json_decode($foodOrder->foods);
                
                $fods = [];
                $cnt = 0;
                $pos = -1;
                
                if(count($foods)>0){
                    foreach($foods as $fod){
                        if($fod->food_id==$food_id){
                            $pos = $cnt;
                        }else{
                            array_push($fods, [
                                'food_id' => $fod->food_id,
                                'name' => $fod->name,
                                'image' => $fod->image,
                                'category' => $fod->category,
                                'price' => (float)$fod->price,
                                'amount' => 1
                            ]);
                        }
                        $cnt++;
                    }
                    if($pos!=-1){
                        $foodOrder->foods = json_encode($fods);
                        $foodOrder->save();
                        Toastr::success('Succesfully removed this food from your cart.');
                    }else{
                        array_push($fods, [
                            'food_id' => $food->id,
                            'name' => $food->name,
                            'image' => $food->image,
                            'category' => $category->name,
                            'price' => (float)$food->price,
                            'amount' => 1
                        ]);
                        $foodOrder->foods = json_encode($fods);
                        $foodOrder->save();
                        Toastr::success('Succesfully added this food to your cart.');
                    }
                }else{
                    array_push($fods, [
                        'food_id' => $food->id,
                        'name' => $food->name,
                        'image' => $food->image,
                        'category' => $category->name,
                        'price' => (float)$food->price,
                        'amount' => 1
                    ]);
                    $foodOrder->foods = json_encode($fods);
                    $foodOrder->save();
                    Toastr::success('Succesfully added this food to your cart.');
                }
            }else{
                array_push($foods, [
                    'food_id' => $food->id,
                    'name' => $food->name,
                    'image' => $food->image,
                    'category' => $category->name,
                    'price' => (float)$food->price,
                    'amount' => 1
                ]);
                $foodOrder->foods = json_encode($foods);
                $foodOrder->save();
                Toastr::success('Succesfully added this food to your cart.');
            }
        }else{
            $foodOrder = new FoodOrder;
            array_push($foods, [
                'food_id' => $food->id,
                'name' => $food->name,
                'image' => $food->image,
                'category' => $category->name,
                'price' => (float)$food->price,
                'amount' => 1
            ]);
            $foodOrder->foods = json_encode($foods);
            
            $reservation = Reservation::where('id', $reservation_id)->first();
            $foodOrder->reservation_id = $reservation->id;
            $foodOrder->venue_id = $reservation->venue_id;
            $foodOrder->table_id = $reservation->table_id;
            $foodOrder->order_number = $reservation->order_name;
            $foodOrder->order_date = $reservation->reserve_date . ' ' . $reservation->start_time . ' ' . $reservation->end_time;
            
            $venue = Restaurant::where('id', $reservation->venue_id)->first();
            $foodOrder->tax = $venue->tax;
            $foodOrder->created_at = now();
            
            $foodOrder->updated_at = now();
            $foodOrder->save();
            
            Toastr::success('Succesfully added this food to your cart.');
        }
        
        return back();
    }
    
    public function set_amount($reservationId){
        try{
            $reservation_id = $reservationId;
            $foodOrder = FoodOrder::where('reservation_id', $reservation_id)->first();
            if(isset($foodOrder)){
                $orderId = $foodOrder->id;
                
                $addons = [];
                $addons = json_decode($foodOrder->addons);
                
                $foodsArr = []; 
                $foodsArr = json_decode($foodOrder->foods);
                
                $foods = []; 
                foreach($foodsArr as $food){  
                    $addonTmp = [];
                    foreach($addons as $val){ 
                        if($val->food_id == $food->food_id){  
                            array_push($addonTmp, $val);
                        }
                    }
                    $food->addons = $addonTmp;
                    array_push($foods, $food); 
                }
                
                return view('admin-views.reservation.add_views.set_amount', compact('reservation_id', 'orderId', 'foods', 'addons', 'foodOrder'));
            }else{
                
            }
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function inc_amount($reservation_id, $orderId, $food_id){
        $foodOrder = FoodOrder::where('reservation_id', $reservation_id)->first();
        
        $foods = [];
        $foods = json_decode($foodOrder->foods);
        
        $pos = -1;
        $cnt = 0;
        $tmpArr = [];
        
        $food = Food::where('id', $food_id)->first();
        $category = Food::where('id', $food->category_id)->first();
        
        if(isset($foods)){
            if(count($foods)>0){
                foreach($foods as $fod){
                    if($fod->food_id==$food_id){
                        $pos = $cnt;
                        $fod->amount += 1;
                        array_push($tmpArr, $fod);
                    }else{
                        array_push($tmpArr, $fod);
                    }
                    $cnt++;
                }
                if($pos==-1){
                    array_push($tmpArr, [
                        'food_id' => $food_id,
                        'name' => $food->name,
                        'image' => $food->image,
                        'category' => $category->name,
                        'price' => (float)$food->price,
                        'amount' => 1
                    ]);
                }
            }else{
                array_push($tmpArr, [
                    'food_id' => $food_id,
                    'name' => $food->name,
                    'image' => $food->image,
                    'category' => $category->name,
                    'price' => (float)$food->price,
                    'amount' => 1
                ]);
            }
        }else{
            array_push($tmpArr, [
                'food_id' => $food_id,
                'name' => $food->name,
                'image' => $food->image,
                'category' => $category->name,
                'price' => (float)$food->price,
                'amount' => 1
            ]);
        }
        
        $foodOrder->foods = json_encode($tmpArr);
        try{
             $foodOrder->save();
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
        
        return back();
    }
    
    public function dec_amount($reservation_id, $orderId, $food_id){
        $foodOrder = FoodOrder::where('reservation_id', $reservation_id)->first();
        
        $foods = [];
        $foods = json_decode($foodOrder->foods);
        
        $pos = -1;
        $cnt = 0;
        $tmpArr = [];
        
        $food = Food::where('id', $food_id)->first();
        $category = Food::where('id', $food->category_id)->first();
        
        if(isset($foods)){
            if(count($foods)>0){
                foreach($foods as $fod){
                    if($fod->food_id==$food_id){
                        $pos = $cnt;
                        if($fod->amount>0){
                            $fod->amount -= 1;
                        }
                        array_push($tmpArr, $fod);
                    }else{
                        array_push($tmpArr, $fod);
                    }
                    $cnt++;
                }
                if($pos==-1){
                    array_push($tmpArr, [
                        'food_id' => $food_id,
                        'name' => $food->name,
                        'image' => $food->image,
                        'category' => $category->name,
                        'price' => (float)$food->price,
                        'amount' => 1
                    ]);
                }
            }else{
                array_push($tmpArr, [
                    'food_id' => $food_id,
                    'name' => $food->name,
                    'image' => $food->image,
                    'category' => $category->name,
                    'price' => (float)$food->price,
                    'amount' => 1
                ]);
            }
        }else{
            array_push($tmpArr, [
                'food_id' => $food_id,
                'name' => $food->name,
                'image' => $food->image,
                'category' => $category->name,
                'price' => (float)$food->price,
                'amount' => 1
            ]);
        }
        
        $foodOrder->foods = json_encode($tmpArr);
        try{
             $foodOrder->save();
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
        
        return back();
    }
    
    public function inc_addon($reservation_id, $orderId, $food_id, $addon_id){
        $foodOrder = FoodOrder::where('reservation_id', $reservation_id)->first();
        
        $addons = [];
        $addons = json_decode($foodOrder->addons);
        
        $tmpArr = [];
        
        if(isset($addons)){
            if(count($addons)>0){
                foreach($addons as $addon){
                    if($addon->addon_id==$addon_id && $addon->food_id==$food_id){
                        $addon->amount += 1;
                        array_push($tmpArr, $addon);
                    }else{
                        array_push($tmpArr, $addon);
                    }
                }
            }
        }
        
        $foodOrder->addons = json_encode($tmpArr);
        try{
             $foodOrder->save();
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
        
        return back();
    }
    
    public function dec_addon($reservation_id, $orderId, $food_id, $addon_id){
        $foodOrder = FoodOrder::where('reservation_id', $reservation_id)->first();
        
        $addons = [];
        $addons = json_decode($foodOrder->addons);
        
        $tmpArr = [];
        
        if(isset($addons)){
            if(count($addons)>0){
                foreach($addons as $addon){
                    if($addon->addon_id==$addon_id && $addon->food_id==$food_id){
                        if($addon->amount>0){
                            $addon->amount -= 1;
                        }
                        array_push($tmpArr, $addon);
                    }else{
                        array_push($tmpArr, $addon);
                    }
                }
            }
        }
        
        $foodOrder->addons = json_encode($tmpArr);
        try{
             $foodOrder->save();
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
        
        return back();
    }
    
    public function check_out(Request $request){
        var_dump($request->sub_total);
        // $reservation = Reservation::where('id', $request->reservation_id)->first();
        // $foodOrder = FoodOrder::where('reservation_id', $request->reservation_id)->first();
        // $customer = User::where('id', $reservation->customer_id)->first();
        
        // session()->put('my_customer_id', $customer->id);
        // session()->put('food_order_id', $foodOrder->id);
        
        // if (isset($customer) && isset($foodOrder)) {
        //     $data = [
        //         'name' => $customer->f_name,
        //         'email' => $customer->email,
        //         'phone' => $customer->phone,
        //     ];
        //     session()->put('data', $data);
        // }

        // return redirect(route('admin.reservation.payment-view', ['reservation_id' => $reservation->id]));
    }
    
    public function add_food_order(Request $request){
        $special_instruction = '';
        if($request->special_instruction!=null && $request->special_instruction != ''){
            $special_instruction = $request->special_instruction;
        }
        
        $foodOrder = FoodOrder::where('reservation_id', $request->reservation_id)->first();
        if(isset($foodOrder)){
            if($foodOrder->foods != ''){
                $foods = json_decode($foodOrder->foods);
                if(count($foods)>0){
                    $addons = [];
                    foreach($foods as $fod){
                        $food = Food::where('id', $fod->food_id)->first();
                        if(isset($food)){
                            if(isset($food->add_ons)){
                                $tmpAddons = [];
                                $tmpAddons = json_decode($food->add_ons);
                                if(count($tmpAddons)>0){
                                    foreach($tmpAddons as $addonId){
                                        $addon = AddOn::where('id', $addonId)->first();
                                        array_push($addons, [
                                            'food_id' => $food->id,
                                            'addon_id' => $addon->id,
                                            'name' => $addon->name,
                                            'price' => (float)$addon->price,
                                            'amount' => 1
                                        ]);
                                    }
                                }
                            }
                        }
                    }
                    $foodOrder->addons = json_encode($addons);
                    $foodOrder->special_instruction = $special_instruction;
                    try{
                        $foodOrder->save();
                        return redirect(route('admin.reservation.set-amount-view', ['reservation_id' => $request->reservation_id]));
                    }
                    catch(\Exception $e){
                        return response()->json(['error' => $e], 201);
                    }
                    
                }else{
                    Toastr::warning('Please select foods.');
                    return back();
                }
            }else{
                Toastr::warning('Please select foods.');
                return back();
            }
        }else{
            Toastr::warning('Please select foods.');
            return back();
        }
    }
    
    public function food_view($id){
        $product = Food::where(['id' => $id])->first();
        $reviews = Review::where(['food_id'=>$id])->latest()->paginate(config('default_pagination'));
        return view('admin-views.reservation.add_views.food_view', compact('product','reviews'));
    }
    
    public function payment_view($reservation_id){
        $reservation = Reservation::where('id', $reservation_id)->first();
        $foodOrder = FoodOrder::where('reservation_id', $reservation_id)->first();
        return view('admin-views.reservation.add_views.payment-view', compact('foodOrder', 'reservation_id'));
    }
    
    public function payment_stripe(Request $request){
        $foodOrder = FoodOrder::where('reservation_id', $request->reservation_id)->first();
        return redirect(route('admin.reservation.stripe-view', ['reservation_id' => $request->reservation_id]));
    }
    
    public function stripe_view($reservation_id){
        $foodOrder = FoodOrder::where('reservation_id', $reservation_id)->first();
        return view('admin-views.reservation.add_views.stripe-pay', compact('foodOrder', 'reservation_id'));
    }
    
    public function get_tables(Request $request) {
        $tables = Tables::where('venue_id', $request->venueid)->where('reserved_status', 0)->get();
        $tableOptions = '<option value="' . 0 . '" disabled selected>---Select---</option>';
        foreach ($tables as $row) {
            $tableOptions .= '<option value="' . $row->id . '">' . $row->table_name . '</option>';
        }
        
        $reviewCount = 0;
        $rating = 0.0;
        
        $venue = Restaurant::where('id', $request->venueid)->with('vendor')->first();
        $foods = Food::where('restaurant_id', $request->venueid)->get();
        
        foreach ($foods as $food) {
            if($food->rating_count > 0){
                $reviewCount++;
                $rating += $food->rating_count;
            }
        }
        
        $reviews = '';
        if($reviewCount == 0){
            $reviews = '(0 Reviews)';
        }else{
            if($reviewCount < 1000){
                $reviews = '(' . $reviewCount . ' Reviews)';
            }else if($reviewCount == 1000){
                $reviews = '(1k Reviews)';
            }else if($reviewCount > 1000 && $reviewCount < 1000000){
                $tk = $reviewCount / 1000;
                $avgRatingK = number_format((float)$tk, 1, '.', ''); 
                $reviews = '(' . $avgRatingK . 'k Reviews)';
            }else if($reviewCount == 1000000){
                $reviews = '(1M Reviews)';
            }else if($reviewCount > 1000000){
                $tm = $reviewCount / 1000000;
                $avgRatingM = number_format((float)$tm, 1, '.', ''); 
                $reviews = '(' . $avgRatingM . 'M Reviews)';
            }
        }
        
        $dispReviews = '';
        if($reviewCount == 0){
            $dispReviews = $reviews;
        }else{
            $tmp = $rating / $reviewCount;
            $avgRating = number_format((float)$tmp, 1, '.', ''); 
            $dispReviews = $avgRating . '/5 ' . $reviews;
        }
        
        $monTimeS = '';
        $monTimeE = '';
        $monTo = '';

        $tueTimeS = '';
        $tueTimeE = '';
        $tueTo = '';

        $wedTimeS = '';
        $wedTimeE = '';
        $wedTo = '';

        $turTimeS = '';
        $turTimeE = '';
        $turTo = '';

        $friTimeS = '';
        $friTimeE = '';
        $friTo = '';

        $satTimeS = '';
        $satTimeE = '';
        $satTo = '';

        $sunTimeS = '';
        $sunTimeE = '';
        $sunTo = '';
        
        $schedules = RestaurantSchedule::where('restaurant_id', $request->venueid)->get();
        foreach ($schedules as $schedule) {
            if($schedule->day == 1){
                $monTimeS = substr($schedule->opening_time, 0, -3);
                $monTimeE = substr($schedule->closing_time, 0, -3);
                $monTo = 'To';
            }else if($schedule->day == 2){
                $tueTimeS = substr($schedule->opening_time, 0, -3);
                $tueTimeE = substr($schedule->closing_time, 0, -3);
                $tueTo = 'To';
            }else if($schedule->day == 3){
                $wedTimeS = substr($schedule->opening_time, 0, -3);
                $wedTimeE = substr($schedule->closing_time, 0, -3);
                $wedTo = 'To';
            }else if($schedule->day == 4){
                $turTimeS = substr($schedule->opening_time, 0, -3);
                $turTimeE = substr($schedule->closing_time, 0, -3);
                $turTo = 'To';
            }else if($schedule->day == 5){
                $friTimeS = substr($schedule->opening_time, 0, -3);
                $friTimeE = substr($schedule->closing_time, 0, -3);
                $friTo = 'To';
            }else if($schedule->day == 6){
                $satTimeS = substr($schedule->opening_time, 0, -3);
                $satTimeE = substr($schedule->closing_time, 0, -3);
                $satTo = 'To';
            }else if($schedule->day == 0){
                $sunTimeS = substr($schedule->opening_time, 0, -3);
                $sunTimeE = substr($schedule->closing_time, 0, -3);
                $sunTo = 'To';
            }
        }

        $src = 'https://swushd.app/storage/app/public/vendor/' . $venue->vendor->image;
        $errorImage = "this.src='https://swushd.app/public/assets/admin/img/900x400/img1.jpg'";
        
        $venueData = '<div class="row"style="margin-left: 6px;"><img style="width: 124px; height: 124px; margin-top: 12px; border: 1px solid; border-radius: 50%; object-fit: cover;" onerror="' . $errorImage .'" src="' . $src . '" alt="Venue image"/>';
        $venueData .= '<div style="margin-left: 20px;"><label class="input-label"><font color="#505050">Venue Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#FF6600"><b>' . $venue->name .'</b></font></label>';
        $venueData .= '<label class="input-label"><font color="#505050">Chef Name:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' . $venue->vendor->f_name . '&nbsp;' . $venue->vendor->l_name .'</label>';
        $venueData .= '<label class="input-label"><font color="#505050">Delivery Time:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' . $venue->delivery_time . '&nbsp;min' .'</label>';
        $venueData .= '<div class="row"><i class="tio-call" style="margin-top: 5px; margin-left: 16px; margin-right: 5px; color: #006600;"></i>';
        $venueData .= '<label class="input-label">&nbsp;&nbsp;' . $venue->phone .'</label></div>';
        $venueData .= '<div class="row"><i class="tio-star" style="margin-top: 5px; margin-left: 16px; margin-right: 5px; color: #FF6600;"></i>';
        $venueData .= '<label class="input-label">&nbsp;&nbsp;' . $dispReviews .'</label></div>';
        $venueData .= '<div class="row"><i class="tio-home" style="margin-top: 5px; margin-left: 16px; margin-right: 5px; color: #006600;"></i>';
        $venueData .= '<label class="input-label text-small">&nbsp;&nbsp;' . wordwrap($venue->address, 40,"<br>\n&nbsp;&nbsp;") .'</label></div></div></div>';
        
        $venueData1 = '<div style="margin-left: 20px;"><b>Opening Times:</b><div class="card card-square shadow" style="width: 400px; height: 128px; margin-top: 12px; padding-right: 14px; padding-left: 14px; background-color: #E0E0E0">';
        
        $disableColor = '#989898';
        $activeColor = '#FF6600';

        $monColor = $monTimeS!=''?'#FF6600':'#989898';
        $tueColor = $tueTimeS!=''?'#FF6600':'#989898';
        $wedColor = $wedTimeS!=''?'#FF6600':'#989898';
        $turColor = $turTimeS!=''?'#FF6600':'#989898';
        $friColor = $friTimeS!=''?'#FF6600':'#989898';
        $satColor = $satTimeS!=''?'#FF6600':'#989898';
        $sunColor = $sunTimeS!=''?'#FFFFFF':'#989898';
        
        $venueMon = '<div class="row"><div style="margin-left: 10px;"><div class="card card-square shadow" style="margin-top: 6px; width: 46px; height: 46px; background-color: #FF6600; display: flex; justify-content: center;"><center><b><font color="' . $sunColor . '">S</font></b></center></div><div style="text-align:center; margin-top: 2px;"><div><font color="#CC6633">' . $sunTimeS . '</font></div><div>' . $sunTo . '</div><div><font color="#006600">' . $sunTimeE . '</font></div></div></div>';
        
        $venueTue = '<div style="margin-left: 10px;"><div class="card card-square shadow" style="margin-top: 6px; width: 46px; height: 46px; background-color: #ffffff; display: flex; justify-content: center;"><center><b><font color="' . $monColor . '">M</font></b></center></div><div style="text-align:center; margin-top: 2px;"><div><font color="#CC6633">' . $monTimeS . '</font></div><div>' . $monTo . '</div><div><font color="#006600">' . $monTimeE . '</font></div></div></div>';
        
        $venueWed = '<div style="margin-left: 10px;"><div class="card card-square shadow" style="margin-top: 6px; width: 46px; height: 46px; background-color: #ffffff; display: flex; justify-content: center;"><center><b><font color="' . $tueColor . '">T</font></b></center></div><div style="text-align:center; margin-top: 2px;"><div><font color="#CC6633">' . $tueTimeS . '</font></div><div>' . $tueTo . '</div><div><font color="#006600">' . $tueTimeE . '</font></div></div></div>';
        
        $venueTur = '<div style="margin-left: 10px;"><div class="card card-square shadow" style="margin-top: 6px; width: 46px; height: 46px; background-color: #ffffff; display: flex; justify-content: center;"><center><b><font color="' . $wedColor . '">W</font></b></center></div><div style="text-align:center; margin-top: 2px;"><div><font color="#CC6633">' . $wedTimeS . '</font></div><div>' . $wedTo . '</div><div><font color="#006600">' . $wedTimeE . '</font></div></div></div>';
        
        $venueFri = '<div style="margin-left: 10px;"><div class="card card-square shadow" style="margin-top: 6px; width: 44px; height: 46px; background-color: #ffffff; display: flex; justify-content: center;"><center><b><font color="' . $turColor . '">T</font></b></center></div><div style="text-align:center; margin-top: 2px;"><div><font color="#CC6633">' . $turTimeS . '</font></div><div>' . $turTo . '</div><div><font color="#006600">' . $turTimeE . '</font></div></div></div>';
        
        $venueSat = '<div style="margin-left: 10px;"><div class="card card-square shadow" style="margin-top: 6px; width: 46px; height: 46px; background-color: #ffffff; display: flex; justify-content: center;"><center><b><font color="' . $friColor . '">F</font></b></center></div><div style="text-align:center; margin-top: 2px;"><div><font color="#CC6633">' . $friTimeS . '</font></div><div>' . $friTo . '</div><div><font color="#006600">' . $friTimeE . '</font></div></div></div>';
        
        $venueSun = '<div style="margin-left: 10px; margin-right: 10px;"><div class="card card-square shadow" style="margin-top: 6px; width: 46px; height: 46px; background-color: #ffffff; display: flex; justify-content: center;"><center><b><font color="' . $satColor . '">S</font></b></center></div><div style="text-align:center; margin-top: 2px;"><div><font color="#CC6633">' . $satTimeS . '</font></div><div>' . $satTo . '</div><div><font color="#006600">' . $satTimeE . '</font></div></div></div></div>';
        
        $venueData1 .= $venueMon . $venueTue . $venueWed . $venueTur . $venueFri . $venueSat . $venueSun . '</div></div>';
        
        return response()->json(['options' => $tableOptions, 'venueData' => $venueData, 'venueData1' => $venueData1]);
    }
    
    public function get_table_info(Request $request) {
        $table = Tables::where('id', $request->table_id)->first();
        
        $errorImage = "this.src='https://swushd.app/public/assets/admin/img/900x400/img1.jpg'";
        $src = 'https://swushd.app/storage/app/public/tables/' . $table->image;
        
        $tableData = '<div class="row" style="margin-left: 12px;"><img style="width: 180px; height: 180px; border: 1px solid; border-radius: 10px;" onerror="' . $errorImage .'" src="' . $src . '" alt="Table image"/>';
        $tableData .= '<div style="margin-left: 32px; margin-top: 14px;"><label class="input-label">Table Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#CC3300" style="bold"><b>' . $table->table_name .'</b></font></label>';
        $tableData .= '<label class="input-label">Seats:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' . $table->capacity .'</label>';
        $tableData .= '<label class="input-label">Floor Number:&nbsp;&nbsp;&nbsp;' . $table->floor_number .'</label></div></div>';
        
        return response()->json(['tableData' => $tableData]);
    }

    public function view_reservation(Request $request)
    {
        try{
            $reservation = Reservation::where('id', $request->id)->first();
            
            $order = Order::with(['details', 'restaurant' => function ($query) {
                return $query->withCount('orders');
            }, 'customer' => function ($query) {
                return $query->withCount('orders');
            }, 'delivery_man' => function ($query) {
                return $query->withCount('orders');
            }, 'details.food' => function ($query) {
                return $query->withoutGlobalScope(RestaurantScope::class);
            }, 'details.campaign' => function ($query) {
                return $query->withoutGlobalScope(RestaurantScope::class);
            }])->where(['id' => $reservation->order_id])->Notpos()->first();
            
            if (isset($order)) {
                if (isset($order->restaurant) && $order->restaurant->self_delivery_system) {
                    $deliveryMen = DeliveryMan::where('restaurant_id', $order->restaurant_id)->available()->active()->get();
                } else {
                    if($order->restaurant !== null){
                        $deliveryMen = DeliveryMan::where('zone_id', $order->restaurant->zone_id)->available()->active()->get();
                    } else{
                        $deliveryMen = DeliveryMan::where('zone_id', '=', NULL )->active()->get();
                    }
                }
    
                $category = $request->query('category_id', 0);
                $categories = Category::active()->get();
                $keyword = $request->query('keyword', false);
                $key = explode(' ', $keyword);
                $products = Food::withoutGlobalScope(RestaurantScope::class)->where('restaurant_id', $order->restaurant_id)
                    ->when($category, function ($query) use ($category) {
                        $query->whereHas('category', function ($q) use ($category) {
                            return $q->whereId($category)->orWhere('parent_id', $category);
                        });
                    })
                    ->when($keyword, function ($query) use ($key) {
                        return $query->where(function ($q) use ($key) {
                            foreach ($key as $value) {
                                $q->orWhere('name', 'like', "%{$value}%");
                            }
                        });
                    })
                    ->latest()->paginate(10);
                $editing = false;
                if ($request->session()->has('order_cart')) {
                    $cart = session()->get('order_cart');
                    if (count($cart) > 0 && $cart[0]->order_id == $order->id) {
                        $editing = true;
                    } else {
                        session()->forget('order_cart');
                    }
                }
    
                $deliveryMen = Helpers::deliverymen_list_formatting($deliveryMen);
                
                return view('admin-views.reservation.view-reservation', compact('order', 'deliveryMen', 'categories', 'products', 'category', 
                'keyword', 'editing', 'reservation'));
            } else {
                Toastr::info(trans('messages.no_more_orders'));
                return back();
            }
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function service_tip(Request $request){
        $foodOrder = FoodOrder::find($request->id);
        $foodOrder->service_tip = $request->service_tip;
        $foodOrder->save();
        Toastr::success(trans('messages.status_updated'));
        return back();
    }
}
