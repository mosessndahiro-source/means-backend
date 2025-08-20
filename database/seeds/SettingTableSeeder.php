<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SettingTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('settings')->insert([
            // currency and taxes
            ["key" => "currency_code", "value" => "USD"],
            ["key" => "currency_icon", "value" => "$"],
            
            // contact information
            ["key" => "support_email", "value" => "admin@example.com"],
            ["key" => "support_phone", "value" => "8181818118"],

            // config
            ["key" => "admin_fee_for_order_in_percent", "value" => "10"],
            ["key" => "tax_in_percent", "value" => "10"],
            ["key" => "minutes_delta", "value" => "30"],
            ["key" => "distance_limit", "value" => "8000"],

            // meta
            ["key" => "privacy_policy", "value" => "Demo privacy policy"],
            ["key" => "about_us", "value" => "Demo privacy policy"],
            ["key" => "terms", "value" => "Demo Terms and Condition"],
        ]);
    }
}
