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
    public function index_for_datatable(Request $request)
    {
        
        $columns = array( 
			0 =>'SL NO', 
			1 =>'DEPARTMENT NAME',
			2 =>'ACTION'
        );
        
        $totalData = LcrDepartment::count();

        $totalFiltered = $totalData; 
        
        $limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if(empty($request->input('search.value'))){
            $departments = LcrDepartment::offset($start)
                            ->limit($limit)
                            ->orderBy('lcr_department_name',$dir)
                            ->get();
                        
             $totalFiltered = LcrDepartment::count();
        }

        else{
			$search = $request->input('search.value');
            $departments =LcrDepartment::where('lcr_department_name','ILIKE',"%{$search}%")
                                    ->offset($start)
                                    ->limit($limit)
                                    ->orderBy('lcr_department_name',$dir)
									->get();

									

			$totalFiltered = LcrDepartment::where('lcr_department_name',"%{$search}%")
                                           ->limit($limit)
                                            ->count();
        }
        
        $data = array();

        $i=0;

        if($departments){
            foreach($departments as $department){
                $nestedData['SL NO'] = ++$i;
                $nestedData['DEPARTMENT NAME'] = $department->lcr_department_name;
                $nestedData['ACTION'] = "<i class='fa fa-edit' aria-hidden='true'></i>";

                $data[] = $nestedData;
            }     

                $json_data = array(
                    "draw" => intval($request->input('draw')),
                    "recordsTotal" => intval($totalData),
                    "recordsFiltered" =>intval($totalFiltered),
                    "data" => $data
        );

        echo json_encode($json_data);

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
