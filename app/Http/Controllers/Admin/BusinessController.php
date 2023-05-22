<?php

namespace App\Http\Controllers\Admin;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Business;
use App\Models\AdminRole;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class BusinessController extends Controller
{

    public function add_new()
    {
        return view('admin-views.business.add-new');
    }

    public function store(Request $request)
    {
        try{
            $validator = Validator::make($request->all(), [
                'business_name' => 'required',
                'website' => 'required',
                'address' => 'required',
                'email' => 'required',
                'phone' => 'required',
                'fax' =>'required'
            ]);
    
            $business = new Business;
            $business->business_name = $request->business_name;
            $business->website = $request->website;
            $business->phone = $request->phone;
            $business->email = $request->email;
            $business->address = $request->address;
            
            $business->fax = $request->fax;
            $business->save();
    
            Toastr::success(trans('messages.business_added_successfully'));
            return redirect()->route('admin.business.list');
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }

    function list()
    {
        $em = Business::paginate(config('default_pagination'));
        return view('admin-views.business.list', compact('em'));
    }

    public function edit($id)
    {
        $e = Business::where(['id' => $id])->first();
        return view('admin-views.business.edit', compact('e'));
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'business_name' => 'required',
            'website' => 'required',
            'address' => 'required',
            'email' => 'required',
            'phone' => 'required',
            'fax' =>'required'
        ]);
        
        $business = Business::where('id', $request->id)->first();
        $business->business_name = $request->business_name;
        $business->website = $request->website;
        $business->phone = $request->phone;
        $business->email = $request->email;
        $business->address = $request->address;
        
        $business->fax = $request->fax;
        $business->save();

        Toastr::success(trans('messages.business_created_success'));
        return redirect()->route('admin.business.list');
    }

    public function distroy($id)
    {
        $role=Business::where(['id'=>$id])->delete();
        Toastr::info(trans('messages.business_deleted_successfully'));
        return back();
    }

    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $employees=Business::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('business_name', 'like', "%{$value}%");
                $q->orWhere('website', 'like', "%{$value}%");
                $q->orWhere('phone', 'like', "%{$value}%");
                $q->orWhere('email', 'like', "%{$value}%");
            }
        })->limit(50)->get();
        return response()->json([
            'view'=>view('admin-views.business.partials._table',compact('employees'))->render(),
            'count'=>$employees->count()
        ]);
    }
}
