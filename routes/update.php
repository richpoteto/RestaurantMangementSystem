<?php
use Illuminate\Support\Facades\Route;

Route::get('/', 'UpdateController@update_software_index')->name('index');
Route::post('update-system', 'UpdateController@update_software')->name('update-system');

Route::fallback(function () {
    return redirect('/');
});
