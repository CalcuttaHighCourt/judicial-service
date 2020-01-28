<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\JudicialOfficerPostingPreference;
use App\JudicialOfficerPosting;
use App\JudicialOfficer;
use App\Zone;
use App\JoZoneTenure;
use App\District;
use App\Subdivision;
use App\JoLegalExperience;

use DB;



use Carbon\Carbon;
use Auth;

class JudicialOfficerPostingPreferenceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $response = [];
        $statusCode = 200;
        $JudicialOfficerPostingPreferences = array();

        try {

            $JudicialOfficerPostingPreferences = JudicialOfficerPostingPreference::all();


            $response = array(
                'JudicialOfficerPostingPreferences' => $JudicialOfficerPostingPreferences
            );
        } catch (\Exception $e) {

            $response = array(
                'exception' => true,
                'exception_message' => $e->getMessage()
            );
            $statusCode = 400;
        } finally {
            return response()->json($response, $statusCode);
        }
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index_for_datatable(Request $request) {
        $response = [];
        $statusCode = 200;
        $judicial_officer_posting_preference = array();

        try {
            $draw = 1;
            $records_total = 0;

            $judicial_officer_posting_preference = JudicialOfficerPostingPreference::all();
            $records_total = $judicial_officer_posting_preference->count();

            $draw = $request->draw;
            $offset = $request->start;
            $length = $request->length;
            $search = $request->search["value"];

            $order = $request->order;

            $filtered = JudicialOfficerPostingPreference::join('judicial_officers as jo', 'judicial_officer_posting_preferences.judicial_officer_id', '=', 'jo.id')
                                                        ->join('zones', 'judicial_officer_posting_preferences.zone_id', '=', 'zones.id')
                                                         ->select('judicial_officer_posting_preferences.*', 'jo.officer_name as officer_name','zones.zone_name');

            $records_filtered_count = $filtered->count();



            $ordered = $filtered;

            for ($i = 0; $i < count($order); $i++) {
                $ordered = $ordered->orderBy($request->columns[$order[$i]['column']]['data'], strtoupper($order[$i]['dir']));
            }

            $page_displayed = $ordered->get()->slice($offset, $length, true)->values();

           
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => $records_filtered_count,
                "judicial_officer_posting_preferences" => $page_displayed,
            );
        } catch (\Exception $e) {
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => 0,
                "judicial_officer_posting_preferences" => [],
            );
        } finally {
            return response()->json($response, $statusCode);
        }
    }

    
                 /*Final Submission of the preference:starts*/

                public function final_submission(Request $request)
                {
                    $response = [
                        'judicial_officer_posting_preference' => []
                    ];
                    $statusCode = 200;
                    $judicial_officer_posting_preference = null;
                    $request['created_by'] = Auth::user()->id;


                    $posting_pref=  $request->input('posting_pref');
                    $request['judicial_officer_id']= Auth::user()->judicial_officer_id;
                    $request['created_by'] = Auth::user()->id;
                    $request['final_submission'] =  $request->input('flag');
                    $officer_id= Auth::user()->judicial_officer_id;

                    try {
                        $jop_pref=JudicialOfficerPostingPreference::where([
                                                                ['judicial_officer_id','=',$officer_id],
                                                                ['final_submission','=','N'] 
                                                                ])->delete();
                                 
            
                        for ($i = 0; $i < count($posting_pref); $i++)
                        {
                            $request['zone_id']= $posting_pref[$i];
                            $judicial_officer_posting_preference = JudicialOfficerPostingPreference::create($request->all());
                        }
                        
                        $response = array(
                            'judicial_officer_posting_preference' => $judicial_officer_posting_preference
                        );
                    } catch (\Exception $e) {
                        $response = array(
                            'exception' => true,
                            'exception_message' => $e->getMessage()
                        );
                        $statusCode = 400;
                    } finally {
                        return response()->json($response, $statusCode);
                    }

                    
                }
                

                 /*Final Submission of the preference:ends*/


    
/*Show the zone prefernce details in datatable:start */

