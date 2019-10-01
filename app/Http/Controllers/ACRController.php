<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\AcrHistory;
use App\JudicialOfficerPosting;
use Carbon\Carbon;
use Auth;

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
        $this->validate($request, [
            'judicial_officer' => array('required', 'max:75'),
            'to_assessment_year' => array('required'),
            'from_assessment_year' => array('required'),
            'jo_code' => array('required')
        ]);

        $judicial_officer = $request->input('judicial_officer');
        $jo_code = $request->input('jo_code');
        $to_assessment_year =  $request->input('to_assessment_year');
        $from_assessment_year =  $request->input('from_assessment_year');
        
        $acr_details['grade_details']= AcrHistory::where([
                                        ['year','>',$from_assessment_year],
                                        ['year','<',$to_assessment_year],
                                        ['jo_code','=',$jo_code]
                                    ])->with('grade_detail')->get();

        $acr_details['current_posting']= JudicialOfficerPosting::where('judicial_officer_id','=',$judicial_officer)
                                        ->whereNull('to_date')  
                                        ->with('court_complex.zone')
                                        ->get();


        return $acr_details;
    }
}
