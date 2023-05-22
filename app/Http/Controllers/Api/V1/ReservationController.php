<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Validator;
use App\Models\Reservation;
use App\Models\Tables;
use App\Models\Order;
use App\Models\User;
use App\Models\RestaurantSchedule;
use App\Models\WithdrawRequest;
use App\CentralLogics\OrderLogic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class ReservationController extends Controller
{
    public function get_reservations(Request $request){
        try{
            if (!$request->hasHeader('zoneId')) {
                $errors = [];
                array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
                return response()->json([
                    'errors' => $errors
                ], 403);
            }
        
            $paginator = Reservation::where('customer_id', $request->customer_id)
            ->orderBy('order_id', 'desc')
            ->paginate(config('default_pagination'));
            return [
                'total_size' => $paginator->total(),
                'limit' => 1,
                'offset' => 50,
                'reservations' => $paginator->items()
            ];
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function get_reservation_info(Request $request){
        try{
            if (!$request->hasHeader('zoneId')) {
                $errors = [];
                array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
                return response()->json([
                    'errors' => $errors
                ], 403);
            }
        
            $reservation = Reservation::where('id', $request->reservation_id)->first();
            return [
                'status' => 'success',
                'reservation' => $reservation,
            ];
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function post_reservation(Request $request){
        try{
            $reservation = new Reservation;
            $reservation->venue_id = $request->venue_id;
            $reservation->chef_id = $request->chef_id;
            $reservation->customer_id = $request->customer_id;
            $reservation->table_id = $request->table_id;
            $reservation->order_id = $request->order_id;
            $reservation->device_id = $request->device_id;
            $reservation->number_in_party = $request->number_in_party;
            $reservation->venue_name = $request->venue_name;
            $reservation->order_name = '#' . $request->order_id;
            $reservation->chef_name = $request->chef_name;
            $reservation->chef_phone = $request->chef_phone;
            $reservation->customer_name = $request->customer_name;
            $reservation->customer_email = $request->customer_email;
            $reservation->customer_phone = $request->customer_phone;
            $reservation->venue_address = $request->venue_address;
            $reservation->special_notes = $request->special_notes;
            $reservation->description = '';
            $reservation->reserve_date = $request->reserve_date;
            $reservation->start_time = $request->start_time;
            $reservation->end_time = $request->end_time;
            $reservation->duration = $request->duration;
            $reservation->payment_method = $request->payment_method;
            $reservation->payment_status = $request->payment_status;
            $reservation->status = $request->status;
            $reservation->reserve_status = $request->reserve_status;
            $reservation->reserve_type = $request->reserve_type;
            $reservation->price = $request->price;
            $reservation->table_image = $request->table_image;
            $reservation->table_name = $request->table_name;
            
            $reservation->save();
            
            $order = Order::find($reservation->user_id);
            Helpers::send_reserve_notification($order);
            
            try{
                $customer = User::find($request->customer_id);
                Mail::to($customer['email'])->send(new \App\Mail\OrderPlaced($order->id));
            }catch (\Exception $ex) {
                info($ex);
            }
            
            return response()->json(['message' => 'This reservation posted successfully', 'reservation_id' => $reservation->id], 200);
        }
        catch(\Exception $e){
            return response()->json(['error' => $e->getMessage()], 201);
        }
    }
    
    public function post_reserve_place(Request $request){
        try{
            $reservation = new Reservation;
            $reservation->venue_id = $request->venue_id;
            $reservation->chef_id = $request->chef_id;
            $reservation->customer_id = $request->customer_id;
            $reservation->table_id = $request->table_id;
            $reservation->order_id = $request->order_id;
            $reservation->device_id = $request->device_id;
            $reservation->number_in_party = $request->number_in_party;
            $reservation->venue_name = $request->venue_name;
            $reservation->order_name = '#' . $request->order_id;
            $reservation->chef_name = $request->chef_name;
            $reservation->chef_phone = $request->chef_phone;
            $reservation->customer_name = $request->customer_name;
            $reservation->customer_email = $request->customer_email;
            $reservation->customer_phone = $request->customer_phone;
            $reservation->venue_address = $request->venue_address;
            $reservation->special_notes = $request->special_notes;
            $reservation->description = '';
            $reservation->reserve_date = $request->reserve_date;
            $reservation->start_time = $request->start_time;
            $reservation->end_time = $request->end_time;
            $reservation->duration = $request->duration;
            $reservation->payment_method = $request->payment_method;
            $reservation->payment_status = $request->payment_status;
            $reservation->status = $request->status;
            $reservation->reserve_status = $request->reserve_status;
            $reservation->reserve_type = $request->reserve_type;
            $reservation->price = $request->price;
            $reservation->table_image = '';
            $reservation->table_name = $request->table_name;
            
            $reservation->save();
            
            $order = Order::find($reservation->user_id);
            Helpers::send_reserve_notification($order);
            
            try{
                $customer = User::find($request->customer_id);
                Mail::to($customer['email'])->send(new \App\Mail\OrderPlaced($order->id));
            }catch (\Exception $ex) {
                info($ex);
            }
            
            return response()->json(['message' => 'This reservation posted successfully', 'reservation_id' => $reservation->id], 200);
        }
        catch(\Exception $e){
            return response()->json(['error' => $e->getMessage()], 201);
        }
    }
    
    public function update_reservation(Request $request){
        try{
            DB::table('reservations')
            ->where('customer_id', $request->customer_id)
            ->update([
                'payment_status' => $request->payment_status,
                'updated_at' => now(),
            ]);
            return response()->json(['message' => 'This reservation updated successfully'], 200);
        }
        catch(\Exception $e){
            return response()->json(['error' => $e->getMessage()], 201);
        }
    }
    
    public function update_reservation_pay(Request $request){
        try{
            DB::table('reservations')
            ->where('customer_id', $request->customer_id)
            ->update([
                'payment_status' => $request->payment_status,
                'updated_at' => now(),
            ]);
            
            $order = Order::where('id', $request['order_id'])->Notpos()->first();
            if($order->transaction == null)
            {
                $reveived_by = $order->payment_method == 'cash_on_delivery'?'restaurant':'admin';

                if(OrderLogic::create_reserve_transaction($order,$reveived_by, null))
                {
                    $order->payment_status = 'paid';
                }
                else
                {
                    return response()->json([
                        'errors' => [
                            ['code' => 'error', 'message' => trans('messages.faield_to_create_order_transaction')]
                        ]
                    ], 406);
                }
            }

            $order->details->each(function($item, $key){
                if($item->food)
                {
                    $item->food->increment('order_count');
                }
            });
            $order->customer->increment('order_count');
            $order->restaurant->increment('order_count');
            
            return response()->json(['message' => 'This reservation updated successfully'], 200);
        }
        catch(\Exception $e){
            return response()->json(['error' => $e->getMessage()], 201);
        }
    }
    
    public function get_tables(Request $request){
        try{
            $paginator = Tables::where('venue_id', $request->restaurant_id)
            ->paginate(config('default_pagination'));
            return [
                'total_size' => $paginator->total(),
                'limit' => 1,
                'offset' => 50,
                'tables' => $paginator->items()
            ];
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function update_tables(Request $request){
        try{
            $table = Tables::where('id', $request->id)->first();
            $table->table_name = $request->table_name;
            $table->image = $request->image;
            $table->venue_id = $request->venue_id;
            $table->reserved_status = $request->reserved_status;
            $table->schedules = $request->schedules;
            $table->capacity = $request->capacity;
            $table->floor_number = $request->floor_number;
            $table->status = $request->status;
            $table->created_at = $table->created_at;
            $table->updated_at = now();
            $table->save();
            return response()->json(['message' => 'This table updated successfully'], 200);
        }
        catch(\Exception $e){
            return response()->json(['error' => $e->getMessage()], 201);
        }
    }
}
