<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeColumnToAdminWalletsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('admin_wallets', function (Blueprint $table) {
            $table->decimal('total_commission_earning',$precision = 24, $scale = 2)->change();
            $table->decimal('digital_received',$precision = 24, $scale = 2)->change();
            $table->decimal('manual_received',$precision = 24, $scale = 2)->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('admin_wallets', function (Blueprint $table) {
            $table->decimal('total_commission_earning',$precision = 8, $scale = 2)->change();
            $table->decimal('digital_received',$precision = 8, $scale = 2)->change();
            $table->decimal('manual_received',$precision = 8, $scale = 2)->change();
        });
    }
}
