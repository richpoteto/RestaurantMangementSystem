<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddOtpToOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('otp')->nullable();
            $table->timestamp('pending')->nullable();
            $table->timestamp('accepted')->nullable();
            $table->timestamp('confirmed')->nullable();
            $table->timestamp('processing')->nullable();
            $table->timestamp('handover')->nullable();
            $table->timestamp('picked_up')->nullable();
            $table->timestamp('delivered')->nullable();
            $table->timestamp('canceled')->nullable();
            $table->timestamp('refund_requested')->nullable();
            $table->timestamp('refunded')->nullable();
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
            $table->dropColumn('otp');
            $table->dropColumn('pending')->nullable();
            $table->dropColumn('accepted')->nullable();
            $table->dropColumn('confirmed')->nullable();
            $table->dropColumn('processing')->nullable();
            $table->dropColumn('handover')->nullable();
            $table->dropColumn('picked_up')->nullable();
            $table->dropColumn('delivered')->nullable();
            $table->dropColumn('canceled')->nullable();
            $table->dropColumn('refund_requested')->nullable();
            $table->dropColumn('refunded')->nullable();
        });
    }
}
