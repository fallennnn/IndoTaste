<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Auth\RequestGuard;

class AuthController extends Controller
{
    //Register user
    public function register(Request $request)
    {
        //validate fields
        $attrs = $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6|confirmed'
        ]);

        //create user
        $users = User::create([
            'name' => $attrs['name'],
            'email' => $attrs['email'],
            'password' => bcrypt($attrs['password'])
        ]);

        return response([
            'user' => $users,
            'token' => $users->createToken('secret')->plainTextToken
        ]);
    }

    //Login user
    public function login(Request $request)
    {
        //validate fields
        $attrs = $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:6'
        ]);

        //attempt login
        if(!Auth::attempt($attrs))
        {
            return response([
                'message' => 'invalid credentials'
            ], 403);
        }

        //return user & token in response
        return response([
            'user'=>auth()->user(),
            'token'=>auth()->user()->createToken('secret')->plainTextToken
        ], 200);
    }

    public function logout()
    {
        auth()->user()->tokens->each->delete();
        return response([
            'message' => 'Logout success.'
        ], 200);
    }

    //get user details
    public function user()
    {
        return response([
            'user' => auth() -> user()
        ], 200);
    }
}
