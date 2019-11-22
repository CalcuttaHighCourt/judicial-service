<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('user_id');            
            $table->string('name');
            $table->integer('user_type_id');
            $table->integer('court_id')->nullable()->unique();
            $table->bigInteger('judicial_officer_id')->nullable()->unique();
            $table->string('jo_code')->nullable()->unique();
            $table->integer('department_id')->nullable()->unique();
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
            
            $table->foreign('court_id')->references('id')->on('courts');
            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('user_type_id')->references('id')->on('user_types');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
