<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCareerProgressionStagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('career_progression_stages', function (Blueprint $table) {
            $table->increments('id');
            $table->string('stage_name');
            $table->integer('rank_id');
            $table->timestamps();

            $table->unique(['stage_name','rank_id']);
            $table->foreign('rank_id')->references('id')->on('ranks');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('career_progression_stages');
    }
}
