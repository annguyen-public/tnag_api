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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// get list of tasks
Route::get('recipes','RecipeController@index');
Route::get('single_recipe/{id}','RecipeController@show');
Route::get('newest_recipes/{offset}','RecipeController@newest_recipes');