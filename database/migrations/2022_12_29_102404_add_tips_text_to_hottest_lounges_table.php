<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTipsTextToHottestLoungesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('hottest_lounges', function (Blueprint $table) {
            $table->string('tips_text', 255)->nullable();//
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('hottest_lounges', function (Blueprint $table) {
            $table->dropColumn('tips_text');//
        });
    }
}
