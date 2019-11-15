<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Court;
use Auth;

class CourtController extends Controller
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
        $courts = array();

        try {
            $courts = Court::all();
            $response = array(
                'courts' => $courts
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
        $courts = array();

        try {
            $draw = 1;
            $records_total = 0;

            $courts = Court::all();
            $records_total = $courts->count();

            $draw = $request->draw;
            $offset = $request->start;
            $length = $request->length;
            $search = $request->search["value"];

            $order = $request->order;

            $filtered = Court::where('court_name', 'ilike', '%'.$search.'%')
                                ->orWhere('subdivision_name', 'ilike', '%'.$search.'%')
                                ->join('subdivisions', 'courts.subdivision_id', '=', 'subdivisions.id')
                                ->select('courts.*', 'subdivisions.subdivision_name as subdivision_name');

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
                "courts" => $page_displayed,
            );
        } catch (\Exception $e) {
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => 0,
                "courts" => [],
            );
        } finally {
            return response()->json($response, $statusCode);
        }
    }

    
    public function store(Request $request)
    {
        $response = [
            'court' => []
        ];
        $statusCode = 200;
        $court = null;

        $this->validate($request, [
            'court_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:courts,court_name'),
            'subdivision_id' => array('required','exists:subdivisions,id')
        ]);


        try {
            $court_name = strtoupper($request->input('court_name'));
            $request['created_by'] = Auth::user()->id;

            $court = Court::create($request->all());
            $response = array(
                'court' => $court
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

    
    public function show($id)
    {
        $response = [ 
            'court' => [ ] 
        ];
        $statusCode = 200;
        $court = null;
        
        try {
            if(!ctype_digit(strval($id))){
		        throw new \Exception('Invalid Input');
		    }
			$court = Court::find($id);
			$response = array (
					'court' => $court 
			);        
        } catch ( \Exception $e ) {
            $response = array (
                    'exception' => true,
                    'exception_message' => $e->getMessage () 
            );
            $statusCode = 400;
        } finally{
            return response()->json ($response, $statusCode);           
        }
    }

    
    public function update(Request $request, $id)
    {
        $response = [ 
            'court' => [ ] 
        ];
        $statusCode = 200;
        $court = null;

        if(!ctype_digit(strval($id))){
            $response = array (
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }

        $this->validate($request, [
            'court_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:courts,court_name,'.$id.',id'),
            'subdivision_id' => array('required','integer','exists:subdivisions,id'),
        ]);
        
        try {            
            $court = Court::find($id);
            if(!$court){
                throw new \Exception('Invalid Input');
            }

            $request['created_by'] = Auth::user()->id;
            
            $court->court_name = $request->court_name;
            $court->subdivision_id = $request->subdivision_id;
            $court->created_by = $request->created_by;
            
            $court->save();
            
            $response = array (
                'court' => $court 
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

    
    public function destroy($id)
    {
        $response = [
            'court' => []
        ]; 
        $statusCode = 200;
        $court = null; 

        try {
            if (!ctype_digit(strval($id))) {
                throw new \Exception('Please check input');
            }
            $court = Court::find($id); 

            if ($court->judicial_officer_postings->count() > 0) {
                $response = array(
                    'exception' => true,
                    'exception_message' => "Record(s) of Court: " . $court->court_name . " exists in Judicial Officer Posting table.", 
                );
                $statusCode = 400;
            } 
            else {
                if(!empty($court)) { 
                    $court->delete();                    
                }
                $response = array(
                    'court' => $court
                ); 
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
