<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
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
use App\JoDocument;
use Auth;
use DB;
use Carbon\Carbon;

class SearchController extends Controller
{
    public function search (Request $request){
        echo "1";
    }
}
