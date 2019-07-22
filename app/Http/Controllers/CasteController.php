<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Caste;
use Auth;


class CasteController extends Controller
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
        $castes = array();

        try {

            $castes = Caste::all();


            $response = array(
                'castes' => $castes
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
        $castes = array();

        try {
            $draw = 1;
            $records_total = 0;

            //$castes = Caste::all();
            //$records_total = $castes->count();
            $records_total =Caste::count();

            $draw = $request->draw;
            $offset = $request->start;
            $length = $request->length;
            $search = $request->search["value"];

            $order = $request->order;

            $filtered = Caste::where('caste_name', 'ilike', '%' . $search . '%');

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
                "castes" => $page_displayed,
            );
        } catch (\Exception $e) {
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => 0,
                "castes" => [],
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
            'caste' => []
        ];
        $statusCode = 200;
        $caste = null;

        $this->validate($request, [
            'caste_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:castes,caste_name')
        ]);


        try {
            $caste_name = strtoupper($request->input('caste_name'));
            $request['created_by'] = Auth::user()->id;

            $caste = Caste::create($request->all());
            $response = array(
                'caste' => $caste
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
        $castes = array ();
        
        try {
            $draw=1;
            $records_total=0;
            
            $castes = Caste::all();
            $records_total=$castes->count();
            
            $draw=$request->draw;
            $offset=$request->start;
            $length=$request->length;
            $search=$request->search["value"];
            
            $order=$request->order;
            
            $filtered = Caste::where('caste_name', 'ilike','%'.$search.'%');
            
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
            'caste' => []
        ];
        $statusCode = 200;
        $caste = null;

        try {
            if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
                throw new \Exception('Invalid Input');
            }
            $caste = Caste::find($id);
            $response = array(
                'caste' => $caste
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
            'caste' => []
        ];
        $statusCode = 200;
        $caste = null;
        if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
            $response = array(
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }
        
        $this->validate($request, [
            'caste_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:castes,caste_name,'.$id.',id'),
        ]);
        
        try {
            
            $caste = Caste::find($id);
            if (!$caste) {
                throw new \Exception('Invalid Input');
            }
            $caste->caste_name = $request->caste_name;
            $caste->created_by = Auth::user()->id;
            $caste->save();

            $response = array(
                'caste' => $caste
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
            'caste' => []
        ]; // Should be changed #25
        $statusCode = 200;
        $caste = null; // Should be changed #26
        try {
            if (!is_numeric($id) || intval($id) != $id || !ctype_digit(strval($id))) {
                throw new \Exception('Please check input');
            }
            $caste = Caste::find($id); // Should be changed #27

            //arpan
            if ($caste->judicial_officers->count() > 0) { //Should be changed #28
                //child row exists
                $response = array(
                    'exception' => true,
                    'exception_message' => "Records of caste: " . $caste->caste_name . " exists in Judicial Officers table.", //Should be changed #29
                );
                $statusCode = 400;
            } else {

                if (!empty($caste)) { // Should be changed #30
                    $caste->delete();
                    //$caste = $caste->forceDelete ( $id ); // Should be changed #31 //only for admin elements.
                }
                $response = array(
                    'caste' => $caste
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
