<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLcrHcEndsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lcr_hc_ends', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('district');
			$table->integer('subdivision');
			$table->integer('court');
            $table->string('hc_case_record');
			$table->integer('hc_case_no');
			$table->integer('hc_case_year');
			$table->date('deadline');
            $table->bigInteger('created_by');
            $table->timestamps();
			
			$table->foreign('court')->references('id')->on('courts');
            $table->foreign('subdivision')->references('id')->on('subdivisions');
            $table->foreign('district')->references('id')->on('districts');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lcr_hc_ends');
    }
}
