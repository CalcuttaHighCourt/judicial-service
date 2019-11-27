<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUpdateDeleteProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared('create or replace function movedeleted()
            returns trigger as	
            $BODY$
                BEGIN
                    insert into history_deleted_data(table_name,deleted_data,deleted_time)
                    values(TG_TABLE_NAME,row_to_json(OLD),now());
                    return OLD;
                END;
            $BODY$
                LANGUAGE plpgsql VOLATILE
                COST 100;
        
        ');

        DB::unprepared('create or replace function moveupdated()
            returns trigger as	
            $BODY$
                BEGIN
                    insert into history_updated_data(table_name,updated_data,updated_time)
                    values(TG_TABLE_NAME,row_to_json(OLD),now());
                    return OLD;
                END;
            $BODY$
                LANGUAGE plpgsql VOLATILE
                COST 100;
        
        ');

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::unprepared('DROP FUNCTION moveupdated()');
        DB::unprepared('DROP FUNCTION movedeleted()');
    }
}
