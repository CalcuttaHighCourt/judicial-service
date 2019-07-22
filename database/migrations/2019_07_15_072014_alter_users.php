<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {

            $table->unsignedBigInteger('court_id')->nullable();
            $table->unsignedBigInteger('district_id')->nullable();
            $table->unsignedBigInteger('zone_id')->nullable();
            $table->unsignedBigInteger('judicial_officer_id')->nullable();

            $table->string('jo_code')->nullable(true);

            $table->foreign('court_id')->references('id')->on('courts');
            $table->foreign('district_id')->references('id')->on('districts');
            $table->foreign('zone_id')->references('id')->on('zones');
            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            //
        });
    }
}
