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
			$table->string('officer_name');
			$table->string('guardian_name');
			$table->string('gurdian_relation');
			$table->string('jo_code')->unique();
			$table->date('date_of_birth');
			$table->date('date_of_joining');
			$table->date('date_of_confirmation');
			$table->date('date_of_retirement');
			$table->text('present_address');
			$table->text('permanent_address');
			$table->string('hometown');
			$table->unsignedBigInteger('home_district_id');
			$table->unsignedBigInteger('home_state_id');
			
			$table->unsignedBigInteger('caste_id');
			$table->unsignedBigInteger('religion_id');
			$table->unsignedBigInteger('recruitment_batch_id');
			
			$table->char('aadhaar_no',12)->nullable();
			$table->char('pan_no',10)->nullable();
			$table->string('pf_no')->nullable();
			
			$table->string('blood_group')->nullable();
			$table->string('identification_marks_1')->nullable();
			$table->string('identification_marks_2')->nullable();
			
			$table->string('mobile_no_1');
			$table->string('mobile_no_2')->nullable();
			$table->string('mobile_no_3')->nullable();
			
			$table->string('email_id_1');
			$table->string('email_id_2')->nullable();
			$table->string('email_id_3')->nullable();	

			$table->unsignedBigInteger('reporting_officer_id');
            $table->unsignedBigInteger('reviewing_officer_id');
			
            $table->timestamps();
			$table->foreign('home_district_id')->references('id')->on('districts');
			$table->foreign('home_state_id')->references('id')->on('states');
			$table->foreign('caste_id')->references('id')->on('castes');
			$table->foreign('religion_id')->references('id')->on('religions');
			$table->foreign('recruitment_batch_id')->references('id')->on('recruitment_batches');
			$table->foreign('reporting_officer_id')->references('id')->on('judicial_officers');
			$table->foreign('reviewing_officer_id')->references('id')->on('judicial_officers');					
			
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
