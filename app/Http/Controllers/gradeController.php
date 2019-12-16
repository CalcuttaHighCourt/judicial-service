<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\GradeDetail;
use Carbon\Carbon;
use Auth;

class GradeController extends Controller
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
        $grades = array();

        try {

            $grades = GradeDetail::all();


            $response = array(
                'grades' => $grades
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
        
        $this->validate ( $request, [ 
            'grade_name' => 'required|max:75|unique:grade_details,grade_name' 
        ]);

        
            $grade_name =$request->input('grade_name');
            $created_by = Auth::user()->id;
           
            GradeDetail::insert([
                'grade_name'=>$grade_name,
                'created_by'=>$created_by,
                'created_at'=>Carbon::today(),
                'updated_at'=>Carbon::today()
            ]);
            return 1;
        }
    
   

  

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
      public function get_all_grade_data(Request $request){
            $columns = array( 
                0 =>'ID', 
                1 =>'GRADE NAME',
                2 =>'ACTION'
            );

            $totalData = GradeDetail::count();

            $totalFiltered = $totalData; 

            $limit = $request->input('length');
            $start = $request->input('start');
            $order = $columns[$request->input('order.0.column')];
            $dir = $request->input('order.0.dir');

            if(empty($request->input('search.value'))){
                $grades = GradeDetail::offset($start)
                                            ->limit($limit)
                                            ->orderBy('grade_name',$dir)
                                            ->get();
                $totalFiltered = GradeDetail::count();
            }
            else{
                $search = $request->input('search.value');
                $grades = GradeDetail::where('id','ilike',"%{$search}%")
                                    ->orWhere('grade_name','ilike',"%{$search}%")
                                    ->offset($start)
                                    ->limit($limit)
                                    ->orderBy('grade_name',$dir)
                                    ->get();
                $totalFiltered = GradeDetail::where('id','ilike',"%{$search}%")
                                        ->orWhere('grade_name','ilike',"%{$search}%")
                                        ->count();
                }

                $data = array();

                if($grades){
                    foreach($grades as $grade){
                        $nestedData['ID'] = $grade->id;
                        $nestedData['GRADE NAME'] = $grade->grade_name;
                        $nestedData['ACTION'] = "<i class='fa fa-trash' aria-hidden='true'></i>";
        
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
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
     {
            $id = $request->input('id');
            GradeDetail::where('id',$id)->delete();
            return 1;
    }
}
