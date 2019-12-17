<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\JudicialOfficerPostingPreference;
use App\JudicialOfficer;
use App\Zone;
use App\JoZoneTenure;
use App\District;
use App\Subdivision;
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

    public function fetch_zone(Request $request){

        $response = [];
        $statusCode = 200;
        $fetch_zones = array();

      
             $judicial_officer= Auth::user()->judicial_officer_id;

            $fetch_zone['current_zone'] = JoZoneTenure::join('zones','zones.id','=','jo_zone_tenures.zone_id')
                                                        ->join('judicial_officers','judicial_officers.id','=','jo_zone_tenures.judicial_officer_id')
                                                        -> where([
                                                            ['to_date','=',null],
                                                            ['judicial_officer_id','=',$judicial_officer]
                                                        ])->max('zones.zone_name');

            $to_date = JoZoneTenure::Where([
                                            ['judicial_officer_id','=',$judicial_officer],
                                            ['to_date','<>',null],
                                        ])
                                    ->max('to_date');


            if($to_date!=""){

                $fetch_zone['previous_zone'] = JoZoneTenure::join('zones','zones.id','=','jo_zone_tenures.zone_id')
                                                            ->where([
                                                                ['to_date','=',$to_date],
                                                                ['judicial_officer_id','=',$judicial_officer]
                                                            ])->max('zones.zone_name');
                                                        
            }
            else{
                $fetch_zone['previous_zone'] = 'NA';
            }
                                      
        //logic for the no. of drop down should be opened depending on whether a JO is new in the system

            if($fetch_zone['previous_zone'] !="NA"){

                $fetch_zone['zones'] = Zone::where([
                                            ['zone_name','<>',$fetch_zone['current_zone']],
                                            ['zone_name','<>',$fetch_zone['previous_zone']]
                                        ])->select('zone_name','id')->get();

              

                 $fetch_zone['no_of_preference']=2;
                                                  
           }
           else{

                $fetch_zone['zones'] = Zone::where([
                    ['zones.zone_name','<>',$fetch_zone['current_zone']]
                   
                ])->select('zone_name','id')->get();

                $fetch_zone['no_of_preference']=3;
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
                 

                $days_to_open_module = Zone::where('zone_name','=',$fetch_zone['current_zone'])
                ->select('min_service_days')->get();

            //for openning the module 6 months prior to the end of service days in a specific zone
            $openning_of_display_module = $days_to_open_module[0]['min_service_days']-180;

                        $dt= Carbon::now();

                        $current_date= date('Y-m-d', strtotime($dt));

                        //difference of the strating date of current zone and current date in days 

                        $diff = (strtotime($strating_date_of_current_zone[0]['from_date']) - strtotime($current_date))/(60*60*24);

                       if($diff>=$openning_of_display_module)
                       {
                        $fetch_zone['flag_to_open_the_module']='Y';
                       }
                       else{
                        $fetch_zone['flag_to_open_the_module']='N';
                       }


                    /* logic for closing the module 5months prior to the end of 
                    service days that should be served in a particular zone*/

                    //for closing the module 5 months prior to the end of service days in a specific zone
                       
                       $closing_of_display_module=$days_to_open_module[0]['min_service_days']-150;
                
                       if($diff<=$closing_of_display_module) 
                       {
                        $fetch_zone['flag_to_close_the_module']='N';
                       }
                       else
                       {
                        $fetch_zone['flag_to_close_the_module']='Y';
                       }
                   return view('zone_pref_jr.index',compact('fetch_zone'));  
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

      

        $this->validate($request, [          
            'posting_pref.*'=>array('required','exists:zones,id')
        ]);

       
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

    /*for selecting */

    public function zone_selection(Request $request){

      
        $this->validate($request, [
            
            'zone_pref' => array('required','integer','max:999','exists:zones,id'),
        ]);

         $zone_options= array();

         $zone_pref=  $request->input('zone_pref');
         
         
        $zone_options['districts'] = District::where('zone_id','=',$zone_pref) 
                                            ->select('id','district_name')->get();
    
        

            $select='SELECT subdivision_name from subdivisions';

            $where=' WHERE 1=1';

            foreach($zone_options['districts'] as $district){

                $where.=' AND district_id <>'.$district->id;
            }

            $zone=' AND zone_id= '.$zone_pref;

            $qury=$select.$where.$zone;

            $zone_options['subdivision']=DB::select($qury);
                           
        //  print_r($subdivision);  
        //  exit;
        //     }
            
       

            foreach($zone_options['districts'] as $district){
                $except="";

                $zone_options['exempted_subdivisions'] = Subdivision::where([
                                                                            ['district_id','=',$district->id],
                                                                            ['zone_id','<>',$zone_pref]
                                                                        ])->select('subdivision_name')->get();
            
           

            if(sizeof($zone_options['exempted_subdivisions'])>0){
                    foreach($zone_options['exempted_subdivisions'] as  $key=>$exempted_subdivision){
                        if($key==0)
                            $except= $except.$exempted_subdivision->subdivision_name;  
                        else
                            $except= $except." , ".$exempted_subdivision->subdivision_name; 
                    }
                   
                    $district->district_name= $district->district_name."\n except :".$except;                  
                    
            }
           
        }

       return( $zone_options);
        
           

            
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
}
