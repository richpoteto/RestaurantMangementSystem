<?php

namespace App\Http\Controllers\Vendor;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Food;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\OrderTransaction;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function dashboard(Request $request)
    {
        $params = [
            'statistics_type' => $request['statistics_type'] ?? 'overall'
        ];
        session()->put('dash_params', $params);

        $data = self::dashboard_order_stats_data();
        $earning = [];
        $commission = [];
        $from = Carbon::now()->startOfYear()->format('Y-m-d');
        $to = Carbon::now()->endOfYear()->format('Y-m-d');
        
        $restaurant_earnings = OrderTransaction::where(['vendor_id' => Helpers::get_vendor_id()])->select(
            DB::raw('IFNULL(sum(restaurant_amount),0) as earning'),
            DB::raw('IFNULL(sum(admin_commission),0) as commission'),
            DB::raw('YEAR(created_at) year, MONTH(created_at) month')
        )->whereBetween('created_at', [$from, $to])->groupby('year', 'month')->get()->toArray();
        
        for ($inc = 1; $inc <= 12; $inc++) {
            $earning[$inc] = 0;
            $commission[$inc] = 0;
            foreach ($restaurant_earnings as $match) {
                if ($match['month'] == $inc) {
                    $earning[$inc] = $match['earning'];
                    $commission[$inc] = $match['commission'];
                }
            }
        }

        $top_sell = Food::orderBy("order_count", 'desc')
        ->take(6)
        ->get();
        
        $most_rated_foods = Food::orderBy('rating_count','desc')
        ->take(6)
        ->get();
        
        $data['top_sell'] = $top_sell;
        $data['most_rated_foods'] = $most_rated_foods;

        return view('vendor-views.dashboard', compact('data', 'earning', 'commission', 'params'));
    }

    public function restaurant_data()
    {
        $new_pending_order = DB::table('orders')->where(['checked' => 0])->where('restaurant_id', Helpers::get_restaurant_id())->where('order_status','pending');;
        if(config('order_confirmation_model') != 'restaurant' && !Helpers::get_restaurant_data()->self_delivery_system)
        {
            $new_pending_order = $new_pending_order->where('order_type', 'take_away');
        }
        $new_pending_order = $new_pending_order->count();
        $new_confirmed_order = DB::table('orders')->where(['checked' => 0])->where('restaurant_id', Helpers::get_restaurant_id())->whereIn('order_status',['confirmed', 'accepted'])->whereNotNull('confirmed')->count();
        
        return response()->json([
            'success' => 1,
            'data' => ['new_pending_order' => $new_pending_order, 'new_confirmed_order' => $new_confirmed_order]
        ]);
    }

    public function order_stats(Request $request)
    {
        $params = session('dash_params');
        foreach ($params as $key => $value) {
            if ($key == 'statistics_type') {
                $params['statistics_type'] = $request['statistics_type'];
            }
        }
        session()->put('dash_params', $params);

        $data = self::dashboard_order_stats_data();
        return response()->json([
            'view' => view('vendor-views.partials._dashboard-order-stats', compact('data'))->render()
        ], 200);
    }

    public function dashboard_order_stats_data()
    {
        $params = session('dash_params');
        $today = $params['statistics_type'] == 'today' ? 1 : 0;
        $this_month = $params['statistics_type'] == 'this_month' ? 1 : 0;

        $confirmed = Order::when($today, function ($query) {
            return $query->whereDate('created_at', Carbon::today());
        })
        ->when($this_month, function ($query) {
            return $query->whereMonth('created_at', Carbon::now());
        })
        ->whereNotIn('order_type', ['reservation'])
        ->where(['restaurant_id' => Helpers::get_restaurant_id()])
        ->whereIn('order_status',['confirmed', 'accepted'])
        ->whereNotNull('confirmed')->OrderScheduledIn(30)
        ->Notpos()->count();

        $cooking = Order::when($today, function ($query) {
            return $query->whereDate('created_at', Carbon::today());
        })
        ->whereNotIn('order_type', ['reservation'])
        ->when($this_month, function ($query) {
            return $query->whereMonth('created_at', Carbon::now());
        })
        ->where(['order_status' => 'processing', 'restaurant_id' => Helpers::get_restaurant_id()])
        ->Notpos()->count();

        $ready_for_delivery = Order::when($today, function ($query) {
            return $query->whereDate('created_at', Carbon::today());
        })
        ->whereNotIn('order_type', ['reservation'])
        ->when($this_month, function ($query) {
            return $query->whereMonth('created_at', Carbon::now());
        })->where(['order_status' => 'handover', 'restaurant_id' => Helpers::get_restaurant_id()])
        ->Notpos()->count();

        $food_on_the_way = Order::when($today, function ($query) {
            return $query->whereDate('created_at', Carbon::today());
        })
        ->whereNotIn('order_type', ['reservation'])
        ->when($this_month, function ($query) {
            return $query->whereMonth('created_at', Carbon::now());
        })
        ->FoodOnTheWay()->where(['restaurant_id' => Helpers::get_restaurant_id()])
        ->Notpos()->count();

        $delivered = Order::when($today, function ($query) {
            return $query->whereDate('created_at', Carbon::today());
        })
        ->whereNotIn('order_type', ['reservation'])
        ->when($this_month, function ($query) {
            return $query->whereMonth('created_at', Carbon::now());
        })
        ->where(['order_status' => 'delivered', 'restaurant_id' => Helpers::get_restaurant_id()])
        ->Notpos()->count();

        $refunded = Order::when($today, function ($query) {
            return $query->whereDate('created_at', Carbon::today());
        })->when($this_month, function ($query) {
            return $query->whereMonth('created_at', Carbon::now());
        })->where(['order_status' => 'refunded', 'restaurant_id' => Helpers::get_restaurant_id()])
        ->Notpos()->count();

        $scheduled = Order::when($today, function ($query) {
            return $query->whereDate('created_at', Carbon::today());
        })
        ->whereNotIn('order_type', ['reservation'])
        ->when($this_month, function ($query) {
            return $query->whereMonth('created_at', Carbon::now());
        })
        ->Scheduled()->where(['restaurant_id' => Helpers::get_restaurant_id()])->where(function($query){
            $query->Scheduled()->where(function($q){
                if(config('order_confirmation_model') == 'restaurant' || Helpers::get_restaurant_data()->self_delivery_system)
                {
                    $q->whereNotIn('order_status',['failed','canceled', 'refund_requested', 'refunded']);
                }
                else
                {
                    $q->whereNotIn('order_status',['pending','failed','canceled', 'refund_requested', 'refunded'])->orWhere(function($query){
                        $query->where('order_status','pending')->where('order_type', 'take_away');
                    });
                }
            });

        })->Notpos()->count();

        $all = Order::when($today, function ($query) {
            return $query->whereDate('created_at', Carbon::today());
        })
        ->whereNotIn('order_type', ['reservation'])
        ->when($this_month, function ($query) {
            return $query->whereMonth('created_at', Carbon::now());
        })
        ->where(['restaurant_id' => Helpers::get_restaurant_id()])
        ->where(function($query){
            return $query->whereNotIn('order_status',(config('order_confirmation_model') == 'restaurant'|| \App\CentralLogics\Helpers::get_restaurant_data()->self_delivery_system)?['failed','canceled', 'refund_requested', 'refunded']:['pending','failed','canceled', 'refund_requested', 'refunded'])
            ->orWhere(function($query){
                return $query->where('order_status','pending')->where('order_type', 'take_away');
            });
        })
        ->Notpos()->count();

        $data = [
            'confirmed' => $confirmed,
            'cooking' => $cooking,
            'ready_for_delivery' => $ready_for_delivery,
            'food_on_the_way' => $food_on_the_way,
            'delivered' => $delivered,
            'refunded' => $refunded,
            'scheduled' => $scheduled,
            'all' => $all,
        ];

        return $data;
    }
}
