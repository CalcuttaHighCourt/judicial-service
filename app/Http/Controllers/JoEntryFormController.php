<?php

namespace App\Http\Controllers;

use App\Http\Requests\JoEntryRequest;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\JudicialOfficer;
use App\State;
use App\CourtComplex;
use Auth;

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
            'judicial_officer' => [ ]
        ]; 
        
        $statusCode = 200;
        $judicial_officer = null; 

        $validated = $request->validated(); // validation rules are set in the Request File  
        
        $request['created_by'] = Auth::user()->id;

        try{
            $judicial_officer = JudicialOfficer::create($request->except([
                                    'file','qualification_id','passing_year',
                                    'designation_id','designation_id','court_id',
                                    'court_complex_id','mode_id','from_date','to_date'
                                ]));
            $response = array(
                'judicial_officer' => $judicial_officer
            );
        
        } catch (\Exception $e) {
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
        //
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
