<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJudicialOfficerPostingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('judicial_officer_postings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('judicial_officer_id');
            $table->unsignedBigInteger('designation_id');
            $table->unsignedBigInteger('court_id')->nullable();
            $table->unsignedBigInteger('court_complex_id');
            $table->unsignedBigInteger('mode_id');
            $table->date('from_date');
            $table->date('to_date')->nullable();
            $table->unsignedBigInteger('created_by');
            $table->timestamps();

            $table->unique(['judicial_officer_id', 'designation_id', 
            'court_id', 'court_complex_id', 'mode_id', 'from_date']);

            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('designation_id')->references('id')->on('designations');
            $table->foreign('court_id')->references('id')->on('courts');
            $table->foreign('court_complex_id')->references('id')->on('court_complexes');
            $table->foreign('mode_id')->references('id')->on('modes');
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
        Schema::dropIfExists('judicial_officer_postings');
    }
}
