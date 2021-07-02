<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\JudicialOfficer;
use App\JudicialOfficerQualification;
use App\JoLegalExperience;
use App\JudicialOfficerPosting;
use App\JudicialOfficerPostingPreference;
use App\JoReporting;
use App\JoZoneTenure;
use App\State;
use App\District;
use App\Subdivision;
use App\Zone;
use App\User;
use App\UserType;
use Auth;
use DB;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index () {
        $data = [];

        $data['total_jo'] = JudicialOfficer::count();
        
        $data['total_jo_gender_wise'] = JudicialOfficer::groupBy('gender')->select('gender',DB::raw('count(*) as count'))->get();

        $data['current_jo_strength'] = JudicialOfficer::where('date_of_retirement', '>', Carbon::now())->count();

        $data['total_jo_strength_gender_wise'] = JudicialOfficer::where('date_of_retirement', '>', Carbon::now())->groupBy('gender')->select('gender',DB::raw('count(*) as count'))->get();

        $data['rank_wise_gender'] = JudicialOfficer::join('judicial_officer_postings','judicial_officers.id','judicial_officer_postings.judicial_officer_id')
                                                        ->join('ranks','judicial_officer_postings.rank_id','ranks.id')
                                                        ->where([
                                                            ['to_date',null],
                                                            ['date_of_retirement', '>', Carbon::now()]
                                                        ])
                                                        ->groupBy('rank_name','rank_order','gender')
                                                        ->select('rank_name','gender',DB::raw('count(*) as count'))
                                                        ->orderBy('rank_order')
                                                        ->get();

        $data['new_joiness_cjjd']  = JudicialOfficer::join('judicial_officer_postings','judicial_officers.id','judicial_officer_postings.judicial_officer_id')
                                                        ->join('designations','judicial_officer_postings.designation_id','designations.id')
                                                        ->where([
                                                            ['date_of_joining','>=',Carbon::now()->subDays(365)],
                                                            ['to_date',null],
                                                            ['recruitment_batch_id','1']
                                                        ])
                                                        ->select('officer_name','jo_code',DB::raw('to_char(date_of_joining,\'dd-mm-yyyy\') as date_of_joining, designation_name ||\', \'||place_of_posting as designation'))
                                                        ->orderBy('date_of_joining','asc')                                                        
                                                        ->get();
        
        $data['new_joiness_dj']  = JudicialOfficer::join('judicial_officer_postings','judicial_officers.id','judicial_officer_postings.judicial_officer_id')
                                                    ->join('designations','judicial_officer_postings.designation_id','designations.id')
                                                    ->where([
                                                        ['date_of_joining','>=',Carbon::now()->subDays(365)],
                                                        ['to_date',null],
                                                        ['recruitment_batch_id','2']
                                                    ])
                                                    ->select('officer_name','jo_code',DB::raw('to_char(date_of_joining,\'dd-mm-yyyy\') as date_of_joining, designation_name ||\', \'||place_of_posting as designation'))
                                                    ->orderBy('date_of_joining','asc')                                                        
                                                    ->get();

        $data['retirement_in_coming_year']  = JudicialOfficer::join('judicial_officer_postings','judicial_officers.id','judicial_officer_postings.judicial_officer_id')
                                                    ->join('designations','judicial_officer_postings.designation_id','designations.id')
                                                    ->where([
                                                        ['date_of_retirement','<=',Carbon::now()->addDays(365)],
                                                        ['date_of_retirement','>=',Carbon::now()],
                                                        ['to_date',null],
                                                    ])
                                                    ->select('officer_name','jo_code',DB::raw('to_char(date_of_retirement,\'dd-mm-yyyy\') as date_of_retirement, designation_name ||\', \'||place_of_posting as designation'))
                                                    ->orderBy('date_of_retirement','asc')                                                        
                                                    ->get();

        $data['on_deputation_cjjd'] = JudicialOfficer::join('judicial_officer_postings','judicial_officers.id','judicial_officer_postings.judicial_officer_id')                                                
                                                ->where([                                                    
                                                    ['to_date',null],
                                                    ['mode_id','3'],
                                                    ['rank_id','1'],
                                                    ['date_of_retirement','>=',Carbon::now()],
                                                ])
                                                ->select('officer_name','jo_code','rank_id',DB::raw('to_char(from_date,\'dd-mm-yyyy\') as from_date, deputation_designation ||\', \'||deputation_posting_place as designation'))
                                                ->orderBy('from_date','asc')                                                        
                                                ->get();

        $data['on_deputation_cjsd'] = JudicialOfficer::join('judicial_officer_postings','judicial_officers.id','judicial_officer_postings.judicial_officer_id')                                                
                                                ->where([                                                    
                                                    ['to_date',null],
                                                    ['mode_id','3'],
                                                    ['rank_id','2'],
                                                    ['date_of_retirement','>=',Carbon::now()],
                                                ])
                                                ->select('officer_name','jo_code','rank_id',DB::raw('to_char(from_date,\'dd-mm-yyyy\') as from_date, deputation_designation ||\', \'||deputation_posting_place as designation'))
                                                ->orderBy('from_date','asc')                                                        
                                                ->get();

        $data['on_deputation_dj'] = JudicialOfficer::join('judicial_officer_postings','judicial_officers.id','judicial_officer_postings.judicial_officer_id')                                                
                                                ->where([                                                    
                                                    ['to_date',null],
                                                    ['mode_id','3'],
                                                    ['rank_id','3'],
                                                    ['date_of_retirement','>=',Carbon::now()],
                                                ])
                                                ->select('officer_name','jo_code','rank_id',DB::raw('to_char(from_date,\'dd-mm-yyyy\') as from_date, deputation_designation ||\', \'||deputation_posting_place as designation'))
                                                ->orderBy('from_date','asc')                                                        
                                                ->get();


        $data['on_special_posting_cjsd'] = JudicialOfficer::join('judicial_officer_postings','judicial_officers.id','judicial_officer_postings.judicial_officer_id')                                                
                                                            ->join('designations','judicial_officer_postings.designation_id','designations.id')
                                                        ->where([                                                    
                                                            ['to_date',null],
                                                            ['mode_id','2'],
                                                            ['judicial_officer_postings.rank_id','2'],
                                                            ['date_of_retirement','>=',Carbon::now()],
                                                        ])
                                                        ->select('officer_name','jo_code',DB::raw('to_char(from_date,\'dd-mm-yyyy\') as from_date, designation_name ||\', \'||place_of_posting as designation'))
                                                        ->orderBy('from_date','asc')                                                        
                                                        ->get();

        $data['on_special_posting_dj'] = JudicialOfficer::join('judicial_officer_postings','judicial_officers.id','judicial_officer_postings.judicial_officer_id')                                                
                                                        ->join('designations','judicial_officer_postings.designation_id','designations.id')                                        
                                                ->where([                                                    
                                                    ['to_date',null],
                                                    ['mode_id','2'],
                                                    ['judicial_officer_postings.rank_id','3'],
                                                    ['date_of_retirement','>=',Carbon::now()],
                                                ])
                                                ->select('officer_name','jo_code',DB::raw('to_char(from_date,\'dd-mm-yyyy\') as from_date, designation_name ||\', \'||place_of_posting as designation'))
                                                ->orderBy('from_date','asc')                                                        
                                                ->get();

        $data['couple_officers_cjjd'] = JudicialOfficer::join('judicial_officers as j','judicial_officers.spouse','j.id')
                                                        ->join('judicial_officer_postings as jop1','jop1.judicial_officer_id','judicial_officers.id')                                                
                                                        ->join('judicial_officer_postings as jop2','jop2.judicial_officer_id','j.id')                                                
                                                        ->join('designations as d1','jop1.designation_id','d1.id')                                        
                                                        ->join('designations as d2','jop2.designation_id','d2.id')                                        
                                                ->where([                                                    
                                                    ['jop1.to_date',null],
                                                    ['jop2.to_date',null],
                                                    ['jop1.rank_id','1'],
                                                    ['judicial_officers.date_of_retirement','>=',Carbon::now()],
                                                ])
                                                ->select(
                                                    'judicial_officers.officer_name as jo_name','judicial_officers.jo_code as jo_code',DB::raw('to_char(jop1.from_date,\'dd-mm-yyyy\') as from_date, d1.designation_name ||\', \'||jop1.place_of_posting as designation'),
                                                    'j.officer_name as spouse_name','j.jo_code as spouse_jo_code',DB::raw('to_char(jop2.from_date,\'dd-mm-yyyy\') as spouse_from_date, d2.designation_name ||\', \'||jop2.place_of_posting as spouse_designation')
                                                )                                                
                                                ->get();

        $data['couple_officers_cjsd'] = JudicialOfficer::join('judicial_officers as j','judicial_officers.spouse','j.id')
                                                        ->join('judicial_officer_postings as jop1','jop1.judicial_officer_id','judicial_officers.id')                                                
                                                        ->join('judicial_officer_postings as jop2','jop2.judicial_officer_id','j.id')                                                
                                                        ->join('designations as d1','jop1.designation_id','d1.id')                                        
                                                        ->join('designations as d2','jop2.designation_id','d2.id')                                        
                                                ->where([                                                    
                                                    ['jop1.to_date',null],
                                                    ['jop2.to_date',null],
                                                    ['jop1.rank_id','2'],
                                                    ['judicial_officers.date_of_retirement','>=',Carbon::now()],
                                                ])
                                                ->select(
                                                    'judicial_officers.officer_name as jo_name','judicial_officers.jo_code as jo_code',DB::raw('to_char(jop1.from_date,\'dd-mm-yyyy\') as from_date, d1.designation_name ||\', \'||jop1.place_of_posting as designation'),
                                                    'j.officer_name as spouse_name','j.jo_code as spouse_jo_code',DB::raw('to_char(jop2.from_date,\'dd-mm-yyyy\') as spouse_from_date, d2.designation_name ||\', \'||jop2.place_of_posting as spouse_designation')
                                                )                                                
                                                ->get();

        $data['couple_officers_ftc'] = JudicialOfficer::join('judicial_officers as j','judicial_officers.spouse','j.id')
                                                        ->join('judicial_officer_postings as jop1','jop1.judicial_officer_id','judicial_officers.id')                                                
                                                        ->join('judicial_officer_postings as jop2','jop2.judicial_officer_id','j.id')                                                
                                                        ->join('designations as d1','jop1.designation_id','d1.id')                                        
                                                        ->join('designations as d2','jop2.designation_id','d2.id')                                        
                                                ->where([                                                    
                                                    ['jop1.to_date',null],
                                                    ['jop2.to_date',null],
                                                    ['jop1.rank_id','4'],
                                                    ['judicial_officers.date_of_retirement','>=',Carbon::now()],
                                                ])
                                                ->select(
                                                    'judicial_officers.officer_name as jo_name','judicial_officers.jo_code as jo_code',DB::raw('to_char(jop1.from_date,\'dd-mm-yyyy\') as from_date, d1.designation_name ||\', \'||jop1.place_of_posting as designation'),
                                                    'j.officer_name as spouse_name','j.jo_code as spouse_jo_code',DB::raw('to_char(jop2.from_date,\'dd-mm-yyyy\') as spouse_from_date, d2.designation_name ||\', \'||jop2.place_of_posting as spouse_designation')
                                                )                                                
                                                ->get();

        $data['couple_officers_dj'] = JudicialOfficer::join('judicial_officers as j','judicial_officers.spouse','j.id')
                                                        ->join('judicial_officer_postings as jop1','jop1.judicial_officer_id','judicial_officers.id')                                                
                                                        ->join('judicial_officer_postings as jop2','jop2.judicial_officer_id','j.id')                                                
                                                        ->join('designations as d1','jop1.designation_id','d1.id')                                        
                                                        ->join('designations as d2','jop2.designation_id','d2.id')                                        
                                                ->where([                                                    
                                                    ['jop1.to_date',null],
                                                    ['jop2.to_date',null],
                                                    ['jop1.rank_id','3'],
                                                    ['judicial_officers.date_of_retirement','>=',Carbon::now()],
                                                ])
                                                ->select(
                                                    'judicial_officers.officer_name as jo_name','judicial_officers.jo_code as jo_code',DB::raw('to_char(jop1.from_date,\'dd-mm-yyyy\') as from_date, d1.designation_name ||\', \'||jop1.place_of_posting as designation'),
                                                    'j.officer_name as spouse_name','j.jo_code as spouse_jo_code',DB::raw('to_char(jop2.from_date,\'dd-mm-yyyy\') as spouse_from_date, d2.designation_name ||\', \'||jop2.place_of_posting as spouse_designation')
                                                )                                                
                                                ->get();
        
        //echo "<pre>";print_r($data['couple_officers_ftc']);exit;
        return view('departments.appointment_dashboard', compact('data'));
    }
}
