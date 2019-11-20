<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLcrLcDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lcr_lc_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('hc_id');
            $table->string('lower_case_record');
            $table->integer('lower_case_no');
            $table->integer('lower_case_year');
            $table->string('status_flag');
            $table->unsignedBigInteger('created_by');
            $table->timestamps();

            $table->foreign('hc_id')->references('id')->on('lcr_hc_ends');
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
        Schema::dropIfExists('lcr_lc_details');
    }
}
