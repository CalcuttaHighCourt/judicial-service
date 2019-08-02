<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Religion;
use Auth;


class ReligionController extends Controller
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
        $religions = array();

        try {

            $religions = Religion::all();


            $response = array(
                'religions' => $religions
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
        $religions = array();

        try {
            $draw = 1;
            $records_total = 0;

            //$religions = Religion::all();
            //$records_total = $religions->count();
            $records_total = Religion::count();

            $draw = $request->draw;
            $offset = $request->start;
            $length = $request->length;
            $search = $request->search["value"];

            $order = $request->order;

            $filtered = Religion::where('religion_name', 'ilike', '%' . $search . '%');

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
                "religions" => $page_displayed,
            );
        } catch (\Exception $e) {
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => 0,
                "religions" => [],
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
            'religion' => []
        ];
        $statusCode = 200;
        $religion = null;

        $this->validate($request, [
            'religion_name' => array('required', 'unique:religions,religion_name')
        ]);
            

        try {
            $religion_name = strtoupper($request->input('religion_name'));        
            $request['created_by'] = Auth::user()->id;

            $religion = Religion::create($request->all());
            $response = array(
                'religion' => $religion
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
        $religions = array ();
        
        try {
            $draw=1;
            $records_total=0;
            
            $religions = Religion::all();
            $records_total=$religions->count();
            
            $draw=$request->draw;
            $offset=$request->start;
            $length=$request->length;
            $search=$request->search["value"];
            
            $order=$request->order;
            
            $filtered = Religion::where('religion_name', 'ilike','%'.$search.'%');
            
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
            'religion' => []
        ];
        $statusCode = 200;
        $religion = null;

        try {
            if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
                throw new \Exception('Invalid Input');
            }
            $religion = Religion::find($id);
            $response = array(
                'religion' => $religion
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
            'religion' => []
        ];
        $statusCode = 200;
        $religion = null;
        
        if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
            $response = array(
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }
        
        $this->validate($request, [
            'religion_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:religions,religion_name,'.$id.',id'),
        ]);

        try {
            $religion = Religion::find($id);
            if (!$religion) {
                throw new \Exception('Invalid Input');
            }
            $religion->religion_name = $request->religion_name;
            $religion->created_by = Auth::user()->id;
            $religion->save();

            $response = array(
                'religion' => $religion
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
            'religion' => []
        ]; // Should be changed #25
        $statusCode = 200;
        $religion = null; // Should be changed #26
        try {
            if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
                throw new \Exception('Please check input');
            }
            $religion = Religion::find($id); // Should be changed #27

            //arpan
            if ($religion->judicial_officers->count() > 0) { //Should be changed #28
                //child row exists
                $response = array(
                    'exception' => true,
                    'exception_message' => "Records of religion: " . $religion->religion_name . " exists in Judicial Officers table.", //Should be changed #29
                );
                $statusCode = 400;
            } else {

                if (!empty($religion)) { // Should be changed #30
                    $religion->delete();
                    //$religion = $religion->forceDelete ( $id ); // Should be changed #31 //only for admin elements.
                }
                $response = array(
                    'religion' => $religion
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
