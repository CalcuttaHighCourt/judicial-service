<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\JudicialOfficer;
use App\Dairy;
use Carbon\Carbon;
use Auth;


class JudicialOfficerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $response = [];
        $statusCode = 200;
        $judicial_officers = array();

        try {

            $judicial_officers = JudicialOfficer::all();


            $response = array(
                'judicial_officers' => $judicial_officers
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



    public function index2(Request $request) {
        $response = [];
        $statusCode = 200;
        $judicial_officers = array();

        try {
            $draw = 1;
            $records_total = 0;

            $judicial_officers = JudicialOfficer::all();
            $records_total = $judicial_officers->count();

            $draw = $request->draw;
            $offset = $request->start;
            $length = $request->length;
            $search = $request->search["value"];

            $order = $request->order;

            $filtered = JudicialOfficer::where('judicial_officers.officer_name', 'ilike', '%' . $search . '%')
                                        ->join('districts','districts.id','=','judicial_officers.home_district_id')
                                        ->join('states','states.id','=','judicial_officers.home_state_id')
                                        ->join('castes','castes.id','=','judicial_officers.caste_id')
                                        ->join('religions','religions.id','=','judicial_officers.religion_id')
                                        ->join('recruitment_batches','recruitment_batches.id','=','judicial_officers.recruitment_batch_id')
                                        ->select('judicial_officers.*','districts.district_name','states.state_name','castes.caste_name','religions.religion_name','recruitment_batches.recruitment_batch_desc');

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
                "judicial_officers" => $page_displayed,
            );
        } catch (\Exception $e) {
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => 0,
                "judicial_officers" => [],
            );
        } finally {
            return response()->json($response, $statusCode);
        }
    }

    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    // public function create()
    // {
    //     //
    // }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $response = [
            'judicial_officer' => []
        ];
        $statusCode = 200;
        $judicial_officer = null;

        $this->validate($request, [
            'officer_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:judicial_officers,judicial_officer_name')
        ]);


        try {
            $officer_name = strtoupper($request->input('officer_name'));
            $request['created_by'] = Auth::user()->id;

            $judicial_officer = JudicialOfficer::create($request->all());
            $response = array(
                'judicial_officer' => $judicial_officer
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

     //Adding new STORAGE
     public function store_worksheet(Request $request){

        $this->validate ( $request, [                     
            'date' => 'required',
            'details' => 'required'                   

        ] );
        $date=$request->input('date');
        $jo_code =Auth::user()->jo_code;
        $textarea=$request->input('details');

    // $count=Dairy::where([['date_of_schedule',$date],['jo_code',$jo_code]])->count();

        Dairy::where([['date_of_schedule',$date],['jo_code',$jo_code]])->delete();
          
        Dairy::insert([
            'jo_code'=>$jo_code,
            'date_of_schedule'=>$date,
            'description'=>$textarea,
            'created_at'=>Carbon::today(),
            'updated_at'=>Carbon::today()
            ]);
        return 1;
    }

    public function show_worksheet(Request $request){

        $this->validate ( $request, [                     
            'date' => 'required'
        ]);
        $date=Carbon::parse($request->input('date'))->format('Y-d-m');
        $jo_code =Auth::user()->jo_code;
        $data=Dairy::where([
                                ['date_of_schedule',$date],
                                ['jo_code',$jo_code]
                            ])
                    ->select('description')
                    ->get();
        return $data;
        
    }

    public function index_for_datatable(Request $request) {
        $response = [ ];
        $statusCode = 200;
        $judicial_officers = array ();
        
        try {
            $draw=1;
            $records_total=0;
            
            $judicial_officers = JudicialOfficer::all();
            $records_total=$judicial_officers->count();
            
            $draw=$request->draw;
            $offset=$request->start;
            $length=$request->length;
            $search=$request->search["value"];
            
            $order=$request->order;
            
            $filtered = JudicialOfficer::where('judicial_officer_name', 'ilike','%'.$search.'%');
            
            $records_filtered_count=$filtered->count();
            
            $ordered=$filtered;
            
            for($i=0;$i<count($order);$i++){
                $ordered=$ordered->orderBy($request->columns[$order[$i]['column']]['data'],strtoupper($order[$i]['dir']));				
            }
            
            $page_displayed=$ordered->get()->slice($offset,$length,true)->values();
            
            $response = array (
                    "draw" => $draw,
                    "recordsTotal" => $records_total,
                    "recordsFiltered" => $records_filtered_count,
                    "zones" => $page_displayed,
            );
        } catch ( \Exception $e ) {
            $response = array (
                    "draw" => $draw,
                    "recordsTotal" => $records_total,
                    "recordsFiltered" => 0,
                    "zones" => [],					
            );			
        } finally{
            return response ()->json ( $response, $statusCode );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $response = [
            'judicial_officer' => []
        ];
        $statusCode = 200;
        $judicial_officer = null;

        try {
            if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
                throw new \Exception('Invalid Input');
            }
            $judicial_officer = JudicialOfficer::find($id);
            $response = array(
                'judicial_officer' => $judicial_officer
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
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function edit($id)
    // {
    //     //
    // }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $response = [
            'judicial_officer' => []
        ];
        $statusCode = 200;
        $judicial_officer = null;
        
        if (!ctype_digit(strval($id))) {
            $response = array(
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }
        
        $this->validate($request, [
            'id' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:judicial_officers,id,'.$id.',id')
        ]);

        try {
            $judicial_officer = JudicialOfficer::find($id);
            if (!$judicial_officer) {
                throw new \Exception('Invalid Input');
            }
            $judicial_officer->id = $request->id;
            $judicial_officer->officer_name = $request->officer_name;
            $judicial_officer->guardian_name = $request->guardian_name;
            $judicial_officer->gurdian_relation = $request->gurdian_relation;
            $judicial_officer->jo_code = $request->jo_code;
            $judicial_officer->date_of_birth = $request->date_of_birth;
            $judicial_officer->date_of_joining = $request->date_of_joining;
            $judicial_officer->date_of_confirmation = $request->date_of_confirmation;
            $judicial_officer->date_of_retirement = $request->date_of_retirement;
            $judicial_officer->present_address = $request->present_address;
            $judicial_officer->permanent_address = $request->permanent_address;
            $judicial_officer->hometown = $request->hometown;
            $judicial_officer->home_district_id = $request->home_district_id;
            $judicial_officer->home_state_id = $request->home_state_id;
            $judicial_officer->caste_id = $request->caste_id;
            $judicial_officer->religion_id = $request->religion_id;
            $judicial_officer->recruitment_batch_id = $request->recruitment_batch_id;
            $judicial_officer->aadhaar_no  = $request->aadhaar_no;
            $judicial_officer->pan_no = $request->pan_no;
            $judicial_officer->pf_no = $request->pf_no; 
            $judicial_officer->blood_group = $request->blood_group; 
            $judicial_officer->identification_marks_1 = $request->identification_marks_1; 
            $judicial_officer->identification_marks_2 = $request->identification_marks_2; 
            $judicial_officer->mobile_no_1 = $request->mobile_no_1; 
            $judicial_officer->mobile_no_2 = $request->mobile_no_2; 
            $judicial_officer->mobile_no_3 = $request->mobile_no_3; 
            $judicial_officer->email_id_1 = $request->email_id_1; 
            $judicial_officer->email_id_2 = $request->email_id_2; 
            $judicial_officer->email_id_3 = $request->email_id_3; 
            $judicial_officer->reporting_officer_id = $request->reporting_officer_id; 
            $judicial_officer->reviewing_officer_id = $request->reviewing_officer_id; 





            // $judicial_officer->created_by = Auth::user()->id;
            $judicial_officer->save();

            $response = array(
                'judicial_officer' => $judicial_officer
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

    public function destroy($id)
    {
        $response = [
            'judicial_officer' => []
        ]; 
        $statusCode = 200;
        $judicial_officer = null; 
        
        try {
            if ( !ctype_digit(strval($id))) {
                throw new \Exception('Please check input');
            }
            $judicial_officer = JudicialOfficer::find($id); // Should be changed #27

            //arpan
            if ($judicial_officer->subordinate_officers->count() > 0) { //Should be changed #28
                //child row exists
                $response = array(
                    'exception' => true,
                    'exception_message' => "Records of judicial_officer: " . $judicial_officer->judicial_officer_name . " exists in other table.", //Should be changed #29
                );
                $statusCode = 400;
            } 
            else {

                if (!empty($judicial_officer)) { // Should be changed #30
                    $judicial_officer->delete();
                    //$judicial_officer = $judicial_officer->forceDelete ( $id ); // Should be changed #31 //only for admin elements.
                }
                //print_r($judicial_officer);exit;
                $response = array(
                    'judicial_officer' => $judicial_officer
                ); // Should be changed #32
            }
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
