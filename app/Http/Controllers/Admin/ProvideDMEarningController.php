<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DeliveryMan;
use App\Models\ProvideDMEarning;
use Illuminate\Support\Facades\Validator;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\DB;

class ProvideDMEarningController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $provide_dm_earning = ProvideDMEarning::latest()->paginate(config('default_pagination'));
        return view('admin-views.deliveryman-earning-provide.index', compact('provide_dm_earning'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'deliveryman_id' => 'required',
            'method'=>'max:191',
            'ref'=>'max:191',
            'amount' => 'required|numeric|between:0.01,999999999999.99',
        ]);


        $dm = DeliveryMan::findOrFail($request['deliveryman_id']);

        $current_balance = $dm->wallet?$dm->wallet->total_earning - $dm->wallet->total_withdrawn:0;

        if ($current_balance < $request['amount']) {
            $validator->getMessageBag()->add('amount', 'Insufficient balance!');
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $provide_dm_earning = new ProvideDMEarning();

        $provide_dm_earning->delivery_man_id = $dm->id;
        $provide_dm_earning->method = $request['method'];
        $provide_dm_earning->ref = $request['ref'];
        $provide_dm_earning->amount = $request['amount'];

        try
        {
            DB::beginTransaction();
            $provide_dm_earning->save();
            $dm->wallet->increment('total_withdrawn', $request['amount']);
            DB::commit();
        }
        catch(\Exception $e)
        {
            DB::rollBack();
            return response()->json(['error'=>$e],200);
        }

        return response()->json(200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $account_transaction=AccountTransaction::findOrFail($id);
        return view('admin-views.account.view', compact('account_transaction'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DeliveryMan::where('id', $id)->delete();
        Toastr::success(trans('messages.provided_dm_earnings_removed'));
        return back();
    }
}
