<?php

use Illuminate\Database\Seeder;
use Vtlabs\Media\Models\Media;

class MediaTableSeeder extends Seeder
{
    public function run()
    {
        factory(Media::class, 10)->create();
    }
}
