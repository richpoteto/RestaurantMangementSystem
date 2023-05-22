<?php

namespace App\Http\Controllers\Vendor;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\VendorEmployee;
use App\Models\EmployeeRole;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EmployeeController extends Controller
{

    public function add_new()
    {
        $rls = EmployeeRole::where('restaurant_id',Helpers::get_restaurant_id())->get();
        return view('vendor-views.employee.add-new', compact('rls'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'f_name' => 'required',
            'l_name' => 'nullable|max:100',
            'role_id' => 'required',
            'image' => 'required',
            'email' => 'required|unique:vendor_employees',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|max:20|unique:vendor_employees',
            'password' => 'required|min:8',
        ]);

        DB::table('vendor_employees')->insert([
            'f_name' => $request->f_name,
            'l_name' => $request->l_name,
            'phone' => $request->phone,
            'email' => $request->email,
            'employee_role_id' => $request->role_id,
            'password' => bcrypt($request->password),
            'vendor_id'=> Helpers::get_vendor_id(),
            'restaurant_id'=>Helpers::get_restaurant_id(),
            'image' => Helpers::upload('vendor/', 'png', $request->file('image')),
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        Toastr::success('Employee added successfully!');
        return redirect()->route('vendor.employee.list');
    }

    function list()
    {
        $em = VendorEmployee::where('restaurant_id', Helpers::get_restaurant_id())->with(['role'])->latest()->paginate(config('default_pagination'));
        return view('vendor-views.employee.list', compact('em'));
    }

    public function edit($id)
    {
        $e = VendorEmployee::where('restaurant_id', Helpers::get_restaurant_id())->where(['id' => $id])->first();
        $rls = EmployeeRole::where('restaurant_id',Helpers::get_restaurant_id())->get();
        return view('vendor-views.employee.edit', compact('rls', 'e'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'f_name' => 'required',
            'l_name' => 'nullable|max:100',
            'role_id' => 'required',
            'email' => 'required|unique:vendor_employees,email,'.$id,
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|max:20|unique:vendor_employees,phone,'.$id,
        ], [
            'f_name.required' => trans('messages.first_name_is_required'),
        ]);

        $e = VendorEmployee::where('restaurant_id', Helpers::get_restaurant_id())->find($id);
        if ($request['password'] == null) {
            $pass = $e['password'];
        } else {
            if (strlen($request['password']) < 7) {
                Toastr::warning(trans('messages.password_length_warning',['length'=>'8']));
                return back();
            }
            $pass = bcrypt($request['password']);
        }

        if ($request->has('image')) {
            $e['image'] = Helpers::update('vendor/', $e->image, 'png', $request->file('image'));
        }

        DB::table('vendor_employees')->where(['id' => $id])->update([
            'f_name' => $request->f_name,
            'l_name' => $request->l_name,
            'phone' => $request->phone,
            'email' => $request->email,
            'employee_role_id' => $request->role_id,
            'vendor_id'=> Helpers::get_vendor_id(),
            'restaurant_id'=>Helpers::get_restaurant_id(),
            'password' => $pass,
            'image' => $e['image'],
            'updated_at' => now(),
        ]);

        Toastr::success('Employee updated successfully!');
        return redirect()->route('vendor.employee.list');
    }

    public function distroy($id)
    {
        $role=VendorEmployee::where('restaurant_id', Helpers::get_restaurant_id())->where(['id'=>$id])->delete();
        Toastr::info(trans('messages.employee_deleted_successfully'));
        return back();
    }

    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $employees=VendorEmployee::where('restaurant_id', Helpers::get_restaurant_id())->
        where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('f_name', 'like', "%{$value}%");
                $q->orWhere('l_name', 'like', "%{$value}%");
                $q->orWhere('phone', 'like', "%{$value}%");
                $q->orWhere('email', 'like', "%{$value}%");
            }
        })->limit(50)->get();
        return response()->json([
            'view'=>view('vendor-views.employee.partials._table',compact('employees'))->render(),
            'count'=>$employees->count()
        ]);
    }
}
