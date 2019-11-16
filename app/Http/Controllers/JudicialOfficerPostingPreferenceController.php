<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\JudicialOfficerPostingPreference;
use App\JudicialOfficer;
use App\Zone;
use App\JoZoneTenure;
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
                                                        ])->select('zones.zone_name')->get();

            $to_date = JoZoneTenure::Where('judicial_officer_id','=',$judicial_officer)
                                    ->max('to_date');

            $fetch_zone['previous_zone'] = JoZoneTenure::join('zones','zones.id','=','jo_zone_tenures.zone_id')
                                                        ->where([
                                                            ['to_date','=',$to_date],
                                                            ['judicial_officer_id','=',$judicial_officer]
                                                        ])->select('zones.zone_name')->get();

            if(sizeof( $fetch_zone['previous_zone'] )>0){

                $fetch_zone['zones'] = Zone::where([
                                            ['zones.zone_name','<>',$fetch_zone['current_zone']['0']['zone_name']],
                                            ['zones.zone_name','<>',$fetch_zone['previous_zone']['0']['zone_name']]
                                        ])->select('zone_name')->get();

                 $fetch_zone['no_of_preference']=2;
                                                  
           }
           else{

                $fetch_zone['zones'] = Zone::where([
                    ['zones.zone_name','<>',$fetch_zone['current_zone']['0']['zone_name']]
                   
                ])->select('zone_name')->get();

                $fetch_zone['no_of_preference']=3;
           }

           $duration_current_zone = ZoneTenure::join('zones','zones.id','=','jo_zone_tenures.zone_id')
           ->join('judicial_officers','judicial_officers.id','=','jo_zone_tenures.judicial_officer_id')
           -> where([
               ['to_date','=',null],
               ['judicial_officer_id','=',$judicial_officer]
           ])->select('from_date')->get();                                         


            $response = array(
                'JudicialOfficerPostingPreferences' => $JudicialOfficerPostingPreferences
            );
        echo "abc";
       
    }

    
/*Show the zone prefernce details in datatable:start */

public function zone_pref_table_content(Request $request) {
    $response = [];
    $statusCode = 200;
    $judicial_officer_posting_preference = array();

    try {
        $draw = 1;
        $records_total = 0;
        $officer_id= Auth::user()->id;

        $judicial_officer_posting_preference = JudicialOfficerPostingPreference::all();
        $records_total = $judicial_officer_posting_preference->count();

        $draw = $request->draw;
        $offset = $request->start;
        $length = $request->length;
        $search = $request->search["value"];

        $order = $request->order;

        $filtered = JudicialOfficerPostingPreference::join('zones', 'judicial_officer_posting_preferences.zone_id', '=', 'zones.id')
                                                    ->where('judicial_officer_id','=',$officer_id)
                                                    ->select('judicial_officer_posting_preferences.*', 'zones.zone_name');
       
        $records_filtered_count = $filtered->count();



        $ordered = $filtered;

        for ($i = 0; $i < count($order); $i++) {
            $ordered = $ordered->orderBy($request->columns[$order[$i]['column']]['data'], strtoupper($order[$i]['dir']));
        }

        $page_displayed = $ordered->get()->slice($offset, $length, true)->values();

        //print_r($page_displayed['0']['id']);

        foreach($page_displayed as $page){
            //$page['created_at']=date('d-m-Y',strtotime($page['created_at']));
            if($page['remarks']==""){
                $page['remarks']='Not Mentioned';
            }

            
        }


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

/*Show the zone prefernce details in datatable:end */


    public function store(Request $request) {
        $response = [
            'judicial_officer_posting_preference' => []
        ];
        $statusCode = 200;
        $judicial_officer_posting_preference = null;
        $request['created_by'] = Auth::user()->id;

      

        $this->validate($request, [          
            'pref.*'=>array('required','exists:zones,id')
        ]);


        try {
         
            $pref=array();
            $pref=  $request->input('pref');
            $request['judicial_officer_id']= Auth::user()->id;
            $request['created_by'] = Auth::user()->id;

            for ($i = 0; $i < count($pref); $i++)
            {
                $request['zone_id']= $pref[$i];
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
