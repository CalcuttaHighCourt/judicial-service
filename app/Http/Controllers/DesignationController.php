<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Designation;
use Auth;


class DesignationController extends Controller
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
        $designations = array();

        try {

            $designations = Designation::all();


            $response = array(
                'designations' => $designations
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
        $designations = array();

        try {
            $draw = 1;
            $records_total = 0;

            // $designations = Designation::all();
            // $records_total = $designations->count();
            $records_total =Designation::count();

            $draw = $request->draw;
            $offset = $request->start;
            $length = $request->length;
            $search = $request->search["value"];

            $order = $request->order;

            $filtered = Designation::where('designation_name', 'ilike', '%' . $search . '%');

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
                "designations" => $page_displayed,
            );
        } catch (\Exception $e) {
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => 0,
                "designations" => [],
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
            'designation' => []
        ];
        $statusCode = 200;
        $designation = null;

        $this->validate($request, [
            'designation_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:designations,designation_name'),
            'rank_id' => array('required')
            ]);


        try {            
            $request['created_by'] = Auth::user()->id;

           //echo $request ; exit;
            $designation = Designation::create($request->all());
            $response = array(
                'designation' => $designation
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
        $designations = array ();
        
        try {
            $draw=1;
            $records_total=0;
            
            $designations = Designation::all();
            $records_total=$designations->count();
            
            $draw=$request->draw;
            $offset=$request->start;
            $length=$request->length;
            $search=$request->search["value"];
            
            $order=$request->order;
            
            $filtered = Designation::where('designation_name', 'ilike','%'.$search.'%');
            
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
            'designation' => []
        ];
        $statusCode = 200;
        $designation = null;

        try {
            if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
                throw new \Exception('Invalid Input');
            }
            $designation = Designation::find($id);
            $response = array(
                'designation' => $designation
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
            'designation' => []
        ];
        $statusCode = 200;
        $designation = null;
        
        if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
            $response = array(
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }
        
        $this->validate($request, [
            'designation_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:designations,designation_name,'.$id.',id'),
        ]);

        try {
            $designation = Designation::find($id);
            if (!$designation) {
                throw new \Exception('Invalid Input');
            }
            $designation->designation_name = $request->designation_name;
            $designation->created_by = Auth::user()->id;
            $designation->save();

            $response = array(
                'designation' => $designation
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
            'designation' => []
        ]; // Should be changed #25
        $statusCode = 200;
        $designation = null; // Should be changed #26

        if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
            throw new \Exception('Please check input');
        }
        $designation = Designation::find($id); // Should be changed #27



        if ($designation->judicial_officer_postings->count() > 0) { //Should be changed #28
            //child row exists
            $response = array(
                'exception' => true,
                'exception_message' => "Records of designation: " . $designation->designation_name . " exists in Judicial Officers Posting table.", //Should be changed #29
            );
            $statusCode = 400;
        } else {

            if (!empty($designation)) { // Should be changed #30
                $designation->delete();
                //$designation = $designation->forceDelete ( $id ); // Should be changed #31 //only for admin elements.
            }
            $response = array(
                'designation' => $designation
            ); // Should be changed #32
        }


        return response()->json($response, $statusCode);

        // try {
        //     if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
        //         throw new \Exception('Please check input');
        //     }
        //     $designation = Designation::find($id); // Should be changed #27

           
        //     //arpan
        //     if ($designation->judicial_officer_postings->count() > 0) { //Should be changed #28
        //         //child row exists
        //         $response = array(
        //             'exception' => true,
        //             'exception_message' => "Records of designation: " . $designation->designation_name . " exists in Judicial Officers Posting table.", //Should be changed #29
        //         );
        //         $statusCode = 400;
        //     } else {

        //         if (!empty($designation)) { // Should be changed #30
        //             $designation->delete();
        //             //$designation = $designation->forceDelete ( $id ); // Should be changed #31 //only for admin elements.
        //         }
        //         $response = array(
        //             'designation' => $designation
        //         ); // Should be changed #32
        //     }
        // } catch (\Exception $e) {
        //     $response = array(
        //         'exception' => true,
        //         'exception_message' => $e->getMessage()
        //     );
        //     $statusCode = 400;
        // } finally {
        //     return response()->json($response, $statusCode);
        // }
    }
}
