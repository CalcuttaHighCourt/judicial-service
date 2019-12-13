<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJoGradesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jo_grades', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('judicial_officer_id');
            $table->integer('rank_id');
            $table->integer('grade');
            $table->integer('grade_year');
            
            $table->timestamps();

            $table->unique(['judicial_officer_id', 'rank_id','grade','grade_year']);

            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
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
        Schema::dropIfExists('jo_grades');
    }
}
