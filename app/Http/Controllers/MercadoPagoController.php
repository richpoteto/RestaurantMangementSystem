<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use MercadoPago\SDK;
use MercadoPago\Payment;
use MercadoPago\Payer;
use Illuminate\Support\Facades\DB;
use App\Models\Order;
use App\Models\BusinessSetting;
use App\CentralLogics\Helpers;
use App\CentralLogics\OrderLogic;

class MercadoPagoController extends Controller
{
    private $data;

    public function __construct()
    {
        $this->data = Helpers::get_business_settings('mercadopago');
    }
    public function index(Request $request)
    {
        $data = $this->data;

        $order = Order::with(['details'])->where(['id' => session('order_id')])->first();

        return view('payment-view-marcedo-pogo', compact('data', 'order'));
    }
    public function make_payment(Request $request)
    {

        SDK::setAccessToken($this->data['access_token']);
        $payment = new Payment();
        $payment->transaction_amount = (float)$request['transactionAmount'];
        $payment->token = $request['token'];
        $payment->description = $request['description'];
        $payment->installments = (int)$request['installments'];
        $payment->payment_method_id = $request['paymentMethodId'];
        $payment->issuer_id = (int)$request['issuer'];
    
        $payer = new Payer();
        $payer->email = $request['payer']['email'];
        $payer->identification = array(
            "type" => $request['payer']['identification']['type'],
            "number" => $request['payer']['identification']['number']
        );
        $payment->payer = $payer;
        
        $payment->save();

        $response = array(
            'status' => $payment->status,
            'status_detail' => $payment->status_detail,
            'id' => $payment->id
        );

        if($payment->error)
        {
            $response['error'] = $payment->error->message;
        }
        if($payment->status == 'approved')
        {
            $order = Order::where(['id' => session('order_id'), 'user_id'=>session('customer_id')])->first();
            try {
                $order->transaction_reference = $payment->id;
                $order->payment_method = 'mercadopago';
                $order->payment_status = 'paid';
                $order->order_status = 'confirmed';
                $order->confirmed = now();
                $order->save();
                $fcm_token = $order->customer->cm_firebase_token;
                $value = Helpers::order_status_update_message('confirmed');
                if ($value) {
                    $data = [
                        'title' =>trans('messages.order_placed_successfully'),
                        'description' => $value,
                        'order_id' => $order['id'],
                        'image' => '',
                        'type'=>'order_status'
                    ];
                    Helpers::send_push_notif_to_device($fcm_token, $data);
                    DB::table('user_notifications')->insert([
                        'data'=> json_encode($data),
                        'user_id'=>$order->customer->id,
                        'created_at'=>now(),
                        'updated_at'=>now()
                    ]);
                }
                $data = [
                    'title' =>trans('messages.order_placed_successfully'),
                    'description' => trans('messages.new_order_push_description'),
                    'order_id' => $order->id,
                    'image' => '',
                    'type'=>'order_status',
                ];
                Helpers::send_push_notif_to_device($order->restaurant->vendor->firebase_token, $data);
                DB::table('user_notifications')->insert([
                    'data'=> json_encode($data),
                    'vendor_id'=>$order->restaurant->vendor_id,
                    'created_at'=>now(),
                    'updated_at'=>now()
                ]);
            } catch (\Exception $e) {
            }
        }
        return response()->json($response);
    }

    public function get_test_user(Request $request)
    {
        // curl -X POST \
        // -H "Content-Type: application/json" \
        // -H 'Authorization: Bearer PROD_ACCESS_TOKEN' \
        // "https://api.mercadopago.com/users/test_user" \
        // -d '{"site_id":"MLA"}'

        $curl = curl_init();  
        curl_setopt($curl, CURLOPT_URL, "https://api.mercadopago.com/users/test_user");
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);   
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);   
        curl_setopt($curl, CURLOPT_POST, true);   
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Authorization: Bearer '.$this->data['access_token']
        ));
        curl_setopt($curl, CURLOPT_POSTFIELDS, '{"site_id":"MLA"}');   
        $response = curl_exec($curl);   
        dd($response);

    }
}
