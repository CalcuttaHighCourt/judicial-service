<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRecruitmentBatchesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recruitment_batches', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('recruitment_batch_desc')->unique();
			$table->integer('batch_year');
            $table->unsignedBigInteger('created_by');
            $table->timestamps();
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
        Schema::dropIfExists('recruitment_batches');
    }
}
