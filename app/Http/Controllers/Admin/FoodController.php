<?php

namespace App\Http\Controllers\Admin;

use Carbon\Carbon;
use App\Models\Food;
use App\Models\Review;
use App\Models\Category;
use App\Models\Restaurant;
use App\Models\Translation;
use App\Models\ItemCampaign;
use App\Models\Attribute;
use App\Http\Controllers\Controller;
use App\CentralLogics\Helpers;
use App\Scopes\RestaurantScope;
use App\CentralLogics\ProductLogic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Brian2694\Toastr\Facades\Toastr;
use Rap2hpoutre\FastExcel\FastExcel;

class FoodController extends Controller
{
    public function index()
    {
        $categories = Category::where(['position' => 0])->latest()->paginate(config('default_pagination'));
        $sub_categories = Category::where(['position' => 1])->latest()->paginate(config('default_pagination'));
        $subsub_categories = Category::where(['position' => 2])->latest()->paginate(config('default_pagination'));
        return view('admin-views.product.index', compact('categories', 'sub_categories', 'subsub_categories'));
    }

    public function store(Request $request)
    {
       $validator = Validator::make($request->all(), [
            'name' => 'array',
            'name.0' => 'required',
            'name.*' => 'max:191',
            'category_id' => 'required',
            //'image' => 'required',
            'price' => 'required|numeric|between:.01,999999999999.99',
            'discount' => 'required|numeric|min:0',
            'restaurant_id' => 'required',
            'attribute_id' => 'required',
            'description' => 'required',
            'description.*' => 'max:1000'
        ], [
            'description.*.max' => trans('messages.description_length_warning'),
            'name.0.required' => trans('messages.item_name_required'),
            'category_id.required' => trans('messages.category_required')
        ]);
        
        try{
            if ($validator->fails())
            {
                Toastr::success(trans('messages.failed_create_food'));
            }else{
                if ($request['discount_type'] == 'percent') {
                    $dis = ($request['price'] / 100) * $request['discount'];
                } else {
                    $dis = $request['discount'];
                }
        
                if ($request['price'] <= $dis) {
                    $validator->getMessageBag()->add('unit_price', trans('messages.discount_can_not_be_more_than_or_equal'));
                }
        
                if ($request['price'] <= $dis || $validator->fails()) {
                    return response()->json(['errors' => Helpers::error_processor($validator)]);
                }
        
                $food = new Food();
                $food->name = $request->name[array_search('en', $request->lang)];
        
                $categoryIds = [];
                if ($request->sub_category_id != null) {
                    array_push($categoryIds, [
                        'id' => $request->sub_category_id,
                        'position' => 1,
                    ]);
                }
                if ($request->sub_sub_category_id != null) {
                    array_push($categoryIds, [
                        'id' => $request->sub_sub_category_id,
                        'position' => 2,
                    ]);
                }
        
                $food->category_id = $request->category_id;
                $food->category_ids = json_encode($categoryIds);
                $food->description =  $request->description[array_search('en', $request->lang)];
        
                $choice_options = [];
                $variations = [];
                $options = [];
                
                $attribute = Attribute::where('id', $request->attribute_id)->first();
                if($attribute != null){
                    $vari['type'] = $attribute->name;
                    $vari['price'] = '0';
                    array_push($variations, $vari);
                            
                    $choose['name'] = 'choice_' . $attribute->id;
                    $choose['title'] = $attribute->name;
                    $choose['options'] = $attribute->name;
                    array_push($choice_options, $choose);
                }
                
                //combinations end
                $food->choice_options = json_encode($choice_options);
                $food->variations = json_encode($variations);
                $food->price = $request->price;
                $food->available_time_starts = $request->available_time_starts;
                $food->available_time_ends = $request->available_time_ends;
                $food->discount = $request->discount_type == 'amount' ? $request->discount : $request->discount;
                $food->discount_type = $request->discount_type;
        
                $attributes = [];
                if($request->attribute_id != null){
                    array_push($attributes, $request->attribute_id);
                }
                $food->attributes = $request->has('attribute_id') ? json_encode($attributes) : json_encode([]);
                $food->add_ons = $request->has('addon_ids') ? json_encode($request->addon_ids) : json_encode([]);
                $food->restaurant_id = $request->restaurant_id;
                $food->image = Helpers::upload('product/', 'png', $request->file('image'));
                $food->veg = $request->veg;
                $food->save();
    
                $data = [];
                foreach ($request->lang as $index => $key) {
                    if ($request->name[$index] && $key != 'en') {
                        array_push($data, array(
                            'translationable_type' => 'App\Models\Food',
                            'translationable_id' => $food->id,
                            'locale' => $key,
                            'key' => 'name',
                            'value' => $request->name[$index],
                        ));
                    }
                    if ($request->description[$index] && $key != 'en') {
                        array_push($data, array(
                            'translationable_type' => 'App\Models\Food',
                            'translationable_id' => $food->id,
                            'locale' => $key,
                            'key' => 'description',
                            'value' => $request->description[$index],
                        ));
                    }
                }
                Translation::insert($data);
                return response()->json([], 200);
            }
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }

    public function view($id)
    {
        $product = Food::withoutGlobalScope(RestaurantScope::class)->where(['id' => $id])->first();
        $reviews=Review::where(['food_id'=>$id])->latest()->paginate(config('default_pagination'));
        return view('admin-views.product.view', compact('product','reviews'));
    }
    
    public function change_priority($id, Request $request){
        $food = Food::where('id', $id)->first();
        $food->priority = $request->priority;
        $food->updated_at = now();
        $food->save();
        return back();
    }

    public function change_feature(Food $food, Request $request)
    {
        $food->f_featured = $request->f_featured;
        $food->updated_at = now();
        $food->save();
        return back();
    }
    
    public function change_trending(Food $food, Request $request){
        $food->f_trending = $request->f_trending;
        $food->updated_at = now();
        $food->save();
        return back();
    }

    public function edit($id)
    {
        $product = Food::withoutGlobalScope(RestaurantScope::class)->withoutGlobalScope('translate')->findOrFail($id);
        if(!$product)
        {
            Toastr::error(trans('messages.food').' '.trans('messages.not_found'));
            return back();
        }
        $category_ids = json_decode($product->category_ids);
        $categories = Category::where(['position' => 0])->get();
        $sub_categories = Category::where(['position' => 1])->get();
        $subsub_categories = Category::where(['position' => 2])->get();
        return view('admin-views.product.edit', compact('product', 'category_ids', 'categories', 'sub_categories', 'subsub_categories'));
    }

    public function status(Request $request)
    {
        $product = Food::withoutGlobalScope(RestaurantScope::class)->findOrFail($request->id);
        $product->status = $request->status;
        $product->save();
        Toastr::success(trans('messages.food_status_updated'));
        return back();
    }

    public function update(Request $request, $id)
    {
        try{
            $validator = Validator::make($request->all(), [
                'name' => 'array',
                'name.0' => 'required',
                'name.*' => 'max:191',
                'category_id' => 'required',
                'price' => 'required|numeric|between:.01,999999999999.99',
                'restaurant_id' => 'required',
                'description' => 'array',
                'description.*' => 'max:1000',
                'discount' => 'required|numeric|min:0',
            ], [
                'description.*.max' => trans('messages.description_length_warning'),
                'name.0.required' => trans('messages.item_name_required'),
                'category_id.required' => trans('messages.category_required')
            ]);
            
            if ($validator->fails())
            {
                Toastr::success(trans('messages.failed_create_food'));
            }else{
                if ($request['discount_type'] == 'percent') {
                    $dis = ($request['price'] / 100) * $request['discount'];
                } else {
                    $dis = $request['discount'];
                }
        
                if ($request['price'] <= $dis) {
                    $validator->getMessageBag()->add('unit_price', trans('messages.discount_can_not_be_more_than_or_equal'));
                }
        
                if ($request['price'] <= $dis || $validator->fails()) {
                    return response()->json(['errors' => Helpers::error_processor($validator)]);
                }
        
                $p = Food::withoutGlobalScope(RestaurantScope::class)->find($id);
                $p->name = $request->name[array_search('en', $request->lang)];
                $p->category_id = $request->category_id;
        
                $categorIds = [];
                array_push($categorIds, [
                    'id' => $request->sub_category_id,
                    'position' => 1,
                ]);
                array_push($categorIds, [
                    'id' => $request->sub_sub_category_id,
                    'position' => 2,
                ]);
        
                $p->category_ids = json_encode($categorIds);
                $p->description =  $request->description[array_search('en', $request->lang)];
                
                $choice_options = [];
                $variations = [];
                $options = [];
                
                $attribute = Attribute::where('id', $request->attribute_id)->first();
                if($attribute != null){
                    $vari['type'] = $attribute->name;
                    $vari['price'] = '0';
                    array_push($variations, $vari);
                            
                    $choose['name'] = 'choice_' . $attribute->id;
                    $choose['title'] = $attribute->name;
                    $choose['options'] = $attribute->name;
                    array_push($choice_options, $choose);
                }
                
                //combinations end
                $p->choice_options = json_encode($choice_options);
                $p->variations = json_encode($variations);
                
                $p->price = $request->price;
                $p->veg = $request->veg;
                $p->image = $request->has('image') ? Helpers::update('product/', $p->image, 'png', $request->file('image')) : $p->image;
                $p->available_time_starts = $request->available_time_starts;
                $p->available_time_ends = $request->available_time_ends;
        
                $p->discount = $request->discount_type == 'amount' ? $request->discount : $request->discount;
                $p->discount_type = $request->discount_type;
        
                $attributes = [];
                if($request->attribute_id != null){
                    array_push($attributes, $request->attribute_id);
                }
                $p->attributes = $request->has('attribute_id') ? json_encode($attributes) : json_encode([]);
                $p->add_ons = $request->has('addon_ids') ? json_encode($request->addon_ids) : json_encode([]);
                $p->restaurant_id = $request->restaurant_id;
                $p->save();
        
                foreach ($request->lang as $index => $key) {
                    if ($request->name[$index] && $key != 'en') {
                        Translation::updateOrInsert(
                            ['translationable_type' => 'App\Models\Food',
                                'translationable_id' => $p->id,
                                'locale' => $key,
                                'key' => 'name'],
                            ['value' => $request->name[$index]]
                        );
                    }
                    if ($request->description[$index] && $key != 'en') {
                        Translation::updateOrInsert(
                            ['translationable_type' => 'App\Models\Food',
                                'translationable_id' => $p->id,
                                'locale' => $key,
                                'key' => 'description'],
                            ['value' => $request->description[$index]]
                        );
                    }
                }
        
                return response()->json([], 200);
            }
        }catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }

    public function delete(Request $request)
    {
        $product = Food::withoutGlobalScope(RestaurantScope::class)->withoutGlobalScope('translate')->find($request->id);

        if($product->image)
        {
            if (Storage::disk('public')->exists('product/' . $product['image'])) {
                Storage::disk('public')->delete('product/' . $product['image']);
            }
        }
        $product->translations()->delete();
        $product->delete();
        Toastr::success(trans('messages.product_deleted_successfully'));
        return back();
    }

    public function variant_combination(Request $request)
    {
        $options = [];
        $price = $request->price;
        $product_name = $request->name;

        if ($request->has('choice_no')) {
            foreach ($request->choice_no as $key => $no) {
                $name = 'choice_options_' . $no;
                $my_str = implode('', $request[$name]);
                array_push($options, explode(',', $my_str));
            }
        }

        $result = [[]];
        foreach ($options as $property => $property_values) {
            $tmp = [];
            foreach ($result as $result_item) {
                foreach ($property_values as $property_value) {
                    $tmp[] = array_merge($result_item, [$property => $property_value]);
                }
            }
            $result = $tmp;
        }
        $combinations = $result;
        return response()->json([
            'view' => view('admin-views.product.partials._variant-combinations', compact('combinations', 'price', 'product_name'))->render(),
        ]);
    }

    public function variant_price(Request $request)
    {
        if($request->item_type=='food')
        {
            $product = Food::withoutGlobalScope(RestaurantScope::class)->find($request->id);
        }
        else
        {
            $product = ItemCampaign::find($request->id);
        }
        // $product = Food::withoutGlobalScope(RestaurantScope::class)->find($request->id);
        $str = '';
        $quantity = 0;
        $price = 0;
        $addon_price = 0;

        foreach (json_decode($product->choice_options) as $key => $choice) {
            if ($str != null) {
                $str .= '-' . str_replace(' ', '', $request[$choice->name]);
            } else {
                $str .= str_replace(' ', '', $request[$choice->name]);
            }
        }

        if($request['addon_id'])
        {
            foreach($request['addon_id'] as $id)
            {
                $addon_price+= $request['addon-price'.$id]*$request['addon-quantity'.$id];
            }
        }

        if ($str != null) {
            $count = count(json_decode($product->variations));
            for ($i = 0; $i < $count; $i++) {
                if (json_decode($product->variations)[$i]->type == $str) {
                    $price = json_decode($product->variations)[$i]->price - Helpers::product_discount_calculate($product, json_decode($product->variations)[$i]->price,$product->restaurant);
                }
            }
        } else {
            $price = $product->price - Helpers::product_discount_calculate($product, $product->price,$product->restaurant);
        }

        return array('price' => Helpers::format_currency(($price * $request->quantity)+$addon_price));
    }
    
    public function get_categories(Request $request)
    {
        $cat = Category::where(['parent_id' => $request->parent_id])->get();
        $res = '<option value="' . 0 . '" disabled selected>---Select---</option>';
        foreach ($cat as $row) {
            $res .= '<option value="' . $row->id . '">' . $row->name . '</option>';
        }
        return response()->json([
            'options' => $res,
        ]);
    }

    public function get_foods(Request $request)
    {
        $foods = Food::withoutGlobalScope(RestaurantScope::class)->with('restaurant')->whereHas('restaurant', function($query)use($request){
            $query->where('zone_id', $request->zone_id);
        })->get();
        $res = '';
        if(count($foods)>0 && !$request->data)
        {
            $res = '<option value="' . 0 . '" disabled selected>---Select---</option>';
        }

        foreach ($foods as $row) {
            $res .= '<option value="'.$row->id.'" ';
            if($request->data)
            {
                $res .= in_array($row->id, $request->data)?'selected ':'';
            }
            $res .= '>'.$row->name.' ('.$row->restaurant->name.')'. '</option>';
        }
        return response()->json([
            'options' => $res,
        ]);
    }

    public function list(Request $request)
    {
        $restaurant_id = $request->query('restaurant_id', 'all');
        $category_id = $request->query('category_id', 'all');
        $foods = Food::withoutGlobalScope(RestaurantScope::class)
        ->when(is_numeric($restaurant_id), function($query)use($restaurant_id){
            return $query->where('restaurant_id', $restaurant_id);
        })
        ->when(is_numeric($category_id), function($query)use($category_id){
            return $query->where('category_id', $category_id);
        })
        ->orderBy('priority', 'DESC')
        ->orderBy('updated_at', 'DESC')
        ->latest()
        ->paginate(config('default_pagination'));
        $restaurant =$restaurant_id !='all'? Restaurant::findOrFail($restaurant_id):null;
        $category =$category_id !='all'? Category::findOrFail($category_id):null;
        return view('admin-views.product.list', compact('foods','restaurant','category'));
    }

    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $foods=Food::withoutGlobalScope(RestaurantScope::class)->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->where('name', 'like', "%{$value}%");
            }
        })->limit(50)->get();
        return response()->json(['count'=>count($foods),
            'view'=>view('admin-views.product.partials._table',compact('foods'))->render()
        ]);
    }

    public function review_list(Request $request)
    {
        $reviews = Review::with(['food','customer'])->latest()->paginate(config('default_pagination'));
        return view('admin-views.product.reviews-list', compact('reviews'));
    }

    public function reviews_status(Request $request)
    {
        $review = Review::find($request->id);
        $review->status = $request->status;
        $review->save();
        Toastr::success(trans('messages.review_visibility_updated'));
        return back();
    }

    public function bulk_import_index()
    {
        return view('admin-views.product.bulk-import');
    }

    public function bulk_import_data(Request $request)
    {
        try {
            $collections = (new FastExcel)->import($request->file('products_file'));
        } catch (\Exception $exception) {
            Toastr::error(trans('messages.you_have_uploaded_a_wrong_format_file'));
            return back();
        }

        $data = [];
        $skip = ['youtube_video_url'];
        foreach ($collections as $collection) {
                if ($collection['name'] === "" || $collection['category_id'] === "" || $collection['sub_category_id'] === "" || $collection['price'] === "" || empty($collection['available_time_starts']) === "" || empty($collection['available_time_ends']) || $collection['restaurant_id'] === "") {
                    Toastr::error(trans('messages.please_fill_all_required_fields'));
                    return back();
                }


            array_push($data, [
                'name' => $collection['name'],
                'category_id' => $collection['sub_category_id']?$collection['sub_category_id']:$collection['category_id'],
                'category_ids' => json_encode([['id' => $collection['category_id'], 'position' => 0], ['id' => $collection['sub_category_id'], 'position' => 1]]),
                'veg' => $collection['veg']??0,  //$request->item_type;
                'price' => $collection['price'],
                'discount' => $collection['discount'],
                'discount_type' => $collection['discount_type'],
                'description' => $collection['description'],
                'available_time_starts' => $collection['available_time_starts'],
                'available_time_ends' => $collection['available_time_ends'],
                'image' => $collection['image'],
                'restaurant_id' => $collection['restaurant_id'],
                'add_ons' => json_encode([]),
                'attributes' => json_encode([]),
                'choice_options' => json_encode([]),
                'variations' => json_encode([]),
                'created_at'=>now(),
                'updated_at'=>now()
            ]);
        }
        try
        {
            DB::beginTransaction();
            DB::table('food')->insert($data);
            DB::commit();
        }catch(\Exception $e){
            DB::rollBack();
            Toastr::error(trans('messages.failed_to_import_data'));
            return back();
        }

        Toastr::success(trans('messages.product_imported_successfully', ['count'=>count($data)]));
        return back();
    }

    public function bulk_export_index()
    {
        return view('admin-views.product.bulk-export');
    }

    public function bulk_export_data(Request $request)
    {
        $request->validate([
            'type'=>'required',
            'start_id'=>'required_if:type,id_wise',
            'end_id'=>'required_if:type,id_wise',
            'from_date'=>'required_if:type,date_wise',
            'to_date'=>'required_if:type,date_wise'
        ]);
        $products = Food::when($request['type']=='date_wise', function($query)use($request){
            $query->whereBetween('created_at', [$request['from_date'].' 00:00:00', $request['to_date'].' 23:59:59']);
        })
        ->when($request['type']=='id_wise', function($query)use($request){
            $query->whereBetween('id', [$request['start_id'], $request['end_id']]);
        })
        ->withoutGlobalScope(RestaurantScope::class)->get();
        return (new FastExcel(ProductLogic::format_export_foods($products)))->download('Foods.xlsx');
    }
}
