<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Restaurant;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use App\CentralLogics\Helpers;

class RestaurantController extends Controller
{
    public function view()
    {
        $shop = Helpers::get_restaurant_data();
        return view('vendor-views.shop.shopInfo', compact('shop'));
    }

    public function edit()
    {
        $shop = Helpers::get_restaurant_data();
        return view('vendor-views.shop.edit', compact('shop'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'name' => 'required|max:191',
            'address' => 'nullable|max:1000',
            'contact' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|max:20|unique:restaurants,phone,'.Helpers::get_restaurant_id(),
        ], [
            'f_name.required' => trans('messages.first_name_is_required'),
        ]);
        $shop = Restaurant::findOrFail(Helpers::get_restaurant_id());
        $shop->name = $request->name;
        $shop->address = $request->address;
        $shop->phone = $request->contact;
        
        $shop->logo = $request->has('image') ? Helpers::update('restaurant/', $shop->logo, 'png', $request->file('image')) : $shop->logo;
        
        $shop->cover_photo = $request->has('photo') ? Helpers::update('restaurant/cover/', $shop->cover_photo, 'png', $request->file('photo')) : $shop->cover_photo;
        
        $shop->save();

        Toastr::success(trans('messages.restaurant_data_updated'));
        return redirect()->route('vendor.shop.view');
    }

}
