<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\CustomerAddress;
use App\Models\Order;
use App\Models\Food;
use App\Models\OrderDetail;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Models\Zone;
use Grimzy\LaravelMysqlSpatial\Types\Point;
class CustomerController extends Controller
{
    public function address_list(Request $request)
    {
        return response()->json(CustomerAddress::where('user_id', $request->user()->id)->latest()->get(), 200);
    }

    public function add_new_address(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'contact_person_name' => 'required',
            'address_type' => 'required',
            'contact_person_number' => 'required',
            'address' => 'required',
            'longitude' => 'required',
            'latitude' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $point = new Point($request->latitude,$request->longitude);
        $zone = Zone::contains('coordinates', $point)->first();
        if(!$zone)
        {
            $errors = [];
            array_push($errors, ['code' => 'coordinates', 'message' => trans('messages.service_not_available_in_this_area')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }

        $address = [
            'user_id' => $request->user()->id,
            'contact_person_name' => $request->contact_person_name,
            'contact_person_number' => $request->contact_person_number,
            'address_type' => $request->address_type,
            'company_name' => $request->company_name != null ? $request->company_name :'',
            'address' => $request->address,
            'floor' => $request->floor,
            'road' => $request->road,
            'village_name' => $request->village_name,
            'apt_number' => $request->apt_number,
            'house' => $request->house,
            'longitude' => $request->longitude,
            'latitude' => $request->latitude,
            'zone_id' => $zone->id,
            'created_at' => now(),
            'updated_at' => now()
        ];
        try{
            DB::table('customer_addresses')->insert($address);
            return response()->json(['message' => trans('messages.successfully_added'),'zone_id'=>$zone->id], 200);
        }catch(\Exception $e){
            return response()->json(['message' => $e->getMessage(), 'zone_id'=>$zone->id], 201);
        }
    }

    public function update_address(Request $request,$id)
    {
        $validator = Validator::make($request->all(), [
            'contact_person_name' => 'required',
            'address_type' => 'required',
            'contact_person_number' => 'required',
            'address' => 'required',
            'longitude' => 'required',
            'latitude' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        $point = new Point($request->latitude,$request->longitude);
        $zone = Zone::contains('coordinates', $point)->first();
        if(!$zone)
        {
            $errors = [];
            array_push($errors, ['code' => 'coordinates', 'message' => trans('messages.service_not_available_in_this_area')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }
        $address = [
            'user_id' => $request->user()->id,
            'contact_person_name' => $request->contact_person_name,
            'contact_person_number' => $request->contact_person_number,
            'address_type' => $request->address_type,
            'company_name' => $request->company_name != null ? $request->company_name :'',
            'address' => $request->address,
            'floor' => $request->floor,
            'road' => $request->road,
            'village_name' => $request->village_name,
            'apt_number' => $request->apt_number,
            'house' => $request->house,
            'longitude' => $request->longitude,
            'latitude' => $request->latitude,
            'zone_id' => $zone->id,
            'created_at' => now(),
            'updated_at' => now()
        ];
        DB::table('customer_addresses')->where('id',$id)->update($address);
        return response()->json(['message' => trans('messages.updated_successfully'),'zone_id'=>$zone->id], 200);
    }

    public function delete_address(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'address_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        if (DB::table('customer_addresses')->where(['id' => $request['address_id'], 'user_id' => $request->user()->id])->first()) {
            DB::table('customer_addresses')->where(['id' => $request['address_id'], 'user_id' => $request->user()->id])->delete();
            return response()->json(['message' => trans('messages.successfully_removed')], 200);
        }
        return response()->json(['message' => trans('messages.not_found')], 404);
    }

    public function get_order_list(Request $request)
    {
        $orders = Order::where(['user_id' => $request->user()->id])->get();
        return response()->json($orders, 200);
    }

    public function get_order_details(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $details = OrderDetail::where(['order_id' => $request['order_id']])->get();
        foreach ($details as $det) {
            $det['product_details'] = json_decode($det['product_details'], true);
        }

        return response()->json($details, 200);
    }

    public function info(Request $request)
    {
        $data = $request->user();
        $data['order_count'] =(integer)$request->user()->orders->count();
        $data['member_since_days'] =(integer)$request->user()->created_at->diffInDays();
        unset($data['orders']);
        return response()->json($data, 200);
    }

    public function guest_info(Request $request)
    {
        $data = $request->user();
        $data['order_count'] =(integer)$request->user()->orders->count();
        $data['member_since_days'] =(integer)$request->user()->created_at->diffInDays();
        unset($data['orders']);
        return response()->json($data, 200);
    }

    public function check_guest_email(Request $request)
    {
        $user_info = User::where('email', $request->email)->first();
        $exist = '';
        if($user_info!=null){
            $exist = 'There is same email.';
            return response()->json(['exist' => $exist], 200);
        }else{
            $exist1 = '';
            $user = User::where('phone', $request->phone)->first();
            if($user!=null){
                $exist1 = 'There is same phone number.';
                return response()->json(['exist' => $exist1], 200);
            }else{
                $exist2 = '';
                $phone = '+' . $request->phone;
                $user1 = User::where('phone', $phone)->first();
                if($user1!=null){
                    $exist2 = 'There is same phone number.';
                    return response()->json(['exist' => $exist2], 200);
                }else{
                    return response()->json(['exist' => ''], 200);
                }
            }
        }
    }

    public function update_profile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'f_name' => 'required',
            'l_name' => 'required',
            'email' => 'required|unique:users,email,'.$request->user()->id,
            'phone' => 'required',
        ], [
            'f_name.required' => 'First name is required!',
            'l_name.required' => 'Last name is required!',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $image = $request->file('image');

        if ($request->has('image')) {
            $imageName = Helpers::update('profile/', $request->user()->image, 'png', $request->file('image'));
        } else {
            $imageName = $request->user()->image;
        }

        if ($request['password'] != null && strlen($request['password']) > 5) {
            $pass = bcrypt($request['password']);
        } else {
            $pass = $request->user()->password;
        }

        $userDetails = [
            'f_name' => $request->f_name,
            'l_name' => $request->l_name,
            'email' => $request->email,
            'phone' => $request->phone,
            'image' => $imageName,
            'password' => $pass,
            'updated_at' => now()
        ];

        User::where(['id' => $request->user()->id])->update($userDetails);

        return response()->json(['message' => trans('messages.successfully_updated')], 200);
    }

    public function register_guest(Request $request)
    {
        try{
            $validator = Validator::make($request->all(), [
                'f_name' => 'required',
                'email' => 'required|unique:users,email,'.$request->user()->id,
            ], [
                'f_name.required' => 'First name is required!',
            ]);
    
            if ($validator->fails()) {
                return response()->json(['errors' => Helpers::error_processor($validator)], 403);
            }
    
            if (!$request->hasHeader('zoneId')) {
                $errors = [];
                array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
                return response()->json([
                    'errors' => $errors
                ], 403);
            }
            $zone_id= json_decode($request->header('zoneId'), true);
            
            $user_info = User::where('email', $request->email)->first();
            if($user_info!=null){
                return response()->json(['message' => 'Guest added successsfully.', 'user_id' => $user_info->id], 200);
            }else{
                $user = new User;
                $user->f_name = $request->f_name;
                $user->l_name = '';
                $user->email = $request->email;
                $user->phone = $request->phone;
                $user->password = '';
                $user->zone_id = $zone_id[0];
                $user->device_id = $request->device_id;
                $user->is_guest = 1;
                $user->save();
        
                return response()->json(['message' => 'Guest added successsfully.', 'user_id' => $user->id], 200);
            }    
        }
        catch(\Exception $e){
            return response()->json(['error' => $e->getMessage()], 201);
        }
    }
    
    public function update_interest(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'interest' => 'required|array',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $userDetails = [
            'interest' => json_encode($request->interest),
        ];

        User::where(['id' => $request->user()->id])->update($userDetails);

        return response()->json(['message' => trans('messages.interest_updated_successfully')], 200);
    }

    public function update_cm_firebase_token(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cm_firebase_token' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        DB::table('users')->where('id',$request->user()->id)->update([
            'cm_firebase_token'=>$request['cm_firebase_token']
        ]);

        return response()->json(['message' => trans('messages.updated_successfully')], 200);
    }

    public function get_suggested_food(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'errors' => $errors
            ], 403);
        }


