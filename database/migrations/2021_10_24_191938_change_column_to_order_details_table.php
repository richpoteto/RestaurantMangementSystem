<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeColumnToOrderDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('order_details', function (Blueprint $table) {
            $table->decimal('price',$precision = 24, $scale = 2)->change(); 
            $table->decimal('discount_on_food',$precision = 24, $scale = 2)->change(); 
            $table->decimal('tax_amount',$precision = 24, $scale = 2)->change(); 
            $table->decimal('total_add_on_price',$precision = 24, $scale = 2)->change(); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('order_details', function (Blueprint $table) {
            $table->decimal('price',$precision = 8, $scale = 2)->change(); 
            $table->decimal('discount_on_food',$precision = 8, $scale = 2)->change(); 
            $table->decimal('tax_amount',$precision = 8, $scale = 2)->change(); 
            $table->decimal('total_add_on_price',$precision = 8, $scale = 2)->change(); 
        });
    }
}
