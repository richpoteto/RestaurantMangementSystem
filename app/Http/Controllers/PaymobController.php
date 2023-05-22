<?php

namespace App\Http\Controllers;

use App\CentralLogics\Helpers;
use App\CentralLogics\OrderLogic;
use Brian2694\Toastr\Facades\Toastr;
use App\Models\Order;
use Illuminate\Http\Request;

class PaymobController extends Controller
{
    protected function cURL($url, $json)
    {
        // Create curl resource
        $ch = curl_init($url);

        // Request headers
        $headers = array();
        $headers[] = 'Content-Type: application/json';

        // Return the transfer as a string
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($json));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        // $output contains the output string
        $output = curl_exec($ch);

        // Close curl resource to free up system resources
        curl_close($ch);
        return json_decode($output);
    }

    protected function GETcURL($url)
    {
        // Create curl resource
        $ch = curl_init($url);

        // Request headers
        $headers = array();
        $headers[] = 'Content-Type: application/json';

        // Return the transfer as a string
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        // $output contains the output string
        $output = curl_exec($ch);

        // Close curl resource to free up system resources
        curl_close($ch);
        return json_decode($output);
    }

    public function credit()
    {
        $currency_code = Helpers::currency_code();
        if ($currency_code != "EGP") {
            Toastr::error(trans('messages.paymob_supports_EGP_currency'));
            return back();
        }

        $config = Helpers::get_business_settings('paymob_accept');
        try {
            $token = $this->getToken();
            $order = $this->createOrder($token);
            $paymentToken = $this->getPaymentToken($order, $token);
        }catch (\Exception $exception){
            Toastr::error(trans('messages.country_permission_denied_or_misconfiguration'));
            return back();
        }
        return \Redirect::away('https://portal.weaccept.co/api/acceptance/iframes/' . $config['iframe_id'] . '?payment_token=' . $paymentToken);
    }

    public function getToken()
    {
        $config = Helpers::get_business_settings('paymob_accept');
        $response = $this->cURL(
            'https://accept.paymobsolutions.com/api/auth/tokens',
            ['api_key' => $config['api_key']]
        );

        return $response->token;
    }

    public function createOrder($token)
    {
        $order = Order::with(['details'])->where(['id' => session('order_id')])->first();

        $items = [];
        foreach ($order->details as $detail) {
            array_push($items, [
                'name' => $detail->campaign?$detail->campaign->title:$detail->food['name'],
                'amount_cents' => round($detail['price'],2) * 100,
                'description' => $detail->campaign?$detail->campaign->title:$detail->food['name'],
                'quantity' => $detail['quantity']
            ]);
        }

        $data = [
            "auth_token" => $token,
            "delivery_needed" => "false",
            "amount_cents" => round($order->order_amount,2) * 100,
            "currency" => "EGP",
            "items" => $items,

        ];
        $response = $this->cURL(
            'https://accept.paymob.com/api/ecommerce/orders',
            $data
        );

        return $response;
    }

    public function getPaymentToken($order, $token)
    {
        $ord = Order::with(['details'])->where(['id' => session('order_id')])->first();

        $value = $ord->order_amount;
        $config = Helpers::get_business_settings('paymob_accept');
        $billingData = [
            "apartment" => "not given",
            "email" => "not given",
            "floor" => "not given",
            "first_name" => "not given",
            "street" => "not given",
            "building" => "not given",
            "phone_number" => "not given",
            "shipping_method" => "PKG",
            "postal_code" => "not given",
            "city" => "not given",
            "country" => "not given",
            "last_name" => "not given",
            "state" => "not given",
        ];
        $data = [
            "auth_token" => $token,
            "amount_cents" => round($value,2) * 100,
            "expiration" => 3600,
            "order_id" => $order->id,
            "billing_data" => $billingData,
            "currency" => "EGP",
            "integration_id" => $config['integration_id']
        ];

        $response = $this->cURL(
            'https://accept.paymob.com/api/acceptance/payment_keys',
            $data
        );

        return $response->token;
    }

    public function callback(Request $request)
    {
        $config = Helpers::get_business_settings('paymob_accept');
        $data = $request->all();
        ksort($data);
        $hmac = $data['hmac'];
        $array = [
            'amount_cents',
            'created_at',
            'currency',
            'error_occured',
            'has_parent_transaction',
            'id',
            'integration_id',
            'is_3d_secure',
            'is_auth',
            'is_capture',
            'is_refunded',
            'is_standalone_payment',
            'is_voided',
            'order',
            'owner',
            'pending',
            'source_data_pan',
            'source_data_sub_type',
            'source_data_type',
            'success',
        ];
        $connectedString = '';
        foreach ($data as $key => $element) {
            if (in_array($key, $array)) {
                $connectedString .= $element;
            }
        }
        $secret = $config['hmac'];
        $hased = hash_hmac('sha512', $connectedString, $secret);
        $order = Order::where('id', session('order_id'))->first();

        if ($hased == $hmac) {
            $order->transaction_reference = 'tran-' . session('order_id');
            $order->payment_method = 'paymob_accept';
            $order->order_status = 'confirmed';
            $order->confirmed = now();
            $order->updated_at = now();
            $order->save();
            try {
                Helpers::send_order_notification($order);
            } catch (\Exception $e) {
            }

            if ($order->callback != null) {
                return redirect($order->callback . '&status=success');
            }else{
                return \redirect()->route('payment-success');
            }
        }

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
