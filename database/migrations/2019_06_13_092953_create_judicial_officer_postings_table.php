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
            $table->bigInteger('judicial_officer_id');
            $table->integer('mode_id');
            $table->integer('rank_id');
            $table->integer('zone_id');
            $table->integer('designation_id')->nullable();
            $table->string('deputation_designation')->nullable();
            $table->string('additional_designation')->nullable();
            $table->string('deputation_posting_place')->nullable();            
            $table->date('from_date');
            $table->date('to_date')->nullable();
            $table->text('posting_remark')->nullable();            
            $table->timestamps();


            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('rank_id')->references('id')->on('ranks');
            $table->foreign('zone_id')->references('id')->on('zones');
            $table->foreign('designation_id')->references('id')->on('courts');
            $table->foreign('mode_id')->references('id')->on('modes');
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
