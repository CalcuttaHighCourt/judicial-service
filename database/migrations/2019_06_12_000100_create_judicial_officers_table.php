<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJudicialOfficersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('judicial_officers', function (Blueprint $table) {
			$table->bigIncrements('id');
			$table->string('jo_code')->unique();			
			$table->string('officer_name');
			$table->string('gender');
			$table->string('guardian_name');
			$table->string('gurdian_relation');			
			$table->date('date_of_birth');
			$table->unsignedBigInteger('home_state_id');
			$table->unsignedBigInteger('home_district_id');
			$table->string('hometown');
			$table->text('present_address');
			$table->text('permanent_address');
			$table->unsignedBigInteger('religion_id')->nullable();	
			$table->unsignedBigInteger('category_id')->nullable();	
			$table->string('blood_group')->nullable();
			$table->string('identification_mark')->nullable();			
			$table->char('aadhaar_no',12)->nullable()->unique();
			$table->char('pan_no',10)->nullable()->unique();
			$table->string('gpf_no')->nullable()->unique();
			$table->string('mobile_no_1')->unique();
			$table->string('mobile_no_2')->nullable()->unique();
			$table->string('mobile_no_3')->nullable()->unique();
			$table->string('email_id_1')->unique();
			$table->string('email_id_2')->nullable()->unique();
			$table->string('email_id_3')->nullable()->unique();
			$table->unsignedBigInteger('recruitment_batch_id');
			$table->date('date_of_joining');
			$table->date('date_of_confirmation');
			$table->date('date_of_retirement');
			$table->unsignedBigInteger('present_reporting_officer_id')->nullable();
            $table->unsignedBigInteger('present_reviewing_officer_id')->nullable();			
			$table->timestamps();
			
			$table->foreign('home_district_id')->references('id')->on('districts');
			$table->foreign('home_state_id')->references('id')->on('states');
			$table->foreign('category_id')->references('id')->on('castes');
			$table->foreign('religion_id')->references('id')->on('religions');
			$table->foreign('recruitment_batch_id')->references('id')->on('recruitment_batches');
			$table->foreign('present_reporting_officer_id')->references('id')->on('judicial_officers');
			$table->foreign('present_reviewing_officer_id')->references('id')->on('judicial_officers');					
			
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
		
        Schema::dropIfExists('judicial_officers');
    }
}
