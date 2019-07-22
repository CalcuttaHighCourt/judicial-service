<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterJudicialOfficers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('judicial_officers', function (Blueprint $table) {
            $table->unsignedBigInteger('photo_id')->nullable();

            $table->foreign('photo_id')->references('id')->on('jo_photos');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('judicial_officers', function (Blueprint $table) {
            //
        });
    }
}
