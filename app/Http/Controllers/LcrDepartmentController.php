<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\LcrDepartment;
use Auth;

class LcrDepartmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('lcr_departments.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
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
            'department' => []
        ];
        $statusCode = 200;
        $department = null;

        $this->validate($request, [
            'lcr_department_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u'),
            
        ]);


        try {
                       
            $department = LcrDepartment::create($request->all());
            $response = array(
                'department' => $department
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
    public function index_for_datatable($id)
    {
        $response = [ ];
		$statusCode = 200;
		$departments = array ();
		
		try {
			$draw=1;
			$records_total=0;
			
            $departments = LcrDepartment::all();
            $records_total=$departments->count();
            
			$draw=$request->draw;
			$offset=$request->start;
			$length=$request->length;
			$search=$request->search["value"];
			
			$order=$request->order;
			
			$filtered = LcrDepartment::where('department_name', 'ilike','%'.$search.'%')
                           ->select('departments.*');
			
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
					"departments" => $page_displayed,
			);
		} catch ( \Exception $e ) {
			$response = array (
					"draw" => $draw,
					"recordsTotal" => $records_total,
					"recordsFiltered" => 0,
					"departments" => [],					
			);			
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
