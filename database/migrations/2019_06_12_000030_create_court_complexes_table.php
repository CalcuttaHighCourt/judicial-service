<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCourtComplexesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('court_complexes', function (Blueprint $table) {
            $table->bigIncrements('id');
			$table->string('court_complex_name')->unique();
			$table->double('latitude');
			$table->double('longitude');
			$table->unsignedBigInteger('district_id');
			$table->unsignedBigInteger('zone_id');
			$table->unsignedBigInteger('created_by');
            $table->timestamps();
			$table->foreign('district_id')->references('id')->on('districts');
			$table->foreign('zone_id')->references('id')->on('zones');
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
        Schema::dropIfExists('court_complexes');
    }
}
