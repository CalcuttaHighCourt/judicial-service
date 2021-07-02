<?php

use Illuminate\Http\Request;

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


Route::post('login', 'PassportController@login');
//Route::post('register', 'PassportController@register');

Route::middleware('auth:api')->group(function () {
    //For Admin :: START

    // Designation Master
    Route::resource('designations', 'DesignationController')->except(['create', 'edit']);

    // Add JO Profile
    Route::resource('jo_entry', 'JoEntryFormController')->except(['create', 'edit']);


    //For Admin :: END
});
