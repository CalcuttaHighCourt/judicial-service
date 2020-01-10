<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Qualification;
use Auth;

class QualificationController extends Controller
{
    /**
         * Display a listing of the resource.
         *
         * @return \Illuminate\Http\Response
         */
        public function index() {
            $response = [];
            $statusCode = 200;
            $qualifications = array();
    
            try {
    
                $qualifications = Qualifications::all();
    
    
                $response = array(
                    'qualifications' => $qualifications
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
         * Store a newly created resource in storage.
         *
         * @param  \Illuminate\Http\Request  $request
         * @return \Illuminate\Http\Response
         */
        public function store(Request $request)
        {
            $response = [ 
                'qualification' => [ ] 
            ];
            $statusCode = 200;
            $qualification = null;

            $this->validate ( $request, [ 
                    'qualification_name' => array('required','max:75','unique:qualifications,qualification_name') 
            ] );

            try {
                $qualification_name = strtoupper($request->input('qualification_name'));
                $request['created_by'] = Auth::user()->id;
                $qualification = Qualification::create ($request->all ());

                $response = array (
                        'qualification' => $qualification 
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
            $qualifications = array ();
            
            try {
                $draw=1;
                $records_total=0;
                
                $qualifications = Qualification::all();
                $records_total=$qualifications->count();
                
                $draw=$request->draw;
                $offset=$request->start;
                $length=$request->length;
                $search=$request->search["value"];
                
                $order=$request->order;
                
                $filtered = Qualification::where('qualification_name', 'ilike','%'.$search.'%');
                
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
                        "qualifications" => $page_displayed,
                );
            } catch ( \Exception $e ) {
                $response = array (
                        "draw" => $draw,
                        "recordsTotal" => $records_total,
                        "recordsFiltered" => 0,
                        "qualifications" => [],					
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
                'qualification' => [ ] 
            ];
            $statusCode = 200;
            $qualification = null;
            
            try {
                if( !ctype_digit(strval($id))){
                    throw new \Exception('Invalid Input');
                }
                $qualification = Qualification::find($id);
                $response = array (
                        'qualification' => $qualification 
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
                'qualification' => [ ] 
            ];
            $statusCode = 200;
            $qualification = null;

            $this->validate ( $request, [ 
                'qualification_name' => array('required','max:75','unique:qualifications,qualification_name') 
            ] );
            
            if(!ctype_digit(strval($id))){
                $response = array (
                    'exception' => true,
                    'exception_message' => 'Invalid Input'
                );

                $statusCode = 400;
                return response ()->json ( $response, $statusCode );
            }
            
            try {            
                $qualification = Qualification::find($id);
                if(!$qualification){
                    throw new \Exception('Invalid Input');
                }

                
                
                $qualification->qualification_name = $request->qualification_name;
                $qualification->created_by = Auth::user()->id;
                
                $qualification->save();
                
                $response = array (
                    'qualification' => $qualification 
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
        public function destroy($id)
        {
            $response = [
				'qualification' => [ ]
		];
		$statusCode = 200;
		$qualification = null;
		
		try {
			//$qualification = Qualification::destroy($id);
		    if(!ctype_digit(strval($id))){
		        throw new \Exception('Please check input');
		    }
			$qualification = Qualification::find($id);
			
			
			
				// $user_type->delete();
				if(! empty($qualification)){//Should be changed #30
					//$qualification = $qualification->forceDelete();//Should be changed #31 //only for admin elements.
					$qualification = $qualification->delete();
				}
					
				$response = array (
						'qualification' => $qualification //Should be changed #32
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
}
