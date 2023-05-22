<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddUserNameToCreditcardsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('creditcards', function (Blueprint $table) {
            $table->string('f_name',100)->nullable();
            $table->string('l_name',100)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('creditcards', function (Blueprint $table) {
            $table->dropColumn('f_name');
            $table->dropColumn('l_name');//
        });
    }
}
