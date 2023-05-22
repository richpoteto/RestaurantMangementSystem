<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddBiographyToVendorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('vendors', function (Blueprint $table) {
            $table->string('profile', 1000)->nullable();
            $table->string('cooking_philosophy', 1000)->nullable();
            $table->string('school_name', 100)->nullable();
            $table->string('certificate', 100)->nullable();
            $table->string('start_year', 10)->nullable();
            $table->string('end_year', 10)->nullable();

            $table->json('skills')->nullable();
            $table->json('achievements')->nullable();
            $table->string('intro_video', 100)->nullable();
            //
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('vendors', function (Blueprint $table) {
            $table->dropColumn('profile');
            $table->dropColumn('cooking_philosophy');
            $table->dropColumn('school_name');
            $table->dropColumn('certificate');
            $table->dropColumn('start_year');
            $table->dropColumn('end_year');
            $table->dropColumn('skills');
            $table->dropColumn('achievements');
            $table->dropColumn('intro_video');
        });
    }
}