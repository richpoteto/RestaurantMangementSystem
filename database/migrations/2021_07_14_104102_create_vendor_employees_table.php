<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVendorEmployeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vendor_employees', function (Blueprint $table) {
            $table->id();
            $table->string('f_name',100)->nullable();
            $table->string('l_name',100)->nullable();
            $table->string('phone',20)->nullable();
            $table->string('email',100)->unique();
            $table->string('image',100)->nullable();
            $table->foreignId('employee_role_id');
            $table->foreignId('vendor_id');
            $table->foreignId('restaurant_id');
            $table->string('password',100);
            $table->boolean('status')->default(1);
            $table->rememberToken();
            $table->string('firebase_token')->nullable();
            $table->string('auth_token')->nullable();
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
        Schema::dropIfExists('vendor_employees');
    }
}
