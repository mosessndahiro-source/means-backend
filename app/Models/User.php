<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $table = 'users';

    protected $fillable = [
        'name',
        'email',
        'mobile_number',
        'password',
        'mobile_verified',
        'is_verified',
        'active',
        'language'
    ];
}
