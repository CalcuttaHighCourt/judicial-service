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
            $table->unsignedBigInteger('judicial_officer_id');
            $table->unsignedBigInteger('grade_id');
            $table->integer('year');
            $table->unsignedBigInteger('created_by');
            $table->timestamps();

            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('grade_id')->references('id')->on('grade_details');
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
        Schema::dropIfExists('acr_histories');
    }
}
