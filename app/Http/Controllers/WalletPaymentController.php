<?php

namespace App\Http\Controllers;

use App\CentralLogics\CustomerLogic;
use App\Models\Order;
use App\Models\BusinessSetting;
use App\CentralLogics\Helpers;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;

class WalletPaymentController extends Controller
{
    /**
     * make_payment Rave payment process
     * @return void
     */
    public function make_payment(Request $request)
    {
        if(BusinessSetting::where('key','wallet_status')->first()->value != 1) return Toastr::error(trans('messages.customer_wallet_disable_warning'));
        $order = Order::with('customer')->where(['id' => $request->order_id, 'user_id'=>$request->user_id])->first();
        if($order->customer->wallet_balance < $order->order_amount) 
        {
            Toastr::error(trans('messages.insufficient_balance'));
            return back();
        }
        $transaction = CustomerLogic::create_wallet_transaction($order->user_id, $order->order_amount, 'order_place', $order->id);
        if ($transaction != false) {
            try {
                $order->transaction_reference = $transaction->transaction_id;
                $order->payment_method = 'wallet';
                $order->payment_status = 'paid';
                $order->order_status = 'confirmed';
                $order->confirmed = now();
                $order->save();
                Helpers::send_order_notification($order);
            } catch (\Exception $e) {
                info($e);
            }

            if ($order->callback != null) {
                return redirect($order->callback . '&status=success');
            }else{
                return \redirect()->route('payment-success');
            }
        }
        else{
            $order->payment_method = 'wallet';
            $order->order_status = 'failed';
            $order->failed = now();
            $order->save();
            if ($order->callback != null) {
                return redirect($order->callback . '&status=fail');
            }else{
                return \redirect()->route('payment-fail');
            }
        }

    }
}
