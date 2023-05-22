<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDeliveryMenTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('delivery_men', function (Blueprint $table) {
            $table->id();
            $table->string('f_name',100)->nullable();
            $table->string('l_name',100)->nullable();
            $table->string('phone',20)->unique();
            $table->string('email',100)->nullable();
            $table->string('identity_number',30)->nullable();
            $table->string('identity_type',50)->nullable();
            $table->string('identity_image')->nullable();
            $table->string('image',100)->nullable();
            $table->string('password',100);
            $table->string('auth_token')->nullable();
            $table->string('fcm_token')->nullable();
            $table->bigInteger('zone_id')->default(1);
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
        Schema::dropIfExists('delivery_men');
    }
}
