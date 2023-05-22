<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Log;

class AddGalleryController extends Controller
{
    public function view()
    {
        return view('vendor-views.add-gallery.index');
    }
    public function update(Request $request)
    {
        $vendor = auth('vendor')->user();
        $foodGallery = json_decode($vendor->food_gallery, true) ?? [];
        $diningGallery = json_decode($vendor->dining_gallery, true) ?? [];
        $chefGallery = json_decode($vendor->chef_gallery, true) ?? [];
        $productGallery = json_decode($vendor->product_gallery, true) ?? [];
        $data = [];

        Log::channel('stderr')->info($foodGallery);
        Log::channel('stderr')->info($diningGallery);
        Log::channel('stderr')->info($chefGallery);
        Log::channel('stderr')->info($productGallery);
        Log::channel('stderr')->info("First pass");

        if ($request->has('food_gallery')) {
            $food_images = $request->file('food_gallery');
            Log::channel('stderr')->info($food_images);
            Log::channel('stderr')->info('Food Images');
            foreach ($food_images as $image) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $image->move(public_path('assets/chef/image'), $imageName);
                array_push($foodGallery, $imageName);
            }
        }
        if ($request->has('dining_gallery')) {
            $dining_images = $request->file('dining_gallery');
            Log::channel('stderr')->info($dining_images);
            Log::channel('stderr')->info('Dining Images');
            foreach ($dining_images as $image) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $image->move(public_path('assets/chef/image'), $imageName);
                array_push($diningGallery, $imageName);
            }
        }
        if ($request->has('chef_gallery')) {
            $chef_images = $request->file('chef_gallery');
            Log::channel('stderr')->info($chef_images);
            Log::channel('stderr')->info('Chef Images');
            foreach ($chef_images as $image) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $image->move(public_path('assets/chef/image'), $imageName);
                array_push($chefGallery, $imageName);
            }
        }
        if ($request->has('product_gallery')) {
            $product_images = $request->file('product_gallery');
            Log::channel('stderr')->info($product_images);
            Log::channel('stderr')->info('product images');
            foreach ($product_images as $image) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $image->move(public_path('assets/chef/image'), $imageName);
                array_push($productGallery, $imageName);
            }
        }

        $vendor->food_gallery = json_encode($foodGallery);
        $vendor->dining_gallery = json_encode($diningGallery);
        $vendor->chef_gallery = json_encode($chefGallery);
        $vendor->product_gallery = json_encode($productGallery);
    
        $vendor->save();
        Toastr::success(trans('messages.restaurant_image_updated'));
    }
}