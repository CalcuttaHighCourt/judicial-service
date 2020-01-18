<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJoCareerProgressionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jo_career_progressions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('judicial_officer_id');
            $table->integer('rank_id');
            $table->integer('progression_stage_id');
            $table->date('date_of_confirmation');
            $table->timestamps();

            $table->unique(['rank_id','progression_stage_id']);

            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('rank_id')->references('id')->on('ranks');
            $table->foreign('progression_stage_id')->references('id')->on('career_progression_stages');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jo_career_progressions');
    }
}
