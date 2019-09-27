<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\AcrHistory;
use Carbon\Cabon;
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
            'created_by' => $created_by
        ]);

    }
        

return 1;
        
    }
}
