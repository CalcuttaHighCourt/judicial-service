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
                        
            $table->bigIncrements('id');
            $table->bigInteger('zone_id');
            $table->bigInteger('subdivision_id');
            $table->unsignedBigInteger('created_by');
            $table->timestamps();

            $table->foreign('zone_id')->references('id')->on('zones');
            $table->foreign('subdivision_id')->references('id')->on('subdivisions');
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
        Schema::dropIfExists('zone_subdivisions');
    }
}
