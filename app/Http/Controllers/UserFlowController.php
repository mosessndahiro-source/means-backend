<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserFlowController extends Controller
{
    /**
     * Step 1: Check if user exists by mobile number
     */
   public function checkUser(Request $request)
{
    if (!$request->mobile_number) {
        return response()->json(['exists' => false], 200);
    }

    $exists = User::where('mobile_number', $request->mobile_number)->exists();

    return response()->json([
        'exists' => $exists
    ], 200);
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
