<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\District;
use App\Court;
use App\CourtComplex;
use Carbon\Carbon;
use App\Lcr_hc_end;
use App\Lcr_lc_detail;
use Auth;

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
	
	//lcr request data entry into database
	public function database_entry(Request $request){
		$district=$request->input('district');
		$court_complex=$request->input('court_complex');
		$court=$request->input('court');
		$hc_case_type=$request->input('hc_case_type');
		$hc_case_no=$request->input('hc_case_no');
		$hc_case_year=$request->input('hc_case_year');
		$lc_case_type=$request->input('lc_case_type');
		$lc_case_no=$request->input('lc_case_no');
		$lc_case_year=$request->input('lc_case_year');
		$deadline=date("Y-m-d", strtotime($request->input('deadline')));
		$userid=Auth::user()->id;
		
		
		
		if(district==""){
			echo "1.5";
		}
		else if(court_complex==""){
			echo "2.5";
		}
		else if(court==""){
			echo "3.5";
		}
		else if(hc_case_type==""){
			echo "4.5";
		}
		else if(hc_case_no==""){
			echo "5.5";
		}
		else if(hc_case_year==""){
			echo "6.5";
		}
		for($j=0;$j<sizeof($lc_case_type);$j++){
			else if(lc_case_type[$j] == "" || lc_case_no[$j] == "" || lc_case_year[$j] == ""){
				echo "1000";
			}
		}
		else if(deadline == ""){
			echo "10.5";
		}
		
		
		else{
		$hc_id = Lcr_hc_end::insertGetId(
		[
			'district' => $district,
			'complex' => $court_complex,
			'court' => $court,
			'hc_case_record' => $hc_case_type,
			'hc_case_no' => $hc_case_no,
			'hc_case_year' => $hc_case_year,
			'deadline' => $deadline,
			'created_by' => $userid
		]
		);
		
		for($i=0;$i<sizeof($lc_case_type);$i++){
			Lcr_lc_detail::insert(
			[
				'hc_id' => $hc_id,
				'lower_case_record' => $lc_case_type[$i],
				'lower_case_no' => $lc_case_no[$i],
				'lower_case_year' => $lc_case_year[$i],
				'created_by' => $userid
			]
			);
		}//for loop ends
	} //else ends
	} //database_entry function ends
}
