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
        $request->validate([
            'mobile_number' => 'required'
        ]);

        $user = User::where('mobile_number', $request->mobile_number)->first();

        return response()->json([
            'exists' => $user ? true : false,
            'user' => $user
        ], 200);
    }

    /**
     * Step 2: Register user (NO PASSWORD REQUIRED)
     */
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users',
            'mobile_number' => 'required|unique:users',
            'role' => 'required'
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'mobile_number' => $request->mobile_number,
            'role' => $request->role,
            'image_url' => $request->image_url ?? null,

            // password is system-generated (OTP-based auth)
            'password' => Hash::make('otp-user'),
        ]);

        return response()->json([
            'success' => true,
            'user' => $user
        ], 201);
    }
}
