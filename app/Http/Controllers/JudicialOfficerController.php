<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\JudicialOfficer;
use App\Diary;
use Carbon\Carbon;
use App\User;
use Auth;


class JudicialOfficerController extends Controller
{    
     
     public function store_worksheet(Request $request){

        $this->validate ( $request, [                     
            'date' => 'required',
            'details' => 'required'   
        ]);       
        
        $date=Carbon::parse($request->input('date'))->format('Y-m-d');
        $judicial_officer_id =Auth::user()->judicial_officer_id;
        $textarea=$request->input('details');


        Diary::where([['date_of_schedule',$date],['judicial_officer_id',$judicial_officer_id]])->delete();
            
        Diary::insert([
                'judicial_officer_id'=>$judicial_officer_id,
                'date_of_schedule'=>$date,
                'description'=>$textarea,
                'created_at'=>Carbon::today(),
                'updated_at'=>Carbon::today()
                ]);

        return 1;
    }

    public function show_worksheet(Request $request){

        $this->validate ( $request, [                     
            'date' => 'required'
        ]);

        $date=Carbon::parse($request->input('date'))->format('Y-m-d');
        $judicial_officer_id =Auth::user()->judicial_officer_id;
        $data=Diary::where([
                                ['date_of_schedule',$date],
                                ['judicial_officer_id',$judicial_officer_id]
                            ])
                    ->select('description')
                    ->get();
        return $data;
        
    }

}
