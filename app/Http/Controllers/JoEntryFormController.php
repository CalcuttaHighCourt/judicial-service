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
                                            'jo_repoting_officers','jo_reviewing_officers',
                                            'judicial_officer_qualifications.qualification',
                                            'judicial_officer_postings.designation'
                                    )->get();
        dd($JOdetails);

        //return response()->json($JOdetails);
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
