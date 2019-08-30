<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\JudicialOfficer;
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
    
    public function store(Request $request)
    {
        //
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
}
