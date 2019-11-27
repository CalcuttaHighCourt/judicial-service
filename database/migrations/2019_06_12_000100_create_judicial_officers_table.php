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
			$table->string('registration_no')->unique();
			$table->string('jo_code')->nullable()->unique();			
			$table->string('officer_name');
			$table->string('gender');
			$table->string('guardian_name');
			$table->string('gurdian_relation');			
			$table->date('date_of_birth');
			$table->integer('home_state_id');
			$table->integer('home_district_id');
			$table->string('hometown')->nullable();
			$table->text('present_address');
			$table->text('permanent_address');
			$table->integer('religion_id')->nullable();	
			$table->integer('category_id')->nullable();	
			$table->string('blood_group')->nullable();
			$table->string('identification_mark')->nullable();			
			$table->char('aadhaar_no',12)->nullable()->unique();
			$table->char('pan_no',10)->nullable()->unique();
			$table->string('gpf_no')->nullable()->unique();
			$table->string('mobile_no_1')->unique();
			$table->string('mobile_no_2')->nullable()->unique();
			$table->string('email_id_1')->unique();
			$table->string('email_id_2')->nullable()->unique();
			$table->integer('recruitment_batch_id');
			$table->date('date_of_joining');
			$table->date('date_of_confirmation');
			$table->date('date_of_retirement');
			$table->timestamps();
			
			$table->foreign('home_district_id')->references('id')->on('districts');
			$table->foreign('home_state_id')->references('id')->on('states');
			$table->foreign('category_id')->references('id')->on('categories');
			$table->foreign('religion_id')->references('id')->on('religions');
			$table->foreign('recruitment_batch_id')->references('id')->on('recruitment_batches');					
			
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
