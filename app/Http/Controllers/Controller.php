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

use Illuminate\Support\Facades\Cache;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;


    // this will receive a set of two zones for any JO and return a suitable zone (if any) as its next posting
    public function find_zone_for_next_posting($zones, $jo_id){ 
        
        shuffle($zones); // randomizing among available two zones for the officer who already has two or more postings

        $str_where = ""; // this string will be used inside the following sql statement inside the where clause
        foreach($zones as $i=>$zone){
            $str_where.=$zone->id;
            if(sizeof($zones) - $i !=1){
                $str_where.= ",";
            }            
        }

       
                    
        $res = DB::select(
                            '
                                select zones.id, zone_name, COALESCE(sum(COALESCE(to_date,current_date)::date - from_date::date),0) as serving_period, COALESCE(ceil((date_of_retirement::date - date_of_joining::date)*ratio_of_service_period/10),1000) as ideal_service_period  from zones
                                left join judicial_officer_postings as jop on zones.id = jop.zone_id and jop.judicial_officer_id ='.$jo_id.'
                                left join judicial_officers as jo on jop.judicial_officer_id = jo.id
                                where zones.id in ('.$str_where.')
                                group by zones.id, zone_name, date_of_retirement,date_of_joining,ratio_of_service_period
                                order by serving_period asc
                            '
                        );

        // now checking whether their already done service in two zones is less than its ideal service period
        
        $eligible_zones = Array();
        foreach($res as $r){
            if($r->serving_period < $r->ideal_service_period){
                array_push($eligible_zones, $r); // storing the eligible zone details
            }
        }

        return $eligible_zones;        
        
    }


    // this will receive zones and judicial officer id as input and will return system generated place of posting for him/her in that zone
    public function find_designation_for_next_posting($zones, $jo_id){ 
       $present_posting = JudicialOfficerPosting::select('rank_id')
                                                ->where('judicial_officer_id',$jo_id)
                                                ->orderBy('from_date', 'desc')
                                                ->limit(1)
                                                ->get();

        $cadre = $present_posting['0']['rank_id'];        

        foreach($zones as $key=>$zone){ 
            $zone_id = $zone->id;
            $month = 0;
            $day = 0;
            $date_upto = date('Y-m-d');
           
            if($zone->zone_name == 'D'){
                $year = 2;
            }
            else{
                $year = 3;
            }

            $record =  app('App\Http\Controllers\ZoneOfConsiderationController')->search_for_zone_of_consideration($zone_id,$cadre,$year,$month,$day,$date_upto);
           

            shuffle($record);
            $probable_next_posting[$key] = array_slice($record,0,1);
            
        }
 
        return $probable_next_posting;
       
    }

}
