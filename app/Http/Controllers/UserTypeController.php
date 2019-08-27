<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Usertype;

class UserTypeController extends Controller
{

    public function store(Request $request)
    {
        $response = [ 
            'user_type' => [ ] 
        ];
        $statusCode = 200;
        
        $this->validate ( $request, [ 
                'type_name' => array('required','max:75','regex:/^[\pL\d\s]+$/u','unique:user_types,type_name') 
        ] );

        try {
            $request['created_by'] = Auth::user()->id;

            $user_type = Usertype::create ( $request->all () );
            $response = array (
                    'user_type' => $user_type 
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
		$user_types = array ();
		
		try {
			$draw=1;
			$records_total=0;
			
            $user_types = Usertype::all();
            $records_total=$user_types->count();
            
			$draw=$request->draw;
			$offset=$request->start;
			$length=$request->length;
			$search=$request->search["value"];
			
			$order=$request->order;
			
			$filtered = Usertype::where('type_name', 'ilike','%'.$search.'%')
                                ->select('id','type_name');
			
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
					"user_types" => $page_displayed,
			);
		} catch ( \Exception $e ) {
			$response = array (
					"draw" => $draw,
					"recordsTotal" => $records_total,
					"recordsFiltered" => 0,
					"user_types" => [],					
			);			
		} finally{
			return response ()->json ( $response, $statusCode );
		}
	}
}
