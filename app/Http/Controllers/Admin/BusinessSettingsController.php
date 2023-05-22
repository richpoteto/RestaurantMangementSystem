<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Restaurant;
use App\Models\FeaturedVenue;
use App\Models\HottestLounge;
use App\Models\PrivateChef;
use App\Models\Currency;
use App\Models\BusinessSetting;
use Illuminate\Support\Facades\DB;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Log;

use Carbon\Carbon;

class BusinessSettingsController extends Controller
{

    private $restaurant;

    public function business_index()
    {
        return view('admin-views.business-settings.business-index');
    }

    public function business_setup(Request $request)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(trans('messages.update_option_is_disable_for_demo'));
            return back();
        }

        DB::table('business_settings')->updateOrInsert(['key' => 'business_name'], [
            'value' => $request['restaurant_name']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'currency'], [
            'value' => $request['currency']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'timezone'], [
            'value' => $request['timezone']
        ]);

        $curr_logo = BusinessSetting::where(['key' => 'logo'])->first();
        if ($request->has('logo')) {
            $image_name = Helpers::update('business/', $curr_logo->value, 'png', $request->file('logo'));
        } else {
            $image_name = $curr_logo['value'];
        }

        DB::table('business_settings')->updateOrInsert(['key' => 'logo'], [
            'value' => $image_name
        ]);

        $fav_icon = BusinessSetting::where(['key' => 'icon'])->first();
        if ($request->has('icon')) {
            $image_name = Helpers::update('business/', $fav_icon->value, 'png', $request->file('icon'));
        } else {
            $image_name = $fav_icon['value'];
        }

        DB::table('business_settings')->updateOrInsert(['key' => 'icon'], [
            'value' => $image_name
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'phone'], [
            'value' => $request['phone']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'email_address'], [
            'value' => $request['email']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'address'], [
            'value' => $request['address']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'footer_text'], [
            'value' => $request['footer_text']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'customer_verification'], [
            'value' => $request['customer_verification']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'order_delivery_verification'], [
            'value' => $request['odc']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'minimum_shipping_charge'], [
            'value' => $request['minimum_shipping_charge']
        ]);
        DB::table('business_settings')->updateOrInsert(['key' => 'per_km_shipping_charge'], [
            'value' => $request['per_km_shipping_charge']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'currency_symbol_position'], [
            'value' => $request['currency_symbol_position']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'schedule_order'], [
            'value' => $request['schedule_order']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'order_confirmation_model'], [
            'value' => $request['order_confirmation_model']
        ]);
        DB::table('business_settings')->updateOrInsert(['key' => 'dm_tips_status'], [
            'value' => $request['dm_tips_status']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'tax'], [
            'value' => $request['tax']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'admin_commission'], [
            'value' => $request['admin_commission']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'card_commission'], [
            'value' => $request['card_commission']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'flat_card_commission'], [
            'value' => $request['flat_card_commission']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'foreign_card_commission'], [
            'value' => $request['foreign_card_commission']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'country'], [
            'value' => $request['country']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'default_location'], [
            'value' => json_encode(['lat' => $request['latitude'], 'lng' => $request['longitude']])
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'admin_order_notification'], [
            'value' => $request['admin_order_notification']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'free_delivery_over'], [
            'value' => $request['free_delivery_over_status'] ? $request['free_delivery_over'] : null
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'dm_maximum_orders'], [
            'value' => $request['dm_maximum_orders']
        ]);

        $languages = $request['language'];

        if (in_array('en', $languages)) {
            unset($languages[array_search('en', $languages)]);
        }
        array_unshift($languages, 'en');

        DB::table('business_settings')->updateOrInsert(['key' => 'language'], [
            'value' => json_encode($languages),
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'timeformat'], [
            'value' => $request['time_format']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'canceled_by_restaurant'], [
            'value' => $request['canceled_by_restaurant']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'canceled_by_deliveryman'], [
            'value' => $request['canceled_by_deliveryman']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'show_dm_earning'], [
            'value' => $request['show_dm_earning']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'toggle_veg_non_veg'], [
            'value' => $request['vnv']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'toggle_dm_registration'], [
            'value' => $request['dm_self_registration']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'toggle_restaurant_registration'], [
            'value' => $request['restaurant_self_registration']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'schedule_order_slot_duration'], [
            'value' => $request['schedule_order_slot_duration']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'digit_after_decimal_point'], [
            'value' => $request['digit_after_decimal_point']
        ]);

        Toastr::success( translate('Successfully updated. To see the changes in app restart the app.'));
        return back();
    }

    public function mail_index()
    {
        return view('admin-views.business-settings.mail-index');
    }

    public function mail_config(Request $request)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(trans('messages.update_option_is_disable_for_demo'));
            return back();
        }
        BusinessSetting::updateOrInsert(
            ['key' => 'mail_config'],
            [
                'value' => json_encode([
                    "status" => $request['status'] ?? 0,
                    "name" => $request['name'],
                    "host" => $request['host'],
                    "driver" => $request['driver'],
                    "port" => $request['port'],
                    "username" => $request['username'],
                    "email_id" => $request['email'],
                    "encryption" => $request['encryption'],
                    "password" => $request['password']
                ]),
                'updated_at' => now()
            ]
        );
        Toastr::success(trans('messages.configuration_updated_successfully'));
        return back();
    }

    public function payment_index()
    {
        return view('admin-views.business-settings.payment-index');
    }

    public function payment_update(Request $request, $name)
    {

        if ($name == 'cash_on_delivery') {
            $payment = BusinessSetting::where('key', 'cash_on_delivery')->first();
            if (isset($payment) == false) {
                DB::table('business_settings')->insert([
                    'key'        => 'cash_on_delivery',
                    'value'      => json_encode([
                        'status' => $request['status'],
                    ]),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('business_settings')->where(['key' => 'cash_on_delivery'])->update([
                    'key'        => 'cash_on_delivery',
                    'value'      => json_encode([
                        'status' => $request['status'],
                    ]),
                    'updated_at' => now(),
                ]);
            }
        } elseif ($name == 'digital_payment') {
            $payment = BusinessSetting::where('key', 'digital_payment')->first();
            if (isset($payment) == false) {
                DB::table('business_settings')->insert([
                    'key'        => 'digital_payment',
                    'value'      => json_encode([
                        'status' => $request['status'],
                    ]),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('business_settings')->where(['key' => 'digital_payment'])->update([
                    'key'        => 'digital_payment',
                    'value'      => json_encode([
                        'status' => $request['status'],
                    ]),
                    'updated_at' => now(),
                ]);
            }
        } elseif ($name == 'ssl_commerz_payment') {
            $payment = BusinessSetting::where('key', 'ssl_commerz_payment')->first();
            if (isset($payment) == false) {
                DB::table('business_settings')->insert([
                    'key'        => 'ssl_commerz_payment',
                    'value'      => json_encode([
                        'status'         => 1,
                        'store_id'       => '',
                        'store_password' => '',
                    ]),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('business_settings')->where(['key' => 'ssl_commerz_payment'])->update([
                    'key'        => 'ssl_commerz_payment',
                    'value'      => json_encode([
                        'status'         => $request['status'],
                        'store_id'       => $request['store_id'],
                        'store_password' => $request['store_password'],
                    ]),
                    'updated_at' => now(),
                ]);
            }
        } elseif ($name == 'razor_pay') {
            $payment = BusinessSetting::where('key', 'razor_pay')->first();
            if (isset($payment) == false) {
                DB::table('business_settings')->insert([
                    'key'        => 'razor_pay',
                    'value'      => json_encode([
                        'status'       => 1,
                        'razor_key'    => '',
                        'razor_secret' => '',
                    ]),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('business_settings')->where(['key' => 'razor_pay'])->update([
                    'key'        => 'razor_pay',
                    'value'      => json_encode([
                        'status'       => $request['status'],
                        'razor_key'    => $request['razor_key'],
                        'razor_secret' => $request['razor_secret'],
                    ]),
                    'updated_at' => now(),
                ]);
            }
        } elseif ($name == 'paypal') {
            $payment = BusinessSetting::where('key', 'paypal')->first();
            if (isset($payment) == false) {
                DB::table('business_settings')->insert([
                    'key'        => 'paypal',
                    'value'      => json_encode([
                        'status'           => 1,
                        'paypal_client_id' => '',
                        'paypal_secret'    => '',
                    ]),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('business_settings')->where(['key' => 'paypal'])->update([
                    'key'        => 'paypal',
                    'value'      => json_encode([
                        'status'           => $request['status'],
                        'paypal_client_id' => $request['paypal_client_id'],
                        'paypal_secret'    => $request['paypal_secret'],
                    ]),
                    'updated_at' => now(),
                ]);
            }
        } elseif ($name == 'stripe') {
            $payment = BusinessSetting::where('key', 'stripe')->first();
            if (isset($payment) == false) {
                DB::table('business_settings')->insert([
                    'key'        => 'stripe',
                    'value'      => json_encode([
                        'status'        => 1,
                        'api_key'       => '',
                        'published_key' => '',
                    ]),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('business_settings')->where(['key' => 'stripe'])->update([
                    'key'        => 'stripe',
                    'value'      => json_encode([
                        'status'        => $request['status'],
                        'api_key'       => $request['api_key'],
                        'published_key' => $request['published_key'],
                    ]),
                    'updated_at' => now(),
                ]);
            }
        } elseif ($name == 'senang_pay') {
            $payment = BusinessSetting::where('key', 'senang_pay')->first();
            if (isset($payment) == false) {
                DB::table('business_settings')->insert([

                    'key'        => 'senang_pay',
                    'value'      => json_encode([
                        'status'        => 1,
                        'secret_key'    => '',
                        'published_key' => '',
                        'merchant_id' => '',
                    ]),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('business_settings')->where(['key' => 'senang_pay'])->update([
                    'key'        => 'senang_pay',
                    'value'      => json_encode([
                        'status'        => $request['status'],
                        'secret_key'    => $request['secret_key'],
                        'published_key' => $request['publish_key'],
                        'merchant_id' => $request['merchant_id'],
                    ]),
                    'updated_at' => now(),
                ]);
            }
        } elseif ($name == 'paystack') {
            $payment = BusinessSetting::where('key', 'paystack')->first();
            if (isset($payment) == false) {
                DB::table('business_settings')->insert([
                    'key'        => 'paystack',
                    'value'      => json_encode([
                        'status'        => 1,
                        'publicKey'     => '',
                        'secretKey'     => '',
                        'paymentUrl'    => '',
                        'merchantEmail' => '',
                    ]),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('business_settings')->where(['key' => 'paystack'])->update([
                    'key'        => 'paystack',
                    'value'      => json_encode([
                        'status'        => $request['status'],
                        'publicKey'     => $request['publicKey'],
                        'secretKey'     => $request['secretKey'],
                        'paymentUrl'    => $request['paymentUrl'],
                        'merchantEmail' => $request['merchantEmail'],
                    ]),
                    'updated_at' => now(),
                ]);
            }
        } elseif ($name == 'flutterwave') {
            $payment = BusinessSetting::where('key', 'flutterwave')->first();
            if (isset($payment) == false) {
                DB::table('business_settings')->insert([
                    'key'        => 'flutterwave',
                    'value'      => json_encode([
                        'status'        => 1,
                        'public_key'     => '',
                        'secret_key'     => '',
                        'hash'    => '',
                    ]),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            } else {
                DB::table('business_settings')->where(['key' => 'flutterwave'])->update([
                    'key'        => 'flutterwave',
                    'value'      => json_encode([
                        'status'        => $request['status'],
                        'public_key'     => $request['public_key'],
                        'secret_key'     => $request['secret_key'],
                        'hash'    => $request['hash'],
                    ]),
                    'updated_at' => now(),
                ]);
            }
        } elseif ($name == 'mercadopago') {
            $payment = BusinessSetting::updateOrInsert(
                ['key' => 'mercadopago'],
                [
                    'value'      => json_encode([
                        'status'        => $request['status'],
                        'public_key'     => $request['public_key'],
                        'access_token'     => $request['access_token'],
                    ]),
                    'updated_at' => now()
                ]
            );
        } elseif ($name == 'paymob_accept') {
            DB::table('business_settings')->updateOrInsert(['key' => 'paymob_accept'], [
                'value' => json_encode([
                    'status' => $request['status'],
                    'api_key' => $request['api_key'],
                    'iframe_id' => $request['iframe_id'],
                    'integration_id' => $request['integration_id'],
                    'hmac' => $request['hmac'],
                ]),
                'updated_at' => now()
            ]);
        } elseif ($name == 'liqpay') {
            DB::table('business_settings')->updateOrInsert(['key' => 'liqpay'], [
                'value' => json_encode([
                    'status' => $request['status'],
                    'public_key' => $request['public_key'],
                    'private_key' => $request['private_key']
                ]),
                'updated_at' => now()
            ]);
        } elseif ($name == 'paytm') {
            DB::table('business_settings')->updateOrInsert(['key' => 'paytm'], [
                'value' => json_encode([
                    'status' => $request['status'],
                    'paytm_merchant_key' => $request['paytm_merchant_key'],
                    'paytm_merchant_mid' => $request['paytm_merchant_mid'],
                    'paytm_merchant_website' => $request['paytm_merchant_website'],
                    'paytm_refund_url' => $request['paytm_refund_url'],
                ]),
                'updated_at' => now()
            ]);
        } elseif ($name == 'bkash') {
            DB::table('business_settings')->updateOrInsert(['key' => 'bkash'], [
                'value' => json_encode([
                    'status' => $request['status'],
                    'api_key' => $request['api_key'],
                    'api_secret' => $request['api_secret'],
                    'username' => $request['username'],
                    'password' => $request['password'],
                ]),
                'updated_at' => now()
            ]);
        } elseif ($name == 'paytabs') {
            DB::table('business_settings')->updateOrInsert(['key' => 'paytabs'], [
                'value' => json_encode([
                    'status' => $request['status'],
                    'profile_id' => $request['profile_id'],
                    'server_key' => $request['server_key'],
                    'base_url' => $request['base_url']
                ]),
                'updated_at' => now()
            ]);
        }

        Toastr::success(trans('messages.payment_settings_updated'));
        return back();
    }
    public function theme_settings()
    {
        return view('admin-views.business-settings.theme-settings');
    }
    public function update_theme_settings(Request $request)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(trans('messages.update_option_is_disable_for_demo'));
            return back();
        }
        DB::table('business_settings')->updateOrInsert(['key' => 'theme'], [
            'value' => $request['theme']
        ]);
        Toastr::success(translate('theme_settings_updated'));
        return back();
    }

    public function app_settings()
    {
        return view('admin-views.business-settings.app-settings');
    }

    public function update_app_settings(Request $request)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(trans('messages.update_option_is_disable_for_demo'));
            return back();
        }
        DB::table('business_settings')->updateOrInsert(['key' => 'new_venue_days'], [
            'value' => $request['new_venue_days']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'trending_threshold_value'], [
            'value' => $request['trending_threshold_value']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'nearby_distance_max'], [
            'value' => $request['nearby_distance_max']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'average_system_order'], [
            'value' => $request['average_system_order']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'app_minimum_version_android'], [
            'value' => $request['app_minimum_version_android']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'app_minimum_version_ios'], [
            'value' => $request['app_minimum_version_ios']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'app_url_android'], [
            'value' => $request['app_url_android']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'app_url_ios'], [
            'value' => $request['app_url_ios']
        ]);
        $newRestaurants = Restaurant::all();
        $newVenueDays = DB::table('business_settings')->where('key','new_venue_days')->value('value');
        // echo ($newVenueDays);
        foreach($newRestaurants as $newRestaurant) {
            $fromDate = Carbon::parse(date("Y-m-d", strtotime($newRestaurant->created_at)));
            $toDate = Carbon::parse(date("Y-m-d"));
            $days = $toDate->diffInDays($fromDate);
            if($days > $newVenueDays) {
                $updatedRestaurant = Restaurant::where('id', $newRestaurant->id)->update(['isNew' => 0]);
            } else {
                $updatedRestaurant = Restaurant::where('id', $newRestaurant->id)->update(['isNew' => 1]);
            }
        }

        $trendingRestaurants = Restaurant::all();
        foreach($trendingRestaurants as $trendingRestaurant) {
            if ($trendingRestaurant->order_count > 0) {
                $averageOrderValue = $trendingRestaurant->total_order/$trendingRestaurant->order_count;
            } else $averageOrderValue = 0;
                        
            $trendingRestaurant = Restaurant::where('id', $trendingRestaurant->id)->update(['average_order' => $averageOrderValue]);                
        }
        $rankRestaurants = Restaurant::orderBy('average_order', 'ASC')->get();
        $trendingThresholdValue = DB::table('business_settings')->where('key','trending_threshold_value')->value('value');
                    
        $rank=1;  
        $restaurants_num = count($rankRestaurants);
        $ranks = [];
        $restaurant_ids = [];        
        $prev=$rankRestaurants[0];
        foreach($rankRestaurants as $rankRestaurant){
            if($prev->average_order!=$rankRestaurant->average_order){
                $prev=$rankRestaurant;
                $rank++;
            }  
            array_push($ranks, $rank);  
            array_push($restaurant_ids, $rankRestaurant->id);                
        }
        
        for ($i = 0; $i < $restaurants_num; $i++) {
            $percentileRank = $ranks[$i]*100/$rank;
            Restaurant::where('id', $restaurant_ids[$i])->update(['percentile_rank' => $percentileRank]);
            if ($trendingThresholdValue !=null) {
                if($percentileRank>$trendingThresholdValue) {
                    Restaurant::where('id', $restaurant_ids[$i])->update(['trending' => 1]);
                } else {
                    Restaurant::where('id', $restaurant_ids[$i])->update(['trending' => 0]);
                } 
            }                             
        }
        $restaurants=DB::table('restaurants')->get();        
        foreach($restaurants as $restaurant) {
            DB::table('vendors')
                ->where('restaurant_id', $restaurant->id)
                ->update([
                    'v_featured' => $restaurant->featured,
                    'v_trending' => $restaurant->trending,
                    'v_isNew' => $restaurant->isNew,
                ]);
        };
        Toastr::success(trans('messages.app_settings_updated'));
        return back();
    }

    public function landing_page_settings($tab)
    {
        if ($tab == 'index') {            
            return view('admin-views.business-settings.landing-page-settings.index');
        } else if ($tab == 'links') {
            return view('admin-views.business-settings.landing-page-settings.links');
        } else if ($tab == 'speciality') {
            return view('admin-views.business-settings.landing-page-settings.speciality');
        } else if ($tab == 'testimonial') {
            return view('admin-views.business-settings.landing-page-settings.testimonial');
        } else if ($tab == 'feature') {
            return view('admin-views.business-settings.landing-page-settings.feature');
        } else if ($tab == 'image') {
            return view('admin-views.business-settings.landing-page-settings.image');
        } else if ($tab == 'backgroundChange') {

            return view('admin-views.business-settings.landing-page-settings.backgroundChange');
        }
    }

    public function update_landing_page_settings(Request $request, $tab)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(trans('messages.update_option_is_disable_for_demo'));
            return back();
        }

        if ($tab == 'text') {
            DB::table('business_settings')->updateOrInsert(['key' => 'landing_page_text'], [
                'value' => json_encode([
                    'header_title_1' => $request['header_title_1'],
                    'header_title_2' => $request['header_title_2'],
                    'header_title_3' => $request['header_title_3'],
                    'about_title' => $request['about_title'],
                    'why_choose_us' => $request['why_choose_us'],
                    'why_choose_us_title' => $request['why_choose_us_title'],
                    'testimonial_title' => $request['testimonial_title'],
                    'mobile_app_section_heading' => $request['mobile_app_section_heading'],
                    'mobile_app_section_text' => $request['mobile_app_section_text'],
                    'feature_section_description' => $request['feature_section_description'],
                    'feature_section_title' => $request['feature_section_title'],
                    'footer_article' => $request['footer_article']
                ])
            ]);
            Toastr::success(trans('messages.landing_page_text_updated'));
        } else if ($tab == 'links') {
            DB::table('business_settings')->updateOrInsert(['key' => 'landing_page_links'], [
                'value' => json_encode([
                    'app_url_android_status' => $request['app_url_android_status'],
                    'app_url_android' => $request['app_url_android'],
                    'app_url_ios_status' => $request['app_url_ios_status'],
                    'app_url_ios' => $request['app_url_ios'],
                    'web_app_url_status' => $request['web_app_url_status'],
                    'web_app_url' => $request['web_app_url']
                ])
            ]);
            Toastr::success(trans('messages.landing_page_links_updated'));
        } else if ($tab == 'speciality') {
            $data = [];
            $imageName = null;
            $speciality = BusinessSetting::where('key', 'speciality')->first();
            if ($speciality) {
                $data = json_decode($speciality->value, true);
            }
            if ($request->has('image')) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $request->image->move(public_path('assets/landing/image'), $imageName);
            }
            array_push($data, [
                'img' => $imageName,
                'title' => $request->speciality_title
            ]);

            DB::table('business_settings')->updateOrInsert(['key' => 'speciality'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(trans('messages.landing_page_speciality_updated'));
        } else if ($tab == 'feature') {
            $data = [];
            $imageName = null;
            $feature = BusinessSetting::where('key', 'feature')->first();
            if ($feature) {
                $data = json_decode($feature->value, true);
            }
            if ($request->has('image')) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $request->image->move(public_path('assets/landing/image'), $imageName);
            }
            array_push($data, [
                'img' => $imageName,
                'title' => $request->feature_title,
                'feature_description' => $request->feature_description
            ]);

            DB::table('business_settings')->updateOrInsert(['key' => 'feature'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(trans('messages.landing_page_feature_updated'));
        } else if ($tab == 'testimonial') {
            $data = [];
            $imageName = null;
            $speciality = BusinessSetting::where('key', 'testimonial')->first();
            if ($speciality) {
                $data = json_decode($speciality->value, true);
            }
            if ($request->has('image')) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $request->image->move(public_path('assets/landing/image'), $imageName);
            }
            array_push($data, [
                'img' => $imageName,
                'name' => $request->reviewer_name,
                'position' => $request->reviewer_designation,
                'detail' => $request->review,
            ]);

            DB::table('business_settings')->updateOrInsert(['key' => 'testimonial'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(trans('messages.landing_page_testimonial_updated'));
        } else if ($tab == 'image') {
            $data = [];
            $images = BusinessSetting::where('key', 'landing_page_images')->first();
            if ($images) {
                $data = json_decode($images->value, true);
            }
            if ($request->has('top_content_image')) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $request->top_content_image->move(public_path('assets/landing/image'), $imageName);
                $data['top_content_image'] = $imageName;
            }
            if ($request->has('about_us_image')) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $request->about_us_image->move(public_path('assets/landing/image'), $imageName);
                $data['about_us_image'] = $imageName;
            }

            if ($request->has('feature_section_image')) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $request->feature_section_image->move(public_path('assets/landing/image'), $imageName);
                $data['feature_section_image'] = $imageName;
            }
            if ($request->has('mobile_app_section_image')) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $request->mobile_app_section_image->move(public_path('assets/landing/image'), $imageName);
                $data['mobile_app_section_image'] = $imageName;
            }
            DB::table('business_settings')->updateOrInsert(['key' => 'landing_page_images'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(trans('messages.landing_page_image_updated'));
        } else if ($tab == 'backgroundChange') {
            DB::table('business_settings')->updateOrInsert(['key' => 'backgroundChange'], [
                'value' => json_encode([
                    'header-bg' => $request['header-bg'],
                    'footer-bg' => $request['footer-bg'],
                    'landing-page-bg' => $request['landing-page-bg']
                ])
            ]);
            Toastr::success(trans('messages.background_updated'));
        }
        return back();
    }

    public function delete_landing_page_settings($tab, $key)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(trans('messages.update_option_is_disable_for_demo'));
            return back();
        }
        $item = BusinessSetting::where('key', $tab)->first();
        $data = $item ? json_decode($item->value, true) : null;
        if ($data && array_key_exists($key, $data)) {
            if ($data[$key]['img'] && file_exists(public_path('assets/landing/image') . $data[$key]['img'])) {
                unlink(public_path('assets/landing/image') . $data[$key]['img']);
            }
            array_splice($data, $key, 1);

            $item->value = json_encode($data);
            $item->save();
            Toastr::success(trans('messages.' . $tab) . ' ' . trans('messages.ad') . ' ' . trans('messages.deleted'));
            return back();
        }
        Toastr::error(trans('messages.not_found'));
        return back();
    }

    public function swushd_main_ad_settings($tab)
    {
        if ($tab == 'index') {
            return view('admin-views.business-settings.swushd-main-ad-settings.index');            
        } else if ($tab == 'restaurant') {
            return view('admin-views.business-settings.swushd-main-ad-settings.restaurant');
        } else if ($tab == 'venue') {
            return view('admin-views.business-settings.swushd-main-ad-settings.venue');
        } else if ($tab == 'elite_venue') {
            return view('admin-views.business-settings.swushd-main-ad-settings.elite_venue');
        } else if ($tab == 'venue_rental') {
            return view('admin-views.business-settings.swushd-main-ad-settings.venue_rental');
        }         
    }

    public function update_swushd_main_ad_settings(Request $request, $tab) 
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(trans('messages.update_option_is_disable_for_demo'));
            return back();
        }
        
        if ($tab == 'lodging') {
            $data = [];            
            $imageName = null;
            $lodging = BusinessSetting::where('key', 'lodging')->first();                       
            if ($lodging) {
                $data = json_decode($lodging->value, true);
            }
            if ($request->has('image')) {                
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $request->image->move(public_path('assets/landing/image'), $imageName);
            };
            array_push($data, [
                'img' => $imageName,
                'lodging_title' => $request->lodging_title,
                'lodging_description' => $request->lodging_description
            ]);
            DB::table('business_settings')->updateOrInsert(['key' => 'lodging'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(trans('messages.swushd_lodging_ad_updated'));            
        } else if ($tab == 'restaurant') {
            $data = [];
            $imageName = null;
            $restaurant = BusinessSetting::where('key', 'restaurant')->first();
             
            if ($restaurant) {
                $data = json_decode($restaurant->value, true);
            }
            if ($request->has('image')) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $request->image->move(public_path('assets/landing/image'), $imageName);
            }
            array_push($data, [
                'img' => $imageName,
                'restaurant_title' => $request->restaurant_title,
                'restaurant_description' => $request->restaurant_description
            ]);

            DB::table('business_settings')->updateOrInsert(['key' => 'restaurant'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(trans('messages.swushd_restaurant_ad_updated'));
        } else if ($tab == 'venue') {
            $data = [];
            $imageName = null;
            $venue = BusinessSetting::where('key', 'venue')->first();            
            if ($venue) {
                $data = json_decode($venue->value, true);
            }
            if ($request->has('image')) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";                
                $request->image->move(public_path('assets/landing/image'), $imageName);                
            }
            array_push($data, [
                'img' => $imageName,
                'venue_title' => $request->venue_title,
                'venue_description' => $request->venue_description
            ]);

            DB::table('business_settings')->updateOrInsert(['key' => 'venue'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(trans('messages.swushd_venue_ad_updated'));
        } else if ($tab == 'elite_venue') {
            $data = [];
            $imageName = null;
            $elite_venue = BusinessSetting::where('key', 'elite_venue')->first();
            if ($elite_venue) {
                $data = json_decode($elite_venue->value, true);
            }
            if ($request->has('image')) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $request->image->move(public_path('assets/landing/image'), $imageName);                
            }
            array_push($data, [
                'img' => $imageName,
                'elite_venue_title' => $request->elite_venue_title,
                'elite_venue_description' => $request->elite_venue_description
            ]);

            DB::table('business_settings')->updateOrInsert(['key' => 'elite_venue'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(trans('messages.swushd_elite_venue_ad_updated'));
        } else if ($tab == 'venue_rental') {
            $data = [];
            $imageName = null;
            $venue_rental = BusinessSetting::where('key', 'venue_rental')->first();
            if ($venue_rental) {
                $data = json_decode($venue_rental->value, true);
            }
            if ($request->has('image')) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . ".png";
                $request->image->move(public_path('assets/landing/image'), $imageName);
                Log::channel('stderr')->info($imageName);
            }
            array_push($data, [
                'img' => $imageName,
                'venue_rental_title' => $request->venue_rental_title,
                'venue_rental_description' => $request->venue_rental_description
            ]);

            DB::table('business_settings')->updateOrInsert(['key' => 'venue_rental'], [
                'value' => json_encode($data)
            ]);
            Toastr::success(trans('messages.swushd_venue_rental_ad_updated'));
        }
        return back();
    }

    public function delete_swushd_main_ad_settings($tab, $key)
    {
        if (env('APP_MODE') == 'demo') {
            Toastr::info(trans('messages.update_option_is_disable_for_demo'));
            return back();
        }
        $item = BusinessSetting::where('key', $tab)->first();
        $data = $item ? json_decode($item->value, true) : null;
        if ($data && array_key_exists($key, $data)) {
            if ($data[$key]['img'] && file_exists(public_path('assets/landing/image') . $data[$key]['img'])) {
                unlink(public_path('assets/landing/image') . $data[$key]['img']);
            }
            array_splice($data, $key, 1);

            $item->value = json_encode($data);
            $item->save();
            Toastr::success(trans('messages.' . $tab) . ' ' . trans('messages.ad') . ' ' . trans('messages.deleted'));
            return back();
        }
        Toastr::error(trans('messages.not_found'));
        return back();
    }

    public function currency_index()
    {
        return view('admin-views.business-settings.currency-index');
    }

    public function currency_store(Request $request)
    {
        $request->validate([
            'currency_code' => 'required|unique:currencies',
        ]);

        Currency::create([
            "country" => $request['country'],
            "currency_code" => $request['currency_code'],
            "currency_symbol" => $request['symbol'],
            "exchange_rate" => $request['exchange_rate'],
        ]);
        Toastr::success(trans('messages.currency_added_successfully'));
        return back();
    }

    public function currency_edit($id)
    {
        $currency = Currency::find($id);
        return view('admin-views.business-settings.currency-update', compact('currency'));
    }

    public function currency_update(Request $request, $id)
    {
        Currency::where(['id' => $id])->update([
            "country" => $request['country'],
            "currency_code" => $request['currency_code'],
            "currency_symbol" => $request['symbol'],
            "exchange_rate" => $request['exchange_rate'],
        ]);
        Toastr::success(trans('messages.currency_updated_successfully'));
        return redirect('vendor-panel/business-settings/currency-add');
    }

    public function currency_delete($id)
    {
        Currency::where(['id' => $id])->delete();
        Toastr::success(trans('messages.currency_deleted_successfully'));
        return back();
    }

    public function terms_and_conditions()
    {
        $tnc = BusinessSetting::where(['key' => 'terms_and_conditions'])->first();
        if ($tnc == false) {
            BusinessSetting::insert([
                'key' => 'terms_and_conditions',
                'value' => ''
            ]);
        }
        return view('admin-views.business-settings.terms-and-conditions', compact('tnc'));
    }

    public function terms_and_conditions_update(Request $request)
    {
        BusinessSetting::where(['key' => 'terms_and_conditions'])->update([
            'value' => $request->tnc
        ]);

        Toastr::success(trans('messages.terms_and_condition_updated'));
        return back();
    }

    public function privacy_policy()
    {
        $data = BusinessSetting::where(['key' => 'privacy_policy'])->first();
        if ($data == false) {
            $data = [
                'key' => 'privacy_policy',
                'value' => '',
            ];
            BusinessSetting::insert($data);
        }
        return view('admin-views.business-settings.privacy-policy', compact('data'));
    }

    public function privacy_policy_update(Request $request)
    {
        BusinessSetting::where(['key' => 'privacy_policy'])->update([
            'value' => $request->privacy_policy,
        ]);

        Toastr::success(trans('messages.privacy_policy_updated'));
        return back();
    }

    public function about_us()
    {
        $data = BusinessSetting::where(['key' => 'about_us'])->first();
        if ($data == false) {
            $data = [
                'key' => 'about_us',
                'value' => '',
            ];
            BusinessSetting::insert($data);
        }
        return view('admin-views.business-settings.about-us', compact('data'));
    }

    public function about_us_update(Request $request)
    {
        BusinessSetting::where(['key' => 'about_us'])->update([
            'value' => $request->about_us,
        ]);

        Toastr::success(trans('messages.about_us_updated'));
        return back();
    }

    public function main_ad(Request $request)
    {
        return view('admin-views.business-settings.swushd-main-ad', compact('data'));
    }

    public function featured_venues(Request $request)
    {
        $featured_venues = FeaturedVenue::latest()->paginate(config('default_pagination'));
        return view('admin-views.business-settings.featured-venues-ad-settings.index', compact('featured_venues'));
    }

    public function store_featured_venues(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|max:191',
            'featured_image' => 'required',
            'venue_name' => 'required',
            'description' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }

        $featuredVenue = new FeaturedVenue;
        $featuredVenue->title = $request->title;
        $featuredVenue->featured_image = Helpers::upload('restaurant/', 'png', $request->file('featured_image'));
        $featuredVenue->venue_name = $request->venue_name;
        $featuredVenue->description = $request->description;
        
        $featuredVenue->save();

        return response()->json([], 200);
    }

    public function status_featured_venues(Request $request)
    {
        $featuredVenue = FeaturedVenue::findOrFail($request->id);
        $featuredVenue->status = $request->status;
        $featuredVenue->save();
        echo ($featuredVenue);
        Toastr::success('Featured Venue Advertisement status changed.');
        return back();
    }

    public function edit_featured_venues($id)
    {
        $featuredVenue = FeaturedVenue::find($id);
        
        return view('admin-views.business-settings.featured-venues-ad-settings.edit', compact('featuredVenue'));
    }

    public function update_featured_venues(Request $request, $id)
    {
        $venue = FeaturedVenue::find($id);
        if($venue){
            $venue->title = $request->title;
            $venue->venue_name = $request->venue_name;
            $venue->description = $request->description;
            $venue->save();
            Toastr::success('Featured Venue Advertisement updated successfully.');
            return back();
        } else {
            Toastr::success('Failed to update this featured venue.');
            return back();
        }
    }

    public function delete_featured_venue($id)
    {
        $featuredVenue = FeaturedVenue::find($id);
        if($featuredVenue){
            $featuredVenue->delete();
            Toastr::success('Featured Venue Advertisement removed successfully.');
            return back();
        }else{
            Toastr::success('Failed to remove this featured venue advertisement.');
            return back();
        }
    }
    
    public function hottest_lounges()
    {
        $hottest_lounges = HottestLounge::latest()->paginate(config('default_pagination'));
        return view('admin-views.business-settings.hottest-lounges-ad-settings.index', compact('hottest_lounges'));
    }

    public function store_hottest_lounges(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'title' => 'required|max:191',
            'lounge_image' => 'required',
            'lounge_name' => 'required',
            'description' => 'required',
            'tips_text' => 'required',
        ], [
            'lounge_image.required' => trans('messages.select_a_image'),
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }      

        $hottestLounge = new HottestLounge;
        $hottestLounge->title = $request->title;
        $hottestLounge->lounge_image = Helpers::upload('restaurant/', 'png', $request->file('lounge_image'));
        $hottestLounge->lounge_name = $request->lounge_name;
        $hottestLounge->description = $request->description;
        $hottestLounge->tips_text = $request->tips_text;
        
        $hottestLounge->save();

        return response()->json([], 200);
    }    

    public function status_hottest_lounges(Request $request)
    {
        $hottestLounge = HottestLounge::findOrFail($request->id);
        $hottestLounge->status = $request->status;
        $hottestLounge->save();
        Toastr::success('Hottest Lounge Advertisement status changed.');
        return back();
    }

    public function edit_hottest_lounges($id)
    {
        $hottestLounge = HottestLounge::find($id);        
        return view('admin-views.business-settings.hottest-lounges-ad-settings.edit', compact('hottestLounge'));
    }

    public function update_hottest_lounges(Request $request, $id)
    {
        $lounge = HottestLounge::find($id);
        if($lounge){
            $lounge->title = $request->title;
            $lounge->lounge_name = $request->lounge_name;
            $lounge->description = $request->description;
            $lounge->tips_text = $request->tips_text;
            $lounge->save();
            Toastr::success('Hottest Lounge Advertisement updated successfully.');
            return back();
        } else {
            Toastr::success('Failed to update this hottest lounge.');
            return back();
        }
    }

    public function delete_hottest_lounge($id)
    {
        $hottestLounge = HottestLounge::find($id);
        if($hottestLounge){
            $hottestLounge->delete();
            Toastr::success('Hottest Lounge Advertisement removed successfully.');
            return back();
        }else{
            Toastr::success('Failed to remove this hottest lounge advertisement.');
            return back();
        }
    }    


    public function private_chefs()
    {
        $private_chefs = PrivateChef::latest()->paginate(config('default_pagination'));
        return view('admin-views.business-settings.private-chefs-ad-settings.index', compact('private_chefs'));
    }

    public function store_private_chefs(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'title' => 'required|max:191',
            'chef_image' => 'required',
            'header_text' => 'required',
            'description' => 'required',
            'bottom_text' => 'required',
        ], [
            'chef_image.required' => trans('messages.select_a_image'),
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)]);
        }      

        $privateChef = new PrivateChef;
        $privateChef->title = $request->title;
        $privateChef->chef_image = Helpers::upload('restaurant/', 'png', $request->file('chef_image'));
        $privateChef->header_text = $request->header_text;
        $privateChef->description = $request->description;
        $privateChef->bottom_text = $request->bottom_text;
        $privateChef->button = $request->button;
        
        $privateChef->save();

        return response()->json([], 200);
    }    

    public function status_private_chefs(Request $request)
    {
        $privateChef = PrivateChef::findOrFail($request->id);
        $privateChef->status = $request->status;
        $privateChef->save();
        Toastr::success('Private Chef Advertisement status changed.');
        return back();
    }

    public function edit_private_chefs($id)
    {
        $privateChef = PrivateChef::find($id);        
        return view('admin-views.business-settings.private-chefs-ad-settings.edit', compact('privateChef'));
    }

    public function update_private_chefs(Request $request, $id)
    {
        $chef = PrivateChef::find($id);
        if($chef){
            $chef->title = $request->title;
            $chef->header_text = $request->header_text;
            $chef->description = $request->description;
            $chef->bottom_text = $request->bottom_text;
            $chef->button = $request->button;
            $chef->save();
            Toastr::success('Private Chef Advertisement updated successfully.');
            return back();
        } else {
            Toastr::success('Failed to update this Private Chef AD.');
            return back();
        }
    }

    public function delete_private_chef($id)
    {
        $privateChef = PrivateChef::find($id);
        Log::channel('stderr')->info($privateChef);
        if($privateChef){
            $privateChef->delete();
            Toastr::success('Private Chef Advertisement removed successfully.');
            return back();
        }else{
            Toastr::success('Failed to remove this Private Chef Advertisement.');
            return back();
        }
    }

    public function fcm_index()
    {
        return view('admin-views.business-settings.fcm-index');
    }

    public function update_fcm(Request $request)
    {
        DB::table('business_settings')->updateOrInsert(['key' => 'fcm_project_id'], [
            'value' => $request['fcm_project_id']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'push_notification_key'], [
            'value' => $request['push_notification_key']
        ]);

        Toastr::success(trans('messages.settings_updated'));
        return back();
    }

    public function update_fcm_messages(Request $request)
    {
        DB::table('business_settings')->updateOrInsert(['key' => 'order_pending_message'], [
            'value' => json_encode([
                'status' => $request['pending_status'] == 1 ? 1 : 0,
                'message' => $request['pending_message']
            ])
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'order_confirmation_msg'], [
            'value' => json_encode([
                'status' => $request['confirm_status'] == 1 ? 1 : 0,
                'message' => $request['confirm_message']
            ])
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'order_processing_message'], [
            'value' => json_encode([
                'status' => $request['processing_status'] == 1 ? 1 : 0,
                'message' => $request['processing_message']
            ])
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'out_for_delivery_message'], [
            'value' => json_encode([
                'status' => $request['out_for_delivery_status'] == 1 ? 1 : 0,
                'message' => $request['out_for_delivery_message']
            ])
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'order_delivered_message'], [
            'value' => json_encode([
                'status' => $request['delivered_status'] == 1 ? 1 : 0,
                'message' => $request['delivered_message']
            ])
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'delivery_boy_assign_message'], [
            'value' => json_encode([
                'status' => $request['delivery_boy_assign_status'] == 1 ? 1 : 0,
                'message' => $request['delivery_boy_assign_message']
            ])
        ]);

        // DB::table('business_settings')->updateOrInsert(['key' => 'delivery_boy_start_message'], [
        //     'value' => json_encode([
        //         'status' => $request['delivery_boy_start_status'] == 1 ? 1 : 0,
        //         'message' => $request['delivery_boy_start_message']
        //     ])
        // ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'delivery_boy_delivered_message'], [
            'value' => json_encode([
                'status' => $request['delivery_boy_delivered_status'] == 1 ? 1 : 0,
                'message' => $request['delivery_boy_delivered_message']
            ])
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'order_handover_message'], [
            'value' => json_encode([
                'status' => $request['order_handover_message_status'] == 1 ? 1 : 0,
                'message' => $request['order_handover_message']
            ])
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'order_cancled_message'], [
            'value' => json_encode([
                'status' => $request['order_cancled_message_status'] == 1 ? 1 : 0,
                'message' => $request['order_cancled_message']
            ])
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'order_refunded_message'], [
            'value' => json_encode([
                'status' => $request['order_refunded_message_status'] == 1 ? 1 : 0,
                'message' => $request['order_refunded_message']
            ])
        ]);

        Toastr::success(trans('messages.message_updated'));
        return back();
    }


    public function location_index()
    {
        return view('admin-views.business-settings.location-index');
    }

    public function location_setup(Request $request)
    {
        $restaurant = Helpers::get_restaurant_id();
        $restaurant->latitude = $request['latitude'];
        $restaurant->longitude = $request['longitude'];
        $restaurant->save();

        Toastr::success(trans('messages.settings_updated'));
        return back();
    }

    public function config_setup()
    {
        return view('admin-views.business-settings.config');
    }

    public function config_update(Request $request)
    {
        DB::table('business_settings')->updateOrInsert(['key' => 'map_api_key'], [
            'value' => $request['map_api_key']
        ]);

        DB::table('business_settings')->updateOrInsert(['key' => 'map_api_key_server'], [
            'value' => $request['map_api_key_server']
        ]);

        Toastr::success(trans('messages.config_data_updated'));
        return back();
    }

    public function toggle_settings($key, $value)
    {
        DB::table('business_settings')->updateOrInsert(['key' => $key], [
            'value' => $value
        ]);

        Toastr::success(trans('messages.app_settings_updated'));
        return back();
    }

    public function viewSocialLogin()
    {
        $data = BusinessSetting::where('key', 'social_login')->first();
        $socialLoginServices = json_decode($data->value, true);
        return view('admin-views.business-settings.social-login.view', compact('socialLoginServices'));
    }

    public function updateSocialLogin($service, Request $request)
    {
        $socialLogin = BusinessSetting::where('key', 'social_login')->first();
        $credential_array = [];
        foreach (json_decode($socialLogin['value'], true) as $key => $data) {
            if ($data['login_medium'] == $service) {
                $cred = [
                    'login_medium' => $service,
                    'client_id' => $request['client_id'],
                    'client_secret' => $request['client_secret'],
                    'status' => $request['status'],
                ];
                array_push($credential_array, $cred);
            } else {
                array_push($credential_array, $data);
            }
        }
        BusinessSetting::where('key', 'social_login')->update([
            'value' => $credential_array
        ]);

        Toastr::success(trans('messages.credential_updated', ['service' => $service]));
        return redirect()->back();
    }

    //recaptcha
    public function recaptcha_index(Request $request)
    {
        return view('admin-views.business-settings.recaptcha-index');
    }

    public function recaptcha_update(Request $request)
    {
        DB::table('business_settings')->updateOrInsert(['key' => 'recaptcha'], [
            'key' => 'recaptcha',
            'value' => json_encode([
                'status' => $request['status'],
                'site_key' => $request['site_key'],
                'secret_key' => $request['secret_key']
            ]),
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        Toastr::success('Updated Successfully');
        return back();
    }

    public function send_mail(Request $request)
    {
        $response_flag = 0;
        try {

            Mail::to($request->email)->send(new \App\Mail\TestEmailSender());
            $response_flag = 1;
        } catch (\Exception $exception) {
            info($exception);
            $response_flag = 2;
        }

        return response()->json(['success' => $response_flag]);
    }
}
