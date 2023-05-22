<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Banner;
use Brian2694\Toastr\Facades\Toastr;


class BannerController extends Controller
{
    function list()
    {
        $banners=Banner::latest()->paginate(config('default_pagination'));
        return view('vendor-views.banner.list',compact('banners'));
    }


    public function status(Request $request)
    {
        $banner = Banner::findOrFail($request->id);
        $restaurant_id = $request->status;
        $restaurant_ids = json_decode($banner->restaurant_ids);
        if(in_array($restaurant_id, $restaurant_ids))
        {
            unset($restaurant_ids[array_search($restaurant_id, $restaurant_ids)]);
        }
        else
        {
            array_push($restaurant_ids, $restaurant_id);
        }

        $banner->restaurant_ids = json_encode($restaurant_ids);
        $banner->save();
        Toastr::success(trans('messages.capmaign_participation_updated'));
        return back();
    }

}
