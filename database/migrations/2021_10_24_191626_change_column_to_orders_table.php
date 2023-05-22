<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeColumnToOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->decimal('order_amount',$precision = 24, $scale = 2)->change(); 
            $table->decimal('coupon_discount_amount',$precision = 24, $scale = 2)->change(); 
            $table->decimal('total_tax_amount',$precision = 24, $scale = 2)->change(); 
            $table->decimal('delivery_charge',$precision = 24, $scale = 2)->change(); 
            $table->decimal('restaurant_discount_amount',$precision = 24, $scale = 2)->change(); 
            $table->decimal('original_delivery_charge',$precision = 24, $scale = 2)->change(); 
            $table->decimal('adjusment',$precision = 24, $scale = 2)->change(); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->decimal('order_amount',$precision = 8, $scale = 2)->change(); 
            $table->decimal('coupon_discount_amount',$precision = 8, $scale = 2)->change(); 
            $table->decimal('total_tax_amount',$precision = 8, $scale = 2)->change(); 
            $table->decimal('delivery_charge',$precision = 8, $scale = 2)->change(); 
            $table->decimal('restaurant_discount_amount',$precision = 8, $scale = 2)->change(); 
            $table->decimal('original_delivery_charge',$precision = 8, $scale = 2)->change(); 
            $table->decimal('adjusment',$precision = 8, $scale = 2)->change(); 
        });
    }
}
