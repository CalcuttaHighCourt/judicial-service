<?php

namespace App\Http\Controllers;

use App\Http\Requests\JoEntryRequest;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\JudicialOfficer;
use App\JudicialOfficerQualification;
use App\JudicialOfficerPosting;
use App\JoZoneTenure;
use App\State;
use App\CourtComplex;
use App\User;
use App\UserType;
use Auth;
use DB;
use Carbon\Carbon;

class JoEntryFormController extends Controller
{
    
    public function index()
    {
		$JOdetails = JudicialOfficer::with('district','state','religion','recruitment_batch',
                                            'jo_repoting_officer','jo_reviewing_officer',
                                            'judicial_officer_qualifications.qualification',
                                            'judicial_officer_postings.designation','judicial_officer_postings.mode',
                                            'subordinate_officers', 'judicial_officer_postings.court',
                                            'judicial_officer_postings.court_complex'
                                    )->get();
   
        return response()->json($JOdetails)->header('Content-Type','application/json');
    }
    
    public function store(JoEntryRequest $request)
    {   
        $response = [
            'judicial_officer' => [],
            'qualification_details' => [],
            'posting_details' => [],
        ]; 
        
        $statusCode = 200;
        $judicial_officer = null; 

        $validated = $request->validated(); // validation rules are set in the Request File  
      
        
        //try{
            DB::beginTransaction();            
                
                /*JO Basic Details :: START*/
                $request['date_of_birth']=Carbon::parse($request['date_of_birth'])->format('Y-m-d');
                $request['date_of_joining']=Carbon::parse($request['date_of_joining'])->format('Y-m-d');
                $request['date_of_confirmation']=Carbon::parse($request['date_of_confirmation'])->format('Y-m-d');
                $request['date_of_retirement']=Carbon::parse($request['date_of_retirement'])->format('Y-m-d');
         
                if(empty($request['religion_id']))
                    $request['religion_id'] = null;
                if(empty($request['category_id']))
                    $request['category_id'] = null;
                if(empty($request['aadhaar_no']))
                    $request['aadhaar_no'] = null;
                if(empty($request['pan_no']))
                    $request['pan_no'] = null;
                if(empty($request['gpf_no']))
                    $request['gpf_no'] = null;
                if(empty($request['email_id_2']))
                    $request['email_id_2'] = null;
                if(empty($request['mobile_no_2']))
                    $request['mobile_no_2'] = null;
                 
                $judicial_officer = JudicialOfficer::insertGetId($request->except([
                                        'file','qualification_id','passing_year',
                                        'designation_id','reporting_officer_id','court_id',
                                        'zone_id','mode_id','from_date','to_date'
                                    ]));
                /*JO Basic Details :: ENDS*/


                /*JO User ID & Password Creation :: STARTS */
                $jo_user = new User;

                $user_type = UserType::where('type_name','ilike','%judicial officer%')
                                        ->max('id');

                $jo_user->name = $request->officer_name;
                $jo_user->email = $request->email_id_1;
                $jo_user->password = Hash::make(123456);
                $jo_user->judicial_officer_id = $judicial_officer;
                $jo_user->user_id = 'jo'.str_pad($judicial_officer,5,'0',STR_PAD_LEFT);
                $jo_user->user_type_id = $user_type;

                $login_credential = $jo_user->save();
                /*JO User ID & Password Creation :: ENDS */

              
                /*JO Qualification Details :: START*/
                $request->qualification_id = $request->qualification_id;
                $request->passing_year = $request->passing_year;

                for($i=0;$i<sizeof($request->qualification_id);$i++){
                    $jo_qualification = new JudicialOfficerQualification;

                    if(!empty($request->qualification_id[$i])){
                        $jo_qualification->judicial_officer_id = $judicial_officer;
                        $jo_qualification->qualification_id = $request->qualification_id[$i];
                        $jo_qualification->passing_year = $request->passing_year[$i];                        

                        $qualification_details[$i] = $jo_qualification->save();
                    }
                    else{
                        $qualification_details = null;
                    }
                }
                /*JO Qualification Details :: ENDS*/


                /*JO Posting Details :: START*/                
                for($i=0;$i<sizeof($request['designation_id']);$i++){
                    $jo_posting = new JudicialOfficerPosting;
    
                    if(!empty($request->designation_id[$i])){
                        $jo_posting->judicial_officer_id = $judicial_officer;
                        $jo_posting->designation_id = $request->designation_id[$i];
                        $jo_posting->court_id = $request->court_id[$i]; 
                        $posting_zone = $request->zone_id[$i];                
                        $jo_posting->mode_id = $request->mode_id[$i];
                        $jo_posting->from_date = Carbon::parse($request->from_date[$i])->format('Y-m-d');
                        $jo_posting->to_date = Carbon::parse($request->to_date[$i])->format('Y-m-d');                        

                        $posting_details[$i] = $jo_posting->save();

                        $zone_count = JoZoneTenure::where('judicial_officer_id',$judicial_officer)->count();

                        if($zone_count>0){
                            $zone_count2 = JoZoneTenure::where([
                                                            ['judicial_officer_id',$judicial_officer],
                                                            ['to_date',null]
                                                        ])->count();
                            if($zone_count2>0){
                                $present_zone = JoZoneTenure::where([
                                                            ['judicial_officer_id',$judicial_officer],
                                                            ['to_date',null]
                                                        ])->max('zone_id');

                                if($present_zone != $posting_zone){
                                    $max_to_date = JudicialOfficerPosting::where('judicial_officer_id',$judicial_officer)
                                                                            ->max('to_date');

                                    JoZoneTenure::where([
                                        ['judicial_officer_id',$judicial_officer],
                                        ['to_date',null]
                                    ])->update(['to_date'=>$max_to_date]);

                                    JoZoneTenure::insert([
                                        'judicial_officer_id' => $judicial_officer,
                                        'zone_id' => $posting_zone,
                                        'from_date' => $jo_posting->from_date,
                                        'to_date' => null,
                                    ]);
                                }
                            }
                            else{
                                JoZoneTenure::insert([
                                    'judicial_officer_id' => $judicial_officer,
                                    'zone_id' => $posting_zone,
                                    'from_date' => $jo_posting->from_date,
                                    'to_date' => null,
                                ]);
                            }
                        }
                        else{
                            JoZoneTenure::insert([
                                'judicial_officer_id' => $judicial_officer,
                                'zone_id' => $posting_zone,
                                'from_date' => $jo_posting->from_date,
                                'to_date' => null,
                            ]);
                        }                        
                       
                    }
                    else{
                        $posting_details = null;
                    }
                }
                /*JO Posting Details :: START*/

                $response = array(
                    'judicial_officer' => $judicial_officer,
                    'login_credential' => $login_credential,
                    'qualification_details' => $qualification_details,
                    'posting_details' => $posting_details,
                ); 
                DB::commit();
         
           
        // } catch (\Exception $e) {
        //     //DB::rollBack();

        //     $response = array(
        //         'exception' => true,
        //         'exception_message' => $e->getMessage()
        //     );
        //     $statusCode = 400;
        // } finally {
            //return response()->json($response, $statusCode);
        //}
    }

    
    public function show($id)
    {
        $profile = JudicialOfficer:: where('judicial_officers.id',$id)
                                     ->with('district','state','religion','recruitment_batch','caste',
                                            'judicial_officer_qualifications.qualification',
                                            'judicial_officer_postings.designation','judicial_officer_postings.mode',
                                            'subordinate_officers','judicial_officer_postings.court', 
                                            'subordinate_officers.reporting_officer','jo_photos'
                                     )
                                     ->get();


           
        $profile[0]['date_of_birth'] = date('d-m-Y', strtotime($profile[0]['date_of_birth']));
        $profile[0]['date_of_joining'] = date('d-m-Y', strtotime($profile[0]['date_of_joining']));
        $profile[0]['date_of_confirmation'] = date('d-m-Y', strtotime($profile[0]['date_of_confirmation']));
        $profile[0]['date_of_retirement'] = date('d-m-Y', strtotime($profile[0]['date_of_retirement']));


        if ($profile[0]['gender'] =="M")
            $profile[0]['gender']= "Male" ;
        else if ($profile[0]['gender'] =="F")
            $profile[0]['gender']= "Female" ;
        elseif ($profile[0]['gender'] =="O")
            $profile[0]['gender']= "Other" ;												

                                        

        
        foreach($profile[0]->judicial_officer_postings  as $details)
        {
            $details->from_date = date('d-m-Y', strtotime($details->from_date));
            $details->to_date = (!$details->to_date) ? '' : date('d-m-Y', strtotime($details->to_date)) ;

        }
        return view('profile.index')->with('profile',$profile);
    }

    public function profile()
    {
        return $this->show(Auth::user()->judicial_officer_id);
    }

    
    public function update(Request $request, $id)
    {
        //
    }
    
    public function destroy($id)
    {
        //
    }

    public function fetch_district(Request $request){
        $state = $request->input('state');
        $districts = State::with('districts')
                            ->where('states.id',$state)
                            ->get();

        return response()->json($districts);
    }

}
