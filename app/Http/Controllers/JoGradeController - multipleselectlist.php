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


class JoGradeController extends Controller
{
    public function get_jo_details(Request $request)
    {
        $this->validate( $request, [ 
            'rank_id' => 'required|exists:ranks,id',
            'date_of_gradation' => 'required|date'
        ]);
        
        $rank_id=$request->input('rank_id');
        $date_of_gradation=Carbon::parse ($request->input('date_of_gradation'))->format('Y-m-d')  ;

        $startDate=Carbon::parse($date_of_gradation)->startOfYear();

        
        // $jo_list = JudicialOfficer::join('jo_grades','judicial_officers.id','=','jo_grades.judicial_officer_id')
        //                             ->join('judicial_officer_postings','judicial_officer_postings.id','=','judicial_officers.id')
        //                             ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
        //                             ->where([
        //                                         ['jo_grades.rank_id','=',$rank_id],
        //                                         ['jo_grades.grade_year','=',$year]
        //                                 ])
        //                             ->whereBetween('judicial_officer_postings.from_date', [$startDate, $endDate]) 
        //                             ->select('judicial_officers.id','judicial_officers.jo_code','judicial_officers.officer_name' )
        //                             ->orderBy('jo_grades.grade','desc')
        //                             ->get();
        


        // if( $jo_list->isEmpty() )
        // {


            $last_gradation_date = JudicialOfficerPosting::where('judicial_officer_postings.rank_id',"=",$rank_id)
                                                        ->whereBetween('judicial_officer_postings.from_date', [$startDate, $date_of_gradation]) 
                                                        ->orderBy('judicial_officer_postings.from_date','desc')
                                                        ->select('judicial_officer_postings.from_date')
                                                        ->first();

            //print_r( $last_gradation_date); exit;

            $jo_list = JudicialOfficer::join('judicial_officer_postings','judicial_officer_postings.id','=','judicial_officers.id')
                                    ->join('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                    ->where('judicial_officer_postings.rank_id',"=",$rank_id)
                                    ->whereDate('judicial_officer_postings.from_date', '<=', $date_of_gradation)
                                    ->orderBy('judicial_officers.date_of_joining','desc')
                                    ->select('judicial_officers.id','judicial_officers.jo_code','judicial_officers.officer_name','judicial_officer_postings.rank_id' )                                    
                                    ->get();



            // $jo_list['new']=1;
            //   ->whereBetween('judicial_officer_postings.from_date', [$startDate, $date_of_gradation]) 

       // }
        // else
        // {
        //     $jo_list['new']=0;
        // }

        return response()->json($jo_list)->header('Content-Type','application/json');


    }
    //end of  public function get_jo_details(Request $request)


    public function save_jo_grade(Request $request)
    {
        $this->validate( $request, [ 
            'judicial_officer_id.*' => 'required||max:99999|exists:judicial_officers,id',
            'rank_id.*' => 'required|max:100|exists:ranks,id',
            'date_of_gradation.*' => 'required|date_format:d-m-Y|after:1990-01-01|before:'.date("Y-m-d", strtotime("+1 day"))
        ]);

        $judicial_officer_id=$request->input('judicial_officer_id');
        $rank_id=$request->input('rank_id');
        $date_of_gradation=  Carbon::parse ($request->input('date_of_gradation'))->format('Y-m-d') ;

        $count= count($judicial_officer_id);

        $response = [
            'return_count' => []
        ]; 
    
        $statusCode = 200;
        
        try{

            DB::beginTransaction();


            for ($i=0; $i< $count; $i++) 
            { 
                JoGrade::insert([
                    'judicial_officer_id'=>$judicial_officer_id[$i],
                    'rank_id'=>$rank_id[$i],
                    'grade'=>$count+1,
                    'grade_year'=>$date_of_gradation[$i]
                ]);
            }

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



}
