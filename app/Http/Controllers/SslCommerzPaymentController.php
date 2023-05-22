<?php

namespace App\Http\Controllers;

ini_set('memory_limit', '-1');

use App\CentralLogics\Helpers;
use App\CentralLogics\OrderLogic;
use App\Library\SslCommerz\SslCommerzNotification;
use App\Models\Order;
use Brian2694\Toastr\Facades\Toastr;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class SslCommerzPaymentController extends Controller
{
    public function index(Request $request)
    {
        $order = Order::with(['details'])->where(['id' => session('order_id')])->first();
        $tr_ref = Str::random(6) . '-' . rand(1, 1000);

        $post_data = array();
        $post_data['total_amount'] = $order->order_amount;
        $post_data['currency'] = Helpers::currency_code();
        $post_data['tran_id'] = $tr_ref;

        # CUSTOMER INFORMATION
        $post_data['cus_name'] = $order->customer['f_name'];
        $post_data['cus_email'] = $order->customer['email'] == null ? "example@example.com" : $order->customer['email'];
        $post_data['cus_add1'] = 'Customer Address';
        $post_data['cus_add2'] = "";
        $post_data['cus_city'] = "";
        $post_data['cus_state'] = "";
        $post_data['cus_postcode'] = "";
        $post_data['cus_country'] = "Bangladesh";
        $post_data['cus_phone'] = $order->customer['phone'] == null ? '0000000000' : $order->customer['phone'];
        $post_data['cus_fax'] = "";

        # SHIPMENT INFORMATION
        $post_data['ship_name'] = "Shipping";
        $post_data['ship_add1'] = "address 1";
        $post_data['ship_add2'] = "address 2";
        $post_data['ship_city'] = "City";
        $post_data['ship_state'] = "State";
        $post_data['ship_postcode'] = "ZIP";
        $post_data['ship_phone'] = "";
        $post_data['ship_country'] = "Country";

        $post_data['shipping_method'] = "NO";
        $post_data['product_name'] = "Computer";
        $post_data['product_category'] = "Goods";
        $post_data['product_profile'] = "physical-goods";

        # OPTIONAL PARAMETERS
        $post_data['value_a'] = "ref001";
        $post_data['value_b'] = "ref002";
        $post_data['value_c'] = "ref003";
        $post_data['value_d'] = "ref004";

        DB::table('orders')
            ->where('id', $order['id'])
            ->update([
                'transaction_reference' => $tr_ref,
                'payment_method' => 'ssl_commerz_payment',
                'order_status' => 'failed',
                'failed' => now(),
                'updated_at' => now(),
            ]);

        try {
            $sslc = new SslCommerzNotification();
            $payment_options = $sslc->makePayment($post_data, 'hosted');
            if (!is_array($payment_options)) {
                Toastr::error(trans('messages.your_currency_is_not_supported',['method'=>trans('messages.sslcommerz')]));
                return back();
            }
        } catch (\Exception $exception) {
            Toastr::error(trans('messages.misconfiguration_or_data_missing'));
            return back();
        }
    }

    public function success(Request $request)
    {
        $tran_id = $request->input('tran_id');
        $amount = $request->input('amount');
        $currency = $request->input('currency');
        $sslc = new SslCommerzNotification();

        $order = Order::where('transaction_reference', $tran_id)->first();

        $validation = $sslc->orderValidate($tran_id, $amount, $currency, $request->all());
        if ($validation == TRUE) {
            $order->order_status='confirmed';
            $order->payment_method='ssl_commerz_payment';
            $order->transaction_reference=$tran_id;
            $order->payment_status='paid';
            $order->confirmed=now();
            $order->save();
            try {
                Helpers::send_order_notification($order);
            } catch (\Exception $e) {
            }

            if ($order->callback != null) {
                return redirect($order->callback . '&status=success');
            }

            return \redirect()->route('payment-success');

        } else {
            DB::table('orders')
                ->where('transaction_reference', $tran_id)
                ->update(['order_status' => 'failed', 'payment_status' => 'unpaid', 'failed'=>now()]);
            if ($order->callback != null) {
                return redirect($order->callback . '&status=fail');
            }
            return \redirect()->route('payment-fail');
        }
    }

    public function fail(Request $request)
    {
        $tran_id = $request->input('tran_id');
        DB::table('orders')
            ->where('transaction_reference', $tran_id)
            ->update(['order_status' => 'failed', 'payment_status' => 'unpaid', 'failed'=>now()]);

        $order_detials = DB::table('orders')
            ->where('transaction_reference', $tran_id)
            ->select('id', 'transaction_reference', 'order_status', 'order_amount', 'callback')->first();

        if ($order_detials->callback != null) {
            return redirect($order_detials->callback . '&status=fail');
        }
        return \redirect()->route('payment-fail');
    }

    public function cancel(Request $request)
    {
        $tran_id = $request->input('tran_id');
        DB::table('orders')
            ->where('transaction_reference', $tran_id)
            ->update(['order_status' => 'canceled', 'payment_status' => 'unpaid']);

        $order_detials = DB::table('orders')
            ->where('transaction_reference', $tran_id)
            ->select('id', 'transaction_reference', 'order_status', 'order_amount', 'callback')->first();

        if ($order_detials->callback != null) {
            return redirect($order_detials->callback . '&status=cancel');
        }
        return \redirect()->route('payment-cancel');
    }

    public function ipn(Request $request)
    {
        #Received all the payement information from the gateway
        if ($request->input('tran_id')) #Check transation id is posted or not.
        {
            $tran_id = $request->input('tran_id');
            #Check order status in order tabel against the transaction id or order id.
            $order_details = DB::table('orders')
                ->where('transaction_reference', $tran_id)
                ->select('transaction_reference', 'order_status', 'order_amount')->first();

            if ($order_details->order_status == 'pending') {
                $sslc = new SslCommerzNotification();
                $validation = $sslc->orderValidate($tran_id, $order_details->order_amount, 'BDT', $request->all());
                if ($validation == TRUE) {
                    /*
                    That means IPN worked. Here you need to update order status
                    in order table as confirmed or Complete.
                    Here you can also sent sms or email for successful transaction to customer
                    */
                    $update_product = DB::table('orders')
                        ->where('transaction_reference', $tran_id)
                        ->update(['order_status' => 'confirmed', 'payment_status' => 'paid']);

                    echo "Transaction is successfully completed";
                } else {
                    /*
                    That means IPN worked, but Transation validation failed.
                    Here you need to update order status as Failed in order table.
                    */
                    $update_product = DB::table('orders')
                        ->where('transaction_reference', $tran_id)
                        ->update(['order_status' => 'confirmed', 'payment_status' => 'unpaid']);

                    echo "validation Fail";
                }

            } else if ($order_details->order_status == 'confirmed' || $order_details->order_status == 'complete') {

                #That means Order status already updated. No need to udate database.

                echo "Transaction is already successfully completed";
            } else {
                #That means something wrong happened. You can redirect customer to your product page.

                echo "Invalid Transaction";
            }
        } else {
            echo "Invalid Data";
        }
    }

}
