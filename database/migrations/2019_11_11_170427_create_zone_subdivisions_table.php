<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateZoneSubdivisionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('zone_subdivisions', function (Blueprint $table) {                        
            $table->increments('id');
            $table->integer('zone_id');
            $table->integer('subdivision_id');
            $table->bigInteger('created_by');
            $table->timestamps();

            $table->unique(['zone_id','subdivision_id']);

            $table->foreign('zone_id')->references('id')->on('zones');
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
        Schema::dropIfExists('zone_subdivisions');
    }
}
