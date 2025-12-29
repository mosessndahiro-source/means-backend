<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserFlowController extends Controller
{
    /**
     * Step 1: Check if user exists by mobile number
     */
   public function register(Request $request)
{
    $request->validate([
        'name' => 'required|string',
        'mobile_number' => 'required|unique:users,mobile_number',
        'email' => 'nullable|email'
    ]);

    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'mobile_number' => $request->mobile_number,
        'password' => Hash::make(Str::random(10)),
        'mobile_verified' => 0,
        'is_verified' => 0,
        'active' => 1,
        'language' => 'en'
    ]);

    return response()->json([
        'user' => $user,
        'registered' => true
    ], 201);
}



    /**
     * Step 2: Register user (NO PASSWORD REQUIRED)
     */
   public function register(Request $request)
{
    $request->validate([
        'name' => 'required|string',
        'email' => 'required|email',
        'mobile_number' => 'required'
    ]);

    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'mobile_number' => $request->mobile_number,
        'password' => Hash::make($request->password ?? 'otp-user'),
        'mobile_verified' => 0,
        'is_verified' => 0,
        'active' => 1,
        'language' => 'en'
    ]);

    return response()->json([
        'user' => $user
    ], 201);
}

}
