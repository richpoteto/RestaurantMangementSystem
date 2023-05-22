<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\CentralLogics\OrderLogic;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\CentralLogics\Helpers;

class SenangPayController extends Controller
{
    public function return_senang_pay(Request $request)
    {
        $order = Order::where(['id' => $request['order_id']])->first();
        if ($request['status_id'] == 1) {
            $order->transaction_reference = $request['transaction_id'];
            $order->payment_method = 'senang_pay';
            $order->order_note = 'Senang pay, Hash : ' . $request['hash'];
            $order->payment_status = 'paid';
            $order->order_status = 'confirmed';
            $order->confirmed = now();
            $order->save();
            Helpers::send_order_notification($order);
            if ($order->callback != null) {
                return redirect($order->callback . '&status=success');
            } else {
                return \redirect()->route('payment-success');
            }
        }
        else
        {
            DB::table('orders')
            ->where('id', $request['order_id'])
            ->update([
                'payment_method'        => 'senang_pay',
                'order_status'          => 'failed',
                'failed'             => now(),
                'updated_at'            => now(),
            ]);
        }
        if ($order->callback != null) {
            return redirect($order->callback . '&status=fail');
        } else {
            return \redirect()->route('payment-fail');
        }
    }
}
