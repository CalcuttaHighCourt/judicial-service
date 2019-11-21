<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCourtsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('courts', function (Blueprint $table) {
            $table->increments('id');
			$table->string('court_name')->unique();
            $table->integer('subdivision_id');
            $table->double('latitude')->nullable();
			$table->double('longitude')->nullable();
			$table->bigInteger('created_by');
            $table->timestamps();
			$table->foreign('subdivision_id')->references('id')->on('subdivisions');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('courts');
    }
}
