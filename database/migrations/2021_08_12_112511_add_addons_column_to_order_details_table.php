<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAddonsColumnToOrderDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('order_details', function (Blueprint $table) {
            $table->decimal('total_add_on_price')->default(0.00);
            $table->renameColumn('add_on_ids', 'add_ons');
            $table->dropColumn('add_on_qtys');
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
            $table->string('add_on_qtys')->nullable();
            $table->renameColumn('add_ons', 'add_on_ids');
            $table->dropColumn('total_add_on_price');
        });
    }
}
