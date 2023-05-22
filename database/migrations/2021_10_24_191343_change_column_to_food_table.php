<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeColumnToFoodTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('food', function (Blueprint $table) {
            $table->decimal('price',$precision = 24, $scale = 2)->change();
            $table->decimal('tax',$precision = 24, $scale = 2)->change();
            $table->decimal('discount',$precision = 24, $scale = 2)->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('food', function (Blueprint $table) {
            $table->decimal('price',$precision = 8, $scale = 2)->change();
            $table->decimal('tax',$precision = 8, $scale = 2)->change();
            $table->decimal('discount',$precision = 8, $scale = 2)->change();            
        });
    }
}
