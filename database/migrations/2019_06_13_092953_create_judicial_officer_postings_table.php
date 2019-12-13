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
            $table->integer('designation_id')->nullable();
            $table->string('deputation_designation')->nullable();
            $table->integer('court_id')->nullable();
            $table->string('deputation_posting_place')->nullable();            
            $table->date('from_date');
            $table->date('to_date')->nullable();
            $table->text('posting_remark')->nullable();
            $table->string('acp_1')->nullable();
            $table->date('acp_1_doc')->nullable();
            $table->string('acp_2')->nullable();
            $table->date('acp_2_doc')->nullable();
            $table->string('dj_se')->nullable();
            $table->date('dj_se_doc')->nullable();
            $table->string('dj_st')->nullable();
            $table->date('dj_st_doc')->nullable();
            $table->integer('created_by');
            $table->timestamps();


            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('rank_id')->references('id')->on('ranks');
            $table->foreign('designation_id')->references('id')->on('designations');
            $table->foreign('court_id')->references('id')->on('courts');            
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
