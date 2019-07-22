<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJudicialOfficerPostingPreferencesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('judicial_officer_posting_preferences', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('judicial_officer_id');
            $table->unsignedBigInteger('zone_id');
            // $table->string('notice_no');
            // $table->date('notice_date');
            $table->unsignedBigInteger('created_by');
            $table->timestamps();

            $table->foreign('judicial_officer_id')->references('id')->on('judicial_officers');
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
        Schema::dropIfExists('judicial_officer_posting_preferences');
    }
}
