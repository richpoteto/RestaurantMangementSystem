<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeColumnToOrderTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('order_transactions', function (Blueprint $table) {
            $table->decimal('order_amount',$precision = 24, $scale = 2)->change(); 
            $table->decimal('restaurant_amount',$precision = 24, $scale = 2)->change(); 
            $table->decimal('admin_commission',$precision = 24, $scale = 2)->change(); 
            $table->decimal('delivery_charge',$precision = 24, $scale = 2)->change(); 
            $table->decimal('original_delivery_charge',$precision = 24, $scale = 2)->change(); 
            $table->decimal('tax',$precision = 24, $scale = 2)->change(); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('order_transactions', function (Blueprint $table) {
            $table->decimal('order_amount',$precision = 8, $scale = 2)->change(); 
            $table->decimal('restaurant_amount',$precision = 8, $scale = 2)->change(); 
            $table->decimal('admin_commission',$precision = 8, $scale = 2)->change(); 
            $table->decimal('delivery_charge',$precision = 8, $scale = 2)->change(); 
            $table->decimal('original_delivery_charge',$precision = 8, $scale = 2)->change(); 
            $table->decimal('tax',$precision = 8, $scale = 2)->change();
        });
    }
}
