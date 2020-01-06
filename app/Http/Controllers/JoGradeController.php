<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\JudicialOfficer;
use App\JudicialOfficerPosting;
use App\JoGrade;
use App\Rank;
use Auth;
use DB;
use Carbon\Carbon;

use
    DataTables\Editor,
    DataTables\Editor\Field,
    DataTables\Editor\Format,
    DataTables\Editor\Mjoin,
    DataTables\Editor\Options,
    DataTables\Editor\Upload,
    DataTables\Editor\Validate;



class JoGradeController extends Controller
{
    public function rank_wise_jo_list(Request $request)
    {
        $this->validate( $request, [ 
            'rank_id' => 'required|exists:ranks,id',
            'date_of_gradation' => 'required|date'
        ]);
        

        $columns = array(            

            0 =>'grade',
            1 =>'inicial', 
            3 =>'formula',
            4 =>'judicial_officer_id',
            5 =>'jo_name',            
            6 =>'date_of_birth', 
            7 =>'date_of_retirement',
            8 =>'date_of_joining',
            9 =>'from_date',
            10 =>'remark',
            11 =>'to_grade'
            
        );


        $rank_id=$request->input('rank_id');
        $date_of_gradation=Carbon::parse ($request->input('date_of_gradation'))->format('Y-m-d')  ;

        $startDate=Carbon::parse($date_of_gradation)->startOfYear();

        $limit = $request->input('length');
        $start = $request->input('start');
        //$order = $columns[$request->input('order.1.column')];
        $dir = $request->input('order.0.dir');     
        
        
        $jo_list_draft = JoGrade::where([
                                            ['jo_grades.rank_id',$rank_id],
                                            ['jo_grades.date_of_gradation',$date_of_gradation],
                                            ['jo_grades.status','Draft']
                                        ])  
                                  ->count();
                                   
        if( $jo_list_draft == 0 )
        {
            $already_finalized = JoGrade::where([
                                                    ['jo_grades.rank_id',$rank_id],
                                                    ['jo_grades.date_of_gradation',$date_of_gradation],
                                                    ['jo_grades.status','Finalized']
                                                ])  
                                          ->count();

            //if rank grade list already finalized
            if($already_finalized > 0)
            {

                $json_data = array(
                    "draw" => intval($request->input('draw')),
                    "recordsTotal" => intval(-1),
                    "recordsFiltered" =>intval(-1),
                    "data" => []
                );
                return json_encode($json_data);
            }

            //else fetch new list
            //from judicial_officer_postings , select those rows which is the latest postion on the given rank
            $totalData = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                            (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id='.$rank_id.')
                                                        )
                                                        judicial_officer_postings'
                                                    ), 

