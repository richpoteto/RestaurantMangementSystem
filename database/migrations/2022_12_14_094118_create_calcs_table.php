<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCalcsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('calcs', function (Blueprint $table) {
            $table->id();
            $table->integer('new_venue_days_calc')->length(10)->default(90);
            $table->integer('nearby_distance_max_calc')->length(10)->default(1);
            $table->integer('trending_threshhold_value')->length(10)->default(0);
            $table->integer('average_system_order')->length(10)->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('calcs');
    }
}
