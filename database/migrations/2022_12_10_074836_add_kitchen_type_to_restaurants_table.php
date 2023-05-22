<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddKitchenTypeToRestaurantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('restaurants', function (Blueprint $table) {
            $table->string('kitchen_type')->length(50)->nullable();
            $table->integer('cuisine_id_2');
            $table->integer('cuisine_id_3');
            $table->integer('cuisine_id_4');//
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
            $table->dropColumn('kitchen_type');
            $table->dropColumn('cuisine_id_2');
            $table->dropColumn('cuisine_id_3');
            $table->dropColumn('cuisine_id_4');//
        });
    }
}
