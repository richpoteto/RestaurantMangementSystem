<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHottestLoungesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hottest_lounges', function (Blueprint $table) {
            $table->id();
            $table->string('title',100)->nullable();
            $table->string('lounge_name',100)->nullable();
            $table->string('lounge_image',100)->nullable();
            $table->string('description',255)->nullable();
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
        Schema::dropIfExists('hottest_lounges');
    }
}
