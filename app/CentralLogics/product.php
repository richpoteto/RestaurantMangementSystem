<?php

namespace App\CentralLogics;

use App\Models\Food;
use App\Models\Review;
use Illuminate\Support\Facades\DB;

class ProductLogic
{
    public static function get_product($id)
    {
        return Food::active()->where('id', $id)->first();
    }

    public static function get_latest_products($limit, $offset, $restaurant_id, $category_id, $type='all')
    {
        $paginator = Food::active()->type($type);
        if($category_id != 0)
        {
            $paginator = $paginator->whereHas('category',function($q)use($category_id){
                return $q->whereId($category_id)->orWhere('parent_id', $category_id);
            });
        }
        $paginator = $paginator->where('restaurant_id', $restaurant_id)->latest()->paginate($limit, ['*'], 'page', $offset);

        return [
            'total_size' => $paginator->total(),
            'limit' => $limit,
            'offset' => $offset,
            'products' => $paginator->items()
        ];
    }

    public static function get_related_products($product_id)
    {
        $product = Food::find($product_id);
        return Food::active()
        ->whereHas('restaurant', function($query){
            $query->Weekday();
        })
        ->where('category_ids', $product->category_ids)
        ->where('id', '!=', $product->id)
        ->limit(10)
        ->get();
    }

    public static function search_products($name, $zone_id, $limit = 10, $offset = 1)
    {
        $key = explode(' ', $name);
        $paginator = Food::active()->whereHas('restaurant', function($q)use($zone_id){
            $q->whereIn('zone_id', $zone_id)->Weekday();
        })->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('name', 'like', "%{$value}%");
            }
        })->paginate($limit, ['*'], 'page', $offset);

        return [
            'total_size' => $paginator->total(),
            'limit' => $limit,
            'offset' => $offset,
            'products' => $paginator->items()
        ];
    }

    public static function popular_products($zone_id, $limit = null, $offset = null, $type='all')
    {
        if($limit != null && $offset != null)
        {
            $paginator = Food::whereHas('restaurant', function($q)use($zone_id){
                $q->whereIn('zone_id', $zone_id)->Weekday();
            })->active()->type($type)->popular()->paginate($limit, ['*'], 'page', $offset);

            return [
                'total_size' => $paginator->total(),
                'limit' => $limit,
                'offset' => $offset,
                'products' => $paginator->items()
            ];
        }
        $paginator = Food::active()->type($type)->whereHas('restaurant', function($q)use($zone_id){
            $q->whereIn('zone_id', $zone_id)->Weekday();
        })->popular()->limit(50)->get();

        return [
            'total_size' => $paginator->count(),
            'limit' => $limit,
            'offset' => $offset,
            'products' => $paginator
        ];

    }

    public static function most_reviewed_products($zone_id, $limit = null, $offset = null, $type='all')
    {
        if($limit != null && $offset != null)
        {
            $paginator = Food::whereHas('restaurant', function($q)use($zone_id){
                $q->whereIn('zone_id', $zone_id)->Weekday();
            })->withCount('reviews')->active()->type($type)
            ->orderBy('reviews_count','desc')
            ->paginate($limit, ['*'], 'page', $offset);

            return [
                'total_size' => $paginator->total(),
                'limit' => $limit,
                'offset' => $offset,
                'products' => $paginator->items()
            ];
        }
        $paginator = Food::active()->type($type)->whereHas('restaurant', function($q)use($zone_id){
            $q->whereIn('zone_id', $zone_id)->Weekday();
        })
        ->withCount('reviews')
        ->orderBy('reviews_count','desc')
        ->limit(50)->get();

        return [
            'total_size' => $paginator->count(),
            'limit' => $limit,
            'offset' => $offset,
            'products' => $paginator
        ];

    }

    public static function get_product_review($id)
    {
        $reviews = Review::where('product_id', $id)->get();
        return $reviews;
    }

    public static function get_rating($reviews)
    {
        $rating5 = 0;
        $rating4 = 0;
        $rating3 = 0;
        $rating2 = 0;
        $rating1 = 0;
        foreach ($reviews as $key => $review) {
            if ($review->rating == 5) {
                $rating5 += 1;
            }
            if ($review->rating == 4) {
                $rating4 += 1;
            }
            if ($review->rating == 3) {
                $rating3 += 1;
            }
            if ($review->rating == 2) {
                $rating2 += 1;
            }
            if ($review->rating == 1) {
                $rating1 += 1;
            }
        }
        return [$rating5, $rating4, $rating3, $rating2, $rating1];
    }

    public static function get_avg_rating($rating)
    {
        $total_rating = 0;
        $total_rating += $rating[1];
        $total_rating += $rating[2]*2;
        $total_rating += $rating[3]*3;
        $total_rating += $rating[4]*4;
        $total_rating += $rating[5]*5;

        return $total_rating/array_sum($rating);
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

    public static function format_export_foods($foods)
    {
        $storage = [];
        foreach($foods as $item)
        {
            $category_id = 0;
            $sub_category_id = 0;
            foreach(json_decode($item->category_ids, true) as $category)
            {
                if($category['position']==1)
                {
                    $category_id = $category['id'];
                }
                else if($category['position']==2)
                {
                    $sub_category_id = $category['id'];
                }
            }
            $storage[] = [
                'id'=>$item->id,
                'name'=>$item->name,
                'description'=>$item->description,
                'image'=>$item->image,
                'veg'=>$item->veg,
                'category_id'=>$category_id,
                'sub_category_id'=>$sub_category_id,
                'price'=>$item->price,
                'discount'=>$item->discount,
                'discount_type'=>$item->discount_type,
                'available_time_starts'=>$item->available_time_starts,
                'available_time_ends'=>$item->available_time_ends,
                'variations'=>str_replace(['{','}','[',']'],['(',')','',''],$item->variations),
                'add_ons'=>str_replace(['"','[',']'],'',$item->add_ons),
                'attributes'=>str_replace(['"','[',']'],'',$item->attributes),
                'choice_options'=>str_replace(['{','}'],['(',')'],substr($item->choice_options, 1, -1)),
                'restaurant_id'=>$item->restaurant_id,
            ];
        }

        return $storage;
    }

    public static function update_food_ratings()
    {
        try{
            $foods = Food::withOutGlobalScopes()->whereHas('reviews')->with('reviews')->get();
            foreach($foods as $key=>$food)
            {
                $foods[$key]->avg_rating = $food->reviews->avg('rating');
                $foods[$key]->rating_count = $food->reviews->count();
                foreach($food->reviews as $review)
                {
                    $foods[$key]->rating = self::update_rating($foods[$key]->rating, $review->rating);
                }
                $foods[$key]->save();
            }
        }catch(\Exception $e){
            info($e);
            return false;
        }
        return true;
    }

    public static function update_rating($ratings, $product_rating)
    {

        $restaurant_ratings = [1=>0 , 2=>0, 3=>0, 4=>0, 5=>0];
        if(isset($ratings))
        {
            $restaurant_ratings = json_decode($ratings, true);
            $restaurant_ratings[$product_rating] = $restaurant_ratings[$product_rating] + 1;
        }
        else
        {
            $restaurant_ratings[$product_rating] = 1;
        }
        return json_encode($restaurant_ratings);
    }
}
