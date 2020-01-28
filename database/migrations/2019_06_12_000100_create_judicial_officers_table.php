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
			$table->bigInteger('spouse')->nullable()->unique();			
			$table->date('date_of_birth');
			$table->integer('home_state_id');
			$table->integer('home_district_id')->nullable();
			$table->string('other_home_district')->nullable();
			$table->string('hometown')->nullable();
			$table->string('additional_hometown')->nullable();
			$table->text('present_address');
			$table->text('permanent_address');						
			$table->string('mobile_no_1')->nullable()->unique();
			$table->string('mobile_no_2')->nullable()->unique();
			$table->string('email_id_1')->nullable()->unique();
			$table->string('email_id_2')->nullable()->unique();
			$table->integer('recruitment_batch_id');			
			$table->integer('recruitment_batch_year')->nullable();
			$table->date('date_of_joining');
			$table->date('date_of_confirmation')->nullable();
			$table->date('date_of_retirement');
			$table->string('posting_preference_window_flag')->nullable();
			$table->date('posting_preference_window_open_on')->nullable();			
			$table->string('profile_image')->nullable();
			$table->timestamps();
			
			$table->foreign('home_district_id')->references('id')->on('districts');
			$table->foreign('home_state_id')->references('id')->on('states');						
			$table->foreign('recruitment_batch_id')->references('id')->on('recruitment_batches');
			$table->foreign('spouse')->references('id')->on('judicial_officers');
			
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
