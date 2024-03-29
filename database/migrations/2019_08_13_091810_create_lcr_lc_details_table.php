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
            $table->bigInteger('hc_id');
            $table->string('lower_case_record');
            $table->integer('lower_case_no');
            $table->integer('lower_case_year');
            $table->string('compliance_flag')->nullable();
            $table->bigInteger('created_by')->nullable();
            $table->timestamps();

            $table->foreign('hc_id')->references('id')->on('lcr_hc_ends');
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
