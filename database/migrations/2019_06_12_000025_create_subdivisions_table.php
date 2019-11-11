<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSubdivisionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subdivisions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('subdivision_name');
			$table->unsignedBigInteger('district_id');
			$table->unsignedBigInteger('created_by');
			$table->timestamps();
            
            $table->unique(['subdivision_name','district_id']);
			$table->foreign('district_id')->references('id')->on('districts');
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
        Schema::dropIfExists('subdivisions');
    }
}
