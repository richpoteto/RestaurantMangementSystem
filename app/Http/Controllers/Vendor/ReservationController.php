<?php

namespace App\Http\Controllers\Vendor;

use App\Models\Reservation;
use App\Models\Order;
use App\Models\Zone;
use App\Models\DeliveryMan;
use App\Models\Category;
use App\Models\Food;
use App\Models\Vendor;
use App\Models\Restaurant;
use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Scopes\RestaurantScope;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
use Brian2694\Toastr\Facades\Toastr;
use Grimzy\LaravelMysqlSpatial\Types\Point;
use Illuminate\Support\Facades\DB;
use Rap2hpoutre\FastExcel\FastExcel;

class ReservationController extends Controller
{
    public function index()
    {
        try{
            $reservations = Reservation::whereIn('reserve_status', [0])
            ->whereIn('reserve_type', [0])
            ->where('venue_id',Helpers::get_restaurant_id())
            ->latest()
            ->paginate(config('default_pagination'));
            return view('vendor-views.reservation.index',compact('reservations'));
        }
        catch(\Exception $e){
            var_dump($e->getMessage());
            die;
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function processing_view(){
        try{
            $reservations = Reservation::where('reserve_status', [1])
            ->whereIn('reserve_type', [0])
            ->where('venue_id',Helpers::get_restaurant_id())
            ->latest()
            ->paginate(config('default_pagination'));
            return view('vendor-views.reservation.processing',compact('reservations'));
        }
        catch(\Exception $e){
            var_dump($e->getMessage());
            die;
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function ready_serve(){
        try{
            $reservations = Reservation::where('reserve_status', [2])
            ->whereIn('reserve_type', [0])
            ->where('venue_id',Helpers::get_restaurant_id())
            ->latest()
            ->paginate(config('default_pagination'));
            return view('vendor-views.reservation.ready-view',compact('reservations'));
        }
        catch(\Exception $e){
            var_dump($e->getMessage());
            die;
            return response()->json(['error' => $e], 201);
        }
    }
    
    public function completed_view(){
        try{
            $reservations = Reservation::where('reserve_status', [3])
            ->whereIn('reserve_type', [0])
            ->where('venue_id',Helpers::get_restaurant_id())
            ->latest()
            ->paginate(config('default_pagination'));
            return view('vendor-views.reservation.completed-view',compact('reservations'));
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
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
                
                return view('vendor-views.reservation.view-reservation', compact('order', 'deliveryMen', 'categories', 'products', 'category', 
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
    
    public function accept_order(Request $request){
        $reservation = Reservation::find($request->reservation_id);
        if($reservation->payment_status!='paid'){
            return response()->json(['error' => 'This user did not paid yet.'], 201);
        }else{
            $reservation->reserve_status = 1;
            $reservation->save();
            return response()->json(['success' => 'Successfully accept this reservation'], 200);
        }
    }
    
    public function ready_order(Request $request){
        $reservation = Reservation::find($request->reservation_id);
        $reservation->reserve_status = 2;
        $reservation->save();
        return response()->json(['success' => 'This reservation is ready for serve now.'], 200);
    }
}
