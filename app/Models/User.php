<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    protected $table = 'users';

    protected $fillable = [
        'name',
        'email',
        'password',
        'mobile_number',
        'mobile_verified',
        'is_verified',
        'active',
        'language'
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];
}
