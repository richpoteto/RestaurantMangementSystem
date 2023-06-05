<?php

use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'Admin', 'as' => 'admin.'], function () {
    /*authentication*/
    Route::group(['namespace' => 'Auth', 'prefix' => 'auth', 'as' => 'auth.'], function () {
        Route::get('login', 'LoginController@login')->name('login');
        Route::post('login', 'LoginController@submit')->middleware('actch');
        Route::get('logout', 'LoginController@logout')->name('logout');
    });
    /*authentication*/

    Route::group(['middleware' => ['admin']], function () {

        Route::get('settings', 'SystemController@settings')->name('settings');
        Route::post('settings', 'SystemController@settings_update');
        Route::post('settings-password', 'SystemController@settings_password_update')->name('settings-password');
        Route::get('/get-restaurant-data', 'SystemController@restaurant_data')->name('get-restaurant-data');

        //dashboard
        Route::get('/', 'DashboardController@dashboard')->name('dashboard');

        Route::resource('account-transaction', 'AccountTransactionController')->middleware('module:account');

        Route::resource('provide-deliveryman-earnings', 'ProvideDMEarningController')->middleware('module:provide_dm_earning');

        Route::get('maintenance-mode', 'SystemController@maintenance_mode')->name('maintenance-mode');

        Route::group(['prefix' => 'dashboard-stats', 'as' => 'dashboard-stats.'], function () {
            Route::post('order', 'DashboardController@order')->name('order');
            Route::post('zone', 'DashboardController@zone')->name('zone');
            Route::post('user-overview', 'DashboardController@user_overview')->name('user-overview');
            Route::post('business-overview', 'DashboardController@business_overview')->name('business-overview');
        });
        
        Route::group(['prefix' => 'business', 'as' => 'business.', 'middleware' => ['module:business']], function () {
            Route::get('add-new', 'BusinessController@add_new')->name('add-new');
            Route::post('store', 'BusinessController@store')->name('store');
            Route::get('list', 'BusinessController@list')->name('list');
            Route::get('update/{id}', 'BusinessController@edit')->name('edit');
            Route::post('update/{id}', 'BusinessController@update')->name('update');
            Route::delete('delete/{id}', 'BusinessController@distroy')->name('delete');
            Route::post('search', 'BusinessController@search')->name('search');
        });

        Route::group(['prefix' => 'custom-role', 'as' => 'custom-role.', 'middleware' => ['module:custom_role']], function () {
            Route::get('create', 'CustomRoleController@create')->name('create');
            Route::post('create', 'CustomRoleController@store');
            Route::get('edit/{id}', 'CustomRoleController@edit')->name('edit');
            Route::post('update/{id}', 'CustomRoleController@update')->name('update');
            Route::delete('delete/{id}', 'CustomRoleController@distroy')->name('delete');
            Route::post('search', 'CustomRoleController@search')->name('search');
        });

        Route::group(['prefix' => 'employee', 'as' => 'employee.', 'middleware' => ['module:employee']], function () {
            Route::get('add-new', 'EmployeeController@add_new')->name('add-new');
            Route::post('add-new', 'EmployeeController@store');
            Route::get('list', 'EmployeeController@list')->name('list');
            Route::get('update/{id}', 'EmployeeController@edit')->name('edit');
            Route::post('update/{id}', 'EmployeeController@update')->name('update');
            Route::delete('delete/{id}', 'EmployeeController@distroy')->name('delete');
            Route::post('search', 'EmployeeController@search')->name('search');
        });
        
        Route::post('food/variant-price', 'FoodController@variant_price')->name('food.variant-price');
        
        Route::group(['prefix' => 'food', 'as' => 'food.', 'middleware' => ['module:food']], function () {
            Route::get('add-new', 'FoodController@index')->name('add-new');
            Route::post('variant-combination', 'FoodController@variant_combination')->name('variant-combination');
            Route::post('store', 'FoodController@store')->name('store');
            Route::get('edit/{id}', 'FoodController@edit')->name('edit');
            Route::post('update/{id}', 'FoodController@update')->name('update');
            Route::get('list', 'FoodController@list')->name('list');
            Route::delete('delete/{id}', 'FoodController@delete')->name('delete');
            Route::get('status/{id}/{status}', 'FoodController@status')->name('status');
            Route::get('review-status/{id}/{status}', 'FoodController@reviews_status')->name('reviews.status');
            Route::post('search', 'FoodController@search')->name('search');
            Route::get('reviews', 'FoodController@review_list')->name('reviews');
            Route::get('change-priority/{id}', 'FoodController@change_priority')->name('change-priority');
            Route::get('featured/{food}/{f_featured}', 'FoodController@change_feature')->name('featured');
            Route::get('trending/{food}/{f_trending}', 'FoodController@change_trending')->name('trending');
            Route::get('view/{id}', 'FoodController@view')->name('view');
            //ajax request
            Route::get('get-categories', 'FoodController@get_categories')->name('get-categories');
            Route::get('get-foods', 'FoodController@get_foods')->name('getfoods');

            //Import and export
            Route::get('bulk-import', 'FoodController@bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'FoodController@bulk_import_data');
            Route::get('bulk-export', 'FoodController@bulk_export_index')->name('bulk-export-index');
            Route::post('bulk-export', 'FoodController@bulk_export_data')->name('bulk-export');
        });

        Route::group(['prefix' => 'product', 'as' => 'product.', 'middleware' => ['module:product']], function () {
            Route::get('add-new', 'GoodController@index')->name('add-new');
            Route::post('variant-combination', 'GoodController@variant_combination')->name('variant-combination');
            Route::post('store', 'GoodController@store')->name('store');
            Route::get('edit/{id}', 'GoodController@edit')->name('edit');
            Route::post('update/{id}', 'GoodController@update')->name('update');
            Route::get('list', 'GoodController@list')->name('list');
            Route::delete('delete/{id}', 'GoodController@delete')->name('delete');
            Route::get('status/{id}/{status}', 'GoodController@status')->name('status');
            Route::get('review-status/{id}/{status}', 'GoodController@reviews_status')->name('reviews.status');
            Route::post('search', 'GoodController@search')->name('search');
            Route::get('reviews', 'GoodController@review_list')->name('reviews');
            Route::get('change-priority/{id}', 'GoodController@change_priority')->name('change-priority');
            Route::get('featured/{product}/{f_featured}', 'GoodController@change_feature')->name('featured');
            Route::get('trending/{product}/{f_trending}', 'GoodController@change_trending')->name('trending');
            Route::get('view/{id}', 'GoodController@view')->name('view');
            //ajax request
            Route::get('get-categories', 'GoodController@get_categories')->name('get-categories');
            Route::get('get-products', 'GoodController@get_products')->name('getproducts');

            //Import and export
            Route::get('bulk-import', 'GoodController@bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'GoodController@bulk_import_data');
            Route::get('bulk-export', 'GoodController@bulk_export_index')->name('bulk-export-index');
            Route::post('bulk-export', 'GoodController@bulk_export_data')->name('bulk-export');
        });

        Route::group(['prefix' => 'banner', 'as' => 'banner.', 'middleware' => ['module:banner']], function () {
            Route::get('add-new', 'BannerController@index')->name('add-new');
            Route::post('store', 'BannerController@store')->name('store');
            Route::get('edit/{banner}', 'BannerController@edit')->name('edit');
            Route::post('update/{banner}', 'BannerController@update')->name('update');
            Route::get('status/{id}/{status}', 'BannerController@status')->name('status');
            Route::delete('delete/{banner}', 'BannerController@delete')->name('delete');
            Route::post('search', 'BannerController@search')->name('search');
        });

        Route::group(['prefix' => 'featuredVenues', 'as' => 'featuredVenues.', 'middleware' => ['module:featuredVenues']], function () {
            Route::get('/', 'FeaturedVenueController@index')->name('add-new');
            Route::post('store', 'FeaturedVenueController@store')->name('store');
            Route::get('edit/{id}', 'FeaturedVenueController@edit')->name('edit');
            Route::post('update/{id}', 'FeaturedVenueController@update')->name('update');
            Route::get('status/{id}/{status}', 'FeaturedVenueController@status')->name('status');
            Route::delete('delete/{id}', 'FeaturedVenueController@delete')->name('delete');
            Route::post('search', 'FeaturedVenueController@search')->name('search');
        });

        // Route::group(['prefix' => 'business-settings/hottestLounges', 'as' => 'hottestLounges.', 'middleware' => ['module:hottestLounges']], function () {
        //     Route::get('/', 'HottestLoungeController@index')->name('add-new');
        //     Route::post('store', 'HottestLoungeController@store')->name('store');
        //     Route::get('edit/{id}', 'HottestLoungeController@edit')->name('edit');
        //     Route::post('update/{id}', 'HottestLoungeController@update')->name('update');
        //     Route::get('status/{id}/{status}', 'HottestLoungeController@status')->name('status');
        //     Route::delete('delete/{id}', 'HottestLoungeController@delete')->name('delete');
        // });

        Route::group(['prefix' => 'campaign', 'as' => 'campaign.', 'middleware' => ['module:campaign']], function () {
            Route::get('{type}/add-new', 'CampaignController@index')->name('add-new');
            Route::post('store/basic', 'CampaignController@storeBasic')->name('store-basic');
            Route::post('store/item', 'CampaignController@storeItem')->name('store-item');
            Route::get('{type}/edit/{campaign}', 'CampaignController@edit')->name('edit');
            Route::get('{type}/view/{campaign}', 'CampaignController@view')->name('view');
            Route::post('basic/update/{campaign}', 'CampaignController@update')->name('update-basic');
            Route::post('item/update/{campaign}', 'CampaignController@updateItem')->name('update-item');
            Route::get('remove-restaurant/{campaign}/{restaurant}', 'CampaignController@remove_restaurant')->name('remove-restaurant');
            Route::post('add-restaurant/{campaign}', 'CampaignController@addrestaurant')->name('addrestaurant');
            Route::get('{type}/list', 'CampaignController@list')->name('list');
            Route::get('status/{type}/{id}/{status}', 'CampaignController@status')->name('status');
            Route::delete('delete/{campaign}', 'CampaignController@delete')->name('delete');
            Route::delete('item/delete/{campaign}', 'CampaignController@delete_item')->name('delete-item');
            Route::post('basic-search', 'CampaignController@searchBasic')->name('searchBasic');
            Route::post('item-search', 'CampaignController@searchItem')->name('searchItem');
        });

        Route::group(['prefix' => 'coupon', 'as' => 'coupon.', 'middleware' => ['module:coupon']], function () {
            Route::get('add-new', 'CouponController@add_new')->name('add-new');
            Route::post('store', 'CouponController@store')->name('store');
            Route::get('update/{id}', 'CouponController@edit')->name('update');
            Route::post('update/{id}', 'CouponController@update');
            Route::get('status/{id}/{status}', 'CouponController@status')->name('status');
            Route::delete('delete/{id}', 'CouponController@delete')->name('delete');
            Route::post('search', 'CouponController@search')->name('search');
        });

        Route::group(['prefix' => 'attribute', 'as' => 'attribute.', 'middleware' => ['module:attribute']], function () {
            Route::get('add-new', 'AttributeController@index')->name('add-new');
            Route::post('store', 'AttributeController@store')->name('store');
            Route::get('edit/{id}', 'AttributeController@edit')->name('edit');
            Route::post('update/{id}', 'AttributeController@update')->name('update');
            Route::delete('delete/{id}', 'AttributeController@delete')->name('delete');
            Route::post('search', 'AttributeController@search')->name('search');

            //Import and export
            Route::get('bulk-import', 'AttributeController@bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'AttributeController@bulk_import_data');
            Route::get('bulk-export', 'AttributeController@bulk_export_index')->name('bulk-export-index');
            Route::post('bulk-export', 'AttributeController@bulk_export_data')->name('bulk-export');
        });

        Route::group(['prefix' => 'reservation', 'as' => 'reservation.'], function () {
            Route::get('ongoing', 'ReservationController@index')->name('ongoing');
            Route::get('processing', 'ReservationController@processing_view')->name('processing');
            Route::get('completed', 'ReservationController@completed_view')->name('completed');
            Route::get('view-reservation/{id}', 'ReservationController@view_reservation')->name('view-reservation');
            Route::get('reserve-table', 'ReservationController@reserve_table')->name('reserve-table');
            Route::get('add-guest-view/{reservation_id}', 'ReservationController@add_guest_view')->name('add-guest-view');
            Route::get('choose-foods-view/{reservation_id}', 'ReservationController@choose_foods_view')->name('choose-foods-view');
            Route::get('set-amount-view/{reservation_id}', 'ReservationController@set_amount')->name('set-amount-view');
            Route::get('payment-view/{reservation_id}', 'ReservationController@payment_view')->name('payment-view');
            Route::get('stripe-view/{reservation_id}', 'ReservationController@stripe_view')->name('stripe-view');
            Route::post('payment-stripe', 'ReservationController@payment_stripe')->name('payment-stripe');
            Route::get('add-food-cart/{food_id}/{reservation_id}', 'ReservationController@add_food_cart')->name('add-food-cart');
            Route::get('food-view/{id}', 'ReservationController@food_view')->name('food-view');
            Route::post('add-reservation', 'ReservationController@add_reservation')->name('add-reservation');
            Route::post('add-guest', 'ReservationController@add_guest')->name('add-guest');
            Route::post('add-food-order', 'ReservationController@add_food_order')->name('add-food-order');
            Route::get('inc-amount/{reservation_id}/{order_id}/{food_id}', 'ReservationController@inc_amount')->name('inc-amount');
            Route::get('dec-amount/{reservation_id}/{order_id}/{food_id}', 'ReservationController@dec_amount')->name('dec-amount');
            Route::get('inc-addon/{reservation_id}/{order_id}/{food_id}/{addon_id}', 'ReservationController@inc_addon')->name('inc-addon');
            Route::get('dec-addon/{reservation_id}/{order_id}/{food_id}/{addon_id}', 'ReservationController@dec_addon')->name('dec-addon');
            Route::post('check-out', 'ReservationController@check_out')->name('check-out');
            Route::get('service-tip/{id}/{service_tip}', 'ReservationController@service_tip')->name('service-tip');
            Route::get('get-tables', 'ReservationController@get_tables')->name('get-tables');
            Route::get('get-table-info', 'ReservationController@get_table_info')->name('get-table-info');
            Route::post('pay-paypal', 'ReservationController@payWithpaypal')->name('pay-paypal');
            });

        Route::group(['prefix' => 'tables', 'as' => 'tables.'], function () {
            Route::get('add', 'TablesController@index')->name('add');
            Route::get('list', 'TablesController@list')->name('list');
            Route::get('edit/{id}', 'TablesController@edit')->name('edit');
            Route::get('delete/{id}', 'TablesController@delete')->name('delete');
            Route::post('add-table', 'TablesController@add_table')->name('add-table');
            Route::group(['middleware' => ['module:tables']], function () {
                Route::get('get-tables', 'TablesController@get_tables')->name('get-tables');
                Route::post('update/{id}', 'TablesController@update')->name('update');
            });
        });

        Route::group(['prefix' => 'vendor', 'as' => 'vendor.'], function () {
            Route::get('get-restaurants-data/{restaurant}', 'VendorController@get_restaurant_data')->name('get-restaurants-data');
            Route::get('restaurant-filter/{id}', 'VendorController@restaurant_filter')->name('restaurantfilter');
            Route::get('get-account-data/{restaurant}', 'VendorController@get_account_data')->name('restaurantfilter');
            Route::get('get-restaurants', 'VendorController@get_restaurants')->name('get-restaurants');
            Route::get('get-addons', 'VendorController@get_addons')->name('get_addons');
            Route::get('add', 'VendorController@index')->name('add');
            Route::group(['middleware' => ['module:restaurant']], function () {
                Route::get('update-application/{id}/{status}', 'VendorController@update_application')->name('application');
                Route::post('store', 'VendorController@store')->name('store');
                Route::get('edit/{id}', 'VendorController@edit')->name('edit');
                Route::post('update/{restaurant}', 'VendorController@update')->name('update');
                Route::post('discount/{restaurant}', 'VendorController@discountSetup')->name('discount');
                Route::post('update-settings/{restaurant}', 'VendorController@updateRestaurantSettings')->name('update-settings');
                Route::get('change-type/{restaurant_id}', 'VendorController@change_type')->name('change-type');
                Route::get('kitchen-class/{restaurant_id}', 'VendorController@kitchen_class')->name('kitchen-class');
                Route::get('venue-class/{restaurant_id}', 'VendorController@venue_class')->name('venue-class');
                Route::get('change-priority/{restaurant_id}', 'VendorController@change_priority')->name('change-priority');
                // Route::delete('delete/{restaurant}', 'VendorController@destroy')->name('delete');
                Route::delete('clear-discount/{restaurant}', 'VendorController@cleardiscount')->name('clear-discount');
                // Route::get('view/{restaurant}', 'VendorController@view')->name('view_tab');
                Route::get('view/{restaurant}/{tab?}/{sub_tab?}', 'VendorController@view')->name('view');
                Route::get('list', 'VendorController@list')->name('list');
                Route::get('chef-list', 'VendorController@chefs_list')->name('chef-list');
                Route::get('chef-edit/{id}', 'VendorController@chef_edit')->name('chef-edit');
                Route::get('chef-update/{id}', 'VendorController@chef_update')->name('chef-update');
                Route::get('chef-featured/{chef}/{featured}', 'VendorController@chef_featured')->name('chef-featured');
                Route::get('chef-trending/{chef}/{trending}', 'VendorController@chef_trending')->name('chef-trending');
                Route::get('chef-isNew/{chef}/{isNew}', 'VendorController@chef_isNew')->name('chef-isNew');
                Route::get('change-chef-type/{vendor}', 'VendorController@change_chef_type')->name('change-chef-type');
                Route::get('change-celeb-category/{vendor}', 'VendorController@change_celeb_category')->name('change-celeb-category');
                Route::get('change-chef-priority/{vendor}', 'VendorController@change_chef_priority')->name('change-chef-priority');
                Route::post('search', 'VendorController@search')->name('search');
                Route::get('status/{restaurant}/{status}', 'VendorController@status')->name('status');
                Route::get('featured/{restaurant}/{featured}', 'VendorController@featured')->name('featured');
                Route::get('trending/{restaurant}/{trending}', 'VendorController@trending')->name('trending');
                Route::get('isNew/{restaurant}/{isNew}', 'VendorController@isNew')->name('isNew');
                Route::get('isNearby/{restaurant}/{isNearby}', 'VendorController@isNearby')->name('isNearby');
                Route::get('toggle-settings-status/{restaurant}/{status}/{menu}', 'VendorController@restaurant_status')->name('toggle-settings');
                Route::post('status-filter', 'VendorController@status_filter')->name('status-filter');
                //Import and export
                Route::get('bulk-import', 'VendorController@bulk_import_index')->name('bulk-import');
                Route::post('bulk-import', 'VendorController@bulk_import_data');
                Route::get('bulk-export', 'VendorController@bulk_export_index')->name('bulk-export-index');
                Route::post('bulk-export', 'VendorController@bulk_export_data')->name('bulk-export');
                //Restaurant shcedule
                Route::post('add-schedule', 'VendorController@add_schedule')->name('add-schedule');
                Route::get('remove-schedule/{restaurant_schedule}', 'VendorController@remove_schedule')->name('remove-schedule');
            });

            Route::group(['middleware' => ['module:withdraw_list']], function () {
                Route::post('withdraw-status/{id}', 'VendorController@withdrawStatus')->name('withdraw_status');
                Route::get('withdraw_list', 'VendorController@withdraw')->name('withdraw_list');
                Route::get('withdraw-view/{withdraw_id}/{seller_id}', 'VendorController@withdraw_view')->name('withdraw_view');
            });
        });

        Route::group(['prefix' => 'addon', 'as' => 'addon.', 'middleware' => ['module:addon']], function () {
            Route::get('add-new', 'AddOnController@index')->name('add-new');
            Route::post('store', 'AddOnController@store')->name('store');
            Route::get('edit/{id}', 'AddOnController@edit')->name('edit');
            Route::post('update/{id}', 'AddOnController@update')->name('update');
            Route::delete('delete/{id}', 'AddOnController@delete')->name('delete');
            Route::get('status/{addon}/{status}', 'AddOnController@status')->name('status');
            Route::post('search', 'AddOnController@search')->name('search');
            //Import and export
            Route::get('bulk-import', 'AddOnController@bulk_import_index')->name('bulk-import');
            Route::post('bulk-import', 'AddOnController@bulk_import_data');
            Route::get('bulk-export', 'AddOnController@bulk_export_index')->name('bulk-export-index');
            Route::post('bulk-export', 'AddOnController@bulk_export_data')->name('bulk-export');
        });
        
        Route::group(['prefix' => 'cuisine', 'as' => 'cuisine.'], function () {
            Route::get('get-all', 'CuisineController@get_all')->name('get-all');
            Route::group(['middleware' => ['module:cuisine']], function () {
                Route::get('add', 'CuisineController@index')->name('add');
                Route::get('list', 'CuisineController@list')->name('list');
                Route::post('store', 'CuisineController@store')->name('store');
                Route::get('edit/{id}', 'CuisineController@edit')->name('edit');
                Route::post('update/{id}', 'CuisineController@update')->name('update');
                Route::delete('delete/{id}', 'CuisineController@delete')->name('delete');
                Route::get('change-priority/{cuisine}', 'CuisineController@change_priority')->name('change-priority');
                Route::get('status/{id}/{active_status}', 'CuisineController@status')->name('status');
                Route::get('featured/{cuisine}/{c_featured}', 'CuisineController@change_feature')->name('featured');
                Route::get('trending/{cuisine}/{c_trending}', 'CuisineController@change_trending')->name('trending');
            });
        });

        Route::group(['prefix' => 'category', 'as' => 'category.'], function () {
            Route::get('get-all', 'CategoryController@get_all')->name('get-all');
            Route::group(['middleware' => ['module:category']], function () {
                Route::get('add', 'CategoryController@index')->name('add');
                Route::get('add-sub-category', 'CategoryController@sub_index')->name('add-sub-category');
                Route::get('add-sub-sub-category', 'CategoryController@sub_sub_index')->name('add-sub-sub-category');
                Route::post('store', 'CategoryController@store')->name('store');
                Route::get('edit/{id}', 'CategoryController@edit')->name('edit');
                Route::post('update/{id}', 'CategoryController@update')->name('update');
                Route::get('update-priority/{category}', 'CategoryController@update_priority')->name('priority');
                Route::post('store', 'CategoryController@store')->name('store');
                Route::get('status/{id}/{status}', 'CategoryController@status')->name('status');
                Route::delete('delete/{id}', 'CategoryController@delete')->name('delete');
                Route::post('search', 'CategoryController@search')->name('search');

                //Import and export
                Route::get('bulk-import', 'CategoryController@bulk_import_index')->name('bulk-import');
                Route::post('bulk-import', 'CategoryController@bulk_import_data');
                Route::get('bulk-export', 'CategoryController@bulk_export_index')->name('bulk-export-index');
                Route::post('bulk-export', 'CategoryController@bulk_export_data')->name('bulk-export');
            });
        });

        Route::group(['prefix' => 'order', 'as' => 'order.', 'middleware' => ['module:order']], function () {
            Route::get('list/{status}', 'OrderController@list')->name('list');
            Route::get('details/{id}', 'OrderController@details')->name('details');
            Route::get('status', 'OrderController@status')->name('status');
            // Route::put('status-update/{id}', 'OrderController@status')->name('status-update');
            Route::get('view/{id}', 'OrderController@view')->name('view');
            Route::post('update-shipping/{order}', 'OrderController@update_shipping')->name('update-shipping');
            Route::delete('delete/{id}', 'OrderController@delete')->name('delete');

            Route::get('add-delivery-man/{order_id}/{delivery_man_id}', 'OrderController@add_delivery_man')->name('add-delivery-man');
            Route::get('payment-status', 'OrderController@payment_status')->name('payment-status');
            Route::get('generate-invoice/{id}', 'OrderController@generate_invoice')->name('generate-invoice');
            Route::post('add-payment-ref-code/{id}', 'OrderController@add_payment_ref_code')->name('add-payment-ref-code');
            Route::get('restaurant-filter/{restaurant_id}', 'OrderController@restaurnt_filter')->name('restaurant-filter');
            Route::get('filter/reset', 'OrderController@filter_reset');
            Route::post('filter', 'OrderController@filter')->name('filter');
            Route::post('search', 'OrderController@search')->name('search');
            //order update
            Route::post('add-to-cart', 'OrderController@add_to_cart')->name('add-to-cart');
            Route::post('remove-from-cart', 'OrderController@remove_from_cart')->name('remove-from-cart');
            Route::get('update/{order}', 'OrderController@update')->name('update');
            Route::get('edit-order/{order}', 'OrderController@edit')->name('edit');
            Route::get('quick-view', 'OrderController@quick_view')->name('quick-view');
            Route::get('quick-view-cart-item', 'OrderController@quick_view_cart_item')->name('quick-view-cart-item');
            Route::get('export-orders/{status}/{type}', 'OrderController@export_orders')->name('export');
        });

        Route::group(['prefix' => 'dispatch', 'as' => 'dispatch.', 'middleware' => ['module:order']], function () {
            Route::get('list/{status}', 'OrderController@dispatch_list')->name('list');
        });

        Route::group(['prefix' => 'zone', 'as' => 'zone.', 'middleware' => ['module:zone']], function () {
            Route::get('/', 'ZoneController@index')->name('home');
            Route::post('store', 'ZoneController@store')->name('store');
            Route::get('edit/{id}', 'ZoneController@edit')->name('edit');
            Route::post('update/{id}', 'ZoneController@update')->name('update');
            Route::delete('delete/{zone}', 'ZoneController@destroy')->name('delete');
            Route::get('status/{id}/{status}', 'ZoneController@status')->name('status');
            Route::post('search', 'ZoneController@search')->name('search');
            Route::get('zone-filter/{id}', 'ZoneController@zone_filter')->name('zonefilter');
            Route::get('get-all-zone-cordinates/{id?}', 'ZoneController@get_all_zone_cordinates')->name('zoneCoordinates');
        });

        Route::group(['prefix' => 'notification', 'as' => 'notification.', 'middleware' => ['module:notification']], function () {
            Route::get('add-new', 'NotificationController@index')->name('add-new');
            Route::post('store', 'NotificationController@store')->name('store');
            Route::get('edit/{id}', 'NotificationController@edit')->name('edit');
            Route::post('update/{id}', 'NotificationController@update')->name('update');
            Route::get('status/{id}/{status}', 'NotificationController@status')->name('status');
            Route::delete('delete/{id}', 'NotificationController@delete')->name('delete');
        });

        Route::group(['prefix' => 'business-settings', 'as' => 'business-settings.', 'middleware' => ['module:settings', 'actch']], function () {
            Route::get('business-setup', 'BusinessSettingsController@business_index')->name('business-setup');
            Route::get('config-setup', 'BusinessSettingsController@config_setup')->name('config-setup');
            Route::post('config-update', 'BusinessSettingsController@config_update')->name('config-update');
            Route::post('update-setup', 'BusinessSettingsController@business_setup')->name('update-setup');
            Route::get('theme-settings', 'BusinessSettingsController@theme_settings')->name('theme-settings');
            Route::POST('theme-settings-update', 'BusinessSettingsController@update_theme_settings')->name('theme-settings-update');
            Route::get('app-settings', 'BusinessSettingsController@app_settings')->name('app-settings');
            Route::POST('app-settings', 'BusinessSettingsController@update_app_settings')->name('app-settings');
            Route::get('landing-page-settings/{tab?}', 'BusinessSettingsController@landing_page_settings')->name('landing-page-settings');
            Route::POST('landing-page-settings/{tab}', 'BusinessSettingsController@update_landing_page_settings')->name('landing-page-settings');
            Route::DELETE('landing-page-settings/{tab}/{key}', 'BusinessSettingsController@delete_landing_page_settings')->name('landing-page-settings-delete');

            Route::get('toggle-settings/{key}/{value}', 'BusinessSettingsController@toggle_settings')->name('toggle-settings');

            Route::get('fcm-index', 'BusinessSettingsController@fcm_index')->name('fcm-index');
            Route::post('update-fcm', 'BusinessSettingsController@update_fcm')->name('update-fcm');

            Route::post('update-fcm-messages', 'BusinessSettingsController@update_fcm_messages')->name('update-fcm-messages');

            Route::get('mail-config', 'BusinessSettingsController@mail_index')->name('mail-config');
            Route::post('mail-config', 'BusinessSettingsController@mail_config');
            Route::get('send-mail', 'BusinessSettingsController@send_mail')->name('mail.send');

            Route::get('payment-method', 'BusinessSettingsController@payment_index')->name('payment-method');
            Route::post('payment-method-update/{payment_method}', 'BusinessSettingsController@payment_update')->name('payment-method-update');

            Route::get('currency-add', 'BusinessSettingsController@currency_index')->name('currency-add');
            Route::post('currency-add', 'BusinessSettingsController@currency_store');
            Route::get('currency-update/{id}', 'BusinessSettingsController@currency_edit')->name('currency-update');
            Route::put('currency-update/{id}', 'BusinessSettingsController@currency_update');
            Route::delete('currency-delete/{id}', 'BusinessSettingsController@currency_delete')->name('currency-delete');

            Route::get('pages/terms-and-conditions', 'BusinessSettingsController@terms_and_conditions')->name('terms-and-conditions');
            Route::post('pages/terms-and-conditions', 'BusinessSettingsController@terms_and_conditions_update');

            Route::get('pages/privacy-policy', 'BusinessSettingsController@privacy_policy')->name('privacy-policy');
            Route::post('pages/privacy-policy', 'BusinessSettingsController@privacy_policy_update');

            Route::get('pages/about-us', 'BusinessSettingsController@about_us')->name('about-us');
            Route::post('pages/about-us', 'BusinessSettingsController@about_us_update');

            Route::get('sms-module', 'SMSModuleController@sms_index')->name('sms-module');
            Route::post('sms-module-update/{sms_module}', 'SMSModuleController@sms_update')->name('sms-module-update');

            //recaptcha
            Route::get('recaptcha', 'BusinessSettingsController@recaptcha_index')->name('recaptcha_index');
            Route::post('recaptcha-update', 'BusinessSettingsController@recaptcha_update')->name('recaptcha_update');
            Route::get('social-media/fetch', 'SocialMediaController@fetch')->name('social-media.fetch');
            Route::get('social-media/status-update', 'SocialMediaController@social_media_status_update')->name('social-media.status-update');
            Route::resource('social-media', 'SocialMediaController');

            //Mobile Ad Settings
            Route::get('swushd-main-ad-settings/{tab?}', 'BusinessSettingsController@swushd_main_ad_settings')->name('swushd-main-ad-settings');
            Route::POST('swushd-main-ad-settings/{tab}', 'BusinessSettingsController@update_swushd_main_ad_settings')->name('swushd-main-ad-settings');
            Route::DELETE('swushd-main-ad-settings/{tab}/{key}', 'BusinessSettingsController@delete_swushd_main_ad_settings')->name('swushd-main-ad-settings-delete');
            // Route::get('mobile-ads/swushd-main-ad', 'BusinessSettingsController@swushd_main_ad')->name('swushd-main-ad');

            Route::group(['prefix' => 'featured-venues', 'as' => 'featured-venues.', 'middleware' => ['module:featured-venues']], function () {
                Route::get('/', 'BusinessSettingsController@featured_venues')->name('add-new');
                Route::post('store', 'BusinessSettingsController@store_featured_venues')->name('store');
                Route::get('edit/{id}', 'BusinessSettingsController@edit_featured_venues')->name('edit');
                Route::post('update/{id}', 'BusinessSettingsController@update_featured_venues')->name('update');
                Route::get('status/{id}/{status}', 'BusinessSettingsController@status_featured_venues')->name('status');
                Route::delete('delete/{id}', 'BusinessSettingsController@delete_featured_venue')->name('delete');
            });
          
            Route::group(['prefix' => 'hottest-lounges', 'as' => 'hottest-lounges.', 'middleware' => ['module:hottest-lounges']], function () {
                Route::get('/', 'BusinessSettingsController@hottest_lounges')->name('add-new');
                Route::post('store', 'BusinessSettingsController@store_hottest_lounges')->name('store');
                Route::get('edit/{id}', 'BusinessSettingsController@edit_hottest_lounges')->name('edit');
                Route::post('update/{id}', 'BusinessSettingsController@update_hottest_lounges')->name('update');
                Route::get('status/{id}/{status}', 'BusinessSettingsController@status_hottest_lounges')->name('status');
                Route::delete('delete/{id}', 'BusinessSettingsController@delete_hottest_lounge')->name('delete');
            });

            Route::group(['prefix' => 'private-chefs', 'as' => 'private-chefs.', 'middleware' => ['module:private-chefs']], function () {
                Route::get('/', 'BusinessSettingsController@private_chefs')->name('add-new');
                Route::post('store', 'BusinessSettingsController@store_private_chefs')->name('store');
                Route::get('edit/{id}', 'BusinessSettingsController@edit_private_chefs')->name('edit');
                Route::post('update/{id}', 'BusinessSettingsController@update_private_chefs')->name('update');
                Route::get('status/{id}/{status}', 'BusinessSettingsController@status_private_chefs')->name('status');
                Route::delete('delete/{id}', 'BusinessSettingsController@delete_private_chef')->name('delete');
            });

            // Route::get('mobile-ads/private-chefs', 'BusinessSettingsController@private_chefs')->name('private-chefs');

            //db clean
            Route::get('db-index', 'DatabaseSettingController@db_index')->name('db-index');
            Route::post('db-clean', 'DatabaseSettingController@clean_db')->name('clean-db');

            //environment setup
            // Route::get('environment-setup', 'EnvironmentSettingsController@environment_index')->name('environment-setup');
            // Route::post('update-environment', 'EnvironmentSettingsController@environment_setup')->name('update-environment');
        });



        Route::group(['prefix' => 'message', 'as' => 'message.'], function () {
            Route::get('list', 'ConversationController@list')->name('list');
            Route::post('store/{user_id}', 'ConversationController@store')->name('store');
            Route::get('view/{user_id}', 'ConversationController@view')->name('view');
        });

        Route::group(['prefix' => 'delivery-man', 'as' => 'delivery-man.'], function () {
            Route::get('get-account-data/{deliveryman}', 'DeliveryManController@get_account_data')->name('restaurantfilter');
            Route::group(['middleware' => ['module:deliveryman']], function () {
                Route::get('add', 'DeliveryManController@index')->name('add');
                Route::post('store', 'DeliveryManController@store')->name('store');
                Route::get('list', 'DeliveryManController@list')->name('list');
                Route::get('preview/{id}/{tab?}', 'DeliveryManController@preview')->name('preview');
                Route::get('status/{id}/{status}', 'DeliveryManController@status')->name('status');
                Route::get('earning/{id}/{status}', 'DeliveryManController@earning')->name('earning');
                Route::get('update-application/{id}/{status}', 'DeliveryManController@update_application')->name('application');
                Route::get('edit/{id}', 'DeliveryManController@edit')->name('edit');
                Route::post('update/{id}', 'DeliveryManController@update')->name('update');
                Route::delete('delete/{id}', 'DeliveryManController@delete')->name('delete');
                Route::post('search', 'DeliveryManController@search')->name('search');
                Route::get('get-deliverymen', 'DeliveryManController@get_deliverymen')->name('get-deliverymen');

                Route::group(['prefix' => 'reviews', 'as' => 'reviews.'], function () {
                    Route::get('list', 'DeliveryManController@reviews_list')->name('list');
                    Route::get('status/{id}/{status}', 'DeliveryManController@reviews_status')->name('status');
                });
            });
        });

        //Pos system
        Route::group(['prefix' => 'pos', 'as' => 'pos.'], function () {
            Route::post('variant_price', 'POSController@variant_price')->name('variant_price');
            Route::group(['middleware' => ['module:pos']], function () {
                Route::get('/', 'POSController@index')->name('index');
                Route::get('quick-view', 'POSController@quick_view')->name('quick-view');
                Route::get('quick-view-cart-item', 'POSController@quick_view_card_item')->name('quick-view-cart-item');
                Route::post('add-to-cart', 'POSController@addToCart')->name('add-to-cart');
                Route::post('remove-from-cart', 'POSController@removeFromCart')->name('remove-from-cart');
                Route::post('cart-items', 'POSController@cart_items')->name('cart_items');
                Route::post('update-quantity', 'POSController@updateQuantity')->name('updateQuantity');
                Route::post('empty-cart', 'POSController@emptyCart')->name('emptyCart');
                Route::post('tax', 'POSController@update_tax')->name('tax');
                Route::post('discount', 'POSController@update_discount')->name('discount');
                Route::get('customers', 'POSController@get_customers')->name('customers');
                Route::post('place-order', 'POSController@place_order')->name('order');
                Route::get('orders', 'POSController@order_list')->name('orders');
                Route::post('search', 'POSController@search')->name('search');
                Route::get('order-details/{id}', 'POSController@order_details')->name('order-details');
                Route::get('invoice/{id}', 'POSController@generate_invoice');
                Route::post('customer-store', 'POSController@customer_store')->name('customer-store');
            });
        });
        Route::group(['prefix' => 'reviews', 'as' => 'reviews.', 'middleware' => ['module:customerList']], function () {
            Route::get('list', 'ReviewsController@list')->name('list');
            Route::post('search', 'ReviewsController@search')->name('search');
        });

        Route::group(['prefix' => 'report', 'as' => 'report.', 'middleware' => ['module:report']], function () {
            Route::get('order', 'ReportController@order_index')->name('order');
            Route::get('day-wise-report', 'ReportController@day_wise_report')->name('day-wise-report');
            Route::get('food-wise-report', 'ReportController@food_wise_report')->name('food-wise-report');
            Route::post('food-wise-report-search', 'ReportController@food_search')->name('food-wise-report-search');
            Route::get('order-transactions', 'ReportController@order_transaction')->name('order-transaction');
            Route::get('earning', 'ReportController@earning_index')->name('earning');
            Route::post('set-date', 'ReportController@set_date')->name('set-date');
        });
        
        Route::get('customer/select-list', 'CustomerController@get_customers')->name('customer.select-list');
        Route::group(['prefix' => 'customer', 'as' => 'customer.', 'middleware' => ['module:customerList']], function () {
            Route::group(['middleware' => ['module:customerList']], function () {
                Route::get('list', 'CustomerController@customer_list')->name('list');
                Route::get('view/{user_id}', 'CustomerController@view')->name('view');
                Route::post('search', 'CustomerController@search')->name('search');
                Route::get('status/{customer}/{status}', 'CustomerController@status')->name('status');
            });

            Route::group(['prefix' => 'wallet', 'as' => 'wallet.', 'middleware' => ['module:customer_wallet']], function () {
                Route::get('add-fund', 'CustomerWalletController@add_fund_view')->name('add-fund');
                Route::post('add-fund', 'CustomerWalletController@add_fund');
                Route::get('report', 'CustomerWalletController@report')->name('report');
            });

            // Subscribed customer Routes
            Route::get('subscribed', 'CustomerController@subscribedCustomers')->name('subscribed');
            Route::post('subscriber-search', 'CustomerController@subscriberMailSearch')->name('subscriberMailSearch');

            Route::get('loyalty-point/report', 'LoyaltyPointController@report')->name('loyalty-point.report');
            Route::get('settings', 'CustomerController@settings')->name('settings');
            Route::post('update-settings', 'CustomerController@update_settings')->name('update-settings');
        });



        Route::group(['prefix' => 'file-manager', 'as' => 'file-manager.'], function () {
            Route::get('/download/{file_name}', 'FileManagerController@download')->name('download');
            Route::get('/index/{folder_path?}', 'FileManagerController@index')->name('index');
            Route::post('/image-upload', 'FileManagerController@upload')->name('image-upload');
            Route::delete('/delete/{file_path}', 'FileManagerController@destroy')->name('destroy');
        });

        //social media login
        // Route::group(['prefix' => 'social-login', 'as' => 'social-login.','middleware'=>['module:business_settings']], function () {
        //     Route::get('view', 'BusinessSettingsController@viewSocialLogin')->name('view');
        //     Route::post('update/{service}', 'BusinessSettingsController@updateSocialLogin')->name('update');

        // });
    });

    Route::get('zone/get-coordinates/{id}', 'ZoneController@get_coordinates')->name('zone.get-coordinates');
});

