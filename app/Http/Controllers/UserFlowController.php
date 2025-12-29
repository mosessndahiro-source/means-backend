<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Str;
use Kreait\Firebase\Factory;

class UserFlowController extends Controller
{
    /**
     * Step 1: Check if user exists
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
            'mobile_number' => 'required|unique:users,mobile_number'
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'mobile_number' => $request->mobile_number,
            'password' => Hash::make('otp-user'),
            'mobile_verified' => 0,
            'is_verified' => 0,
            'active' => 1,
            'language' => 'en'
        ]);

        return response()->json([
            'user' => $user
        ], 201);
    }
public function login(Request $request)
{
    $request->validate([
        'token' => 'required|string'
    ]);

    try {
        $factory = (new Factory)
            ->withServiceAccount(storage_path('firebase/firebase.json'));

        $auth = $factory->createAuth();
        $verifiedIdToken = $auth->verifyIdToken($request->token);

        $phone = $verifiedIdToken->claims()->get('phone_number');

        if (!$phone) {
            return response()->json(['message' => 'Phone number missing'], 400);
        }

        $user = User::where('mobile_number', $phone)->first();

        if (!$user) {
            return response()->json([
                'message' => 'User not registered'
            ], 404);
        }

        return response()->json([
            'user' => $user
        ], 200);

    } catch (\Exception $e) {
        return response()->json([
            'message' => 'Invalid Firebase token'
        ], 401);
    }
}
}
