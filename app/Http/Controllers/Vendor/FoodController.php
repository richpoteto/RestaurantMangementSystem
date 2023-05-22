<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\CentralLogics\Helpers;
use App\CentralLogics\ProductLogic;
use App\Models\Category;
use App\Models\Food;
use App\Models\Review;
use App\Models\Attribute;
use App\Models\Translation;
use App\Models\AddOn;
use App\Scopes\RestaurantScope;
use Carbon\Carbon;
use Brian2694\Toastr\Facades\Toastr;
use Rap2hpoutre\FastExcel\FastExcel;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class FoodController extends Controller
{
    public function index()
    {
        if(!Helpers::get_restaurant_data()->food_section)
        {
            Toastr::warning(trans('messages.permission_denied'));
            return back();
        }
        $categories = Category::where(['position' => 0])->latest()->paginate(config('default_pagination'));
        $sub_categories = Category::where(['position' => 1])->latest()->paginate(config('default_pagination'));
        $subsub_categories = Category::where(['position' => 2])->latest()->paginate(config('default_pagination'));
        return view('vendor-views.product.index', compact('categories', 'sub_categories', 'subsub_categories'));
    }

    public function store(Request $request)
    {
        if(!Helpers::get_restaurant_data()->food_section)
        {
            return response()->json([
                'errors'=>[
                    ['code'=>'unauthorized', 'message'=>trans('messages.permission_denied')]
                ]
            ]);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'array',
            'name.0' => 'required',
            'name.*' => 'max:191',
            'category_id' => 'required',
            //'image' => 'required',
            'price' => 'required|numeric|between:.01,999999999999.99',
            'description.*' => 'max:1000',
            'discount' => 'required|numeric|min:0',
        ], [
            'name.0.required' => trans('messages.item_name_required'),
            'category_id.required' => trans('messages.category_required'),
            'veg.required'=>trans('messages.item_type_is_required'),
            'description.*.max' => trans('messages.description_length_warning'),
        ]);
        
        try{
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
    
            $food = new Food;
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
            $food->description = $request->description[array_search('en', $request->lang)];
    
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
            $food->veg = $request->veg;
            $food->image = Helpers::upload('product/', 'png', $request->file('image'));
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
            $food->restaurant_id = Helpers::get_restaurant_id();
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
        catch(\Exception $e){
            var_dump($e->getMessage());
            die;
            return response()->json(['error' => $e->getMessage()], 201);
        }
    }

    public function view($id)
    {
        $product = Food::findOrFail($id);
        $reviews=Review::where(['food_id'=>$id])->latest()->paginate(config('default_pagination'));
        return view('vendor-views.product.view', compact('product','reviews'));
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
        if(!Helpers::get_restaurant_data()->food_section)
        {
            Toastr::warning(trans('messages.permission_denied'));
            return back();
        }

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
        
        $restaurant_id = Helpers::get_restaurant_id();
        $addonArr = AddOn::withoutGlobalScope(RestaurantScope::class)->withoutGlobalScope('translate')->where(['restaurant_id' => $restaurant_id])->active()->get();
        $addons = json_decode($product['add_ons'], true);
        
        return view('vendor-views.product.edit', compact('product', 'addonArr', 'addons', 'category_ids', 'categories', 'sub_categories', 'subsub_categories'));
    }

    public function status(Request $request)
    {
        if(!Helpers::get_restaurant_data()->food_section)
        {
            Toastr::warning(trans('messages.permission_denied'));
            return back();
        }
        $product = Food::find($request->id);
        $product->status = $request->status;
        $product->save();
        Toastr::success('Food status updated!');
        return back();
    }

    public function update(Request $request, $id)
    {
        if(!Helpers::get_restaurant_data()->food_section)
        {
            return response()->json([
                'errors'=>[
                    ['code'=>'unauthorized', 'message'=>trans('messages.permission_denied')]
                ]
            ]);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'array',
            'name.0' => 'required',
            'name.*' => 'max:191',
            'category_id' => 'required',
            'price' => 'required|numeric|between:0.01,999999999999.99',
            'description.*' => 'max:1000',
            'discount' => 'required|numeric|min:0',
        ], [
            'name.0.required' => trans('messages.item_name_required'),
            'category_id.required' => trans('messages.category_required'),
            'veg.required'=>trans('messages.item_type_is_required'),
            'description.*.max' => trans('messages.description_length_warning'),
        ]);

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

        $p = Food::find($id);

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
        $p->description = $request->description[array_search('en', $request->lang)];

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
        $p->veg = $request->veg;
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

    public function delete(Request $request)
    {
        if(!Helpers::get_restaurant_data()->food_section)
        {
            Toastr::warning(trans('messages.permission_denied'));
            return back();
        }
        $product = Food::find($request->id);

        if($product->image)
        {
            if (Storage::disk('public')->exists('product/' . $product['image'])) {
                Storage::disk('public')->delete('product/' . $product['image']);
            }
        }

        $product->delete();
        Toastr::success('Food removed!');
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
            'view' => view('vendor-views.product.partials._variant-combinations', compact('combinations', 'price', 'product_name'))->render(),
        ]);
    }

    public function get_categories(Request $request)
    {
        $cat = Category::where(['parent_id' => $request->parent_id])->get();
        $res = '<option value="' . 0 . '" disabled selected>---Select---</option>';
        foreach ($cat as $row) {
            if ($row->id == $request->sub_category) {
                $res .= '<option value="' . $row->id . '" selected >' . $row->name . '</option>';
            } else {
                $res .= '<option value="' . $row->id . '">' . $row->name . '</option>';
            }
        }
        return response()->json([
            'options' => $res,
        ]);
    }

    public function list(Request $request)
    {
        $type = $request->query('type', 'all');
        
        $foods = Food::orderBy('priority', 'DESC')
        ->orderBy('updated_at', 'DESC')
        ->latest()
        ->paginate(config('default_pagination'));
        
        return view('vendor-views.product.list', compact('foods', 'type'));
    }

    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $foods=Food::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->where('name', 'like', "%{$value}%");
            }
        })->limit(50)->get();
        return response()->json([
            'view'=>view('vendor-views.product.partials._table',compact('foods'))->render()
        ]);
    }

    public function bulk_import_index()
    {
        return view('vendor-views.product.bulk-import');
    }

    public function bulk_import_data(Request $request)
    {
        if(!Helpers::get_restaurant_data()->food_section)
        {
            Toastr::warning(trans('messages.permission_denied'));
            return back();
        }
        try {
            $collections = (new FastExcel)->import($request->file('products_file'));
        } catch (\Exception $exception) {
            Toastr::error(trans('messages.you_have_uploaded_a_wrong_format_file'));
            return back();
        }

        $data = [];
        $skip = ['youtube_video_url'];
        foreach ($collections as $collection) {
            if ($collection['name'] === "" || $collection['category_id'] === "" || $collection['sub_category_id'] === "" || $collection['price'] === "" || empty($collection['available_time_starts']) === "" || empty($collection['available_time_ends']) || empty($collection['veg']) === "") {
                Toastr::error(trans('messages.please_fill_all_required_fields'));
                return back();
            }
            array_push($data, [
                'name' => $collection['name'],
                'category_id' => $collection['sub_category_id']?$collection['sub_category_id']:$collection['category_id'],
                'category_ids' => json_encode([['id' => $collection['category_id'], 'position' => 0], ['id' => $collection['sub_category_id'], 'position' => 1]]),
                'veg' => $collection['veg'],  //$request->item_type;
                'price' => $collection['price'],
                'discount' => $collection['discount'],
                'discount_type' => $collection['discount_type'],
                'description' => $collection['description'],
                'available_time_starts' => $collection['available_time_starts'],
                'available_time_ends' => $collection['available_time_ends'],
                'image' => $collection['image'],
                'restaurant_id' => Helpers::get_restaurant_id(),
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
        return view('vendor-views.product.bulk-export');
    }

    public function bulk_export_data(Request $request)
    {
        if(!Helpers::get_restaurant_data()->food_section)
        {
            Toastr::warning(trans('messages.permission_denied'));
            return back();
        }

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
        ->where('restaurant_id', Helpers::get_restaurant_id())
        ->get();
        return (new FastExcel(ProductLogic::format_export_foods($products)))->download('Foods.xlsx');
    }
}
