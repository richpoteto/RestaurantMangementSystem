<?php

use Illuminate\Support\Facades\Route;
use Symfony\Component\Routing\RouteCompiler;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['namespace' => 'Api\V1', 'middleware'=>'localization'], function () {

    Route::group(['prefix' => 'auth', 'namespace' => 'Auth'], function () {
        Route::post('sign-up', 'CustomerAuthController@register');
        Route::post('sign-up-guest', 'CustomerAuthController@register_guest');
        Route::post('login', 'CustomerAuthController@login');
        Route::post('login-guest', 'CustomerAuthController@login_guest');
        Route::post('verify-phone', 'CustomerAuthController@verify_phone');

        Route::post('check-email', 'CustomerAuthController@check_email');
        Route::post('verify-email', 'CustomerAuthController@verify_email');

        Route::post('forgot-password', 'PasswordResetController@reset_password_request');
        Route::post('verify-token', 'PasswordResetController@verify_token');
        Route::put('reset-password', 'PasswordResetController@reset_password_submit');

        Route::group(['prefix' => 'delivery-man'], function () {
            Route::post('login', 'DeliveryManLoginController@login');

            Route::post('forgot-password', 'DMPasswordResetController@reset_password_request');
            Route::post('verify-token', 'DMPasswordResetController@verify_token');
            Route::put('reset-password', 'DMPasswordResetController@reset_password_submit');
        });
        Route::group(['prefix' => 'vendor'], function () {
            Route::post('login', 'VendorLoginController@login');
            Route::post('forgot-password', 'VendorPasswordResetController@reset_password_request');
            Route::post('verify-token', 'VendorPasswordResetController@verify_token');
            Route::put('reset-password', 'VendorPasswordResetController@reset_password_submit');
        });

        //social login(up comming)
        // Route::post('social-login', 'SocialAuthController@social_login');
        // Route::post('social-register', 'SocialAuthController@social_register');
    });

    Route::group(['prefix' => 'delivery-man'], function () {
        Route::get('last-location', 'DeliverymanController@get_last_location');


        Route::group(['prefix' => 'reviews','middleware'=>['auth:api']], function () {
            Route::get('/{delivery_man_id}', 'DeliveryManReviewController@get_reviews');
            Route::get('rating/{delivery_man_id}', 'DeliveryManReviewController@get_rating');
            Route::post('/submit', 'DeliveryManReviewController@submit_review');
        });
        Route::group(['middleware'=>['dm.api']], function () {
            Route::get('profile', 'DeliverymanController@get_profile');
            Route::get('notifications', 'DeliverymanController@get_notifications');
            Route::put('update-profile', 'DeliverymanController@update_profile');
            Route::post('update-active-status', 'DeliverymanController@activeStatus');
            Route::get('current-orders', 'DeliverymanController@get_current_orders');
            Route::get('latest-orders', 'DeliverymanController@get_latest_orders');
            Route::post('record-location-data', 'DeliverymanController@record_location_data');
            Route::get('all-orders', 'DeliverymanController@get_all_orders');
            Route::get('order-delivery-history', 'DeliverymanController@get_order_history');
            Route::put('accept-order', 'DeliverymanController@accept_order');
            Route::put('update-order-status', 'DeliverymanController@update_order_status');
            Route::put('update-payment-status', 'DeliverymanController@order_payment_status_update');
            Route::get('order-details', 'DeliverymanController@get_order_details');
            Route::put('update-fcm-token', 'DeliverymanController@update_fcm_token');
            //Remove account
            Route::delete('remove-account', 'DeliverymanController@remove_account');
        });
    });
    
    Route::group(['prefix' => 'vendors', 'namespace' => 'Vendor'], function () {
        Route::get('vendor-list', 'VendorController@vendor_list');
    });
    
    Route::group(['prefix' => 'featuredvenue'], function () {
        Route::get('get-featured-venues', 'FeaturedVenueController@get_featured_venues');
    });

    Route::group(['prefix' => 'hottestlounge'], function () {
        Route::get('get-hottest-lounges', 'HottestLoungeController@get_hottest_lounges');
    });
    
    Route::group(['prefix' => 'reservation'], function () {
        Route::get('get-reservations', 'ReservationController@get_reservations');
        Route::get('get-reservation-info', 'ReservationController@get_reservation_info');
        Route::get('get-tables', 'ReservationController@get_tables');
        Route::post('update-tables', 'ReservationController@update_tables');
        Route::post('post-reservation', 'ReservationController@post_reservation');
        Route::post('post-reserve-place', 'ReservationController@post_reserve_place');
        Route::get('update-reservation', 'ReservationController@update_reservation');
        Route::get('update-reservation-pay', 'ReservationController@update_reservation_pay');
    });
    
    Route::group(['prefix' => 'vendor', 'namespace' => 'Vendor', 'middleware'=>['vendor.api']], function () {
        Route::get('notifications', 'VendorController@get_notifications');
        Route::get('profile', 'VendorController@get_profile');
        Route::post('update-active-status', 'VendorController@active_status');
        Route::get('earning-info', 'VendorController@get_earning_data');
        Route::put('update-profile', 'VendorController@update_profile');
        Route::get('current-orders', 'VendorController@get_current_orders');
        Route::get('completed-orders', 'VendorController@get_completed_orders');
        Route::get('all-orders', 'VendorController@get_all_orders');
        Route::put('update-order-status', 'VendorController@update_order_status');
        Route::get('order-details', 'VendorController@get_order_details');
        Route::put('update-fcm-token', 'VendorController@update_fcm_token');
        Route::get('get-basic-campaigns', 'VendorController@get_basic_campaigns');
        Route::put('campaign-leave', 'VendorController@remove_restaurant');
        Route::put('campaign-join', 'VendorController@addrestaurant');
        Route::get('get-withdraw-list', 'VendorController@withdraw_list');
        Route::get('get-products-list', 'VendorController@get_products');
        Route::put('update-bank-info', 'VendorController@update_bank_info');
        Route::post('request-withdraw', 'VendorController@request_withdraw');

        //remove account
        Route::delete('remove-account', 'VendorController@remove_account');
        
        // Business setup
        Route::put('update-business-setup', 'BusinessSettingsController@update_restaurant_setup');

        // Reataurant schedule
        Route::post('schedule/store', 'BusinessSettingsController@add_schedule');
        Route::delete('schedule/{restaurant_schedule}', 'BusinessSettingsController@remove_schedule');

        // Attributes
        Route::get('attributes', 'AttributeController@list');

        // Addon
        Route::group(['prefix'=>'addon'], function(){
            Route::get('/', 'AddOnController@list');
            Route::post('store', 'AddOnController@store');
            Route::put('update', 'AddOnController@update');
            Route::get('status', 'AddOnController@status');
            Route::delete('delete', 'AddOnController@delete');
        });

        Route::group(['prefix' => 'delivery-man'], function () {
            Route::post('store', 'DeliveryManController@store');
            Route::get('list', 'DeliveryManController@list');
            Route::get('preview', 'DeliveryManController@preview');
            Route::get('status', 'DeliveryManController@status');
            Route::post('update/{id}', 'DeliveryManController@update');
            Route::delete('delete', 'DeliveryManController@delete');
            Route::post('search', 'DeliveryManController@search');
        });
        // Food
        Route::group(['prefix'=>'product'], function(){
            Route::post('store', 'FoodController@store');
            Route::put('update', 'FoodController@update');
            Route::delete('delete', 'FoodController@delete');
            Route::get('status', 'FoodController@status');
            Route::POST('search', 'FoodController@search');
            Route::get('reviews', 'FoodController@reviews');

        });

        // POS
        Route::group(['prefix'=>'pos'], function(){
            Route::get('orders', 'POSController@order_list');
            Route::post('place-order', 'POSController@place_order');
            Route::get('customers', 'POSController@get_customers');
        });
    });

    Route::group(['prefix' => 'config'], function () {
        Route::get('/', 'ConfigController@configuration');
        Route::get('/get-zone-id', 'ConfigController@get_zone');
        Route::get('place-api-autocomplete', 'ConfigController@place_api_autocomplete');
        Route::get('distance-api', 'ConfigController@distance_api');
        Route::get('place-api-details', 'ConfigController@place_api_details');
        Route::get('geocode-api', 'ConfigController@geocode_api');
    });

    Route::group(['prefix' => 'products'], function () {
        Route::get('latest', 'ProductController@get_latest_products');
        Route::get('popular', 'ProductController@get_popular_products');
        Route::get('most-reviewed', 'ProductController@get_most_reviewed_products');
        Route::get('set-menu', 'ProductController@get_set_menus');
        Route::get('search', 'ProductController@get_searched_products');
        Route::get('details/{id}', 'ProductController@get_product');
        Route::get('related-products/{food_id}', 'ProductController@get_related_products');
        Route::get('reviews/{food_id}', 'ProductController@get_product_reviews');
        Route::get('rating/{food_id}', 'ProductController@get_product_rating');
        Route::post('reviews/submit', 'ProductController@submit_product_review')->middleware('auth:api');
    });

    Route::group(['prefix' => 'restaurants'], function () {
        Route::get('get-restaurants/{filter_data}', 'RestaurantController@get_restaurants');
        Route::post('get-restaurants', 'RestaurantController@get_restaurants');
        Route::get('popular', 'RestaurantController@get_popular_restaurants');
        Route::get('details/{id}', 'RestaurantController@get_details');
        Route::get('reviews', 'RestaurantController@reviews');
        Route::get('search', 'RestaurantController@get_searched_restaurants');
    });

    Route::group(['prefix' => 'banners'], function () {
        Route::get('/', 'BannerController@get_banners');
    });

    Route::group(['prefix' => 'categories'], function () {
        Route::get('/', 'CategoryController@get_categories');
        Route::get('childes/{category_id}', 'CategoryController@get_childes');
        Route::get('products/{category_id}', 'CategoryController@get_products');
        Route::get('products/{category_id}/all', 'CategoryController@get_all_products');
        Route::get('restaurants/{category_id}', 'CategoryController@get_restaurants');
    });

    Route::group(['prefix' => 'customer', 'middleware' => 'auth:api'], function () {
        Route::get('notifications', 'NotificationController@get_notifications');
        Route::get('info', 'CustomerController@info');
        Route::get('guest-info', 'CustomerController@guest_info');
        Route::get('update-zone', 'CustomerController@update_zone');
        Route::post('update-profile', 'CustomerController@update_profile');
        Route::post('register-guest', 'CustomerController@register_guest');
        Route::post('update-interest', 'CustomerController@update_interest');
        Route::put('cm-firebase-token', 'CustomerController@update_cm_firebase_token');
        Route::get('suggested-foods', 'CustomerController@get_suggested_food');
        Route::get('check-guest-email', 'CustomerController@check_guest_email');
        //Remove account
        Route::delete('remove-account', 'CustomerController@remove_account');

        Route::group(['prefix'=>'loyalty-point'], function() {
            Route::post('point-transfer', 'LoyaltyPointController@point_transfer');
            Route::get('transactions', 'LoyaltyPointController@transactions');            
        });

        Route::group(['prefix'=>'wallet'], function() {
            Route::get('transactions', 'WalletController@transactions');            
        });


        Route::group(['prefix' => 'address'], function () {
            Route::get('list', 'CustomerController@address_list');
            Route::post('add', 'CustomerController@add_new_address');
            Route::put('update/{id}', 'CustomerController@update_address');
            Route::delete('delete', 'CustomerController@delete_address');
        });

        Route::group(['prefix' => 'order'], function () {
            Route::get('list', 'OrderController@get_order_list');
            Route::get('reserve-order-list', 'OrderController@get_reserve_order_list');
            Route::get('running-orders', 'OrderController@get_running_orders');
            Route::get('details', 'OrderController@get_order_details');
            Route::post('place', 'OrderController@place_order');
            Route::post('place-reserve', 'OrderController@place_reserve_order');
            Route::post('place-reserve-place', 'OrderController@place_reserve_place_order');
            Route::put('cancel', 'OrderController@cancel_order');
            Route::put('refund-request', 'OrderController@refund_request');
            Route::get('track', 'OrderController@track_order');
            Route::put('payment-method', 'OrderController@update_payment_method');
            Route::put('complete', 'OrderController@complete_order');
        });
        // Chatting
        Route::group(['prefix' => 'message'], function () {
            Route::get('get', 'ConversationController@messages');
            Route::post('send', 'ConversationController@messages_store');
            Route::post('chat-image', 'ConversationController@chat_image');
        });

        Route::group(['prefix' => 'wish-list'], function () {
            Route::get('/', 'WishlistController@wish_list');
            Route::post('add', 'WishlistController@add_to_wishlist');
            Route::post('add-vendor', 'WishlistController@add_vendor_to_wishlist');
            Route::delete('remove', 'WishlistController@remove_from_wishlist');
            Route::delete('remove-vendor', 'WishlistController@remove_vendor_from_wishlist');
        });
        Route::group(['prefix' => 'credit-cards'], function () {
            Route::get('/', 'CreditcardsController@get_credit_cards');
            Route::post('add', 'CreditcardsController@add_to_creditcards');
            Route::delete('remove', 'CreditcardsController@remove_from_creditcards');
        });
    });
    
    Route::group(['prefix' => 'cuisines'], function () {
        Route::get('get-cuisines', 'CuisineController@get_cuisines');
    });

    Route::group(['prefix' => 'banners'], function () {
        Route::get('/', 'BannerController@get_banners');
    });

    Route::group(['prefix' => 'campaigns'], function () {
        Route::get('basic', 'CampaignController@get_basic_campaigns');
        Route::get('basic-campaign-details', 'CampaignController@basic_campaign_details');
        Route::get('item', 'CampaignController@get_item_campaigns');
    });

    Route::group(['prefix' => 'coupon', 'middleware' => 'auth:api'], function () {
        Route::get('list', 'CouponController@list');
        Route::get('apply', 'CouponController@apply');
    });
});
