<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLcrStatusChecksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lcr_status_checks', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('hc_id');
            $table->string('remarks');
            $table->string('memo_no');
            $table->date('memo_date');
            $table->timestamps();


            //$table->unique('memo_no','memo_date');
            $table->foreign('hc_id')->references('id')->on('lcr_hc_ends');
            // $table->foreign('memo_no')->references('memo_no')->on('lcr_hc_ends');
            // $table->foreign('memo_date')->references('memo_date')->on('lcr_hc_ends');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lcr_status_checks');
    }
}
