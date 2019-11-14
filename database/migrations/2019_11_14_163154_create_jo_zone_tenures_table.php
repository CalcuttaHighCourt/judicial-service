<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJoZoneTenuresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jo_zone_tenures', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('judicial_officer_id');
            $table->unsignedBigInteger('zone_id');
            $table->date('from_date');
            $table->date('to_date')->nullable();
            $table->unsignedBigInteger('created_by');
            $table->timestamps();

            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('zone_id')->references('id')->on('zones');
            $table->foreign('created_by')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jo_zone_tenures');
    }
}
