<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Campaign;
use App\Models\ItemCampaign;
use App\Models\Restaurant;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use App\CentralLogics\Helpers;
use App\Models\Translation;

class CampaignController extends Controller
{
    function index($type)
    {
        return view('admin-views.campaign.'.$type.'.index');
    }

    function list($type)
    {
        if($type=='basic')
        {
            $campaigns=Campaign::latest()->paginate(config('default_pagination'));
        }
        else{
            $campaigns=ItemCampaign::latest()->paginate(config('default_pagination'));
        }
        
        return view('admin-views.campaign.'.$type.'.list', compact('campaigns'));
    }

    public function storeBasic(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|unique:campaigns|max:191',
            'description'=>'max:1000',
            'image' => 'required',
        ]);
        
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $campaign = new Campaign;
        $campaign->title = $request->title[array_search('en', $request->lang)];
        $campaign->description = $request->description[array_search('en', $request->lang)];
        $campaign->image = Helpers::upload('campaign/', 'png', $request->file('image'));
        $campaign->start_date = $request->start_date;
        $campaign->end_date = $request->end_date;
        $campaign->start_time = $request->start_time;
        $campaign->end_time = $request->end_time;
        $campaign->save();
        
        $data = [];
        foreach ($request->lang as $index => $key) {
            if ($request->title[$index] && $key != 'en') {
                array_push($data, array(
                    'translationable_type' => 'App\Models\Campaign',
                    'translationable_id' => $campaign->id,
                    'locale' => $key,
                    'key' => 'title',
                    'value' => $request->title[$index],
                ));
            }
            if ($request->description[$index] && $key != 'en') {
                array_push($data, array(
                    'translationable_type' => 'App\Models\Campaign',
                    'translationable_id' => $campaign->id,
                    'locale' => $key,
                    'key' => 'description',
                    'value' => $request->description[$index],
                ));
            }
        }

        Translation::insert($data);

        return response()->json([], 200);
    }

    public function update(Request $request, Campaign $campaign)
    {
        $validator = Validator::make($request->all(),[
            'title' => 'required|max:191',
            'description' => 'max:1000'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }
        
        $campaign->title = $request->title[array_search('en', $request->lang)];
        $campaign->description = $request->description[array_search('en', $request->lang)];
        $campaign->image = $request->has('image') ? Helpers::update('campaign/', $campaign->image, 'png', $request->file('image')) : $campaign->image;;
        $campaign->start_date = $request->start_date;
        $campaign->end_date = $request->end_date;
        $campaign->start_time = $request->start_time;
        $campaign->end_time = $request->end_time;
        $campaign->save();

        foreach ($request->lang as $index => $key) {
            if ($request->title[$index] && $key != 'en') {
                Translation::updateOrInsert(
                    ['translationable_type' => 'App\Models\Campaign',
                        'translationable_id' => $campaign->id,
                        'locale' => $key,
                        'key' => 'title'],
                    ['value' => $request->title[$index]]
                );
            }
            if ($request->description[$index] && $key != 'en') {
                Translation::updateOrInsert(
                    ['translationable_type' => 'App\Models\Campaign',
                        'translationable_id' => $campaign->id,
                        'locale' => $key,
                        'key' => 'description'],
                    ['value' => $request->description[$index]]
                );
            }
        }

        return response()->json([], 200);
    }
    
    public function storeItem(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|max:191|unique:item_campaigns',
            'image' => 'required',
            'category_id' => 'required',
            'price' => 'required|numeric|between:0.01,999999999999.99',
            'restaurant_id' => 'required',
            'start_time' => 'required',
            'end_time' => 'required',
            'start_date' => 'required',
            'start_date' => 'required',
            'veg' => 'required',
            'description'=>'max:1000'
        ], [
            'category_id.required' => trans('messages.select_category'),
        ]);
        
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

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

        $campaign = new ItemCampaign;

        $category = [];
        if ($request->category_id != null) {
            array_push($category, [
                'id' => $request->category_id,
                'position' => 1,
            ]);
        }
        if ($request->sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_category_id,
                'position' => 2,
            ]);
        }
        if ($request->sub_sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_sub_category_id,
                'position' => 3,
            ]);
        }

        $campaign->category_ids = json_encode($category);
        $choice_options = [];
        if ($request->has('choice')) {
            foreach ($request->choice_no as $key => $no) {
                $str = 'choice_options_' . $no;
                if ($request[$str][0] == null) {
                    $validator->getMessageBag()->add('name', trans('messages.attribute_choice_option_value_can_not_be_null'));
                    return response()->json(['errors' => Helpers::error_processor($validator)]);
                }
                $item['name'] = 'choice_' . $no;
                $item['title'] = $request->choice[$key];
                $item['options'] = explode(',', implode('|', preg_replace('/\s+/', ' ', $request[$str])));
                array_push($choice_options, $item);
            }
        }
        $campaign->choice_options = json_encode($choice_options);
        $variations = [];
        $options = [];
        if ($request->has('choice_no')) {
            foreach ($request->choice_no as $key => $no) {
                $name = 'choice_options_' . $no;
                $my_str = implode('|', $request[$name]);
                array_push($options, explode(',', $my_str));
            }
        }
        //Generates the combinations of customer choice options
        $combinations = Helpers::combinations($options);
        if (count($combinations[0]) > 0) {
            foreach ($combinations as $key => $combination) {
                $str = '';
                foreach ($combination as $k => $item) {
                    if ($k > 0) {
                        $str .= '-' . str_replace(' ', '', $item);
                    } else {
                        $str .= str_replace(' ', '', $item);
                    }
                }
                $item = [];
                $item['type'] = $str;
                $item['price'] = abs($request['price_' . str_replace('.', '_', $str)]);
                array_push($variations, $item);
            }
        }
        $campaign->admin_id = auth('admin')->id();
        $campaign->title = $request->title[array_search('en', $request->lang)];
        $campaign->description = $request->description[array_search('en', $request->lang)];
        $campaign->image = Helpers::upload('campaign/', 'png', $request->file('image'));
        $campaign->start_date = $request->start_date;
        $campaign->end_date = $request->end_date;
        $campaign->start_time = $request->start_time;
        $campaign->end_time = $request->end_time;
        $campaign->variations = json_encode($variations);
        $campaign->price = $request->price;
        $campaign->discount = $request->discount_type == 'amount' ? $request->discount : $request->discount;
        $campaign->discount_type = $request->discount_type;
        $campaign->attributes = $request->has('attribute_id') ? json_encode($request->attribute_id) : json_encode([]);
        $campaign->add_ons = $request->has('addon_ids') ? json_encode($request->addon_ids) : json_encode([]);
        $campaign->restaurant_id = $request->restaurant_id;
        $campaign->veg = $request->veg;
        $campaign->save();
        
        $data = [];
        foreach ($request->lang as $index => $key) {
            if ($request->title[$index] && $key != 'en') {
                array_push($data, array(
                    'translationable_type' => 'App\Models\ItemCampaign',
                    'translationable_id' => $p->id,
                    'locale' => $key,
                    'key' => 'title',
                    'value' => $request->title[$index],
                ));
            }
            if ($request->description[$index] && $key != 'en') {
                array_push($data, array(
                    'translationable_type' => 'App\Models\ItemCampaign',
                    'translationable_id' => $p->id,
                    'locale' => $key,
                    'key' => 'description',
                    'value' => $request->description[$index],
                ));
            }
        }
        Translation::insert($data);

        return response()->json([], 200);
    }

    public function updateItem(ItemCampaign $campaign, Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|array',
            'category_id' => 'required',
            'price' => 'required|numeric|between:0.01,999999999999.99',
            'restaurant_id' => 'required',
            'veg' => 'required',
            'description.*'=>'max:1000',
        ]);
        
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

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

        $category = [];
        if ($request->category_id != null) {
            array_push($category, [
                'id' => $request->category_id,
                'position' => 1,
            ]);
        }
        if ($request->sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_category_id,
                'position' => 2,
            ]);
        }
        if ($request->sub_sub_category_id != null) {
            array_push($category, [
                'id' => $request->sub_sub_category_id,
                'position' => 3,
            ]);
        }

        $campaign->category_ids = json_encode($category);
        $choice_options = [];
        if ($request->has('choice')) {
            foreach ($request->choice_no as $key => $no) {
                $str = 'choice_options_' . $no;
                if ($request[$str][0] == null) {
                    $validator->getMessageBag()->add('name', trans('messages.attribute_choice_option_value_can_not_be_null'));
                    return response()->json(['errors' => Helpers::error_processor($validator)]);
                }
                $item['name'] = 'choice_' . $no;
                $item['title'] = $request->choice[$key];
                $item['options'] = explode(',', implode('|', preg_replace('/\s+/', ' ', $request[$str])));
                array_push($choice_options, $item);
            }
        }
        $campaign->choice_options = json_encode($choice_options);
        $variations = [];
        $options = [];
        if ($request->has('choice_no')) {
            foreach ($request->choice_no as $key => $no) {
                $name = 'choice_options_' . $no;
                $my_str = implode('|', $request[$name]);
                array_push($options, explode(',', $my_str));
            }
        }
        //Generates the combinations of customer choice options
        $combinations = Helpers::combinations($options);
        if (count($combinations[0]) > 0) {
            foreach ($combinations as $key => $combination) {
                $str = '';
                foreach ($combination as $k => $item) {
                    if ($k > 0) {
                        $str .= '-' . str_replace(' ', '', $item);
                    } else {
                        $str .= str_replace(' ', '', $item);
                    }
                }
                $item = [];
                $item['type'] = $str;
                $item['price'] = abs($request['price_' . str_replace('.', '_', $str)]);
                array_push($variations, $item);
            }
        }
        $campaign->title = $request->title[array_search('en', $request->lang)];
        $campaign->description = $request->description[array_search('en', $request->lang)];
        $campaign->image = $request->has('image') ? Helpers::update('campaign/', $campaign->image, 'png', $request->file('image')) : $campaign->image;
        $campaign->start_date = $request->start_date;
        $campaign->end_date = $request->end_date;
        $campaign->start_time = $request->start_time;
        $campaign->end_time = $request->end_time;
        $campaign->restaurant_id = $request->restaurant_id;
        $campaign->variations = json_encode($variations);
        $campaign->price = $request->price;
        $campaign->discount = $request->discount_type == 'amount' ? $request->discount : $request->discount;
        $campaign->discount_type = $request->discount_type;
        $campaign->attributes = $request->has('attribute_id') ? json_encode($request->attribute_id) : json_encode([]);
        $campaign->add_ons = $request->has('addon_ids') ? json_encode($request->addon_ids) : json_encode([]);
        $campaign->veg = $request->veg;
        $campaign->save();

        foreach ($request->lang as $index => $key) {
            if ($request->title[$index] && $key != 'en') {
                Translation::updateOrInsert(
                    ['translationable_type' => 'App\Models\ItemCampaign',
                        'translationable_id' => $campaign->id,
                        'locale' => $key,
                        'key' => 'title'],
                    ['value' => $request->title[$index]]
                );
            }
            if ($request->description[$index] && $key != 'en') {
                Translation::updateOrInsert(
                    ['translationable_type' => 'App\Models\ItemCampaign',
                        'translationable_id' => $campaign->id,
                        'locale' => $key,
                        'key' => 'description'],
                    ['value' => $request->description[$index]]
                );
            }
        }

        return response()->json([], 200);
    }

    public function edit($type, $campaign)
    {
        if($type=='basic')
        {
            $campaign = Campaign::withoutGlobalScope('translate')->findOrFail($campaign);
        }
        else
        {
            $campaign = ItemCampaign::withoutGlobalScope('translate')->findOrFail($campaign);
        }
        return view('admin-views.campaign.'.$type.'.edit', compact('campaign'));
    }

    public function view($type, $campaign)
    {   
        if($type=='basic')
        {
            $campaign = Campaign::findOrFail($campaign);
            $restaurants = $campaign->restaurants()->paginate(config('default_pagination'));
            $restaurant_ids = []; 
            foreach($campaign->restaurants as $restaurant)
            {
                $restaurant_ids[] = $restaurant->id;
            }
            return view('admin-views.campaign.basic.view', compact('campaign', 'restaurants', 'restaurant_ids'));
        }
        else
        {
            $campaign = ItemCampaign::findOrFail($campaign);
        }
        return view('admin-views.campaign.item.view', compact('campaign'));
        
    }

    public function status($type, $id, $status)
    {
        if($type=='item')
        {
            $campaign = ItemCampaign::findOrFail($id);
        }
        else{
            $campaign = Campaign::findOrFail($id);
        }
        $campaign->status = $status;
        $campaign->save();
        Toastr::success(trans('messages.campaign_status_updated'));
        return back();
    }

    public function delete(Campaign $campaign)
    {
        if (Storage::disk('public')->exists('campaign/' . $campaign->image)) {
            Storage::disk('public')->delete('campaign/' . $campaign->image);
        }
        $campaign->translations()->delete();
        $campaign->delete();
        Toastr::success(trans('messages.campaign_deleted_successfully'));
        return back();
    }
    public function delete_item(ItemCampaign $campaign)
    {
        if (Storage::disk('public')->exists('campaign/' . $campaign->image)) {
            Storage::disk('public')->delete('campaign/' . $campaign->image);
        }
        $campaign->translations()->delete();
        $campaign->delete();
        Toastr::success(trans('messages.campaign_deleted_successfully'));
        return back();
    }

    public function remove_restaurant(Campaign $campaign, $restaurant)
    {
        $campaign->restaurants()->detach($restaurant);
        $campaign->save();
        Toastr::success(trans('messages.restaurant_remove_from_campaign'));
        return back();
    }
    public function addrestaurant(Request $request, Campaign $campaign)
    {
        $campaign->restaurants()->attach($request->restaurant_id);
        $campaign->save();
        Toastr::success(trans('messages.restaurant_added_to_campaign'));
        return back();
    }

    public function searchBasic(Request $request){
        $key = explode(' ', $request['search']);
        $campaigns=Campaign::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('title', 'like', "%{$value}%");
            }
        })->limit(50)->get();
        return response()->json([
            'view'=>view('admin-views.campaign.basic.partials._table',compact('campaigns'))->render(),
            'count'=>$campaigns->count()
        ]);
    }
    public function searchItem(Request $request){
        $key = explode(' ', $request['search']);
        $campaigns=ItemCampaign::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('title', 'like', "%{$value}%");
            }
        })->limit(50)->get();
        return response()->json([
            'view'=>view('admin-views.campaign.item.partials._table',compact('campaigns'))->render()
        ]);
    }
}