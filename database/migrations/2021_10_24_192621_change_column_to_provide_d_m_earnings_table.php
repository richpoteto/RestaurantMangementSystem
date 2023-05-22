<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeColumnToProvideDMEarningsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('provide_d_m_earnings', function (Blueprint $table) {
            $table->decimal('amount',$precision = 24, $scale = 2)->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('provide_d_m_earnings', function (Blueprint $table) {
            $table->decimal('amount',$precision = 8, $scale = 2)->change();
        });
    }
}
