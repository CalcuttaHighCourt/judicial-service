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
            $table->bigInteger('judicial_officer_id');
            $table->integer('zone_id');
            $table->date('from_date');
            $table->date('to_date')->nullable();
            $table->timestamps();
            
            $table->unique(['judicial_officer_id','zone_id','from_date']);

            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('zone_id')->references('id')->on('zones');
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
