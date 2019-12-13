<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJoReportingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jo_reportings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('judicial_officer_id');
            $table->bigInteger('posting_id');
            $table->bigInteger('reporting_officer_id')->nullable();
            $table->char('other_reporting_officer_name')->nullable();
            $table->char('other_reporting_officer_designation')->nullable();            
            $table->timestamps();

            $table->unique(['judicial_officer_id', 'posting_id']);
            
            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('reporting_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('posting_id')->references('id')->on('judicial_officer_postings');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jo_reporting_reviewings');
    }
}
