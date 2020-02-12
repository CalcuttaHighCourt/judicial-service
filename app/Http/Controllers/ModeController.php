<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Mode;
use Auth;


class ModeController extends Controller
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
            $modes = array();
    
            try {
    
                $modes = Mode::all();
    
    
                $response = array(
                    'modes' => $modes
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
        $response = [ ];
        $statusCode = 200;
        $modes = array ();
        
        try {
            $draw=1;
            $records_total=0;
            
            $modes = Mode::all();
            $records_total=$modes->count();
            
            $draw=$request->draw;
            $offset=$request->start;
            $length=$request->length;
            $search=$request->search["value"];
            
            $order=$request->order;
            
            $filtered = Mode::where('posting_mode', 'ilike','%'.$search.'%');
            
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
                    "modes" => $page_displayed,
            );
        } catch ( \Exception $e ) {
            $response = array (
                    "draw" => $draw,
                    "recordsTotal" => $records_total,
                    "recordsFiltered" => 0,
                    "modes" => [],					
            );			
        } finally{
            return response ()->json ( $response, $statusCode );
        }
    }
    public function store(Request $request)
        {
            $response = [ 
                'mode' => [ ] 
            ];
            $statusCode = 200;
            $mode = null;

            $this->validate ( $request, [ 
                    'posting_mode' => array('required','max:75','regex:/^[\pL\d\s]+$/u','unique:modes,posting_mode') 
            ] );

            try {
                $posting_mode = strtoupper($request->input('posting_mode'));
                $mode = Mode::create ($request->all ());

                $response = array (
                        'mode' => $mode 
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
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        $response = [
            'mode' => []
        ];
        $statusCode = 200;
        $mode = null;

        try {
            if (!ctype_digit(strval($id))) {
                throw new \Exception('Invalid Input');
            }
            $mode = Mode::find($id);
            $response = array(
                'mode' => $mode
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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $response = [
            'mode' => []
        ];
        $statusCode = 200;
        $mode = null;
        
        if (!ctype_digit(strval($id))) {
            $response = array(
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }
        
        $this->validate($request, [
            'posting_mode' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:modes,posting_mode,'.$id.',id'),
        ]);

        try {
            $mode = Mode::find($id);
            if (!$mode) {
                throw new \Exception('Invalid Input');
            }
            $mode->posting_mode = $request->posting_mode;
            //$mode->created_by = Auth::user()->id;
            $mode->save();

            $response = array(
                'mode' => $mode
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
            'mode' => []
        ]; 
        $statusCode = 200;
        $mode = null; 
        try {
            if (!ctype_digit(strval($id))) {
                throw new \Exception('Please check input');
            }
            $mode = Mode::find($id); 

          
                if (!empty($mode)) { 
                    $mode->delete();                    
                }
                $response = array(
                    'mode' => $mode
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
