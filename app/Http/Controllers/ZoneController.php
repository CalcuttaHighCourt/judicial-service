<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Zone;
use App\ZoneSubdivision;
use Carbon\Carbon;
use Auth;
use DB;

class ZoneController extends Controller
{

    

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
       
    {
        $response = [ ];
		$statusCode = 200;
		$zone = array ();
		
		try {
			
			$zone = Zone::all ();

			
			$response = array (
					'zone' => $zone 
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
         * Store a newly created resource in storage.
         *
         * @param  \Illuminate\Http\Request  $request
         * @return \Illuminate\Http\Response
         */
        public function store(Request $request) {
          
    
            $this->validate($request, [
                'zone_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:zones,zone_name'),
                'subdivision' => array('required', 'exists:subdivisions,id'),
                'min_service_days' => array('required','integer')
            ]);
    
                $zone_name = strtoupper($request->input('zone_name'));
                $subdivision = $request->input('subdivision');
                $min_service_days = $request->input('min_service_days');
                $created_by = Auth::user()->id;

                Zone::insert([
                    'zone_name' => $zone_name,
                    'created_by' => $created_by,
                    'min_service_days' =>$min_service_days,
                    'created_at'=>Carbon::today(),
                    'updated_at'=>Carbon::today()
                ]);

                $zone_id = Zone::max('id');
               
              
                
                for($i=0; $i<sizeof($subdivision); $i++){
                    ZoneSubdivision::insert([
                        'zone_id'=>$zone_id,
                        'subdivision_id'=>$subdivision[$i],
                        'created_by' => $created_by,
                        'created_at'=>Carbon::today(),
                        'updated_at'=>Carbon::today()
                    ]);
               
                }
                return 1;   
    }
            
        public function index_for_datatable(Request $request) {
            $response = [ ];
            $statusCode = 200;
            $zones = array ();
            
            try {
                $draw=1;
                $records_total=0;
                
                $zones = Zone::all();
                $records_total=$zones->count();
                
                $draw=$request->draw;
                $offset=$request->start;
                $length=$request->length;
                $search=$request->search["value"];
                
                $order=$request->order;
                
                $filtered = Zone::where('zone_name', 'ilike','%'.$search.'%');
                
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
                'zone' => [ ] 
            ];
            $statusCode = 200;
            $zone = null;
            
            try {
                if( !ctype_digit(strval($id))){
                    throw new \Exception('Invalid Input');
                }
                $zone = Zone::find($id);
                $response = array (
                        'zone' => $zone 
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
         * Update the specified resource in storage.
         *
         * @param  \Illuminate\Http\Request  $request
         * @param  int  $id
         * @return \Illuminate\Http\Response
         */
        public function update(Request $request, $id)
        {
            $response = [ 
                'zone' => [ ] 
            ];
            $statusCode = 200;
            $zone = null;

            if(!ctype_digit(strval($id))){
                $response = array (
                    'exception' => true,
                    'exception_message' => 'Invalid Input'
                );

                $statusCode = 400;
                return response ()->json ( $response, $statusCode );
            }
            
            try {            
                $zone = Zone::find($id);
                if(!$zone){
                    throw new \Exception('Invalid Input');
                }

                
                $zone->zone_name = $request->zone_name;
                $zone->created_by = Auth::user()->id;
                
                $zone->save();
                
                $response = array (
                    'zone' => $zone 
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
         * Remove the specified resource from storage.
         *
         * @param  int  $id
         * @return \Illuminate\Http\Response
         */
    //     public function destroy($id){
        //
    //} 
}
