<?php

use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'Api\V2'], function () {
    Route::post('ls-lib-update', 'LsLibController@lib_update');
});
