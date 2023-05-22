<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeColumnToDiscountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('discounts', function (Blueprint $table) {
            $table->decimal('min_purchase',$precision = 24, $scale = 2)->change();
            $table->decimal('max_discount',$precision = 24, $scale = 2)->change();
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
        Schema::table('discounts', function (Blueprint $table) {
            $table->decimal('min_purchase',$precision = 8, $scale = 2)->change();
            $table->decimal('max_discount',$precision = 8, $scale = 2)->change();
            $table->decimal('discount',$precision = 8, $scale = 2)->change();
        });
    }
}
