<?php

namespace App\Http\Controllers\Vendor;

use App\Models\WithdrawRequest;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\CentralLogics\Helpers;

class SystemController extends Controller
{
    public function dashboard()
    {
        $withdraw_req=WithdrawRequest::where('vendor_id',Helpers::get_restaurant_id())->latest()->paginate(10);
        return view('vendor-views.dashboard', compact('withdraw_req'));
    }

    public function restaurant_data()
    {
        $new_order = DB::table('orders')->where(['checked' => 0])->where('restaurant_id', Helpers::get_restaurant_id())->count();
        return response()->json([
            'success' => 1,
            'data' => ['new_order' => $new_order]
        ]);
    }
}
