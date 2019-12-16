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
            $table->date('date_of_gradation');
            
            $table->timestamps();

            $table->unique(['judicial_officer_id', 'rank_id','grade','date_of_gradation']);

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
