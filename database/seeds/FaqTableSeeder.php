<?php

use Illuminate\Database\Seeder;
use Vtlabs\Faq\Models\Faq;

class FaqTableSeeder extends Seeder
{
    public function run()
    {
        factory(Faq::class, 5)->create();
    }
}
