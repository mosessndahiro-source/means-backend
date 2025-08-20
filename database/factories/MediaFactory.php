<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use Faker\Generator as Faker;
use Vtlabs\Category\Models\Category;
use Vtlabs\Media\Models\Author;
use Vtlabs\Media\Models\Media;
use Vtlabs\Media\Models\MediaContent;
use Vtlabs\Media\Models\MediaEpisode;

$factory->define(Media::class, function (Faker $faker) {
    return [
        'title' => ['en' => $faker->text(200)],
        'length' => $faker->numberBetween(20, 200),
        'status' => Media::STATUS_PUBLISHED,
    ];
});

$factory->afterCreating(Media::class, function ($media, $faker) {

    // create media content
    $videoUrl = [
        'https://opuslab.works/misc/1.mp4',
        'https://opuslab.works/misc/2.mp4',
        'https://opuslab.works/misc/3.mp4'
    ];

    $media->content()->saveMany([
        new MediaContent([
            'original_source' => $videoUrl[array_rand($videoUrl)],
            'source' => []
        ])
    ]);

    // create media preview images
    $imageUrls = ['https://verbosetechlabs.com/images/clipx/banner1.png', 'https://verbosetechlabs.com/images/clipx/banner2.png', 'https://verbosetechlabs.com/images/clipx/banner3.png'];
    $media->addMediaFromUrl($imageUrls[array_rand($imageUrls)])->toMediaCollection("images");
});
