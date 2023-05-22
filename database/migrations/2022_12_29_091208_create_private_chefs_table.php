<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePrivateChefsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('private_chefs', function (Blueprint $table) {
            $table->id();
            $table->string('title',100)->nullable();
            $table->string('header_text',100)->nullable();
            $table->string('chef_image',100)->nullable();
            $table->string('description',255)->nullable();
            $table->string('bottom_text',100)->nullable();
            $table->string('button',100)->nullable();
            $table->boolean('status')->default(1);   
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
        Schema::dropIfExists('private_chefs');
    }
}
