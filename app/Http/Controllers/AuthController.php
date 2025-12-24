<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|min:6',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json(['user' => $user], 201);
    }

   public function login(Request $request)
{
    $token = $request->input('token');

    if (!$token) {
        return response()->json(['message' => 'Token is required'], 400);
    }

    try {
        // Verify the Firebase ID token (you need kreait/firebase-php installed)
        $verifiedIdToken = \Firebase\Auth\TokenVerifier::create()->verifyIdToken($token);
        $uid = $verifiedIdToken->claims()->get('sub');
        $phone = $verifiedIdToken->claims()->get('phone_number');

        // Find or create user by phone number
        $user = User::where('mobile_number', $phone)->first();

        if (!$user) {
            // Optional: create new user
            $user = User::create([
                'mobile_number' => $phone,
                'name' => 'User ' . substr($phone, -4),
                'email' => $phone . '@means.app', // dummy email
                'password' => Hash::make(Str::random(16)),
            ]);
        }

        // Generate your app token (Sanctum or Passport)
        $appToken = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'user' => $user,
            'token' => $appToken
        ], 200);

    } catch (\Exception $e) {
        return response()->json(['message' => 'Invalid login token'], 401);
    }
}

    // ✅ ADD THIS
    public function checkUser(Request $request)
    {
        return response()->json([
            'exists' => true
        ], 200);
    }
}
