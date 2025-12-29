<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    protected $table = 'users';

    protected $fillable = [
        'name',
        'email',
        'username',
        'password',
        'mobile_number',
        'mobile_verified',
        'is_verified',
        'active',
        'language',
        'notification',
        'meta'
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'mobile_verified' => 'boolean',
        'is_verified' => 'boolean',
        'active' => 'boolean',
        'meta' => 'array',
    ];
}