                                                'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                            )
                                            ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                            ->where('judicial_officer_postings.rank_id',"=",$rank_id)
                                            ->whereDate('judicial_officer_postings.from_date', '<=', $date_of_gradation)
                                            ->count();  
        }
        else
        {
            //from judicial_officer_postings , select those rows which is the latest postion on the given rank

            $totalData = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id='.$rank_id.')
                                                        )
                                                        judicial_officer_postings'
                                                    ), 

                                                'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                            )
                                            ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                            ->join('jo_grades','judicial_officers.id','=','jo_grades.judicial_officer_id')
                                            ->where([
                                                        ['jo_grades.rank_id',$rank_id],
                                                        ['jo_grades.date_of_gradation',$date_of_gradation],
                                                        ['jo_grades.status','=','Draft']
                                                    ])  
                                            ->count();  

            // echo "<pre>";
            // print_r($totalData);
            // echo "</pre>";
            // exit();

        }

        $totalFiltered = $totalData;    
    

        if( $jo_list_draft == 0 )
        {

            if(empty($request->input('search.value')))
            {

                //from judicial_officer_postings , select those rows which is the latest postion on the given rank

                $jo_list = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id='.$rank_id.')
                                                           )
                                                          judicial_officer_postings'
                                                        ), 

                                                    'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                            )
                                            ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                            ->where('judicial_officer_postings.rank_id',"=",$rank_id)
                                            ->whereDate('judicial_officer_postings.from_date', '<=', $date_of_gradation)
                                            ->orderBy('judicial_officers.date_of_joining','desc')
                                            ->select('judicial_officers.id','judicial_officers.jo_code','judicial_officers.officer_name', 'judicial_officers.date_of_birth',  'judicial_officers.date_of_retirement','judicial_officer_postings.rank_id' ,'judicial_officers.date_of_joining', 'judicial_officer_postings.from_date' )                                    
                                            ->offset($start)
                                            ->limit($limit)
                                            ->get();


                                            /*
select judicial_officers.id,judicial_officers.jo_code,judicial_officers.officer_name,judicial_officers.date_of_birth,  
	judicial_officers.date_of_retirement,judicial_officer_postings.rank_id,judicial_officers.date_of_joining,
	judicial_officer_postings.from_date, jo_grades.remark 
	
from judicial_officers 

inner join (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
		(select min(jop2.from_date) from judicial_officer_postings jop2 
		    where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id=1
		)
	   ) judicial_officer_postings on judicial_officer_postings.judicial_officer_id = judicial_officers.id 
inner join ranks on judicial_officer_postings.rank_id = ranks.id 
inner join jo_grades on jo_grades.judicial_officer_id = judicial_officers.id 
where judicial_officer_postings.rank_id = 1 and judicial_officer_postings.from_date::date <= '2019-12-04'
                                            */
                $totalFiltered = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                    (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id='.$rank_id.')
                                                                )
                                                                judicial_officer_postings'
                                                            ), 

                                                        'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                                )
                                                ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                                ->where('judicial_officer_postings.rank_id',"=",$rank_id)
                                                ->whereDate('judicial_officer_postings.from_date', '<=', $date_of_gradation)
                                                ->orderBy('judicial_officers.date_of_joining','desc')
                                                ->count();

            }
            else
            {
                $search = strtoupper($request->input('search.value'));
                
                $jo_list = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id='.$rank_id.')
                                                            )
                                                            judicial_officer_postings'
                                                        ), 

                                            'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                            )
                                            ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                            ->where('judicial_officer_postings.rank_id',"=",$rank_id)
                                            ->whereDate('judicial_officer_postings.from_date', '<=', $date_of_gradation)
                                            ->where(function($query) use ($search){    
                                                $query->orWhere('judicial_officers.officer_name','ilike',"%{$search}%");
                                                $query->orWhere('judicial_officers.jo_code','ilike',"%{$search}%");                                                  
                                            })
                                            ->orderBy('judicial_officers.date_of_joining','desc')
                                            ->select('judicial_officers.id','judicial_officers.jo_code','judicial_officers.officer_name','judicial_officers.date_of_birth',  'judicial_officers.date_of_retirement','judicial_officer_postings.rank_id','judicial_officers.date_of_joining','judicial_officer_postings.from_date' )                                                   
                                            ->offset($start)
                                            ->limit($limit)
                                            ->get();


                $totalFiltered = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                    (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id='.$rank_id.')
                                                                )
                                                                judicial_officer_postings'
                                                            ), 

                                                        'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                                )
                                                ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                                ->where('judicial_officer_postings.rank_id',"=",$rank_id)
                                                ->whereDate('judicial_officer_postings.from_date', '<=', $date_of_gradation)
                                                ->where(function($query) use ($search){
                                                    $query->orWhere('judicial_officers.officer_name','ilike',"%{$search}%");
                                                    $query->orWhere('judicial_officers.jo_code','ilike',"%{$search}%");                                                          
                                                })        
                                                ->orderBy('judicial_officers.date_of_joining','desc')
                                                ->count();


            }// END OF ELSE OF if(empty($request->input('search.value')))
        
        }   //end of  if( $jo_list_draft == 0 )
        else
        {

            if(empty($request->input('search.value')))
            {

                $jo_list = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id='.$rank_id.')
                                                            )
                                                            judicial_officer_postings'
                                                        ), 

                                                    'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                            )
                                            ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                            ->join('jo_grades','judicial_officers.id','=','jo_grades.judicial_officer_id')
                                            ->where([
                                                        ['jo_grades.rank_id',$rank_id],
                                                        ['jo_grades.date_of_gradation',$date_of_gradation],
                                                        ['jo_grades.status','=','Draft']
                                                    ])  
                                            ->select('judicial_officers.id','judicial_officers.jo_code','judicial_officers.officer_name','judicial_officers.date_of_birth',  'judicial_officers.date_of_retirement','judicial_officer_postings.rank_id' ,'judicial_officers.date_of_joining', 'judicial_officer_postings.from_date', 'jo_grades.remark' )                                    
                                            ->orderBy('jo_grades.grade','asc')
                                            ->offset($start)
                                            ->limit($limit)
                                            ->get();


                $totalFiltered = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                    (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id='.$rank_id.')
                                                                )
                                                                judicial_officer_postings'
                                                            ), 

                                                            'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                                )
                                                ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                                ->join('jo_grades','judicial_officers.id','=','jo_grades.judicial_officer_id')
                                                ->where([
                                                            ['jo_grades.rank_id',$rank_id],
                                                            ['jo_grades.date_of_gradation',$date_of_gradation],
                                                            ['jo_grades.status','=','Draft']
                                                        ])  
                                                ->count();

            }
            else
            {
                $search = strtoupper($request->input('search.value'));
                
                $jo_list = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id='.$rank_id.')
                                                           )
                                                          judicial_officer_postings'
                                                        ), 

                                                    'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                            )
                                            ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                            ->join('jo_grades','judicial_officers.id','=','jo_grades.judicial_officer_id')
                                            ->where([
                                                        ['jo_grades.rank_id',$rank_id],
                                                        ['jo_grades.date_of_gradation',$date_of_gradation],
                                                        ['jo_grades.status','=','Draft']
                                                    ])  
                                            ->where(function($query) use ($search){    
                                                $query->orWhere('judicial_officers.officer_name','ilike',"%{$search}%");
                                                $query->orWhere('judicial_officers.jo_code','ilike',"%{$search}%");                                                  
                                            })
                                            ->select('judicial_officers.id','judicial_officers.jo_code','judicial_officers.officer_name','judicial_officers.date_of_birth',  'judicial_officers.date_of_retirement','judicial_officer_postings.rank_id','judicial_officers.date_of_joining','judicial_officer_postings.from_date', 'jo_grades.remark' )                                                   
                                            ->orderBy('jo_grades.grade','asc')
                                            ->offset($start)
                                            ->limit($limit)
                                            ->get();


                $totalFiltered = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                    (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id='.$rank_id.')
                                                                    )
                                                                judicial_officer_postings'
                                                            ), 

                                                        'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                                )
                                                ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                                ->join('jo_grades','judicial_officers.id','=','jo_grades.judicial_officer_id')
                                                ->where([
                                                            ['jo_grades.rank_id',$rank_id],
                                                            ['jo_grades.date_of_gradation',$date_of_gradation],
                                                            ['jo_grades.status','=','Draft']
                                                        ])  
                                                ->where(function($query) use ($search){
                                                    $query->orWhere('judicial_officers.officer_name','ilike',"%{$search}%");
                                                    $query->orWhere('judicial_officers.jo_code','ilike',"%{$search}%");                                                          
                                                })        
                                                ->count();


            } // END OF ELSE OF if(empty($request->input('search.value')))
            
        }
        //end of else of if( $jo_list_draft == 0 )

            $data = array();
            $counter=1;
            
            if($jo_list)
            {
                foreach($jo_list as $list)
                {                   
                    $nestedData['grade'] = $counter; 
                    $nestedData['inicial'] = $counter;

                    $nestedData['formula'] = "";
                   // $nestedData['year'] = "";

                    $nestedData['judicial_officer_id'] = $list->id;
                    $nestedData['jo_name'] = $list->officer_name." || ".$list->jo_code;
                   
                    $nestedData['date_of_birth'] =Carbon::parse ($list->date_of_birth)->format('d-m-Y');
                    $nestedData['date_of_retirement'] = Carbon::parse ($list->date_of_retirement)->format('d-m-Y');
                    $nestedData['date_of_joining'] = Carbon::parse ($list->date_of_joining)->format('d-m-Y') ;        

                    $nestedData['from_date'] = Carbon::parse ($list->from_date)->format('d-m-Y') ;  

                    if($jo_list_draft == 0)
                        $nestedData['remark'] = "";
                    else
                        $nestedData['remark'] = $list->remark;

                    //$nestedData['edit_position'] = '<img src= src="'.asset('images/position.png').'  width="20" height="20" class="edit_position"  style="cursor:pointer;" alt="Edit Position" aria-hidden="true" title="Edit Position" > ';
                    $nestedData['to_grade'] = "";

                    $counter++;

                    $data[] = $nestedData;
                }

                $json_data = array(
                    "draw" => intval($request->input('draw')),
                    "recordsTotal" => intval($totalData),
                    "recordsFiltered" =>intval($totalFiltered),
                    "data" => $data
                );

            }

            echo json_encode($json_data);


    }
    //end of  public function get_jo_details(Request $request)



    //Fetch status and current date from server on the given date and rank: start
    public function get_jo_list_info(Request $request)
    {
        $this->validate( $request, [ 
            'rank_id' => 'required|max:100|exists:ranks,id',
            'date_of_gradation' => 'required|date_format:d-m-Y|after:1990-01-01|before:'.date("Y-m-d", strtotime("+1 day"))
        ]);

        $rank_id=$request->input('rank_id');
        $date_of_gradation=  Carbon::parse ($request->input('date_of_gradation'))->format('Y-m-d') ;
        
        $jo_list_info = JoGrade::where([
                                            ['rank_id',$rank_id],
                                            ['date_of_gradation',$date_of_gradation],
                                        ])  
                                ->select('status')
                                ->get();

        $data['current_date']= Carbon::today()->format('d-m-Y')  ;
        if(sizeof($jo_list_info)>0)
            $data['status']= $jo_list_info[0]->status ;
        else
            $data['status']="";

        return $data;
        
    }
    //Fetch status and current date from server on the given date and rank: end

    
    public function save_jo_grade(Request $request)
    {
        $this->validate( $request, [ 
            'graded_jo_list.*.judicial_officer_id' => 'required||max:99999|exists:judicial_officers,id',
            'rank_id' => 'required|max:100|exists:ranks,id',
            'date_of_gradation' => 'required|date_format:d-m-Y|after:1990-01-01|before:'.date("Y-m-d", strtotime("+1 day"))
        ]);

        $graded_jo_list=$request->input('graded_jo_list');
            
        $rank_id=$request->input('rank_id');
        $date_of_gradation=  Carbon::parse ($request->input('date_of_gradation'))->format('Y-m-d') ;
        $status=$request->input('status');


        

                // echo "<pre>";
                // print_r($graded_jo_list);
                // echo "</pre>";
                // exit();

        $count= sizeof($graded_jo_list);


        $jo_list_draft = JoGrade::where([
                                            ['jo_grades.rank_id',$rank_id],
                                            ['jo_grades.date_of_gradation',$date_of_gradation],
                                            ['jo_grades.status','Draft']
                                        ])  
                                 ->count();

        $response = [
            'return_count' => []
        ]; 
    
        $statusCode = 200;
        
        try{

            DB::beginTransaction();

                
            if( $jo_list_draft == 0 )
            {
                        
                for ($i=0; $i< $count; $i++) 
                { 
                    JoGrade::insert([
                        'judicial_officer_id'=>$graded_jo_list[$i]['judicial_officer_id'],
                        'rank_id'=>$rank_id,
                        'grade'=>$graded_jo_list[$i]['grade'],
                        'date_of_gradation'=>$date_of_gradation,
                        'remark'=>$graded_jo_list[$i]['remark'],
                        'status'=>$status
                    ]);
                }


            }
            else
            {
                for ($i=0; $i< $count; $i++) 
                { 
                    JoGrade:: where([
                                        ['jo_grades.judicial_officer_id',$graded_jo_list[$i]['judicial_officer_id'] ],
                                        ['jo_grades.rank_id',$rank_id],
                                        ['jo_grades.date_of_gradation',$date_of_gradation]
                                    ])  
                            ->update([                      
                                    'grade'=>$graded_jo_list[$i]['grade'],
                                    'remark'=>$graded_jo_list[$i]['remark'],
                                    'status'=>$status
                                ]);
                }

            }// end of else of  if( $jo_list_draft == 0 )
            
            DB::commit();     

            $response = array(
                'return_count' => $count
            ); 
            
        } catch (\Exception $e) 
        {
            DB::rollBack();

            $response = array(
                'exception' => true,
                'exception_message' => $e->getMessage()
            );
            $statusCode = 400;

        } 
        finally 
        {        
            return response()->json($response, $statusCode);
        }



    }//end of public function save_jo_grade(Request $request)





    public function get_final_jo_graded_list(Request $request)
    {
        $this->validate( $request, [ 
            'rank_id' => 'required|exists:ranks,id',
            'date_of_gradation' => 'required|date'
        ]);
        

        $columns = array(            

            0 =>'grade',
            1 =>'formula',
            2 =>'jo_name',            
            3 =>'date_of_birth', 
            4 =>'date_of_retirement',
            5 =>'date_of_joining',
            6 =>'from_date',
            7 =>'remark',
            8 =>'status'
            
        );


        $rank_id=$request->input('rank_id');
        $date_of_gradation=Carbon::parse ($request->input('date_of_gradation'))->format('Y-m-d')  ;

        $limit = $request->input('length');
        $start = $request->input('start');
        //$order = $columns[$request->input('order.1.column')];
        $dir = $request->input('order.0.dir');     
        

                                   
       //from judicial_officer_postings , select those rows which is the latest postings
        $totalData = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                            (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id )
                                                    )
                                                    judicial_officer_postings'
                                                ), 

                                            'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                        ) 
                                        ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                        ->join('jo_grades','judicial_officers.id','=','jo_grades.judicial_officer_id')
                                        ->whereDate('judicial_officers.date_of_retirement', ">=", Carbon::today() )  
                                        ->where([
                                                    ['jo_grades.rank_id',$rank_id],
                                                    ['jo_grades.date_of_gradation',$date_of_gradation]
                                                ])  
                                        ->count();  



        $totalFiltered = $totalData;    
    

        if(empty($request->input('search.value')))
        {
            //from judicial_officer_postings , select those rows which is the latest postings

            $jo_list = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id )
                                                        )
                                                        judicial_officer_postings'
                                                     ), 

                                                 'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                        )
                                        ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                        ->join('jo_grades','judicial_officers.id','=','jo_grades.judicial_officer_id')
                                        ->whereDate('judicial_officers.date_of_retirement', ">=", Carbon::today() )  
                                        ->where([
                                                    ['jo_grades.rank_id',$rank_id],
                                                    ['jo_grades.date_of_gradation',$date_of_gradation]
                                                ])  
                                        ->select('judicial_officers.jo_code','judicial_officers.officer_name','judicial_officers.date_of_birth',  'judicial_officers.date_of_retirement','judicial_officer_postings.rank_id as current_rank_id','jo_grades.rank_id as jo_grade_rank_id','judicial_officers.date_of_joining', 'judicial_officer_postings.from_date', 'jo_grades.remark','jo_grades.grade','jo_grades.status'  )                                    
                                        ->orderBy('jo_grades.grade','asc')
                                        ->offset($start)
                                        ->limit($limit)
                                        ->get();


            $totalFiltered = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                    (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id )
                                                            )
                                                            judicial_officer_postings'
                                                        ), 

                                                    'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                            )
                                            ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                            ->join('jo_grades','judicial_officers.id','=','jo_grades.judicial_officer_id')
                                            ->whereDate('judicial_officers.date_of_retirement', ">=", Carbon::today() )  
                                            ->where([
                                                        ['jo_grades.rank_id',$rank_id],
                                                        ['jo_grades.date_of_gradation',$date_of_gradation]
                                                    ])  
                                            ->count();

        }
        else
        {
            $search = strtoupper($request->input('search.value'));

            //from judicial_officer_postings , select those rows which is the latest postings
            
            $jo_list = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id and jop2.rank_id='.$rank_id.')
                                                        )
                                                        judicial_officer_postings'
                                                    ), 

                                              'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                        )
                                        ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                        ->join('jo_grades','judicial_officers.id','=','jo_grades.judicial_officer_id')
                                        ->whereDate('judicial_officers.date_of_retirement', ">=", Carbon::today() )  
                                        ->where([
                                                    ['jo_grades.rank_id',$rank_id],
                                                    ['jo_grades.date_of_gradation',$date_of_gradation]
                                                ])  
                                        ->where(function($query) use ($search){    
                                            $query->orWhere('judicial_officers.officer_name','ilike',"%{$search}%");
                                            $query->orWhere('judicial_officers.jo_code','ilike',"%{$search}%");                                                  
                                        })
                                        ->select('judicial_officers.jo_code','judicial_officers.officer_name','judicial_officers.date_of_birth',  'judicial_officers.date_of_retirement','judicial_officer_postings.rank_id as current_rank_id','jo_grades.rank_id as jo_grade_rank_id','judicial_officers.date_of_joining','judicial_officer_postings.from_date', 'jo_grades.remark','jo_grades.grade','jo_grades.status' )                                                   
                                        ->orderBy('jo_grades.grade','asc')
                                        ->offset($start)
                                        ->limit($limit)
                                        ->get();


            $totalFiltered = JudicialOfficer::join(DB::raw(' (SELECT * FROM judicial_officer_postings jop1 where jop1.from_date = 
                                                                    (select min(jop2.from_date) from judicial_officer_postings jop2 where jop2.judicial_officer_id=jop1.judicial_officer_id )
                                                            )
                                                            judicial_officer_postings'
                                                        ), 

                                                    'judicial_officer_postings.judicial_officer_id', '=', 'judicial_officers.id'
                                            )
                                            ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                            ->join('jo_grades','judicial_officers.id','=','jo_grades.judicial_officer_id')
                                            ->whereDate('judicial_officers.date_of_retirement', ">=", Carbon::today() )  
                                            ->where([
                                                        ['jo_grades.rank_id',$rank_id],
                                                        ['jo_grades.date_of_gradation',$date_of_gradation]
                                                    ])  
                                            ->where(function($query) use ($search){
                                                $query->orWhere('judicial_officers.officer_name','ilike',"%{$search}%");
                                                $query->orWhere('judicial_officers.jo_code','ilike',"%{$search}%");                                                          
                                            })        
                                            ->count();


        } // END OF ELSE OF if(empty($request->input('search.value')))


        // echo "<pre>";
        // print_r($jo_list[0]->status);
        // echo "</pre>";
        // exit();
        
            $data = array();
            
            if($jo_list)
            {
                foreach($jo_list as $list)
                {                   
                    $nestedData['grade'] = $list->grade; 

                    $nestedData['formula'] = "";
                   // $nestedData['year'] = "";
                   if($list->current_rank_id != $list->jo_grade_rank_id)
                   {
                        $currnet_rank_name=Rank::where("id",$list->current_rank_id)
                                                ->select('rank_name')
                                                 ->get();


                        $nestedData['jo_name'] = $list->officer_name." || ".$list->jo_code. '<br> <span class="badge badge-danger" style="background-color:red">(Current Rank: '.$currnet_rank_name[0]->rank_name.')</span>';
                   }                       
                   else
                   {
                        $nestedData['jo_name'] = $list->officer_name." || ".$list->jo_code;
                   }
                        
                   
                    $nestedData['date_of_birth'] =Carbon::parse ($list->date_of_birth)->format('d-m-Y');
                    $nestedData['date_of_retirement'] = Carbon::parse ($list->date_of_retirement)->format('d-m-Y');
                    $nestedData['date_of_joining'] = Carbon::parse ($list->date_of_joining)->format('d-m-Y');

                    $nestedData['from_date'] = Carbon::parse ($list->from_date)->format('d-m-Y');

                    $nestedData['remark'] = $list->remark;
                    $nestedData['status'] = $list->status;

                    $data[] = $nestedData;
                    
                }

                if(sizeof($jo_list)>0) 
                    $status= $jo_list[0]->status ;
                else 
                    $status="";

                $json_data = array(
                    "draw" => intval($request->input('draw')),
                    "recordsTotal" => intval($totalData),
                    "recordsFiltered" =>intval($totalFiltered),
                    // "status" => $status,
                    "data" => $data
                );

            }

            echo json_encode($json_data);


    }
    //end of  public function get_final_jo_graded_list(Request $request)




}//end of class JoGradeController extends Controller
