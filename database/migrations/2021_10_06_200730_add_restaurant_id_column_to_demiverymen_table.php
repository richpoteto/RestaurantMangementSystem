<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddRestaurantIdColumnToDemiverymenTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('delivery_men', function (Blueprint $table) {
            $table->string('type')->default('zone_wise');
            $table->bigInteger('restaurant_id')->nullable();
            $table->bigInteger('zone_id')->nullable()->default(null)->change();
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('delivery_men', function (Blueprint $table) {
            $table->bigInteger('zone_id')->default(1)->change();
            $table->dropColumn('type');
            $table->dropColumn('restaurant_id');
        });
    }
}
