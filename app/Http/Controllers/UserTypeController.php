<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\UserType;

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
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
