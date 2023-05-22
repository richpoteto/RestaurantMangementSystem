<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\HottestLounge;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;

class HottestLoungeController extends Controller
{
    function index()
    {
        $hottest_lounges = HottestLounge::latest()->paginate(config('default_pagination'));        
        return view('admin-views.business-settings.hottest-lounges-ad-settings.index', compact('hottest_lounges'));        
    }

    public function store(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'title' => 'required|max:191',
            'lounge_image' => 'required',
            'lounge_name' => 'required',
            'description' => 'required',
        ], [
            'lounge_image.required' => trans('messages.select_a_image'),
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $hottestLounge = new HottestLounge;
        $hottestLounge->title = $request->title;
        $hottestLounge->lounge_image = Helpers::upload('restaurant/', 'png', $request->file('lounge_image'));
        $hottestLounge->lounge_name = $request->lounge_name;
        $hottestLounge->description = $request->description;
        $hottestLounge->save();       

        return response()->json([], 200);
    }

    public function edit($id)
    {        
        $hottestLounge = HottestLounge::find($id);        
        return view('admin-views.business-settings.hottest-lounges-ad-settings.edit', compact('hottestLounge'));
    }

    public function status(Request $request)
    {
        $hottestLounge = HottestLounge::findOrFail($request->id);
        $hottestLounge->status = $request->status;
        $hottestLounge->save();
        Toastr::success('Hottest Lounge Advertisement status changed.');
        return back();
    }

    public function update(Request $request, $id)
    {
        $lounge = HottestLounge::find($id);
        if($lounge){
            $lounge->title = $request->title;
            $lounge->lounge_name = $request->lounge_name;
            $lounge->description = $request->description;
            $lounge->save();
            Toastr::success('Hottest Lounge Advertisement updated successfully.');
            return back();
        } else {
            Toastr::success('Failed to update this hottest lounge.');
            return back();
        }
    }

    public function delete($id)
    {
        $hottestLounge = HottestLounge::find($id);
        if($hottestLounge){
            $hottestLounge->delete();
            Toastr::success('Hottest Lounge Advertisement removed successfully.');
            return back();
        }else{
            Toastr::success('Failed to remove this hottest lounge advertisement.');
            return back();
        }
    }  
}
