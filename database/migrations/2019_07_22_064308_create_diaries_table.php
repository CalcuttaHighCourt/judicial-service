<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDiariesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('diaries', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('judicial_officer_id');
            $table->date('date_of_schedule');
            $table->text('description');
            $table->timestamps();

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
        Schema::dropIfExists('diaries');
    }
}
