<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJoReportingReviewingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jo_reporting_reviewings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('judicial_officer_id');
            $table->bigInteger('reporting_officer_id')->nullable();
            $table->date('from_date');
            $table->date('to_date')->nullable();
            $table->timestamps();

            $table->unique(['judicial_officer_id', 'reporting_officer_id']);
            
            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('reporting_officer_id')->references('id')->on('judicial_officers');
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
