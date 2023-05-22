<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsToDeliveryManWalletsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('delivery_man_wallets', function (Blueprint $table) {
            $table->decimal('total_earning')->default(0);
            $table->decimal('total_withdrawn')->default(0);
            $table->decimal('pending_withdraw')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('delivery_man_wallets', function (Blueprint $table) {
            $table->dropColumn('total_earning');
            $table->dropColumn('total_withdrawn');
            $table->dropColumn('pending_withdraw');
        });
    }
}
