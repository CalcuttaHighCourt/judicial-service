<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

use App\JudicialOfficerPosting;
use App\JudicialOfficer;
use App\Zone;
use App\Subdivision;
use DB;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function search_for_zone_of_consideration($zone,$cadre,$year,$month,$day,$date_upto){        

        $tenure_in_days = ($year*365) + ($month*30) + $day;

        // fetching all the judicial officers presently posted in selected zone
        $officer_query = "select judicial_officer_id from judicial_officer_postings 
                        inner join judicial_officers on judicial_officer_postings.judicial_officer_id = judicial_officers.id
                        where to_date is null and zone_id = $zone and rank_id = $cadre and date_of_retirement > '".$date_upto."'";

        $officers = DB::select($officer_query);        
        
        // checking last continous service period for each officers in present zone
        $valid_officers = Array();
        foreach($officers as $key=>$officer){
            
            $jo_posting_history_query = 'select judicial_officer_postings.id as id, designation_name, zone_id, deputation_designation,
                                        place_of_posting, deputation_posting_place, from_date, to_char(from_date,\'dd-mm-yyyy\') as modified_from_date, coalesce(to_char(to_date,\'dd-mm-yyyy\'),\'Till Date\') as to_date
                                        from judicial_officer_postings left join designations on judicial_officer_postings.designation_id = designations.id 
                                        where judicial_officer_postings.judicial_officer_id ='.$officer->judicial_officer_id.' 
                                        order by from_date desc';
        
            $jo_posting_history = DB::select($jo_posting_history_query);
            
            $current_zone = $jo_posting_history['0']->zone_id;
            $posting_id = "";
            $str_posting_history = "";
            foreach($jo_posting_history as $posting_counter=>$posting_history){
                if($posting_counter == 0){ // to display the current posting seperately
                    if($posting_history->deputation_designation==null){
                        $str_posting_history.="<strong>Presently Posted As ".$posting_history->designation_name.", ".$posting_history->place_of_posting." Since ".$posting_history->modified_from_date."</strong><br/><br/>\n\nOther Postings In The Given Time Period : <br/>\n";
                    }
                    else{
                        $str_posting_history.="<strong>Presently Posted (On Deputation) As ".$posting_history->deputation_designation.", ".$posting_history->deputation_posting_place." Since ".$posting_history->modified_from_date."</strong><br/><br/\n\nOther Postings In The Given Time Period : <br/\n";
                    }
                }
                else{
                    if($posting_history->deputation_designation==null){
                        $str_posting_history.="<br/>\n".($posting_counter).". Posted As ".$posting_history->designation_name.", ".$posting_history->place_of_posting." From ".$posting_history->modified_from_date." To ".$posting_history->to_date."";
                    }
                    else{
                        $str_posting_history.="<br/>\n".($posting_counter).". Posted (On Deputation) As ".$posting_history->deputation_designation.", ".$posting_history->deputation_posting_place." From ".$posting_history->modified_from_date." To ".$posting_history->to_date."";
                    }
                }

                if($current_zone == $posting_history->zone_id){
                    $posting_id = $posting_history->id;
                }
                else{
                    break;
                }
            }
            
            
            $tenure_in_present_zone_query = 'select officer_name, jo_code, to_char(date_of_retirement,\'dd-mm-yyyy\') as date_of_retirement, judicial_officer_postings.judicial_officer_id, \''.$date_upto.'\'::date - from_date::date as continuous_service_period_in_days, 
                                            age(\''.$date_upto.'\', from_date) continuous_service_period, to_char(from_date,\'dd-mm-yyyy\') as from_date, to_date
                                            from judicial_officer_postings inner join judicial_officers on judicial_officer_postings.judicial_officer_id = judicial_officers.id
                                            where judicial_officer_postings.id = '.$posting_id.'';
            
            
            $tenure_in_present_zone = DB::select($tenure_in_present_zone_query);
            
            
            if($tenure_in_present_zone['0']->continuous_service_period_in_days >= $tenure_in_days){
                $temp = Array();
                $temp['officer_name'] = $tenure_in_present_zone['0']->officer_name;
                $temp['jo_code'] = $tenure_in_present_zone['0']->jo_code;
                $temp['retirement_date'] = $tenure_in_present_zone['0']->date_of_retirement;
                $temp['judicial_officer_id'] = $tenure_in_present_zone['0']->judicial_officer_id;
                $temp['from_date'] = $tenure_in_present_zone['0']->from_date;
                $temp['continuous_service_period'] = $tenure_in_present_zone['0']->continuous_service_period;
                $temp['posting_history'] = $str_posting_history;
                array_push($valid_officers,$temp); 
            }
        
        }

        $from_date = array_column($valid_officers, 'from_date');
        array_multisort($from_date, SORT_DESC, $valid_officers);
        
        return $valid_officers;
    }

}
