<?php

namespace App\Http\Controllers;

ini_set('max_execution_time', 180);

use App\CentralLogics\Helpers;
use App\CentralLogics\ProductLogic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;

class UpdateController extends Controller
{
    public function update_software_index(){
        return view('update.update-software');
    }

    public function update_software(Request $request)
    {
        Helpers::setEnvironmentValue('SOFTWARE_ID','MzM1NzE3NTA=');
        Helpers::setEnvironmentValue('BUYER_USERNAME',$request['username']);
        Helpers::setEnvironmentValue('PURCHASE_CODE',$request['purchase_key']);
        Helpers::setEnvironmentValue('APP_MODE','live');
        Helpers::setEnvironmentValue('SOFTWARE_VERSION','5.6.2');
        Helpers::setEnvironmentValue('APP_NAME','stackfood'.time());

        $data = Helpers::requestSender();
        if (!$data['active']) {
            return redirect(base64_decode('aHR0cHM6Ly82YW10ZWNoLmNvbS9zb2Z0d2FyZS1hY3RpdmF0aW9u'));
        }

        Artisan::call('migrate', ['--force' => true]);
        $previousRouteServiceProvier = base_path('app/Providers/RouteServiceProvider.php');
        $newRouteServiceProvier = base_path('app/Providers/RouteServiceProvider.txt');
        copy($newRouteServiceProvier, $previousRouteServiceProvier);
        Artisan::call('cache:clear');
        Artisan::call('view:clear');

        Helpers::insert_business_settings_key('free_delivery_over');
        Helpers::insert_business_settings_key('app_minimum_version_ios');
        Helpers::insert_business_settings_key('app_minimum_version_android');
        Helpers::insert_business_settings_key('app_url_ios');
        Helpers::insert_business_settings_key('app_url_android');
        Helpers::insert_business_settings_key('dm_maximum_orders',1);
        Helpers::insert_business_settings_key('order_confirmation_model','deliveryman');
        Helpers::insert_business_settings_key('popular_food',1);
        Helpers::insert_business_settings_key('popular_restaurant',1);
        Helpers::insert_business_settings_key('new_restaurant',1);
        Helpers::insert_business_settings_key('most_reviewed_foods',1);
        Helpers::insert_business_settings_key('flutterwave',
        json_encode([
            'status'        => 1,
            'public_key'     => '',
            'secret_key'     => '',
            'hash'    => '',
        ]));

        Helpers::insert_business_settings_key('mercadopago',
        json_encode([
            'status'        => 1,
            'public_key'     => '',
            'access_token'     => '',
        ]));

        Helpers::insert_business_settings_key('landing_page_text','{"header_title_1":"Food App","header_title_2":"Why stay hungry when you can order from StackFood","header_title_3":"Get 10% OFF on your first order","about_title":"StackFood is Best Delivery Service Near You","why_choose_us":"Why Choose Us?","why_choose_us_title":"Lorem ipsum dolor sit amet, consectetur adipiscing elit.","testimonial_title":"Trusted by Customer & Restaurant Owner","footer_article":"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar."}');
        Helpers::insert_business_settings_key('landing_page_links','{"app_url_android_status":"1","app_url_android":"https:\/\/play.google.com","app_url_ios_status":"1","app_url_ios":"https:\/\/www.apple.com\/app-store","web_app_url_status":null,"web_app_url":"front_end"}');
        Helpers::insert_business_settings_key('speciality','[{"img":"clean_&_cheap_icon.png","title":"Clean & Cheap Price"},{"img":"best_dishes_icon.png","title":"Best Dishes Near You"},{"img":"virtual_restaurant_icon.png","title":"Your Own Virtual Restaurant"}]');
        Helpers::insert_business_settings_key('testimonial','[{"img":"img-1.png","name":"Barry Allen","position":"Web Designer","detail":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A\r\n                    aliquam amet animi blanditiis consequatur debitis dicta\r\n                    distinctio, enim error eum iste libero modi nam natus\r\n                    perferendis possimus quasi sint sit tempora voluptatem. Est,\r\n                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!"},{"img":"img-2.png","name":"Sophia Martino","position":"Web Designer","detail":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!"},{"img":"img-3.png","name":"Alan Turing","position":"Web Designer","detail":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!"},{"img":"img-4.png","name":"Ann Marie","position":"Web Designer","detail":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!"}]');
        Helpers::insert_business_settings_key('landing_page_images','{"top_content_image":"double_screen_image.png","about_us_image":"about_us_image.png"}');
        Helpers::insert_business_settings_key('paymob_accept','{"status":"0","api_key":null,"iframe_id":null,"integration_id":null,"hmac":null}');

        //Version 5.0
        Helpers::insert_business_settings_key('show_dm_earning',0);
        Helpers::insert_business_settings_key('canceled_by_deliveryman',0);
        Helpers::insert_business_settings_key('canceled_by_restaurant',0);
        Helpers::insert_business_settings_key('timeformat','24');
        // Helpers::insert_business_settings_key('language','en');
        // Helpers::insert_business_settings_key('social_login','[{"login_medium":"google","client_id":"","client_secret":"","status":"0"},{"login_medium":"facebook","client_id":"","client_secret":"","status":""}]');
        Helpers::insert_business_settings_key('toggle_veg_non_veg', 0);
        Helpers::insert_business_settings_key('toggle_dm_registration', 0);
        Helpers::insert_business_settings_key('toggle_restaurant_registration', 0);
        Helpers::insert_business_settings_key('recaptcha', '{"status":"0","site_key":null,"secret_key":null}');
        Helpers::insert_business_settings_key('schedule_order_slot_duration', 30);
        Helpers::insert_business_settings_key('digit_after_decimal_point', 2);
        Helpers::insert_business_settings_key('language', '["en"]');
        Helpers::insert_business_settings_key('icon', 'icon.png');

        Helpers::insert_business_settings_key('wallet_status', '0');
        Helpers::insert_business_settings_key('loyalty_point_minimum_point', '0');
        Helpers::insert_business_settings_key('loyalty_point_status', '0');
        Helpers::insert_business_settings_key('loyalty_point_item_purchase_point', '0');
        Helpers::insert_business_settings_key('loyalty_point_exchange_rate', '0');
        Helpers::insert_business_settings_key('wallet_add_refund', '0');
        Helpers::insert_business_settings_key('order_refunded_message', 'Order refunded successfully');
        Helpers::insert_business_settings_key('ref_earning_status', '0');
        Helpers::insert_business_settings_key('ref_earning_exchange_rate', '0');
        Helpers::insert_business_settings_key('dm_tips_status', '0');
        Helpers::insert_business_settings_key('theme', '1');
        ProductLogic::update_food_ratings();
        return redirect('/admin/auth/login');
    }
}
