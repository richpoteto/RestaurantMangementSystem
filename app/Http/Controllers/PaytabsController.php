<?php

namespace App\Http\Controllers;

use App\CentralLogics\Helpers;
use App\Models\Order;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;


class Paytabs
{
    function send_api_request($request_url, $data, $request_method = null)
    {
        $config = Helpers::get_business_settings('paytabs');

        $data['profile_id'] = $config['profile_id'];
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => $config['base_url'] .'/'. $request_url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_CUSTOMREQUEST => isset($request_method) ? $request_method : 'POST',
            CURLOPT_POSTFIELDS => json_encode($data, true),
            CURLOPT_HTTPHEADER => array(
                'authorization:' . $config['server_key'],
                'Content-Type:application/json'
            ),
        ));

        $response = json_decode(curl_exec($curl), true);
        curl_close($curl);
        return $response;
    }

    function is_valid_redirect($post_values)
    {
        $config = Helpers::get_business_settings('paytabs');

        $serverKey = $config['server_key'];

        // Request body include a signature post Form URL encoded field
        // 'signature' (hexadecimal encoding for hmac of sorted post form fields)
        $requestSignature = $post_values["signature"];
        unset($post_values["signature"]);
        $fields = array_filter($post_values);

        // Sort form fields
        ksort($fields);

        // Generate URL-encoded query string of Post fields except signature field.
        $query = http_build_query($fields);

        $signature = hash_hmac('sha256', $query, $serverKey);
        if (hash_equals($signature, $requestSignature) === TRUE) {
            // VALID Redirect
            return true;
        } else {
            // INVALID Redirect
            return false;
        }
    }
}

class PaytabsController extends Controller
{
    public function payment()
    {
        $order = Order::with(['details','customer'])->where(['id' => session('order_id'), 'user_id'=>session('customer_id')])->first();

        $value = $order->order_amount;

        $user = $order->customer;

        $plugin = new Paytabs();
        $request_url = 'payment/request';
        $data = [
            "tran_type" => "sale",
            "tran_class" => "ecom",
            "cart_id" => $order->id,
            "cart_currency" => "EGP",
            "cart_amount" => round($value,2),
            "cart_description" => "products",
            "paypage_lang" => "en",
            "callback" => url('/') . "/paytabs-response", // Nullable - Must be HTTPS, otherwise no post data from paytabs
            "return" => url('/') . "/paytabs-response", // Must be HTTPS, otherwise no post data from paytabs , must be relative to your site URL
            "customer_details" => [
                "name" => $user->f_name,
                "email" => $user->email,
                "phone" => "000000",
                "street1" => "address",
                "city" => "not given",
                "state" => "not given",
                "country" => "not given",
                "zip" => "00000"
            ],
            "shipping_details" => [
                "name" => "not given",
                "email" => "not given",
                "phone" => "not given",
                "street1" => "not given",
                "city" => "not given",
                "state" => "not given",
                "country" => "not given",
                "zip" => "0000"
            ],
            "user_defined" => [
                "udf9" => "UDF9",
                "udf3" => "UDF3"
            ]
        ];
        $page = $plugin->send_api_request($request_url, $data);
        if(!isset($page['redirect_url'])) {
            Toastr::error(translate('misconfiguration_or_data_missing'));
            return back();
        }
        header('Location:' . $page['redirect_url']); /* Redirect browser */
        exit();
    }

    public function callback_response(Request $request)
    {
        $order = Order::with(['details'])->where(['id' => session('order_id'), 'user_id'=>session('customer_id')])->first();
        $plugin = new Paytabs();

        $response_data = $_POST;

        $transRef = filter_input(INPUT_POST, 'tranRef');

        if (!$transRef) {
            Toastr::error(translate('Transaction reference is not set. return url must be HTTPs with POST method to can retrieve data'));
            return back();
        }

        $is_valid = $plugin->is_valid_redirect($response_data);
        if (!$is_valid) {
            Toastr::error(translate('Not a valid PayTabs response'));
            return back();
        }

        $request_url = 'payment/query';
        $data = [
            "tran_ref" => $transRef
        ];
        $verify_result = $plugin->send_api_request($request_url, $data);
        $is_success = $verify_result['payment_result']['response_status'] === 'A';
        if ($is_success) {
            $order->transaction_reference = $transRef;
            $order->payment_method = 'Paytabs';
            $order->payment_status = 'paid';
            $order->order_status = 'confirmed';
            $order->confirmed = now();
            $order->save();
            Helpers::send_order_notification($order);
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