        $zone_id= json_decode($request->header('zoneId'), true);

        $interest = $request->user()->interest;
        $interest = isset($interest) ? json_decode($interest):null;
        // return response()->json($interest, 200);

        $products =  Food::active()->whereHas('restaurant', function($q)use($zone_id){
            $q->whereIn('zone_id', $zone_id);
        })
        ->when(isset($interest), function($q)use($interest){
            return $q->whereIn('category_id',$interest);
        })
        ->when($interest == null, function($q){
            return $q->popular();
        })->limit(5)->get();
        $products = Helpers::product_data_formatting($products, true, false, app()->getLocale());
        return response()->json($products, 200);
    }

    public function update_zone(Request $request)
    {
        if (!$request->hasHeader('zoneId') && is_numeric($request->header('zoneId'))) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }

        $customer = $request->user();
        $customer->zone_id = (integer)json_decode($request->header('zoneId'), true)[0];
        $customer->save();
        return response()->json([], 200);
    }

    public function remove_account(Request $request)
    {
        $user = $request->user();
        
        if(Order::where('user_id', $user->id)->whereIn('order_status', ['pending','accepted','confirmed','processing','handover','picked_up'])->count())
        {
            return response()->json(['errors'=>[['code'=>'on-going', 'message'=>translate('messages.user_account_delete_warning')]]],203);
        }
        $request->user()->token()->revoke();
        $user->delete();
        return response()->json([]);
    }
}
