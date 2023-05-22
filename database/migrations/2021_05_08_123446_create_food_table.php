<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFoodTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('food', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->text('description')->nullable();
            $table->string('image',30)->nullable();
            $table->foreignId('category_id')->nullable();
            $table->string('category_ids',255)->nullable();
            $table->text('variations')->nullable();
            $table->string('add_ons')->nullable();
            $table->string('attributes',255)->nullable();
            $table->text('choice_options')->nullable();
            $table->decimal('price')->default(0);
            $table->decimal('tax')->default(0);
            $table->string('tax_type',20)->default('percent');
            $table->decimal('discount')->default(0);
            $table->string('discount_type',20)->default('percent');
            $table->time('available_time_starts')->nullable();
            $table->time('available_time_ends')->nullable();
            $table->boolean('set_menu')->default(0);
            $table->boolean('status')->default(1);
            $table->foreignId('restaurant_id');
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
        Schema::dropIfExists('food');
    }
}
