<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\District;
use App\Court;
use App\CourtComplex;
use Carbon\Carbon;

class LcrController extends Controller
{
    public function hc_index_court_complex(Request $request){

        $district=$request->input('district');

        $data= CourtComplex::select('id','court_complex_name')
                                ->where('district_id',$district)
                                ->get();
            

        return $data;

    }

    public function hc_index_court(Request $request){

        $court_complex=$request->input('court_complex');

            $data= Court::select('id','court_name')
                                ->where('court_complex_id',$court_complex)
                                ->get();

        return $data;

    }
}
