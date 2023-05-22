<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWalletsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('restaurant_wallets', function (Blueprint $table) {
            $table->id();
            $table->foreignId('vendor_id');
            $table->decimal('total_earning')->default(0);
            $table->decimal('total_withdrawn')->default(0);
            $table->decimal('pending_withdraw')->default(0);
            $table->decimal('collected_cash')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('restaurant_wallets');
    }
}
