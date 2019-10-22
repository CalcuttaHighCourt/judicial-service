<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\AcrHistory;
use App\JudicialOfficerPosting;
use Carbon\Carbon;
use Auth;
use DB;

class ACRController extends Controller
{
    public function acr_history_save (Request $request){

        $this->validate($request, [
            'judicial_officer' => array('required', 'max:75'),
            'grades' => array('required', 'max:75'),
            'year_of_assessment' => array('required'),
            'jo_code' => array('required')
        ]);

        $judicial_officer = $request->input('judicial_officer');
        $grades = $request->input('grades');
        $year_of_assessment = $request->input('year_of_assessment');
        $jo_code = $request->input('jo_code');
        $created_by = Auth::user()->id;


        for($i=0;$i<sizeof($grades);$i++)
        {
             AcrHistory::insert([
                    'jo_code'=> $jo_code,
                    'judicial_officer_id' => $judicial_officer,
                    'grade_id' => $grades[$i],
                    'year' => $year_of_assessment[$i],
                    'created_by' => $created_by,
                    'created_at'=>Carbon::today(),
                    'updated_at'=>Carbon::today()
             ]);

         }
        return 1;
        
    }

    public function fetch_acr_history(Request $request)

     {
    //     $this->validate($request, [
    //         'judicial_officer' => array('required', 'max:75'),
    //         'to_assessment_year' => array('required'),
    //         'from_assessment_year' => array('required'),
    //         'jo_code' => array('required'),
    //         'grade' => array('required'),
    //         'jo_code' => array('required'),
    //     ]);

        $judicial_officer = $request->input('judicial_officer');
        $jo_code = trim($request->input('jo_code'));
        $to_assessment_year =  $request->input('to_assessment_year');
        $from_assessment_year =  $request->input('from_assessment_year');
        $grade =  $request->input('grade');
        $designation =  $request->input('designation');

        // $acr_details['grade_details']= AcrHistory::where([
        //                                 ['year','>',$from_assessment_year],
        //                                 ['year','<',$to_assessment_year],
        //                                 ['jo_code','=',$jo_code]
        //                             ])->with('grade_detail')->get();

        $select = "SELECT  acr.jo_code, jo.officer_name,acr.year,gd.grade_name,desig.designation_name
        FROM acr_histories acr LEFT OUTER JOIN judicial_officers jo ON acr.judicial_officer_id=jo.id
        LEFT OUTER JOIN grade_details gd ON gd.id=acr.grade_id
        LEFT OUTER JOIN judicial_officer_postings jop ON jop.judicial_officer_id=jo.id
        LEFT OUTER JOIN designations desig ON desig.id=jop.designation_id";

        // $acr_details['current_posting']= JudicialOfficerPosting::where('judicial_officer_id','=',$judicial_officer)
        //                                 ->whereNull('to_date')  
        //                                 ->with('court_complex.zone')
        //                                 ->get();\


         // Default WHERE condition
         $where = ' WHERE 1=1 ';

          // Default Order By query
        $orderBy = ' ORDER BY jo.officer_name ';

        if(!empty($judicial_officer))
            $where = $where.' AND jo.id ='.$judicial_officer;

        if(!empty($grade))
            $where = $where.' AND gd.id ='.$grade;

        if(!empty($jo_code))
            $where = $where." AND acr.jo_code ilike '%".$jo_code."%'";

        if(!empty($designation))
            $where = $where.' AND desig.id ='.$designation;

        if(!empty($to_assessment_year))
            $where = $where.' AND year BETWEEN '.$from_assessment_year.' AND '.$to_assessment_year;

        return $details=DB::select($select.$where.$orderBy);
    }
}
