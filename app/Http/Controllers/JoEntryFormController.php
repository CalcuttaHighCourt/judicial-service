<?php

namespace App\Http\Controllers;

use App\Http\Requests\JoEntryRequest;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\JudicialOfficer;
use App\JudicialOfficerQualification;
use App\JoLegalExperience;
use App\JudicialOfficerPosting;
use App\JoReporting;
use App\JoZoneTenure;
use App\State;
use App\User;
use App\UserType;
use App\Rank;
use App\Designation;
use App\CareerProgressionStage;
use App\JoCareerProgression;
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
      
        
        try{
            DB::beginTransaction();            
                
                /*JO Basic Details :: START*/
                $request['date_of_birth']=Carbon::parse($request['date_of_birth'])->format('Y-m-d');
                $request['date_of_joining']=Carbon::parse($request['date_of_joining'])->format('Y-m-d');

                if(!empty($request['date_of_confirmation']))
                    $request['date_of_confirmation']=Carbon::parse($request['date_of_confirmation'])->format('Y-m-d');
                else
                    $request['date_of_confirmation']=null;

                $request['date_of_retirement']=Carbon::parse($request['date_of_retirement'])->format('Y-m-d');
                         
                if(empty($request['email_id_2']))
                    $request['email_id_2'] = null;
                if(empty($request['mobile_no_2']))
                    $request['mobile_no_2'] = null;
                if(empty($request['spouse']))
                    $request['spouse'] = null;
                if($request['state_flag']=='other'){
                    $request['home_district_id'] = null;
                }
                

                $judicial_officer = null;
                $login_credential = null;
                $qualification_details = null;
                $posting_details = null;
                $reporting_details = null;
                $jo_legal_experience_details = null;
                 
                $judicial_officer = JudicialOfficer::insertGetId([
                        'registration_no' => $request->registration_no, 'jo_code' => $request->jo_code,
                        'officer_name' => $request->officer_name, 'gender' => $request->gender,
                        'spouse' => $request->spouse, 'date_of_birth' => $request->date_of_birth,
                        'home_state_id' => $request->home_state_id, 'home_district_id' => $request->home_district_id,
                        'other_home_district' => $request->other_home_district,'hometown' => $request->hometown,
                        'present_address' => $request->present_address,'permanent_address' => $request->permanent_address,
                        'mobile_no_1' => $request->mobile_no_1,'mobile_no_2' => $request->mobile_no_2,
                        'email_id_1' => $request->email_id_1, 'email_id_2' => $request->email_id_2,
                        'recruitment_batch_id' => $request->recruitment_batch_id,'recruitment_batch_year' => $request->recruitment_batch_year,
                        'date_of_joining' => $request->date_of_joining, 'date_of_confirmation' => $request->date_of_confirmation,
                        'date_of_retirement' => $request->date_of_retirement,
                ]);

                // Spouse Update in other side
                if($request['spouse'] != null){
                    JudicialOfficer::where([
                        ['id',$request['spouse']],
                    ])->update(['spouse'=>$judicial_officer]);
                }

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

            
                /*JO Legal Experience Details :: STARTS*/
                for($i=0;$i<sizeof($request['subdivision_id']);$i++){
                    $jo_legal_experience = new JoLegalExperience;

                    if(!empty($request->subdivision_id[$i])){
                        $jo_legal_experience->judicial_officer_id = $judicial_officer;                       
                        $jo_legal_experience->subdivision_id = $request->subdivision_id[$i];
                        $jo_legal_experience->from_year = $request->from_year[$i];
                        $jo_legal_experience->to_year = $request->to_year[$i];

                        $jo_legal_experience_details[$i] = $jo_legal_experience->save();
                    }
                    else{
                        $jo_legal_experience_details = null;
                    }
                }
                /*JO Legal Experience Details :: ENDS*/


                /*JO Posting Details :: START*/                
                if(!empty($request['flag_mode'])){
                    $jo_posting = new JudicialOfficerPosting;

                    
                    if($request->designation_id == "")
                        $jo_posting->designation_id = null;
                    else{    
                        if($request->flag_mode=='deputation'){
                            $jo_posting->designation_id = null;
                        }
                        else if($request->flag_mode=='regular'){
                            $jo_posting->designation_id = $request->designation_id;                        
                        }
                    }
                    $jo_posting->zone_id = $request->zone_id;
                    $posting_zone = $request->zone_id;
                    $jo_posting->judicial_officer_id = $judicial_officer;                        
                    $jo_posting->mode_id = $request->mode_id;
                    $jo_posting->rank_id = $request->rank_id;
                    $jo_posting->deputation_designation = $request->deputation_designation;
                    $jo_posting->deputation_posting_place = $request->deputation_posting_place;
                    $jo_posting->from_date = Carbon::parse($request->from_date)->format('Y-m-d');

                    if(!empty($request->to_date))
                        $jo_posting->to_date = Carbon::parse($request->to_date)->format('Y-m-d');                        
                    else
                        $jo_posting->to_date = null;

                    $jo_posting->posting_remark = $request->posting_remark;

                    $posting_details = $jo_posting->save();

                    /*JO Reporting Details :: START*/  
                    if(!empty($request->reporting_officer_id) || !empty($request->other_reporting_officer_name)){
                        if($request->flag_mode == 'deputation')
                            $request->reporting_officer_id = null;

                        $posting_id = JudicialOfficerPosting::max('id');
                        
                        $jo_reporting = new JoReporting;
                        $jo_reporting->judicial_officer_id = $judicial_officer;
                        $jo_reporting->posting_id = $posting_id;
                        $jo_reporting->reporting_officer_id = $request->reporting_officer_id;
                        $jo_reporting->other_reporting_officer_name = $request->other_reporting_officer_name;
                        $jo_reporting->other_reporting_officer_designation = $request->other_reporting_officer_designation;

                        $reporting_details = $jo_reporting->save();
                    }
                    else{
                        $reporting_details = null;
                    }
                    /*JO Reporting Details :: ENDS*/ 

                    /*JO Posting Zone Tenure :: START*/   
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
                    /*JO Posting Zone Tenure :: END*/
                    
                }
                else{
                    $posting_details = null;
                }
                /*JO Posting Details :: END*/

                $response = array(
                    'judicial_officer' => $judicial_officer,
                    'login_credential' => $login_credential,
                    'qualification_details' => $qualification_details,
                    'posting_details' => $posting_details,
                    'reporting_details' => $reporting_details,
                    'jo_legal_experience_details' => $jo_legal_experience_details,
                ); 
                DB::commit();
         
           
        } catch (\Exception $e) {
            DB::rollBack();

            $response = array(
                'exception' => true,
                'exception_message' => $e->getMessage()
            );
            $statusCode = 400;
        } finally {
            return response()->json($response, $statusCode);
        }
    }


    // profile image upload
    public function jo_upload_image(Request $request){
        $this->validate( $request, [ 
            'profile_image' => 'required|file|mimes:jpeg,png,jpg,gif|max:50'
        ]);
        
        $jo_details = JudicialOfficer::orderBy('id','desc')->get();

        $image = $request->file('profile_image');

        if(!is_dir(public_path('images/judicial_officers/'.$jo_details['0']->registration_no))) 
        {
            mkdir(public_path('images/judicial_officers/'.$jo_details['0']->registration_no), 0777, true);       
        }

        $new_name = $jo_details['0']->registration_no.'_'.strtotime(date('Y-m-d')).'.'.$image->getClientOriginalExtension();

        if(file_exists(public_path('images/judicial_officers/'.$jo_details['0']->registration_no.'/'.$new_name)))
        {
            unlink(public_path('images/judicial_officers/'.$jo_details['0']->registration_no.'/'.$new_name));
        }

        $image->move(public_path('images/judicial_officers/'.$jo_details['0']->registration_no), $new_name);

        JudicialOfficer::where('registration_no',$jo_details['0']->registration_no)
                        ->update([
                            'profile_image' => $new_name,
                        ]);
    
        return response()->json([
            'image' => true,
            'message'   => 'Image Upload Successfully',
        ]);
    
    }

    
    public function show($id)
    {
        $profile = JudicialOfficer:: where('judicial_officers.id',$id)
                                     ->with('district','state','religion','recruitment_batch','category',
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

        

    public function fetch_district(Request $request){
        $this->validate( $request, [ 
            'state' => 'required|max:1000|exists:states,id'
        ]);

        $state = $request->input('state');
        $districts = State::with('districts')
                            ->where('states.id',$state)
                            ->get();

        return response()->json($districts);
    }

    public function fetch_rank_designation(Request $request){
        $this->validate( $request, [ 
            'batch_id' => 'required|max:20|exists:recruitment_batches,id',
            'batch_name' => 'required|max:20',
        ]);

        $batch = $request->input('batch_name');

        if($batch == 'PSC' || $batch == 'psc'){
            $data['ranks'] = Rank::where('rank_order', 1)->get();
        }
        else if($batch == 'Direct Entry' || $batch == 'direct entry'){
            $data['ranks'] = Rank::where('rank_order', 3)->get();
        }

        $rank = $data['ranks']['0']->id;

        $data['designations'] = Designation::where('rank_id',$rank)
                                            ->get();

        return response()->json($data);
    }

    public function show_all_jo(Request $request){
        $columns = array(   
            0 =>'more_details',          
            1 =>'registration_no', 
            2 =>'jo_code',
            3 =>'officer_name',
            4 =>'date_of_birth',
            5 =>'date_of_retirement',
            6 =>'action',
            
        );

        $totalData = JudicialOfficer::count();

        $totalFiltered = $totalData; 

        $limit = $request->input('length');
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');

        if(empty($request->input('search.value'))){
            $judicial_officers = JudicialOfficer::offset($start)
                                ->limit($limit)
                                ->orderBy($order,$dir)
                                ->get();
            $totalFiltered = JudicialOfficer::count();
        }
        else{
            $search = $request->input('search.value');
            $judicial_officers = JudicialOfficer::where('registration_no',"%{$search}%")
                                ->orWhere('jo_code','ilike',"%{$search}%")
                                ->orWhere('officer_name','ilike',"%{$search}%")
                                ->offset($start)
                                ->limit($limit)
                                ->orderBy($order,$dir)
                                ->get();
            $totalFiltered = JudicialOfficer::where('registration_no',"%{$search}%")
                                        ->orWhere('jo_code','ilike',"%{$search}%")
                                        ->orWhere('officer_name','ilike',"%{$search}%")
                                        ->count();
        }

        $data = array();

        if($judicial_officers){
            foreach($judicial_officers as $judicial_officer){
                $nestedData['more_details'] = '<img src="images/details_open.png" style="cursor:pointer" class="more_details" alt="More Details">';
                $nestedData['registration_no'] = $judicial_officer->registration_no;
                $nestedData['jo_code'] = $judicial_officer->jo_code;
                $nestedData['officer_name'] = $judicial_officer->officer_name;
                $nestedData['date_of_birth'] = Carbon::parse($judicial_officer->date_of_birth)->format('d-m-Y');
                $nestedData['date_of_retirement'] = Carbon::parse($judicial_officer->date_of_retirement)->format('d-m-Y');
                $nestedData['action'] = "<i class='fa fa-pencil edit' style=\"cursor:pointer\" aria-hidden='true'></i>";

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


    public function fetch_jo_details(Request $request){
        $this->validate( $request, [ 
            'jo_id' => 'required|max:99999|exists:judicial_officers,id',
        ]);

        $jo_details = array();

        // Basic & Contact Details
        $jo_details['basic_contact_details'] = JudicialOfficer::find($request->jo_id);
        
        $jo_details['basic_contact_details']->date_of_birth = Carbon::parse($jo_details['basic_contact_details']->date_of_birth)->format('d-m-Y');
        $jo_details['basic_contact_details']->date_of_joining = Carbon::parse($jo_details['basic_contact_details']->date_of_joining)->format('d-m-Y');
        $jo_details['basic_contact_details']->date_of_retirement = Carbon::parse($jo_details['basic_contact_details']->date_of_retirement)->format('d-m-Y');
        
        if($jo_details['basic_contact_details']->date_of_confirmation != null)
            $jo_details['basic_contact_details']->date_of_confirmation = Carbon::parse($jo_details['basic_contact_details']->date_of_confirmation)->format('d-m-Y');
        else
            $jo_details['basic_contact_details']->date_of_confirmation = "";

        $jo_details['basic_contact_details']->profile_image = asset('images/judicial_officers/'.$jo_details['basic_contact_details']->registration_no.'/'.$jo_details['basic_contact_details']->profile_image);

        // Qualification Details
        $jo_details['qualification_details'] = JudicialOfficerQualification::where('judicial_officer_id',$request->jo_id)
                                                                            ->orderBy('passing_year','asc')
                                                                            ->get();

        // Practice Details
        $jo_details['practice_details'] = JoLegalExperience::where('judicial_officer_id',$request->jo_id)
                                                            ->orderBy('from_year','asc')
                                                            ->get();

        // Posting Details
        $jo_details['posting_details'] = JudicialOfficerPosting::leftJoin('jo_reportings','judicial_officer_postings.id','=','jo_reportings.posting_id')
                                                                ->where('judicial_officer_postings.judicial_officer_id',$request->jo_id)
                                                                ->orderBy('from_date','asc')
                                                                ->get();

        foreach($jo_details['posting_details'] as $key => $jo_posting){
            if($jo_posting->to_date!=null)
                $jo_posting->to_date = Carbon::parse($jo_posting->to_date)->format('d-m-Y');            
             
            $jo_posting->from_date = Carbon::parse($jo_posting->from_date)->format('d-m-Y');
        }


        // Career Progression Details
        $jo_details['ranks'] = JudicialOfficerPosting::leftJoin('ranks','judicial_officer_postings.rank_id','=','ranks.id')
                                                        ->where('judicial_officer_postings.judicial_officer_id',$request->jo_id)
                                                        ->select('ranks.id','rank_name','rank_order')
                                                        ->orderBy('rank_order','asc')
                                                        ->distinct()
                                                        ->get();

        $jo_details['career_progression'] = JoCareerProgression::where('judicial_officer_id',$request->jo_id)
                                                                ->orderBy('date_of_confirmation')
                                                                ->get();

        foreach($jo_details['career_progression'] as $key => $jo_career_progression){
            $jo_career_progression->date_of_confirmation = Carbon::parse($jo_career_progression->date_of_confirmation)->format('d-m-Y');
        }
         
        return $jo_details;
    }


    public function update_basic_details(Request $request){
        $this->validate( $request, [ 
            'id' => 'required|max:99999|exists:judicial_officers,id',
            'jo_code' => 'nullable|string|alpha_num|max:50',
            'registration_no' => 'required|integer|max:99999',
            'officer_name' => 'required|string|regex:/^[\pL\s\-]+$/u|max:100',
            'gender' => 'required|string|alpha|in:M,F,O|max:10',
            'spouse' => 'nullable|integer|exists:judicial_officers,id|max:999999',
            'date_of_birth' => 'required|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
            'recruitment_batch_id' => 'required|integer|exists:recruitment_batches,id|max:10000',
            'recruitment_batch_year' => 'required|integer|min:1950|max:'.date('Y'),
            'date_of_joining' => 'required|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
            'date_of_confirmation' => 'nullable|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
            'date_of_retirement' => 'required|date_format:d-m-Y|after:1900-01-01',  
        ]);
        
        $request['date_of_birth']=Carbon::parse($request['date_of_birth'])->format('Y-m-d');
        $request['date_of_joining']=Carbon::parse($request['date_of_joining'])->format('Y-m-d');

        if(empty($request['spouse']))
            $request['spouse'] = null;

        if(!empty($request['date_of_confirmation']))
            $request['date_of_confirmation']=Carbon::parse($request['date_of_confirmation'])->format('Y-m-d');
        else
            $request['date_of_confirmation']=null;

        $request['date_of_retirement']=Carbon::parse($request['date_of_retirement'])->format('Y-m-d');
        
        // spouse detachment
        if($request['spouse']==null){
            $spouse = JudicialOfficer::where([
                                ['id',$request->id],
                            ])->max('spouse');

            JudicialOfficer::where([
                ['id',$spouse],
            ])->update(['spouse'=>null]);
        }

        // basic details update
        JudicialOfficer::where('id',$request->id)
                        ->update($request->except(['id','_token']));

        // spouse attachment
        if($request['spouse']!=null){        
            JudicialOfficer::where([
                ['id',$request['spouse']],
            ])->update(['spouse'=>$request->id]);
        }
        
        

        return 1;
    }


    public function update_contact_details(Request $request){
        $this->validate( $request, [ 
            'id' => 'required|max:99999|exists:judicial_officers,id',
            'home_state_id' => 'required|integer|exists:states,id|max:10000',
            'state_flag' => 'required|string|max:20|in:west_bengal,other',
            'home_district_id' => 'required_if:state_flag,==,west_bengal|integer|exists:districts,id|max:200',
            'other_home_district' => 'required_if:state_flag,==,other|string|regex:/^[\pL\s\-]+$/u|max:100',
            'hometown' => 'required|string|regex:/^[\pL\s\-]+$/u|max:100',
            'present_address' => 'required|string|max:255',
            'permanent_address' => 'required|string|max:255',
            'mobile_no_1' => 'required|integer|max:9999999999',
            'mobile_no_2' => 'nullable|integer|max:9999999999',
            'email_id_1' => 'required|email:rfc,dns|max:100',
            'email_id_2' => 'nullable|email:rfc,dns|max:100',
        ]);
                
        JudicialOfficer::where('id',$request->id)
                        ->update($request->except(['id','state_flag','_token']));
        
        return 1;
    }

    public function update_profile_image(Request $request){
        $this->validate( $request, [ 
            'id' => 'required|max:99999|exists:judicial_officers,id',
            'profile_image' => 'required|file|mimes:jpeg,png,jpg,gif|max:50'            
        ]);

        $this->validate( $request, [ 
            'profile_image' => 'required|file|mimes:jpeg,png,jpg,gif|max:50'
        ]);
        
        $jo_details = JudicialOfficer::where('id',$request->id)->get();

        $image = $request->file('profile_image');

        if(!is_dir(public_path('images/judicial_officers/'.$jo_details['0']->registration_no))) 
        {
            mkdir(public_path('images/judicial_officers/'.$jo_details['0']->registration_no), 0777, true);       
        }

        $new_name = $jo_details['0']->registration_no.'_'.strtotime(date('Y-m-d')).'.'.$image->getClientOriginalExtension();

        if(file_exists(public_path('images/judicial_officers/'.$jo_details['0']->registration_no.'/'.$new_name)))
        {
            unlink(public_path('images/judicial_officers/'.$jo_details['0']->registration_no.'/'.$new_name));
        }

        $image->move(public_path('images/judicial_officers/'.$jo_details['0']->registration_no), $new_name);

        JudicialOfficer::where('registration_no',$jo_details['0']->registration_no)
                        ->update([
                            'profile_image' => $new_name,
                        ]);        
        return 1;
    }

    public function update_posting_details(Request $request){
        $this->validate($request,[
            'id' => 'required|max:99999|exists:judicial_officers,id',
            'flag_mode' => 'required|array',
            'flag_mode.*' => 'required|alpha|max:30|in:regular,deputation',
            'mode_id' => 'required|array',
            'mode_id.*' => 'required|required_with:flag_mode.*,rank_id.*,from_date.*|integer|max:1000|exists:modes,id',
            'rank_id' => 'required|array',
            'rank_id.*' => 'required|required_with:mode_id.*,rank_id.*,flag_mode.*|integer|max:50|exists:ranks,id',
            'designation_id' => 'required|array',
            'designation_id.*' => 'nullable|required_if:flag_mode.*,==,regular|integer|max:500|exists:designations,id',
            'additional_designation' => 'required|array',
            'additional_designation.*' => 'nullable|string|max:250',
            'deputation_designation' => 'required|array',
            'deputation_designation.*' => 'nullable|required_if:flag_mode.*,==,deputation|string|max:500',
            'reporting_officer_id' => 'required|array',
            'reporting_officer_id.*' => 'nullable|integer|max:999999|exists:judicial_officers,id',   
            'other_reporting_officer_name' => 'required|array',
            'other_reporting_officer_name.*' => 'nullable|string|max:100|regex:/^[\pL\s\-]+$/u',
            'other_reporting_officer_designation' => 'required|array',
            'other_reporting_officer_designation.*' => 'nullable|string|max:100|regex:/^[\pL\s\-]+$/u',
            'zone_id' => 'required|array',
            'zone_id.*' => 'required|integer|max:500|exists:zones,id',            
            'deputation_posting_place' => 'required|array',
            'deputation_posting_place.*' => 'nullable|required_if:flag_mode.*,==,deputation|string|max:255',
            'from_date' => 'required|array',
            'from_date.*' => 'required|required_with:mode_id.*,rank_id.*,flag_mode.*|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
            'to_date' => 'required|array',
            'to_date.*' => 'nullable|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),                     
            'posting_remark' => 'required|array',
            'posting_remark.*' => 'nullable|string',
        ]);

        $response = array();    
        $statusCode = 200;

        try{
            DB::beginTransaction(); 
            
            $jo_posting_code = JudicialOfficerPosting::where('judicial_officer_id',$request->input('id'))->get();
            foreach($jo_posting_code as $posting_id){
                JoReporting::where('posting_id',$posting_id->id)->delete();
            }    

            JudicialOfficerPosting::where('judicial_officer_id',$request->input('id'))->delete();                                
            
            JudicialOfficerPosting::where('judicial_officer_id',$request->input('id'))->delete();

            JoZoneTenure::where('judicial_officer_id',$request->input('id'))->delete();
           
            for($i=0; $i<sizeof($request['flag_mode']); $i++){
                $jo_posting = new JudicialOfficerPosting;

                if($request->flag_mode[$i]=='deputation'){
                    $jo_posting->designation_id = null;
                    $posting_zone = $request->deputation_zone[$i];
                    $jo_posting->deputation_designation = $request->deputation_designation[$i];
                    $jo_posting->deputation_posting_place = $request->deputation_posting_place[$i];
                }
                else if($request->flag_mode[$i]=='regular'){
                    $jo_posting->designation_id = $request->designation_id[$i];
                    $posting_zone = $request->zone_id[$i];
                    $jo_posting->deputation_designation = '';
                    $jo_posting->deputation_posting_place = '';
                }

                $jo_posting->judicial_officer_id = $request->id;  
                $jo_posting->additional_designation = $request->additional_designation[$i];                      
                $jo_posting->zone_id = $request->zone_id[$i];                      
                $jo_posting->mode_id = $request->mode_id[$i];
                $jo_posting->rank_id = $request->rank_id[$i];                
                $jo_posting->from_date = Carbon::parse($request->from_date[$i])->format('Y-m-d');

                if(!empty($request->to_date[$i]))
                    $jo_posting->to_date = Carbon::parse($request->to_date[$i])->format('Y-m-d');                        
                else
                    $jo_posting->to_date = null;

                $jo_posting->posting_remark = $request->posting_remark[$i];

                $posting_details = $jo_posting->save();

                /*JO Reporting Details :: START*/  
                if(!empty($request->reporting_officer_id[$i]) || !empty($request->other_reporting_officer_name[$i])){                    
                    $posting_id = JudicialOfficerPosting::max('id');
                    
                    $jo_reporting = new JoReporting;
                    
                    if($request->flag_mode[$i] == 'deputation'){
                        $jo_reporting->reporting_officer_id = null;
                        $jo_reporting->other_reporting_officer_name = $request->other_reporting_officer_name[$i];
                        $jo_reporting->other_reporting_officer_designation = $request->other_reporting_officer_designation[$i];
                    }
                    else if($request->flag_mode[$i] == 'regular'){
                        $jo_reporting->reporting_officer_id = $request->reporting_officer_id[$i];
                        $jo_reporting->other_reporting_officer_name = '';
                        $jo_reporting->other_reporting_officer_designation = '';                    
                    }
                    
                    $jo_reporting->judicial_officer_id = $request->id;
                    $jo_reporting->posting_id = $posting_id;                    

                    $reporting_details = $jo_reporting->save();
                }
                else{
                    $reporting_details = null;
                }
                /*JO Reporting Details :: ENDS*/ 

                /*JO Posting Zone Tenure :: START*/   
                $zone_count = JoZoneTenure::where('judicial_officer_id',$request->id)->count();

                if($zone_count>0){
                    $zone_count2 = JoZoneTenure::where([
                                                    ['judicial_officer_id',$request->id],
                                                    ['to_date',null]
                                                ])->count();
                    if($zone_count2>0){
                        $present_zone = JoZoneTenure::where([
                                                    ['judicial_officer_id',$request->id],
                                                    ['to_date',null]
                                                ])->max('zone_id');

                        if($present_zone != $posting_zone){
                            $max_to_date = JudicialOfficerPosting::where('judicial_officer_id',$request->id)
                                                                    ->max('to_date');

                            JoZoneTenure::where([
                                ['judicial_officer_id',$request->id],
                                ['to_date',null]
                            ])->update(['to_date'=>$max_to_date]);

                            JoZoneTenure::insert([
                                'judicial_officer_id' => $request->id,
                                'zone_id' => $posting_zone,
                                'from_date' => $jo_posting->from_date,
                                'to_date' => null,
                            ]);
                        }
                    }
                    else{
                        JoZoneTenure::insert([
                            'judicial_officer_id' => $request->id,
                            'zone_id' => $posting_zone,
                            'from_date' => $jo_posting->from_date,
                            'to_date' => null,
                        ]);
                    }
                }
                else{
                    JoZoneTenure::insert([
                        'judicial_officer_id' => $request->id,
                        'zone_id' => $posting_zone,
                        'from_date' => $jo_posting->from_date,
                        'to_date' => null,
                    ]);
                }                        
                /*JO Posting Zone Tenure :: END*/                
            }  
            
            DB::commit();

        } catch (\Exception $e) {
            DB::rollBack(); 
            $response = array(
                'exception' => true,
                'exception_message' => $e->getMessage()
            );           
            $statusCode = 400;
        } finally {
            return response()->json($response, $statusCode);
        }
    }

    public function update_practice_details(Request $request){
        $this->validate($request,[
            'id' => 'required|max:99999|exists:judicial_officers,id',
            'subdivision_id' => 'array',
            'subdivision_id.*' => 'required_with:from_year.*,to_year.*|nullable|integer|exists:subdivisions,id|max:1000',
            'from_year' => 'array',
            'from_year.*' => 'required_with:subdivision_id.*,to_year.*|nullable|integer|min:1900|max:'.date('Y'),
            'to_year' => 'array',
            'to_year.*' => 'required_with:subdivision_id.*,from_year.*|nullable|integer|min:1900|max:'.date('Y'),            
        ]);

        $response = array();    
        $statusCode = 200;

        try{
            DB::beginTransaction(); 

            JoLegalExperience::where('judicial_officer_id',$request->input('id'))->delete(); 

            for($i=0;$i<sizeof($request['subdivision_id']);$i++){
                $jo_legal_experience = new JoLegalExperience;

                if(!empty($request->subdivision_id[$i])){
                    $jo_legal_experience->judicial_officer_id = $request->id;                       
                    $jo_legal_experience->subdivision_id = $request->subdivision_id[$i];
                    $jo_legal_experience->from_year = $request->from_year[$i];
                    $jo_legal_experience->to_year = $request->to_year[$i];

                    $jo_legal_experience_details[$i] = $jo_legal_experience->save();
                }
                else{
                    $jo_legal_experience_details = null;
                }
            }

            DB::commit();
        }
        catch (\Exception $e) {
            DB::rollBack(); 
            $response = array(
                'exception' => true,
                'exception_message' => $e->getMessage()
            );           
            $statusCode = 400;
        } finally {
            return response()->json($response, $statusCode);
        }
    }


    public function update_qualification_details(Request $request){
        $this->validate($request,[
            'id' => 'required|max:99999|exists:judicial_officers,id',
            'qualification_id' => 'array',
            'qualification_id.*' => 'required_with:passing_year.*|nullable|integer|exists:qualifications,id|max:500',
            'passing_year' => 'array',
            'passing_year.*' => 'required_with:qualification_id.*|nullable|integer|min:1900|max:'.date('Y'),
        ]);

        $response = array();    
        $statusCode = 200;

        try{
            DB::beginTransaction(); 

            JudicialOfficerQualification::where('judicial_officer_id',$request->input('id'))->delete(); 

            for($i=0;$i<sizeof($request->qualification_id);$i++){
                $jo_qualification = new JudicialOfficerQualification;

                if(!empty($request->qualification_id[$i])){
                    $jo_qualification->judicial_officer_id = $request->id;
                    $jo_qualification->qualification_id = $request->qualification_id[$i];
                    $jo_qualification->passing_year = $request->passing_year[$i];                        

                    $qualification_details[$i] = $jo_qualification->save();
                }
                else{
                    $qualification_details = null;
                }
            }

            DB::commit();
        }
        catch (\Exception $e) {
            DB::rollBack(); 
            $response = array(
                'exception' => true,
                'exception_message' => $e->getMessage()
            );           
            $statusCode = 400;
        } finally {
            return response()->json($response, $statusCode);
        }
    }

}
