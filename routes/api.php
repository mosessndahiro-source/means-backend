<?php

use Illuminate\Http\Request;
use App\Http\Controllers\UserFlowController;

Route::post('/check-user', [UserFlowController::class, 'checkUser']);
Route::post('/register', [UserFlowController::class, 'register']);

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