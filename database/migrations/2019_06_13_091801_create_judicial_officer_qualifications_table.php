<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJudicialOfficerQualificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('judicial_officer_qualifications', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('judicial_officer_id');
            $table->unsignedBigInteger('qualification_id');
            $table->integer('passing_year');
            $table->unsignedBigInteger('created_by');
            $table->timestamps();

            $table->unique('judicial_officer_id', 'qualification_id');
            
            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('qualification_id')->references('id')->on('qualifications');
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
        Schema::dropIfExists('judicial_officer_qualifications');
    }
}
