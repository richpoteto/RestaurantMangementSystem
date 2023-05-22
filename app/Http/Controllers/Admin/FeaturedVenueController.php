<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\FeaturedVenue;
use App\Models\Restaurant;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;

class FeaturedVenueController extends Controller
{
    function index()
    {
        $featuredVenues = FeaturedVenue::latest()->paginate(config('default_pagination'));
        return view('admin-views.featured-venues.index', compact('featuredVenues'));
    }

    public function store(Request $request)
    {        
        $validator = Validator::make($request->all(), [
            'title' => 'required|max:191',
            'featured_image' => 'required',
            'zone_id' => 'required',
            'restaurant_id' => 'required',
            'description' => 'required',
        ], [
            'zone_id.required' => trans('messages.select_a_zone'),
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $featuredVenue = new FeaturedVenue;
        $featuredVenue->title = $request->title;
        $featuredVenue->zone_id = $request->zone_id;
        $featuredVenue->venue_id = $request->restaurant_id;
        
        $restaurant = Restaurant::find($request->restaurant_id);
        if($restaurant){
            $featuredVenue->venue_name = $restaurant->name;
        } else {
            $featuredVenue->venue_name = '';
        }
        
        $featuredVenue->featured_image = Helpers::upload('restaurant/', 'png', $request->file('featured_image'));
        $featuredVenue->description = $request->description;
        $featuredVenue->save();
 
        return response()->json([], 200);
    }

    public function edit($id)
    {
        $featuredVenue = FeaturedVenue::find($id);
        return view('admin-views.featured-venues.edit', compact('featuredVenue'));
    }

    public function status(Request $request)
    {
        $featuredVenue = FeaturedVenue::findOrFail($request->id);
        $featuredVenue->status = $request->status;
        $featuredVenue->save();
        Toastr::success('Featured Restaurant status changed.');
        return back();
    }

    public function update(Request $request, $id)
    {
        $venue = FeaturedVenue::find($id);
        if($venue){
            $venue->title = $request->title;
            $venue->description = $request->description;
            $venue->save();
            Toastr::success('Featured Restaurant updated successfully.');
            return back();
        }else{
            Toastr::success('Failed to update this featured venue.');
            return back();
        }
    }

    public function delete($id)
    {
        $featuredVenue = FeaturedVenue::find($id);
        if($featuredVenue){
            $featuredVenue->delete();
            Toastr::success('Featured Restaurant removed successfully.');
            return back();
        }else{
            Toastr::success('Failed to remove this featured venue.');
            return back();
        }
    }

    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $featuredVenues=FeaturedVenue::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('title', 'like', "%{$value}%");
            }
        })->limit(50)->get();
        return response()->json([
            'view'=>view('admin-views.featured-venues.partials._table',compact('featuredVenues'))->render(),
            'count'=>$featuredVenues->count()
        ]);
    }
}
