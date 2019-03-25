<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/docrawl_amano','crawlController@docrawl_amano');
Route::get('/docrawl_bar61','crawlController@docrawl_bar61');
Route::get('/docrawl_babur','crawlController@docrawl_babur');
