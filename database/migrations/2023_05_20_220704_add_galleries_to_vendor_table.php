<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddGalleriesToVendorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('vendors', function (Blueprint $table) {
            $table->json('food_gallery')->nullable();
            $table->json('dining_gallery')->nullable();
            $table->json('chef_gallery')->nullable();
            $table->json('product_gallery')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('vendors', function (Blueprint $table) {
            $table->dropColumn('food_gallery');
            $table->dropColumn('dining_gallery');
            $table->dropColumn('chef_gallery');
            $table->dropColumn('product_gallery');
        });
    }
}
