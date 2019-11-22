<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\UserType;
use Auth;

class UserTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

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
    public function create()
    {
        //
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
            'user_type' => [ ] 
        ];
        $statusCode = 200;
       

        $this->validate ( $request, [ 
                'type_name' => array('required','max:75','regex:/^[\pL\d\s]+$/u','unique:user_types,type_name') 
        ] );

        try {
           // $request['created_by'] = 11;//Auth::user()->id;

            $user_type = UserType::create ( $request->all () );
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

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
            'user_type' => [ ] 
        ];
        $statusCode = 200;
        $user_type = null;

        if(!ctype_digit(strval($id))){
            $response = array (
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response ()->json ( $response, $statusCode );
        }

        $this->validate($request, [
            'type_name' => array('required', 'unique:user_types,type_name'),
        ]);
        
        try {            
            $user_type = UserType::find($id);
            if(!$user_type){
                throw new \Exception('Invalid Input');
            }
            
            $user_type->type_name = $request->type_name;
           
            //$user_type->created_by = 11;//Auth::user()->id;
            
            $user_type->save();
            
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

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $response = [
            'user_type' => []
        ]; // Should be changed #25
        $statusCode = 200;
        $user_type = null; // Should be changed #26
        try {
            if ( !ctype_digit(strval($id))) {
                throw new \Exception('Please check input');
            }
            $user_type = UserType::find($id); // Should be changed #27

            
                if (!empty($user_type)) { // Should be changed #30
                    $user_type->delete();
                    //$user_type = $user_type->forceDelete ( $id ); // Should be changed #31 //only for admin elements.
                }
                $response = array(
                    'user_type' => $user_type
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
