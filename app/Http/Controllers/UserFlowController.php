<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserFlowController extends Controller
{
    public function checkUser(Request $request)
    {
        return response()->json([
            'exists' => false
        ], 200);
    }

    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'mobile_number' => 'required'
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'mobile_number' => $request->mobile_number,
            'password' => Hash::make($request->password ?? 'otp-user'),
        ]);

        return response()->json([
            'user' => $user
        ], 201);
    }
}
