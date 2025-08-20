<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use Faker\Generator as Faker;
use Vtlabs\Faq\Models\Faq;

$factory->define(Faq::class, function (Faker $faker) {
    return [
        'title' => $faker->words(2, true),
        'short_description' => $faker->text(50),
        'description' => $faker->text(200),
    ];
});
