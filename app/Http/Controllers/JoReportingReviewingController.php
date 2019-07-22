<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\JoReportingReviewing;
use Auth;


class JoReportingReviewingController extends Controller
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
        $jo_reporting_reviewings = array();

        try {

            $jo_reporting_reviewings = JoReportingReviewing::all();


            $response = array(
                'jo_reporting_reviewings' => $jo_reporting_reviewings
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
        $jo_reporting_reviewings = array();

        try {
            $draw = 1;
            $records_total = 0;

            $jo_reporting_reviewings = JoReportingReviewing::  join('judicial_officers as jo','jo.id','=','jo_reporting_reviewings.judicial_officer_id')
                                                                ->join('judicial_officers as jo_reporting','jo_reporting.id','=','jo_reporting_reviewings.reporting_officer_id')
                                                                ->join('judicial_officers as jo_reviewing','jo_reviewing.id','=','jo_reporting_reviewings.reviewing_officer_id')                                                                
                                                                ->select('jo.id as id', 'jo.officer_name as officer_name','jo_reporting.officer_name as reporting_officer_name','jo_reporting.id as reporting_officer_id', 'jo_reviewing.officer_name as reviewing_officer_name', 'jo_reviewing.id as reviewing_officer_id');


            $records_total = $jo_reporting_reviewings->count();

            $draw = $request->draw;
            $offset = $request->start;
            $length = $request->length;
            $search = $request->search["value"];

            $order = $request->order;

            $filtered = JoReportingReviewing::  join('judicial_officers as jo','jo.id','=','jo_reporting_reviewings.judicial_officer_id')
                                                ->join('judicial_officers as jo_reporting','jo_reporting.id','=','jo_reporting_reviewings.reporting_officer_id')
                                                ->join('judicial_officers as jo_reviewing','jo_reviewing.id','=','jo_reporting_reviewings.reviewing_officer_id')                                                                
                                                ->where('jo.officer_name', 'ilike', '%' . $search . '%')
                                                ->orWhere('jo_reporting.officer_name', 'ilike', '%' . $search . '%')
                                                ->orWhere('jo_reviewing.officer_name', 'ilike', '%' . $search . '%')
                                                ->select('jo.id as id', 'jo.officer_name as officer_name','jo_reporting.officer_name as reporting_officer_name','jo_reporting.id as reporting_officer_id', 'jo_reviewing.officer_name as reviewing_officer_name', 'jo_reviewing.id as reviewing_officer_id');
                                                

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
                "jo_reporting_reviewings" => $page_displayed,
            );
        } catch (\Exception $e) {
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => 0,
                "jo_reporting_reviewings" => [],
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
            'jo_reporting_reviewing' => []
        ];
        $statusCode = 200;
        $jo_reporting_reviewing = null;

        $this->validate($request, [
            'jo_reporting_reviewing_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:jo_reporting_reviewings,jo_reporting_reviewing_name')
        ]);


        try {
            $jo_reporting_reviewing_name = strtoupper($request->input('jo_reporting_reviewing_name'));
            $request['created_by'] = Auth::user()->id;

            $jo_reporting_reviewing = JoReportingReviewing::create($request->all());
            $response = array(
                'jo_reporting_reviewing' => $jo_reporting_reviewing
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
        $response = [ ];
        $statusCode = 200;
        $jo_reporting_reviewings = array ();
        
        try {
            $draw=1;
            $records_total=0;
            
            $jo_reporting_reviewings = JoReportingReviewing::all();
            $records_total=$jo_reporting_reviewings->count();
            
            $draw=$request->draw;
            $offset=$request->start;
            $length=$request->length;
            $search=$request->search["value"];
            
            $order=$request->order;
            
            $filtered = JoReportingReviewing::where('jo_reporting_reviewing_name', 'ilike','%'.$search.'%');
            
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
            'jo_reporting_reviewing' => []
        ];
        $statusCode = 200;
        $jo_reporting_reviewing = null;

        try {
            if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
                throw new \Exception('Invalid Input');
            }
            $jo_reporting_reviewing = JoReportingReviewing::find($id);
            $response = array(
                'jo_reporting_reviewing' => $jo_reporting_reviewing
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
            'jo_reporting_reviewing' => []
        ];
        $statusCode = 200;
        $jo_reporting_reviewing = null;
        
        if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
            $response = array(
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }
        
        $this->validate($request, [
            'id' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'exists:judicial_officers,id'),
            'reporting_officer_id' => array('required', 'exists:judicial_officers,id'),
            'reviewing_officer_id' => array('required', 'exists:judicial_officers,id')           
        ]);

        try {
            $judicial_officer_id =  $request->input('id');
            $reporting_officer_id = $request->input('reporting_officer_id');
            $reviewing_officer_id = $request->input('reviewing_officer_id');

            $jo_reporting_reviewing = JoReportingReviewing::find($judicial_officer_id);
            if (!$jo_reporting_reviewing) {
                throw new \Exception('Invalid Input');
            }

            $jo_reporting_reviewing->reporting_officer_id = $request->reporting_officer_id;
            $jo_reporting_reviewing->reviewing_officer_id = $request->reviewing_officer_id;
            
            $jo_reporting_reviewing->created_by = Auth::user()->id;
            $jo_reporting_reviewing->save();

            $response = array(
                'jo_reporting_reviewing' => $jo_reporting_reviewing
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
            'jo_reporting_reviewing' => []
        ]; // Should be changed #25
        $statusCode = 200;
        $jo_reporting_reviewing = null; // Should be changed #26
        try {
            if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
                throw new \Exception('Please check input');
            }
            $jo_reporting_reviewing = JoReportingReviewing::find($id); // Should be changed #27

            //arpan
            if ($jo_reporting_reviewing->judicial_officers->count() > 0) { //Should be changed #28
                //child row exists
                $response = array(
                    'exception' => true,
                    'exception_message' => "Records of jo_reporting_reviewing: " . $jo_reporting_reviewing->jo_reporting_reviewing_name . " exists in Judicial Officers table.", //Should be changed #29
                );
                $statusCode = 400;
            } else {

                if (!empty($jo_reporting_reviewing)) { // Should be changed #30
                    $jo_reporting_reviewing->delete();
                    //$jo_reporting_reviewing = $jo_reporting_reviewing->forceDelete ( $id ); // Should be changed #31 //only for admin elements.
                }
                $response = array(
                    'jo_reporting_reviewing' => $jo_reporting_reviewing
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
