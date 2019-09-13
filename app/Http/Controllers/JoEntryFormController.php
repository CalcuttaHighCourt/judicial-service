<?php

namespace App\Http\Controllers;

use App\Http\Requests\JoEntryRequest;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\JudicialOfficer;
use App\JudicialOfficerQualification;
use App\JudicialOfficerPosting;
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
                                            'subordinate_officers'
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
            //DB::beginTransaction();
            DB::transaction(function ($request) {

                /*JO Basic Details :: START*/
                $request['date_of_birth']=Carbon::parse($request['date_of_birth'])->format('Y-m-d');
                $request['date_of_joining']=Carbon::parse($request['date_of_joining'])->format('Y-m-d');
                $request['date_of_confirmation']=Carbon::parse($request['date_of_confirmation'])->format('Y-m-d');
                $request['date_of_retirement']=Carbon::parse($request['date_of_retirement'])->format('Y-m-d');
            
                $judicial_officer = JudicialOfficer::insertGetId($request->except([
                                        'file','qualification_id','passing_year',
                                        'designation_id','court_id',
                                        'court_complex_id','mode_id','from_date','to_date'
                                    ]));
                /*JO Basic Details :: ENDS*/


                /*JO User ID & Password Creation :: STARTS */
                $jo_user = new User;

                $user_type = UserType::where('type_name','ilike','%judicial officer%')
                                        ->max('id');

                $jo_user->name = $request->officer_name;
                $jo_user->email = $request->email_id_1;
                $jo_user->password = Hash::make(strtolower($request->jo_code));
                $jo_user->judicial_officer_id = $judicial_officer;
                $jo_user->user_id = 'jo'.str_pad($judicial_officer,5,'0',STR_PAD_LEFT);
                $jo_user->user_type_id = $user_type;

                $login_credential = $jo_user->save();
                /*JO User ID & Password Creation :: ENDS */


                /*JO Qualification Details :: START*/
                $request->qualification_id = json_decode($request->qualification_id);
                $request->passing_year = json_decode($request->passing_year);
                $request['created_by'] = Auth::user()->id;

                for($i=0;$i<sizeof($request->qualification_id);$i++){
                    $jo_qualification = new JudicialOfficerQualification;

                    if(!empty($request->qualification_id[$i])){
                        $jo_qualification->judicial_officer_id = $judicial_officer;
                        $jo_qualification->qualification_id = $request->qualification_id[$i];
                        $jo_qualification->passing_year = $request->passing_year[$i];
                        $jo_qualification->created_by = $request['created_by'];

                        $qualification_details[$i] = $jo_qualification->save();
                    }
                    else{
                        $qualification_details = null;
                    }
                }
                /*JO Qualification Details :: ENDS*/


                /*JO Posting Details :: START*/
                $request->designation_id = json_decode($request->designation_id);
                $request->court_id = json_decode($request->court_id);
                $request->court_complex_id = json_decode($request->court_complex_id);
                $request->mode_id = json_decode($request->mode_id);
                $request->from_date = json_decode($request->from_date);
                $request->to_date = json_decode($request->to_date);

                for($i=0;$i<sizeof($request['designation_id']);$i++){
                    $jo_posting = new JudicialOfficerPosting;
                    
                    if(!empty($request->designation_id[$i])){
                        $jo_posting->judicial_officer_id = $judicial_officer;
                        $jo_posting->designation_id = $request->designation_id[$i];
                        $jo_posting->court_id = $request->court_id[$i];
                        $jo_posting->court_complex_id = $request->court_complex_id[$i];
                        $jo_posting->mode_id = $request->mode_id[$i];
                        $jo_posting->from_date = Carbon::parse($request->from_date[$i])->format('Y-m-d');
                        $jo_posting->to_date = Carbon::parse($request->to_date[$i])->format('Y-m-d');
                        $jo_posting->created_by = $request['created_by'];

                        $posting_details[$i] = $jo_posting->save();
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

            }, 1);
                //DB::commit();
           
        } catch (\Exception $e) {
            //DB::rollBack();

            $response = array(
                'exception' => true,
                'exception_message' => $e->getMessage()
            );
            $statusCode = 400;
        } finally {
            return response()->json($response, $statusCode);
        }
    }

    
    public function show($id)
    {
        $profile = JudicialOfficer:: where('judicial_officers.id',$id)
                                        ->with('district','state','religion','recruitment_batch','caste',
                                                'jo_repoting_officer','jo_reviewing_officer',
                                                'judicial_officer_qualifications.qualification',
                                                'judicial_officer_postings.designation','judicial_officer_postings.mode',
                                                'subordinate_officers','judicial_officer_postings.court', 
                                                'subordinate_officers.reporting_officer','subordinate_officers.reviewing_officer'
                                        )
                                        ->get();
           
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
