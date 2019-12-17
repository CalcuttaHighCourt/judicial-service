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
        $to_assessment_year =  $request->input('to_assessment_year');
        $from_assessment_year =  $request->input('from_assessment_year');
        $grade =  $request->input('grade');
        $designation =  $request->input('designation');

       
        $select = "SELECT  distinct jop.judicial_officer_id,jo.jo_code,jo.officer_name,year,grade_id
        FROM acr_histories acr LEFT OUTER JOIN judicial_officers jo ON acr.judicial_officer_id=jo.id 
        LEFT OUTER JOIN judicial_officer_postings jop ON jop.judicial_officer_id=jo.id";

        
         // Default WHERE condition
         $where = ' WHERE 1=1';

          // Default Order By query
        $orderBy = ' ORDER BY year,grade_id,jo.officer_name';

        if(!empty($judicial_officer))
            $where = $where.' AND jo.id ='.$judicial_officer;

        if(!empty($grade))
            $where = $where.' AND acr.grade_id ='.$grade;
        
        if(!empty($designation))
            $where = $where.' AND jop.designation_id ='.$designation;

        if(!empty($to_assessment_year))
            $where = $where.' AND year BETWEEN '.$from_assessment_year.' AND '.$to_assessment_year;

        $jo_code=DB::select($select.$where.$orderBy);

        $columns = array( 
            0 =>'jo_code', 
            1 =>'officer_name',
            2 =>'designation_name',
            3 =>'court_name',
            4=>'year',
            5 =>'grade_name'
        );

        $data = array();
        
        foreach($jo_code as $code)
        {
            $grades=DB::select('SELECT grade_name,year 
            from acr_histories acr inner join grade_details on acr.grade_id=grade_details.id
            where acr.judicial_officer_id='.$code->judicial_officer_id.' AND year ='.$code->year);

            $nestedData['jo_code']=$code->jo_code;

            $nestedData['officer_name']=$code->officer_name;
            
            if($judicial_officer!=""){
                $nestedData['place_of_posting'] = DB::select('select court_name, from_date from judicial_officer_postings inner join courts
                on judicial_officer_postings.court_id = courts.id 
                where judicial_officer_postings.judicial_officer_id='.$code->judicial_officer_id.' order by from_date desc
                limit 1');
            }
            else
                $nestedData['place_of_posting']="";
        
            foreach($grades as $grade)
            {
                $nestedData['grade_name']=$grade->grade_name;
                $nestedData['year']=$grade->year;
                
                $designations=DB::select('SELECT from_date,to_date,designation_id,designation_name,court_name from judicial_officer_postings jop 
                                          inner join designations on jop.designation_id=designations.id
                                          inner join courts on jop.court_id=courts.id
                where judicial_officer_id='.$code->judicial_officer_id." AND from_date >= '".$code->year."-01-01' AND from_date <= '".$code->year."-12-31'
                order by from_date desc");
      
                $str=""; 
                $str1="";               
                foreach($designations as $key=>$designation)
                {
                    $str=$str." ".$designation->designation_name."</br></br> \n\n ";                    

                    $str1=$str1." ".$designation->court_name."</br></br> \n\n";

                    $nestedData['designation_name']=$str;    
                    $nestedData['court_name']=$str1;                
                    
                }
               
            }

            $data[] = $nestedData;
        }
        
       
       
        return $data;
    }

    public function officerwise_assessment_year(Request $request){

        $data= array();

        $judicial_id=$request->input('judicial_id');

        $check_retirement = DB::select('select count(*) as count from judicial_officer_postings where to_date is null and judicial_officer_id='. $judicial_id);

        if($check_retirement['0']->count>0){ // not retired
            $year_range= DB::select('SELECT MAX(to_date) as max_to_date, MIN(from_date)  as min_from_date from judicial_officer_postings where judicial_officer_id='. $judicial_id);
            
            $year_range['0']->max_to_date = date('Y');
            $year_range['0']->min_from_date = date('Y',strtotime($year_range['0']->min_from_date));
        }
        else{ // retired
            $year_range= DB::select('SELECT MAX(to_date) as max_to_date, MIN(from_date)  as min_from_date from judicial_officer_postings where judicial_officer_id='. $judicial_id);
            
            $year_range['0']->max_to_date = date('Y',strtotime($year_range['0']->max_to_date));
            $year_range['0']->min_from_date = date('Y',strtotime($year_range['0']->min_from_date));
        }

        return $year_range;
    }
}
