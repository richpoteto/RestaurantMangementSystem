<?php

namespace App\Providers;

use App\Models\BusinessSetting;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\ServiceProvider;
use Carbon\Carbon;
use phpDocumentor\Reflection\Types\Boolean;

Carbon::setWeekStartsAt(Carbon::MONDAY);
Carbon::setWeekEndsAt(Carbon::SUNDAY);
class ConfigServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        $mode = env('APP_MODE');

        try {
            $data = BusinessSetting::where(['key' => 'mail_config'])->first();
            $emailServices = json_decode($data['value'], true);
            if ($emailServices) {
                $config = array(
                    'status' => (Boolean)(isset($emailServices['status'])?$emailServices['status']:1),
                    'driver' => $emailServices['driver'],
                    'host' => $emailServices['host'],
                    'port' => $emailServices['port'],
                    'username' => $emailServices['username'],
                    'password' => $emailServices['password'],
                    'encryption' => $emailServices['encryption'],
                    'from' => array('address' => $emailServices['email_id'], 'name' => $emailServices['name']),
                    'sendmail' => '/usr/sbin/sendmail -bs',
                    'pretend' => false,
                );
                Config::set('mail', $config);
            }

            $data = BusinessSetting::where(['key' => 'paystack'])->first();
            $paystack = json_decode($data['value'], true);
            if ($paystack) {
                $config = array(
                    'publicKey' => env('PAYSTACK_PUBLIC_KEY', $paystack['publicKey']),
                    'secretKey' => env('PAYSTACK_SECRET_KEY', $paystack['secretKey']),
                    'paymentUrl' => env('PAYSTACK_PAYMENT_URL', $paystack['paymentUrl']),
                    'merchantEmail' => env('MERCHANT_EMAIL', $paystack['merchantEmail']),
                );
                Config::set('paystack', $config);
            }

            $data = BusinessSetting::where(['key' => 'ssl_commerz_payment'])->first();
            $ssl = json_decode($data['value'], true);
            if ($ssl) {
                if ($mode == 'live') {
                    $url = "https://securepay.sslcommerz.com";
                    $host = false;
                } else {
                    $url = "https://sandbox.sslcommerz.com";
                    $host = true;
                }
                $config = array(
                    'projectPath' => env('PROJECT_PATH'),
                    'apiDomain' => env("API_DOMAIN_URL", $url),
                    'apiCredentials' => [
                        'store_id' => $ssl['store_id'],
                        'store_password' => $ssl['store_password'],
                    ],
                    'apiUrl' => [
                        'make_payment' => "/gwprocess/v4/api.php",
                        'transaction_status' => "/validator/api/merchantTransIDvalidationAPI.php",
                        'order_validate' => "/validator/api/validationserverAPI.php",
                        'refund_payment' => "/validator/api/merchantTransIDvalidationAPI.php",
                        'refund_status' => "/validator/api/merchantTransIDvalidationAPI.php",
                    ],
                    'connect_from_localhost' => env("IS_LOCALHOST", $host), // For Sandbox, use "true", For Live, use "false"
                    'success_url' => '/success',
                    'failed_url' => '/fail',
                    'cancel_url' => '/cancel',
                    'ipn_url' => '/ipn',
                );
                Config::set('sslcommerz', $config);
            }

            $data = BusinessSetting::where(['key' => 'paypal'])->first();
            $paypal = json_decode($data['value'], true);
            if ($paypal) {

                if ($mode == 'live') {
                    $paypal_mode = "live";
                } else {
                    $paypal_mode = "sandbox";
                }

                $config = array(
                    'client_id' => $paypal['paypal_client_id'], // values : (local | production)
                    'secret' => $paypal['paypal_secret'],
                    'settings' => array(
                        'mode' => env('PAYPAL_MODE', $paypal_mode), //live||sandbox
                        'http.ConnectionTimeOut' => 30,
                        'log.LogEnabled' => true,
                        'log.FileName' => storage_path() . '/logs/paypal.log',
                        'log.LogLevel' => 'ERROR'
                    ),
                );
                Config::set('paypal', $config);
            }

            $data = BusinessSetting::where(['key' => 'flutterwave'])->first();
            $flutterwave = json_decode($data['value'], true);
            if ($flutterwave) {
                $config = array(
                    'publicKey' => env('FLW_PUBLIC_KEY', $flutterwave['public_key']), // values : (local | production)
                    'secretKey' => env('FLW_SECRET_KEY', $flutterwave['secret_key']),
                    'secretHash' => env('FLW_SECRET_HASH', $flutterwave['hash']),
                );
                Config::set('flutterwave', $config);
            }

            $data = BusinessSetting::where(['key' => 'razor_pay'])->first();
            $razor = json_decode($data['value'], true);
            if ($razor) {
                $config = array(
                    'razor_key' => env('RAZOR_KEY', $razor['razor_key']),
                    'razor_secret' => env('RAZOR_SECRET', $razor['razor_secret'])
                );
                Config::set('razor', $config);
            }

            $odv = BusinessSetting::where(['key' => 'order_delivery_verification'])->first();
            if ($odv) {
                Config::set('order_delivery_verification', $odv->value);
            } else {
                Config::set('order_delivery_verification', 0);
            }

            $pagination = BusinessSetting::where(['key' => 'default_pagination'])->first();
            if ($pagination) {
                Config::set('default_pagination', $pagination->value);
            } else {
                Config::set('default_pagination', 25);
            }

            $round_up_to_digit = BusinessSetting::where(['key' => 'digit_after_decimal_point'])->first();
            if ($round_up_to_digit) {
                Config::set('round_up_to_digit', $round_up_to_digit->value);
            } else {
                Config::set('round_up_to_digit', 2);
            }

            $dm_maximum_orders = BusinessSetting::where(['key' => 'dm_maximum_orders'])->first();
            if ($dm_maximum_orders) {
                Config::set('dm_maximum_orders', $dm_maximum_orders->value);
            } else {
                Config::set('dm_maximum_orders', 1);
            }

            $order_confirmation_model = BusinessSetting::where(['key' => 'order_confirmation_model'])->first();
            if ($order_confirmation_model) {
                Config::set('order_confirmation_model', $order_confirmation_model->value);
            } else {
                Config::set('order_confirmation_model', 'deliveryman');
            }

            $timezone = BusinessSetting::where(['key' => 'timezone'])->first();
            if ($timezone) {
                Config::set('timezone', $timezone->value);
                date_default_timezone_set($timezone->value);
            }

            $timeformat = BusinessSetting::where(['key' => 'timeformat'])->first();
            if ($timeformat && $timeformat->value == '12') {
                Config::set('timeformat', 'h:i:a');
            }
            else{
                Config::set('timeformat', 'H:i');
            }

            $canceled_by_restaurant = BusinessSetting::where(['key' => 'canceled_by_restaurant'])->first();
            if ($canceled_by_restaurant) {
                Config::set('canceled_by_restaurant', (boolean)$canceled_by_restaurant->value);
            }

            $canceled_by_deliveryman = BusinessSetting::where(['key' => 'canceled_by_deliveryman'])->first();
            if ($canceled_by_deliveryman) {
                Config::set('canceled_by_deliveryman', (boolean)$canceled_by_deliveryman->value);
            }

            $toggle_veg_non_veg = (boolean)BusinessSetting::where(['key' => 'toggle_veg_non_veg'])->first()->value;
            if($toggle_veg_non_veg)
            {
                Config::set('toggle_veg_non_veg', $toggle_veg_non_veg);
            }
            else{
                Config::set('toggle_veg_non_veg', false);
            }

            //paytm
            $paytm = BusinessSetting::where(['key' => 'paytm'])->first();
            $paytm = isset($paytm)?json_decode($paytm->value, true):null;

            if (isset($paytm)) {

                $PAYTM_STATUS_QUERY_NEW_URL='https://securegw-stage.paytm.in/merchant-status/getTxnStatus';
                $PAYTM_TXN_URL='https://securegw-stage.paytm.in/theia/processTransaction';
                if ($mode == 'live') {
                    $PAYTM_STATUS_QUERY_NEW_URL='https://securegw.paytm.in/merchant-status/getTxnStatus';
                    $PAYTM_TXN_URL='https://securegw.paytm.in/theia/processTransaction';
                }

                $config = array(
                    'PAYTM_ENVIRONMENT' => ($mode=='live')?'PROD':'TEST',
                    'PAYTM_MERCHANT_KEY' => env('PAYTM_MERCHANT_KEY', $paytm['paytm_merchant_key']),
                    'PAYTM_MERCHANT_MID' => env('PAYTM_MERCHANT_MID', $paytm['paytm_merchant_mid']),
                    'PAYTM_MERCHANT_WEBSITE' => env('PAYTM_MERCHANT_WEBSITE', $paytm['paytm_merchant_website']),
                    'PAYTM_REFUND_URL' => env('PAYTM_REFUND_URL', $paytm['paytm_refund_url']),
                    'PAYTM_STATUS_QUERY_URL' => env('PAYTM_STATUS_QUERY_URL', $PAYTM_STATUS_QUERY_NEW_URL),
                    'PAYTM_STATUS_QUERY_NEW_URL' => env('PAYTM_STATUS_QUERY_NEW_URL', $PAYTM_STATUS_QUERY_NEW_URL),
                    'PAYTM_TXN_URL' => env('PAYTM_TXN_URL', $PAYTM_TXN_URL),
                );

                Config::set('config_paytm', $config);
            }

        } catch (\Exception $ex) {

        }
    }
}
