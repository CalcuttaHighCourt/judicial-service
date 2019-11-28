<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUpdateDeleteTrigger extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared('CREATE TRIGGER movedeleted
        BEFORE DELETE
        ON judicial_officers
        FOR EACH ROW
        EXECUTE PROCEDURE movedeleted();');

        DB::unprepared('CREATE TRIGGER moveupdated
        BEFORE UPDATE
        ON judicial_officers
        FOR EACH ROW
        EXECUTE PROCEDURE moveupdated();');

        DB::unprepared('CREATE TRIGGER movedeleted
        BEFORE DELETE
        ON judicial_officer_qualifications
        FOR EACH ROW
        EXECUTE PROCEDURE movedeleted();');

        DB::unprepared('CREATE TRIGGER moveupdated
        BEFORE UPDATE
        ON judicial_officer_qualifications
        FOR EACH ROW
        EXECUTE PROCEDURE moveupdated();');

        DB::unprepared('CREATE TRIGGER movedeleted
        BEFORE DELETE
        ON judicial_officer_postings
        FOR EACH ROW
        EXECUTE PROCEDURE movedeleted();');

        DB::unprepared('CREATE TRIGGER moveupdated
        BEFORE UPDATE
        ON judicial_officer_postings
        FOR EACH ROW
        EXECUTE PROCEDURE moveupdated();');

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::unprepared('DROP TRIGGER moveupdated ON judicial_officers');
        DB::unprepared('DROP TRIGGER movedeleted ON judicial_officers');
        
        DB::unprepared('DROP TRIGGER moveupdated ON judicial_officer_qualifications');
        DB::unprepared('DROP TRIGGER movedeleted ON judicial_officer_qualifications');
        
        DB::unprepared('DROP TRIGGER moveupdated ON judicial_officer_postings');
        DB::unprepared('DROP TRIGGER movedeleted ON judicial_officer_postings');
    }
}
