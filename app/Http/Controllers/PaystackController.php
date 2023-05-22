<?php

namespace App\Http\Controllers;

use App\CentralLogics\Helpers;
use App\CentralLogics\OrderLogic;
use App\Models\Order;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Paystack;

class PaystackController extends Controller
{
    public function redirectToGateway(Request $request)
    {
        try {
            $order = Order::with(['details'])->where(['id' => $request['orderID']])->first();
            DB::table('orders')
                ->where('id', $order['id'])
                ->update([
                    'payment_method' => 'paystack',
                    'order_status' => 'failed',
                    'transaction_reference' => $request['reference'],
                    'failed' => now(),
                    'updated_at' => now(),
                ]);

            return Paystack::getAuthorizationUrl()->redirectNow();
        } catch (\Exception $e) {
            Toastr::error(trans('messages.your_currency_is_not_supported',['method'=>trans('messages.paystack')]));
            return Redirect::back();
        }
    }

    public function handleGatewayCallback()
    {
        $paymentDetails = Paystack::getPaymentData();
        $order = Order::where(['transaction_reference' => $paymentDetails['data']['reference']])->first();
        if ($paymentDetails['status'] == true) {
            $order->payment_status = 'paid';
            $order->order_status = 'confirmed';
            $order->confirmed = now();
            $order->save();
            try {
                Helpers::send_order_notification($order);
            } catch (\Exception $e) {}
            if ($order->callback != null) {
                return redirect($order->callback . '&status=success');
            }else{
                return \redirect()->route('payment-success');
            }
        } else {
            DB::table('orders')
            ->where('id', $order['id'])
            ->update([
                'payment_method' => 'paystack',
                'order_status' => 'failed',
                'failed' => now(),
                'updated_at' => now(),
            ]);
            if ($order->callback != null) {
                return redirect($order->callback . '&status=fail');
            }else{
                return \redirect()->route('payment-fail');
            }
        }
    }
}