public function zone_pref_content(Request $request) {
    $response = [];
    $statusCode = 200;
    $judicial_officer_posting_preference = array();

    try{
       
        $officer_id= Auth::user()->judicial_officer_id;

        $judicial_officer_posting_preference = JudicialOfficerPostingPreference::join('zones','zones.id','=','judicial_officer_posting_preferences.zone_id')
                                            ->where([
                                                ['judicial_officer_id','=',$officer_id],
                                                ['final_submission','=','N']
                                            ])->select('judicial_officer_posting_preferences.zone_id','zones.zone_name','remarks')->get();

                                          
        $response = array(
            'judicial_officer_posting_preference' => $judicial_officer_posting_preference
        );
    } catch (\Exception $e) {
        $response = array(
            'exception' => true,
            'exception_message' => $e->getMessage()
        );
        $statusCode = 400;
    } finally {
        return response()->json($response, $statusCode);
    }
}


/*Show the zone prefernce details in datatable:end */


    public function store(Request $request) {
        $response = [
            'judicial_officer_posting_preference' => []
        ];
        $statusCode = 200;
        $judicial_officer_posting_preference = null;
        $request['created_by'] = Auth::user()->id;

      

        // $this->validate($request, [          
        //     'zone_preference.*'=>array('required','exists:zones,id')
        // ]);

       
            $station_name=  $request->input('station_name');
            $station_zone=  $request->input('station_zone');
            $request['judicial_officer_id']= Auth::user()->judicial_officer_id;
            $request['created_by'] = Auth::user()->id;
            $request['final_submission'] =  $request->input('flag');
            $request['remarks'] = $request->input('remarks');
            $officer_id= Auth::user()->judicial_officer_id;


        try {
            $jop_pref=JudicialOfficerPostingPreference::where([
                                                        ['judicial_officer_id','=',$officer_id]
                                                    ])->delete();
                     

            for ($i = 0; $i < sizeof($station_name); $i++)
            {

                $request['zone_id']= $station_zone[$i];
                $request['station_name']= $station_name[$i];
                $judicial_officer_posting_preference = JudicialOfficerPostingPreference::create($request->all());
            }
            exit;
            $response = array(
                'judicial_officer_posting_preference' => $judicial_officer_posting_preference
            );
        } catch (\Exception $e) {
            $response = array(
                'exception' => true,
                'exception_message' => $e->getMessage()
            );
            $statusCode = 400;
        } finally {
            return response()->json($response, $statusCode);
        }
    }

    /*for selecting zones*/

    public function fetch_zone(Request $request){

        $response = [];
        $statusCode = 200;
        $zone_options = array();

      
            $judicial_officer= Auth::user()->judicial_officer_id;
            $zone_options['current_zone'] = JoZoneTenure::join('zones','zones.id','=','jo_zone_tenures.zone_id')
                                                        ->join('judicial_officers','judicial_officers.id','=','jo_zone_tenures.judicial_officer_id')
                                                        -> where([
                                                            ['to_date','=',null],
                                                            ['judicial_officer_id','=',$judicial_officer]
                                                        ])->max('zones.zone_name');

            //if current zone is blank             
            if($zone_options['current_zone']=="")
            {            
                $zone_options['current_zone' ]= 'NA';
            }              

            //if previous zone is blank 
            $to_date = JoZoneTenure::Where([
                                ['judicial_officer_id','=',$judicial_officer],
                                ['to_date','<>',null],
                            ])
                        ->max('to_date');
            
            if($to_date!=""){
                $zone_options['previous_zone'] = JoZoneTenure::join('zones','zones.id','=','jo_zone_tenures.zone_id')
                                                            ->where([
                                                                ['to_date','=',$to_date],
                                                                ['judicial_officer_id','=',$judicial_officer]
                                                           ])->max('zones.zone_name');                                                       
            }
            else{
                $zone_options['previous_zone'] = 'NA';
            }

            //logic for the no. of drop down should be opened depending on whether a JO is new in the system
            if($zone_options['current_zone']!='NA'){
                if($zone_options['previous_zone'] !='NA'){
                    $zone_options['zones'] = Zone::where([
                            ['zone_name','<>',$zone_options['current_zone']],
                            ['zone_name','<>',$zone_options['previous_zone']]
                        ])->select('zone_name','id')->get();            
                    $zone_options['no_of_preference']=2;                                     
                }
                else{
                        $zone_options['zones'] = Zone::where('zones.zone_name','<>',$zone_options['current_zone'])->select('zone_name','id')->get();
                        $zone_options['no_of_preference']=3;
                }
                /* logic for openning the module 6months prior to the end of 
                service days that should be served in a particular zone*/
                $strating_date_of_current_zone = JoZoneTenure::join('zones','zones.id','=','jo_zone_tenures.zone_id')
                                            ->join('judicial_officers','judicial_officers.id','=','jo_zone_tenures.judicial_officer_id')
                                            -> where([
                                                ['to_date','=',null],
                                                ['judicial_officer_id','=',$judicial_officer]
                                            ])->select('from_date')->get();                                         

                                            $dt= Carbon::now();
                    //echo $strating_date_of_current_zone[0]['from_date'] ;                   // 1975-12-25
                    $days_to_open_module = Zone::where('zone_name','=',$zone_options['current_zone'])
                        ->select('min_service_days')->get();
                    //for openning the module 6 months prior to the end of service days in a specific zone
                    $openning_of_display_module = $days_to_open_module[0]['min_service_days']-180;
                                $dt= Carbon::now();
                                $current_date= date('Y-m-d', strtotime($dt));
                                //difference of the strating date of current zone and current date in days 
                                $diff = (strtotime($strating_date_of_current_zone[0]['from_date']) - strtotime($current_date))/(60*60*24);
                            if($diff>=$openning_of_display_module)
                            {
                                $zone_options['flag_to_open_the_module']='Y';
                            }
                            else{
                                $zone_options['flag_to_open_the_module']='N';
                        }
                    /* logic for closing the module 5months prior to the end of 
                    service days that should be served in a particular zone*/

                    //for closing the module 5 months prior to the end of service days in a specific zone
                                    
                    $closing_of_display_module=$days_to_open_module[0]['min_service_days']-150;
                    if($diff<=$closing_of_display_module) 
                        {
                        $zone_options['flag_to_close_the_module']='N';
                        }
                        else
                        {
                        $zone_options['flag_to_close_the_module']='Y';
                        }
                    }
                else{
                    $zone_options['no_of_preference']='NA';
                }
            
            if(($zone_options['current_zone']!='NA')||($zone_options['previous_zone'] !='NA')){

                    $zone_options['zones'] = Zone::where([
                                        ['zone_name','<>',$zone_options['current_zone']],
                                        ['zone_name','<>',$zone_options['previous_zone']]
                                ])->select('zone_name','id')->get(); 

                    if( sizeof($zone_options['zones'])>0)
                    {
                        foreach($zone_options['zones'] as  $key=>$zone_pref){
                            // echo $zone_pref;
                            // print_r( $zone_options['zones']);
                            $zone_options[$zone_pref->zone_name] = District::where('zone_id','=',$zone_pref->id) 
                                                        ->select('id','district_name')->get();
                                                        
                            // echo "<pre>";                          
                            // print_r($zone_options);
                            $select='SELECT subdivision_name from subdivisions';
                            $where=' WHERE 1=1';                      
                            foreach(  $zone_options[$zone_pref->zone_name] as $district){
                                $where.=' AND district_id <>'.$district->id;
                            }
                            $zone=' AND zone_id= '.$zone_pref->id;
                            $qury=$select.$where.$zone;
                            $zone_options[$zone_pref->id]=DB::select($qury);
                            foreach(  $zone_options[$zone_pref->zone_name] as $district){
                                //echo "b";
                                $except="";
                                $zone_options['exempted_subdivisions'] = Subdivision::where([
                                                                                            ['district_id','=',$district->id],
                                                                                            ['zone_id','<>',$zone_pref->id]
                                                                                        ])->select('subdivision_name')->get();                    
                                // echo "<pre>";
                                // print_r( $zone_options['subdivision']); exit;
                                if(sizeof($zone_options['exempted_subdivisions'])>0){
                                    foreach($zone_options['exempted_subdivisions'] as  $key=>$exempted_subdivision){
                                        //echo "c";
                                        if($key==0)
                                            $except= $except.$exempted_subdivision->subdivision_name;  
 
                                      
                                        else
                                            $except= $except." , ".$exempted_subdivision->subdivision_name; 
                                            
                                    }
                                   
                                    $district->district_name= $district->district_name."\n except :".$except; 

                                }
                               
                            }
                                 
                        }
                                              
                    }                 
                }
           
            return view('zone_pref_jr.index',compact('zone_options'));
        }

        public function preference_display_for_appointment(Request $request){
               
                $judicial_officer_details['display_pref_for_jo'] = JudicialOfficer:: where('posting_preference_window_flag','=','Y')
                                                                                    ->select('id','officer_name','jo_code','hometown','home_state_id','registration_no','profile_image')
                                                                                    ->get();

                $zones = Zone::orderBy('zone_name')->get();
                
                if( sizeof($judicial_officer_details['display_pref_for_jo'])>0)
                {
                    foreach($judicial_officer_details['display_pref_for_jo'] as  $key=>$station_pref){

                        $profile_image=asset('images/judicial_officers/'.$judicial_officer_details['display_pref_for_jo'][$key]->registration_no.'/'.$judicial_officer_details['display_pref_for_jo'][$key]->profile_image);
                        //print_r($profile_image); exit;
                        $str1="";

                        if($judicial_officer_details['display_pref_for_jo'][$key]->profile_image!=null){
                        
                            $str1 = $judicial_officer_details['display_pref_for_jo'][$key]->officer_name."/".$judicial_officer_details['display_pref_for_jo'][$key]->jo_code. "<br><br>\n\n<img src ='". $profile_image."' style ='height:18%' >";
                        }
                        else{
                            $str1= $judicial_officer_details['display_pref_for_jo'][$key]->officer_name."/".$judicial_officer_details['display_pref_for_jo'][$key]->jo_code;

                        }
                        
                        
                        $judicial_officer_details['officer_name'][$key] =$str1 ;

                        $judicial_officer_details['preference_details'][$key] = JudicialOfficerPostingPreference::where([
                                                                                                                    ['final_submission','=','Y'],
                                                                                                                    ['judicial_officer_id','=',$station_pref->id]
                                                                                                                ])->select('station_name','remarks')->get();
                      
                        //Current Posting Details
                        $judicial_officer_details['posted_as'][$key] = JudicialOfficerPosting::join('judicial_officers','judicial_officer_postings.judicial_officer_id','=','judicial_officers.id')
                                                                                        ->leftJoin('designations','judicial_officer_postings.designation_id','=','designations.id')
                                                                                        ->where('judicial_officers.id','=',$station_pref->id)
                                                                                        ->orderBy('judicial_officer_postings.from_date','DESC')
                                                                                        ->limit(1)
                                                                                        ->get();                           
                                                                                       
                        if($judicial_officer_details['posted_as'][$key]['0']['designation_id'] == null){
                            $judicial_officer_details['posted_as'][$key]['0']['designation_name']="<strong>Currently Deputed as</strong> ".$judicial_officer_details['posted_as'][$key]['0']['deputation_designation']." At ".$judicial_officer_details['posted_as'][$key]['0']['deputation_posting_place']." From ". Carbon::parse($judicial_officer_details['posted_as'][$key]['0']['from_date'])->format('d-m-Y');
                            
                        }
                        else if($judicial_officer_details['posted_as'][$key]['0']['additional_designation'] != null){
                            $judicial_officer_details['posted_as'][$key]['0']['designation_name']="<strong>Currently Posted as</strong> ".$judicial_officer_details['posted_as'][$key]['0']['designation_name']." From ". Carbon::parse($judicial_officer_details['posted_as'][$key]['0']['from_date'])->format('d-m-Y')." And ".$judicial_officer_details['posted_as'][$key]['0']['additional_designation'];
                           
                        }
                        else{
                            $judicial_officer_details['posted_as'][$key]['0']['designation_name']="<strong>Currently Posted as</strong> ".$judicial_officer_details['posted_as'][$key]['0']['designation_name']." From ". Carbon::parse($judicial_officer_details['posted_as'][$key]['0']['from_date'])->format('d-m-Y');
                            
                        } 
                        
                       // Posting details
                       $str ="";

                       $judicial_officer_details['posting_details'][$key] =  JudicialOfficerPosting ::leftjoin('designations','judicial_officer_postings.designation_id','designations.id')
                                                                                                            ->leftjoin('zones','judicial_officer_postings.zone_id','=','zones.id')                                                                                      
                                                                                                            ->where('judicial_officer_postings.judicial_officer_id','=',$station_pref->id)
                                                                                                            ->orderBy('judicial_officer_postings.from_date','ASC')
                                                                                                            ->select('judicial_officer_postings.judicial_officer_id','designations.designation_name', 'judicial_officer_postings.additional_designation',
                                                                                                                    'judicial_officer_postings.deputation_designation','judicial_officer_postings.deputation_posting_place',
                                                                                                                    'judicial_officer_postings.from_date','judicial_officer_postings.to_date','zones.zone_name')
                                                                                                            ->get();
                        foreach($judicial_officer_details['posting_details'][$key] as $key5=>$posting){
                            $str.= "<br>";

                            if($posting['to_date'] != null)
                                $posting['to_date'] = Carbon::parse($posting['to_date'])->format('d-m-Y');
                            else
                                $posting['to_date'] = "Till Date";

                            $posting['from_date'] = Carbon::parse($posting['from_date'])->format('d-m-Y');  

                            if($posting['designation_name']==null){
                                $str.= "<strong>".($key5+1).".</strong> Deputed as ".$posting['deputation_designation']. "At ".$posting['deputation_posting_place']." From ".$posting['from_date']." To ".$posting['to_date'];
                            }
                            else if( $posting['additional_designation'] !=null){
                                $str.= "<strong>".($key5+1).".</strong> Posted as ".$posting['designation_name']." From ".$posting['from_date']." To ".$posting['to_date']." And ".$posting['additional_designation'];
                            }
                            else{
                                $str.= "<strong>".($key5+1).". </strong> Posted as ".$posting['designation_name']." From ".$posting['from_date']." To ".$posting['to_date'];
                            }
                            $str.=" <strong> (Zone: ".$posting->zone_name.") </strong>";
                        }

                        $judicial_officer_details['posted_as'][$key]['0']['designation_name'].="<br><br>\n\n".$str;       

                        foreach($zones as $key4=>$zone){                            
                           $diff_days = 0;
                           $zone_tenures = JoZoneTenure::where([ 
                                                                ['judicial_officer_id','=',$station_pref->id],
                                                                ['zone_id','=',$zone->id]
                                                            ])->select('from_date','to_date')->get();
                            $str1="";

                            foreach ($zone_tenures as $key3=>$zone_tenure){
                                $from_date=Carbon::parse($zone_tenure->from_date);
                                if($zone_tenure->to_date == null){
                                    $to_date= Carbon::now();
                                }
                                else{
                                    $to_date=Carbon::parse($zone_tenure->to_date);
                                }
                                    
                                $diff_days += $from_date->diffInDays($to_date);                                
                            }

                            //Calculation and string creation for duration spend in a zone in Y-M-D format:start 
                            $tenure="";                            
                           
                            
                            if( $diff_days >= 365){
                                $years =  floor($diff_days/365);
                                $days = fmod($diff_days,365);
                                if($days > 30){
                                    $months= floor($days/30);
                                    $days = fmod($days,30);

                                    $tenure=$years." Y ".$months." M ".$days." D ";
                                }
                                else{
                                    $tenure=$years." Y ".$days." D ";
                                }                                
                            }
                            else if($diff_days >= 30){

                                $months = floor($diff_days,12);
                                $days = fmod($diff_days,12);

                                $tenure=$months." M ".$days." D ";
                            }
                            else if($diff_days > 0){

                                $tenure=$diff_days." D ";
                            }
                            else
                                $tenure="Yet to be posted.";

                            $str1.="<br>\n Zone ".$zone->zone_name." : ".$tenure;

                            //Calculation and string creation for duration spend in a zone in Y-M-D format:end
                            $judicial_officer_details['zone_tenure'][$key][$key4]=$str1;

                        }    
                        
                        //Home state 
                        // $str.= "<br>\n";
                        $judicial_officer_details['home_state'][$key] = JudicialOfficer::join('states','judicial_officers.home_state_id','=','states.id')  
                                                                                    ->where('judicial_officers.home_state_id','=',$station_pref->home_state_id)  
                                                                                    ->select('state_name')->get();

                        //Legal Practice Subdivisions
                        $judicial_officer_details['practice_subdivision'][$key] = JoLegalExperience::join('judicial_officers','jo_legal_experiences.judicial_officer_id','=','judicial_officers.id')
                                                                                                    ->join('subdivisions','jo_legal_experiences.subdivision_id','=','subdivisions.id')
                                                                                                    ->where('judicial_officers.id','=',$station_pref->id)
                                                                                                    ->get();

                   
                        if(sizeof($judicial_officer_details['practice_subdivision'][$key])>0){
                            foreach( $judicial_officer_details['practice_subdivision'][$key] as $key6=>$practice_details)
                            
                            $judicial_officer_details['practice_subdivision'][$key][$key6]['subdivision_name']=$judicial_officer_details['practice_subdivision'][$key][$key6]['subdivision_name']." From ".$judicial_officer_details['practice_subdivision'][$key][$key6]['from_year']." To ".$judicial_officer_details['practice_subdivision'][$key][$key6]['to_year'];
                            //print_r()
                        }

                        //spouse details
                        $judicial_officer_details['spouse_details'][$key] = JudicialOfficer::where('judicial_officers.id','=',$station_pref->id)
                                                                                            ->select('judicial_officers.spouse')
                                                                                            ->get();
                                                          
                                                
                        if(sizeof($judicial_officer_details['spouse_details'][$key])>0){

                            $judicial_officer_details['spouse_details'][$key] = JudicialOfficerPosting::join('judicial_officers','judicial_officer_postings.judicial_officer_id','=','judicial_officers.id')
                                                                                        ->leftJoin('designations','judicial_officer_postings.designation_id','=','designations.id')
                                                                                        ->where([
                                                                                            ['judicial_officers.id','=',$judicial_officer_details['spouse_details'][$key]['0']['spouse']],
                                                                                            ['judicial_officers.date_of_retirement','>=',Carbon::now()]
                                                                                        ])
                                                                                        ->orderBy('from_date','DESC')
                                                                                        ->limit(1)
                                                                                        ->get();   
                                                                                        
                            if(sizeof($judicial_officer_details['spouse_details'][$key])>0){

                                if($judicial_officer_details['spouse_details'][$key]['0']['designation_id'] == null){
                                    $judicial_officer_details['spouse_details'][$key]['0']['designation_name']="Deputed as ".$judicial_officer_details['spouse_details'][$key]['0']['deputation_designation']." At ".$judicial_officer_details['spouse_details'][$key]['0']['deputation_posting_place']." From ". Carbon::parse($judicial_officer_details['spouse_details'][$key]['0']['from_date'])->format('d-m-Y');
                                }
                                else if($judicial_officer_details['spouse_details'][$key]['0']['additional_designation'] != null){
                                    $judicial_officer_details['spouse_details'][$key]['0']['designation_name']="Posted as ".$judicial_officer_details['spouse_details'][$key]['0']['designation_name']." From ". Carbon::parse($judicial_officer_details['posted_as'][$key]['0']['from_date'])->format('d-m-Y')." And ".$judicial_officer_details['spouse_details'][$key]['0']['additional_designation'];
                                }
                                else{
                                    $judicial_officer_details['spouse_details'][$key]['0']['designation_name']="Posted as ".$judicial_officer_details['spouse_details'][$key]['0']['designation_name']." From ". Carbon::parse($judicial_officer_details['spouse_details'][$key]['0']['from_date'])->format('d-m-Y');
                                }
                            }
                        }

                    }
                   
                } 
               
                echo json_encode($judicial_officer_details);                
            }
    
         
    public function update(Request $request, $id) {
        $response = [
            'judicial_officer_posting_preference' => []
        ];
        $statusCode = 200;
        $judicial_officer_posting_preference = null;
        
        if (!ctype_digit(strval($id))) {
            $response = array(
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }
        
        $this->validate($request, [
            'judicial_officer_id' => array('required', 'exists:judicial_officers,id'),
            'zone_id' => array('required', 'exists:zones,id'),
            'notice_no' => array('required'),
            'notice_date' => array('required', 'date'),
        ]);

        try {
            $judicial_officer_posting_preference = JudicialOfficerPostingPreference::find($id);
            if (!$judicial_officer_posting_preference) {
                throw new \Exception('Invalid Input');
            }
            $judicial_officer_posting_preference->judicial_officer_id = $request->judicial_officer_id;
            $judicial_officer_posting_preference->zone_id = $request->zone_id;
            $judicial_officer_posting_preference->notice_no = $request->notice_no;
            $judicial_officer_posting_preference->notice_date = $request->notice_date;
            $judicial_officer_posting_preference->created_by = Auth::user()->id;
            $judicial_officer_posting_preference->save();

            $response = array(
                'judicial_officer_posting_preference' => $judicial_officer_posting_preference
            );
        } catch (\Exception $e) {
            $response = array(
                'exception' => true,
                'exception_message' => $e->getMessage()
            );
            $statusCode = 400;
        } finally {
            return response()->json($response, $statusCode);
        }
    }

   
    public function destroy($id)
    {
            $response = [
                'judicial_officer_posting_preference' => [ ]
        ];
        $statusCode = 200;
        $judicial_officer_posting_preference = null;
        
        try {
            //$preference = JudicialOfficerPostingPreference::destroy($id);
            if(!ctype_digit(strval($id))){
                throw new \Exception('Please check input');
            }
            $judicial_officer_posting_preference = JudicialOfficerPostingPreference::find($id);
            //print_r($preference);exit;
                // $user_type->delete();
                if(!empty($judicial_officer_posting_preference)){//Should be changed #30
                    //$preference = $preference->forceDelete();//Should be changed #31 //only for admin elements.
                    $judicial_officer_posting_preference = $judicial_officer_posting_preference->delete();
                }
                    
                $response = array (
                        'judicial_officer_posting_preference' => $judicial_officer_posting_preference //Should be changed #32
                );
            
            
        } catch ( \Exception $e ) {
            $response = array (
                    'exception' => true,
                    'exception_message' => $e->getMessage ()
            );
            $statusCode = 400;
        } finally{
            return response ()->json ( $response, $statusCode );
        }
    }   

    //populate activate window page with valid judicial officers list
    public function list_of_valid_judicial_officers(Request $request){

        $judicial_officers= JudicialOfficer::where([
                                                ['date_of_retirement','>',Carbon::today()],
                                                ['posting_preference_window_flag','<>','Y']
                                            ])
                                            ->orWhere([
                                                ['date_of_retirement','>',Carbon::today()],
                                                ['posting_preference_window_flag','=', null]
                                            ])
                                            ->orderBy('registration_no')
                                            ->select('id','officer_name','jo_code', 'registration_no')
                                            ->get();
       
       return view('appointments.preference_window_open',compact('judicial_officers'));
                
    }


    //Code for window openning for judicial officer's posting preference
    public function activate_preference_window(Request $request){

        $this->validate($request,[
            'judicial_officer' => 'array|required',
            'judicial_officer.*' => 'required|max:99999'
        ]);

        $response = array();    
        $statusCode = 200;
        $jo_list = $request->input('judicial_officer');

        try{
            DB::beginTransaction(); 

            for($i=0;$i<sizeof($jo_list);$i++){

                JudicialOfficer::where('id',$jo_list[$i])
                                ->update([
                                    'posting_preference_window_flag'=>'Y',
                                    'posting_preference_window_open_on' =>Carbon::today(),
                                    'updated_at'=>Carbon::today()
                                ]);
                                
            }

            DB::commit();

        } catch (\Exception $e) {
            DB::rollBack(); 
            $response = array(
                'exception' => true,
                'exception_message' => $e->getMessage()
            );           
            $statusCode = 400;
        } finally {
            return response()->json($response, $statusCode);
        }

       
    }
}
