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
            $table->unsignedBigInteger('judicial_officer_id');
            $table->unsignedBigInteger('reporting_officer_id');
            $table->unsignedBigInteger('reviewing_officer_id');
            $table->date('from_date');
            $table->date('to_date');
            $table->unsignedBigInteger('created_by');
            $table->timestamps();

            $table->unique('judicial_officer_id', 'reporting_officer_id', 'reviewing_officer_id');
            
            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('reporting_officer_id')->references('id')->on('judicial_officers');
            $table->foreign('reviewing_officer_id')->references('id')->on('judicial_officers');
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
        Schema::dropIfExists('jo_reporting_reviewings');
    }
}
