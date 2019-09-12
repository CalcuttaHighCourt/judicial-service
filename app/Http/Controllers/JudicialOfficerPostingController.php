<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\JudicialOfficerPosting;
use App\JudicialOfficer;
use App\Zone;
use Auth;
use Carbon\Carbon;

class JudicialOfficerPostingController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $response = [];
        $statusCode = 200;
        $judicial_officer_postings = array();

        try {

            $judicial_officer_postings = JudicialOfficerPosting::all();


            $response = array(
                'judicial_officer_postings' => $judicial_officer_postings
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

    public function index_for_datatable(Request $request) {
        $response = [];
        $statusCode = 200;
        $judicial_officer_postings = array();

        try {
            $draw = 1;
            $records_total = 0;

            $judicial_officer_postings = JudicialOfficerPosting::all();
            $records_total = $judicial_officer_postings->count();

            $draw = $request->draw;
            $offset = $request->start;
            $length = $request->length;
            $search = $request->search["value"];

            $order = $request->order;

            $filtered = JudicialOfficerPosting::join('judicial_officers', 'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id')
                    ->join('designations', 'judicial_officer_postings.designation_id', '=', 'designations.id')
                    ->join('courts', 'judicial_officer_postings.court_id', '=', 'courts.id')
                    ->join('court_complexes', 'judicial_officer_postings.court_complex_id', '=', 'court_complexes.id')
                    ->join('modes', 'judicial_officer_postings.mode_id', '=', 'modes.id')
                    ->select('judicial_officer_postings.*', 'judicial_officers.officer_name as officer_name', 'designations.designation_name as designation_name', 'courts.court_name as court_name', 'court_complexes.court_complex_name as court_complex_name', 'modes.posting_mode as posting_mode');

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
                "judicial_officer_postings" => $page_displayed,
            );
        } catch (\Exception $e) {
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => 0,
                "judicial_officer_postings" => [],
            );
        } finally {
            return response()->json($response, $statusCode);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $response = [
            'judicial_officer_posting' => []
        ];
        $statusCode = 200;
        $judicial_officer_posting = null;
        $request['created_by'] = Auth::user()->id;
        $this->validate($request, [
            'judicial_officer_id' => array('required','integer','exists:judicial_officers,id'),
            'designation_id' => array('required','integer','exists:designations,id'),
            'court_id' => array('required','integer','exists:courts,id'),
            'court_complex_id' => array('required','integer','exists:court_complexes,id'),
            'mode_id' => array('required','integer','exists:modes,id'),
            'from_date' => array('required', 'date','date_format:d-M-Y'),
            'to_date' => array('date', 'date_format:d-M-Y'),
            'created_by' => array('required','integer','exists:users,id'),
        ]);
        try {
            $judicial_officer_posting = JudicialOfficerPosting::create($request->all());
            $response = array(
                'judicial_officer_posting' => $judicial_officer_posting
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
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $response = [
            'judicial_officer_posting' => []
        ];
        $statusCode = 200;
        $judicial_officer_posting = null;
        try {
            if (!ctype_digit(strval($id))) {
                throw new \Exception('Invalid Input');
            }
            $judicial_officer_posting = JudicialOfficerPosting::find($id);
            $response = array(
                'judicial_officer_posting' => $judicial_officer_posting
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


    public function jo_current_posting_details(Request $request)
    {
       
        $this->validate ( $request, [                     
            'jo_code' => 'required|exists:judicial_officer_postings,judicial_officer_id'                    

        ] );
        $jo_code=$request->input('jo_code');

        //$jo_posting = array();

        $jo_posting= JudicialOfficerPosting:: join('judicial_officers as jo','jo.id','=','judicial_officer_postings.judicial_officer_id')
                                                    ->join('designations as ds','ds.id','=','judicial_officer_postings.designation_id')
                                                    ->join('court_complexes as cc','cc.id','=','judicial_officer_postings.court_complex_id')
                                                    ->join('districts as dist','dist.id','=','cc.district_id')
                                                    ->join('zones','zones.id','=','cc.zone_id')
                                                    ->where('judicial_officer_postings.judicial_officer_id','=',$jo_code)
                                                    ->select('jo.officer_name as officer_name', 'jo.jo_code as jo_code','judicial_officer_postings.from_date', 'judicial_officer_postings.from_date as duration','ds.designation_name as designation_name','dist.district_name as district_name','zones.zone_name as zone_name')
                                                    ->get();

        $jo_posting[0]['from_date']= Carbon::parse ($jo_posting[0]['from_date'])->format('d-m-Y'); 

        $today= strtotime(Carbon::today());
        $duration =  $today - strtotime($jo_posting[0]['duration']) ;
        
        $years = floor($duration / (365*60*60*24));
        $months = floor(($duration - $years * 365*60*60*24) / (30*60*60*24));
        $days = floor(($duration - $years * 365*60*60*24 - $months*30*60*60*24)/ (60*60*24));

        if ($years>0)
                $jo_posting[0]['duration']=$years."year(s) ".$months."month(s) ".$days."day(s)";
        else if($years>0 && $months>0)
                $jo_posting[0]['duration']=$months."month(s) ".$days."day(s)";
        else
                $jo_posting[0]['duration']=$days."day(s)";

        return($jo_posting);
    }




    public function zone_pref_details_fetch(Request $request)
    {
       
        $id= auth()->user()->judicial_officer_id;
        $user_type = Auth::user()->user_type_id;

        $zone_pref_details['current_zone']= JudicialOfficerPosting:: join('court_complexes as cc','cc.id','=','judicial_officer_postings.court_complex_id')
                                                    ->join('zones','zones.id','=','cc.zone_id')
                                                    ->leftjoin('judicial_officers','judicial_officers.id','=','judicial_officer_postings.judicial_officer_id')
                                                    ->where('judicial_officer_postings.judicial_officer_id',$id)
                                                    ->orderBy('from_date', 'desc')
                                                    ->select('zones.zone_name as zone_name','zones.id as zone_id','judicial_officer_postings.from_date as current_from_date', 'zones.min_service_days as min_service_days','judicial_officers.date_of_retirement as date_of_retirement')
                                                    ->first();


       $zone_pref_details['just_prev_zone']= JudicialOfficerPosting:: join('court_complexes as cc','cc.id','=','judicial_officer_postings.court_complex_id')
                                                    ->join('zones','zones.id','=','cc.zone_id')
                                                    ->where([
                                                                ['judicial_officer_postings.judicial_officer_id',$id],
                                                                ['from_date','<',$zone_pref_details['current_zone']['current_from_date']]
                                                            ])
                                                    ->orderBy('from_date', 'desc')
                                                    ->select('zones.zone_name as zone_name','zones.id as zone_id')
                                                    ->first();

          

        $count= JudicialOfficerPosting:: join('court_complexes as cc','cc.id','=','judicial_officer_postings.court_complex_id')
                                                    ->join('zones','zones.id','=','cc.zone_id')
                                                    ->where([
                                                                ['judicial_officer_postings.judicial_officer_id',$id]
                                                            ])                                                  
                                                    ->count();


        $zone_pref_details['current_zone']['current_from_date']= Carbon::parse ($zone_pref_details['current_zone']['current_from_date'])->format('d-m-Y'); 

        $today= strtotime(Carbon::today());
        $zone_service_duration =  $today - strtotime($zone_pref_details['current_zone']['current_from_date']) ;

        $years = floor($zone_service_duration / (365*60*60*24));
        $months = floor(($zone_service_duration - $years * 365*60*60*24) / (30*60*60*24));
        //$posting_days_span = floor(($zone_service_duration - $years * 365*60*60*24 - $months*30*60*60*24)/ (60*60*24)); 
        $posting_days_span= round($zone_service_duration / (60 * 60 * 24));


        $zone_pref_details['current_zone']['date_of_retirement']= Carbon::parse ($zone_pref_details['current_zone']['date_of_retirement'])->format('d-m-Y'); 

        $avail_last_posting =strtotime( $zone_pref_details['current_zone']['date_of_retirement']) - $today ;
        
        $years = floor($avail_last_posting / (365*60*60*24));
        $months = floor(($avail_last_posting - $years * 365*60*60*24) / (30*60*60*24));
        // $retirement_days_left = floor(($avail_last_posting - $years * 365*60*60*24 - $months*30*60*60*24)/ (60*60*24));   
        $retirement_days_left= round($avail_last_posting / (60 * 60 * 24));

       //print_r($zone_pref_details['just_prev_zone']['zone_id']); exit;


        $zone_service_max_days= 930; //Zone:: max('min_service_days')


        if($posting_days_span >= $zone_pref_details['current_zone']['min_service_days']-30   &&   $zone_service_max_days >= $retirement_days_left )
        {
           $zone_pref_details['zones']= Zone::orderBy('zone_name')
                                               ->get();

                                               
        }
        //for second posting in carrier i.e $zone_pref_details['just_prev_zone']['zone_id'] == null , exclude current zone & jusat next prioriy zone
        else if($count==1   &&  $posting_days_span >= $zone_pref_details['current_zone']['min_service_days']-30)
        {

            $zone_pref_details['zones']= Zone::where('id','<>',$zone_pref_details['current_zone']['zone_id'])
                                                ->orderBy('zone_name')
                                                ->get();
        }  
        else if($posting_days_span >= $zone_pref_details['current_zone']['min_service_days']-30)
        {
            $zone_pref_details['zones']= Zone::where([
                                                        ['id','<>',$zone_pref_details['current_zone']['zone_id']],
                                                        ['id','<>',$zone_pref_details['just_prev_zone']['zone_id']]
                                                    ])
                                                    ->orderBy('zone_name')
                                                    ->get();
        }
        

// print_r( $zone_pref_details);exit;
                return view('zone_pref_jr.index',compact('zone_pref_details'));
                //return($jo_posting);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $response = [
            'judicial_officer_posting' => []
        ];
        $statusCode = 200;
        $state = null;

        if (!ctype_digit(strval($id))) {
            $response = array(
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }
        $request['created_by'] = Auth::user()->id;
        $this->validate($request, [
            'judicial_officer_id' => array('required', 'exists:judicial_officers,id'),
            'designation_id' => array('required', 'exists:designations,id'),
            'court_id' => array('required', 'exists:courts,id'),
            'court_complex_id' => array('required', 'exists:court_complexes,id'),
            'mode_id' => array('required', 'exists:modes,id'),
            'from_date' => array('required', 'date', 'date_format:d-M-Y'),
            'to_date' => array('date', 'date_format:d-M-Y'),
            'created_by' => array('required', 'exists:users,id'),
        ]);

        try {
            $judicial_officer_posting = JudicialOfficerPosting::find($id);
            if (!$judicial_officer_posting) {
                throw new \Exception('Invalid Input');
            }
            $judicial_officer_posting->judicial_officer_id = $request->judicial_officer_id;
            $judicial_officer_posting->designation_id = $request->designation_id;
            $judicial_officer_posting->court_id = $request->court_id;
            $judicial_officer_posting->court_complex_id = $request->court_complex_id;
            $judicial_officer_posting->mode_id = $request->mode_id;
            $judicial_officer_posting->from_date = $request->from_date;
            $judicial_officer_posting->to_date = $request->to_date;
            $judicial_officer_posting->created_by = $request->created_by;
            $judicial_officer_posting->save();

            $response = array(
                'judicial_officer_posting' => $judicial_officer_posting
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
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $response = [
            'judicial_officer_posting' => []
        ];
        $statusCode = 200;
        $judicial_officer_posting = null;

        try {
            if (!ctype_digit(strval($id))) {
                throw new \Exception('Please check input');
            }
            $judicial_officer_posting = JudicialOfficerPosting::find($id);
            if (!empty($judicial_officer_posting)) {
                $judicial_officer_posting->delete();
            }
            $response = array(
                'judicial_officer_posting' => $judicial_officer_posting
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

}
