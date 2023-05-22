<?php

namespace App\CentralLogics;

use App\Models\Restaurant;
use App\Models\FeaturedVenue;
use App\Models\HottestLounge;
use App\Models\OrderTransaction;
use Illuminate\Support\Facades\Log;

class RestaurantLogic
{
    public static function get_restaurants($zone_id, $filter, $limit = 10, $offset = 1, $type='all', $isNearby)
    {
        $paginator = Restaurant::
        withOpen()
        ->with(['discount'=>function($q){
            return $q->validate();
        }, 'schedules'])->whereIn('zone_id', $zone_id)
        ->when($filter=='delivery', function($q){
            return $q->delivery();
        })
        ->when($filter=='take_away', function($q){
            return $q->takeaway();
        })
        ->Active()
        ->type($type)
        ->orderBy('priority', 'desc')
        ->orderBy('percentile_rank', 'DESC')
        ->orderBy('updated_at', 'desc')
        ->paginate($limit, ['*'], 'page', $offset);
        return [
            'total_size' => $paginator->total(),
            'limit' => $limit,
            'offset' => $offset,
            'isNearby' => $isNearby,
            'restaurants' => $paginator->items()
        ];
    }
    
    // public static function get_featured_restaurants($zone_id, $filter, $limit = 10, $offset = 1, $type='all'){
    //     $paginator = FeaturedVenue::whereIn('zone_id', $zone_id)->paginate($limit, ['*'], 'page', $offset);
    //     return [
    //         'total_size' => $paginator->total(),
    //         'limit' => $limit,
    //         'offset' => $offset,
    //         'restaurants' => $paginator->items()
    //     ];
    // }

    public static function get_featured_restaurants($filter, $limit = 10, $offset = 1, $type='all'){
        $paginator = FeaturedVenue::paginate($limit, ['*'], 'page', $offset);
        return [
            'total_size' => $paginator->total(),
            'limit' => $limit,
            'offset' => $offset,
            'restaurants' => $paginator->items()
        ];
    }

    public static function get_hottest_lounges($filter, $limit = 10, $offset = 1, $type='all'){
        $paginator = HottestLounge::paginate($limit, ['*'], 'page', $offset);
        return [
            'total_size' => $paginator->total(),
            'limit' => $limit,
            'offset' => $offset,
            'lounges' => $paginator->items()
        ];
    }
 

    public static function get_popular_restaurants($zone_id, $limit = 10, $offset = 1, $type='all')
    {
        $paginator = Restaurant::withOpen()
        ->with(['discount'=>function($q){
            return $q->validate();
        }, 'schedules'])->whereIn('zone_id', $zone_id)
        ->Active()
        ->type($type)
        ->withCount('orders')
        ->orderBy('open', 'desc')
        ->orderBy('orders_count', 'desc')
        ->limit($limit)
        ->get();
        return [
            'total_size' => $paginator->count(),
            'limit' => $limit,
            'offset' => $offset,
            'restaurants' => $paginator
        ];
    }

    public static function get_restaurant_details($restaurant_id)
    {
        return Restaurant::with(['discount'=>function($q){
            return $q->validate();
        }, 'campaigns', 'schedules'])->active()->whereId($restaurant_id)->first();
    }

    public static function calculate_restaurant_rating($ratings)
    {
        $total_submit = $ratings[0]+$ratings[1]+$ratings[2]+$ratings[3]+$ratings[4];
        $rating = ($ratings[0]*5+$ratings[1]*4+$ratings[2]*3+$ratings[3]*2+$ratings[4])/($total_submit?$total_submit:1);
        return ['rating'=>$rating, 'total'=>$total_submit];
    }

    public static function update_restaurant_rating($ratings, $product_rating)
    {
        $restaurant_ratings = [1=>0 , 2=>0, 3=>0, 4=>0, 5=>0];
        if($ratings)
        {
            $restaurant_ratings[1] = $ratings[4];
            $restaurant_ratings[2] = $ratings[3];
            $restaurant_ratings[3] = $ratings[2];
            $restaurant_ratings[4] = $ratings[1];
            $restaurant_ratings[5] = $ratings[0];
            $restaurant_ratings[$product_rating] = $ratings[5-$product_rating] + 1;
        }
        else
        {
            $restaurant_ratings[$product_rating] = 1;
        }
        return json_encode($restaurant_ratings);
    }

    public static function search_restaurants($name, $zone_id, $category_id= null,$limit = 10, $offset = 1, $type='all')
    {
        $key = explode(' ', $name);
        $paginator = Restaurant::withOpen()->with(['discount'=>function($q){
            return $q->validate();
        }])->whereIn('zone_id', $zone_id)->weekday()->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('name', 'like', "%{$value}%");
            }
        })
        ->when($category_id, function($query)use($category_id){
            $query->whereHas('foods.category', function($q)use($category_id){
                return $q->whereId($category_id)->orWhere('parent_id', $category_id);
            });
        })
        ->active()->type($type)->paginate($limit, ['*'], 'page', $offset);

        return [
            'total_size' => $paginator->total(),
            'limit' => $limit,
            'offset' => $offset,
            'restaurants' => $paginator->items()
        ];
    }

    public static function get_overall_rating($reviews)
    {
        $totalRating = count($reviews);
        $rating = 0;
        foreach ($reviews as $key => $review) {
            $rating += $review->rating;
        }
        if ($totalRating == 0) {
            $overallRating = 0;
        } else {
            $overallRating = number_format($rating / $totalRating, 2);
        }

        return [$overallRating, $totalRating];
    }

    public static function get_earning_data($vendor_id)
    {
        $monthly_earning = OrderTransaction::whereMonth('created_at', date('m'))->NotRefunded()->where('vendor_id', $vendor_id)->sum('restaurant_amount');
        $weekly_earning = OrderTransaction::whereBetween('created_at', [now()->startOfWeek(), now()->endOfWeek()])->NotRefunded()->where('vendor_id', $vendor_id)->sum('restaurant_amount');
        $daily_earning = OrderTransaction::whereDate('created_at', now())->NotRefunded()->where('vendor_id', $vendor_id)->sum('restaurant_amount');

        return['monthely_earning'=>(float)$monthly_earning, 'weekly_earning'=>(float)$weekly_earning, 'daily_earning'=>(float)$daily_earning];
    }

    public static function format_export_restaurants($restaurants)
    {
        $storage = [];
        foreach($restaurants as $item)
        {
            if($item->restaurants->count()<1)
            {
                break;
            }
            $storage[] = [
                'id'=>$item->id,
                'ownerFirstName'=>$item->f_name,
                'ownerLastName'=>$item->l_name,
                'restaurantName'=>$item->restaurants[0]->name,
                'logo'=>$item->restaurants[0]->logo,
                'phone'=>$item->phone,
                'email'=>$item->email,
                'latitude'=>$item->restaurants[0]->latitude,
                'longitude'=>$item->restaurants[0]->longitude,
                'zone_id'=>$item->restaurants[0]->zone_id,
            ];
        }

        return $storage;
    }
}
