<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAcrHistoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('acr_histories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('jo_code');
            $table->bigInteger('judicial_officer_id');
            $table->integer('grade_id');
            $table->integer('year');
            $table->bigInteger('created_by');
            $table->timestamps();

            $table->unique(['judicial_officer_id','year']);

            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('grade_id')->references('id')->on('grade_details');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('acr_histories');
    }
}
