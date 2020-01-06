<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDesignationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('designations', function (Blueprint $table) {
            $table->increments('id');
            $table->string('designation_name');
            $table->integer('rank_id')->nullable();
            $table->integer('subdivision_id');
			$table->bigInteger('created_by')->nullable();
            $table->timestamps();            
            
            $table->foreign('rank_id')->references('id')->on('ranks');
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
        Schema::dropIfExists('designations');
    }
}
