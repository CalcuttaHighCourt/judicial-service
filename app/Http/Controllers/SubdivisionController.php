<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Subdivision;
use App\District;
use Auth;


class SubdivisionController extends Controller
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
		$subdivision = array ();
		
		try {
			
			$subdivision = Subdivision::all ();

			
			$response = array (
					'subdivision' => $subdivision 
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

    public function index_for_datatable(Request $request) {
		$response = [ ];
		$statusCode = 200;
		$subdivisions = array ();
		
		try {
			$draw=1;
			$records_total=0;
			
            $subdivisions = Subdivision::all();
            $records_total=$subdivisions->count();
            
			$draw=$request->draw;
			$offset=$request->start;
			$length=$request->length;
			$search=$request->search["value"];
			
			$order=$request->order;
			
			$filtered = Subdivision::where('subdivision_name', 'ilike','%'.$search.'%')
                            ->join('districts', 'subdivisions.district_id', '=', 'districts.id')
                                ->select('subdivisions.*', 'districts.district_name as district_name');
			
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
					"subdivisions" => $page_displayed,
			);
		} catch ( \Exception $e ) {
			$response = array (
					"draw" => $draw,
					"recordsTotal" => $records_total,
					"recordsFiltered" => 0,
					"subdivisions" => [],					
			);			
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
        public function store(Request $request)
        {
            $response = [ 
                'subdivision' => [ ] 
            ];
            $statusCode = 200;
            $district = null;

            $this->validate ( $request, [ 
                    'subdivision_name' => array('required','max:75','regex:/^[\pL\d\s]+$/u') ,
                    'district_id' => array('required')
                    ] );

            try {
                $request['created_by'] = Auth::user()->id;

                $subdivision = Subdivision::create ( $request->all () );
                $response = array (
                        'subdivision' => $subdivision 
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
        public function show($id)
        {
            $response = [ 
                'subdivision' => [ ] 
            ];
            $statusCode = 200;
            $district = null;
            
            try {
                if( !ctype_digit(strval($id))){
                    throw new \Exception('Invalid Input');
                }
                $subdivision = Subdivision::find($id);
                $response = array (
                        'subdivision' => $subdivision 
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
                'subdivision' => [ ] 
            ];
            $statusCode = 200;
            $subdivision = null;

            if(!ctype_digit(strval($id))){
                $response = array (
                    'exception' => true,
                    'exception_message' => 'Invalid Input'
                );

                $statusCode = 400;
                return response ()->json ( $response, $statusCode );
            }

            $this->validate($request, [
                
               
                'subdivision_name' => array('required', 'unique:subdivisions,subdivision_name'),
                'disrtict_id' => array('required'),
            ]);
            
            try {            
                $subdivision = Subdivision::find($id);
                if(!$subdivision){
                    throw new \Exception('Invalid Input');
                }
                
                $subdivision->subdivision_name = $request->subdivision_name;
               
                $subdivision->created_by = Auth::user()->id;
                
                $subdivision->save();
                
                $response = array (
                    'subdivision' => $subdivision 
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


        public function load_index_page(){
            $district = District::orderBy('district_name')->get();
            return view('subdivisions.index',compact('districts'));
        }

        /**
         * Remove the specified resource from storage.
         *
         * @param  int  $id
         * @return \Illuminate\Http\Response
         */
        public function destroy($id) {
            $response = [
                'subdivision' => []
            ]; // Should be changed #25
            $statusCode = 200;
            $subdivision = null; // Should be changed #26
            try {
                if ( !ctype_digit(strval($id))) {
                    throw new \Exception('Please check input');
                }
                $subdivision = Subdivision::find($id); // Should be changed #27
    
                
                    if (!empty($subdivision)) { // Should be changed #30
                        $subdivision->delete();
                        //$subdivision = $subdivision->forceDelete ( $id ); // Should be changed #31 //only for admin elements.
                    }
                    $response = array(
                        'subdivision' => $subdivision
                    ); // Should be changed #32
                
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
