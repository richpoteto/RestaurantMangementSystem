<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('food_id')->nullable();
            $table->foreignId('order_id')->nullable();
            $table->decimal('price')->default(0);
            $table->text('food_details')->nullable();
            $table->string('variation')->nullable();
            $table->string('add_on_ids',255)->nullable();
            $table->string('add_on_qtys')->nullable();
            $table->decimal('discount_on_food')->nullable();
            $table->string('discount_type',20)->default('amount');
            $table->integer('quantity')->default(1);
            $table->decimal('tax_amount')->default(1);
            $table->string('variant',255)->nullable();
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
        Schema::dropIfExists('order_details');
    }
}
