<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeColumnTypeToRestaurantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('restaurants', function (Blueprint $table) {
            $table->decimal('minimum_order',$precision = 24, $scale = 2)->change();
            $table->decimal('comission',$precision = 24, $scale = 2)->change();
            $table->decimal('tax',$precision = 24, $scale = 2)->change();
            $table->decimal('delivery_charge',$precision = 24, $scale = 2)->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('restaurants', function (Blueprint $table) {
            $table->decimal('minimum_order',$precision = 8, $scale = 2)->change();
            $table->decimal('comission',$precision = 8, $scale = 2)->change();
            $table->decimal('tax',$precision = 8, $scale = 2)->change();
            $table->decimal('delivery_charge',$precision = 8, $scale = 2)->change();
        });
    }
}
