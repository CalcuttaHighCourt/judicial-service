<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\District;
use App\Court;
use App\Subdivision;
use Carbon\Carbon;
use App\Lcr_hc_end;
use App\Lcr_lc_detail;
use Auth;

class LcrController extends Controller
{

    public function hc_index_subdivision(Request $request){

        $district=$request->input('district');

        $data= Subdivision::select('id','subdivision_name')
                                ->where('district_id',$district)
                                ->get();
            

        return $data;

    }

    public function hc_index_court(Request $request){

        $subdivision=$request->input('subdivision');

            $data= Court::select('id','court_name')
                                ->where('subdivision_id',$subdivision)
                                ->get();

        return $data;

    }
	
	//lcr request data entry into database
	public function database_entry(Request $request){
		
		
		$request->validate([
			'district' => 'required',
			'subdivision' => 'required',
			'court' => 'required',
			'hc_case_type' => 'required',
			'hc_case_no' => 'required',
			'hc_case_year' => 'required',
			'deadline' => 'required',
			'memo_no' => 'required',
			'memo_date' => 'required',
		]);
		
		
		$district=$request->input('district');
		$subdivision=$request->input('subdivision');
		$court=$request->input('court');
		$hc_case_type=$request->input('hc_case_type');
		$hc_case_no=$request->input('hc_case_no');
		$hc_case_year=$request->input('hc_case_year');
		$lc_case_type=$request->input('lc_case_type');
		$lc_case_no=$request->input('lc_case_no');
		$lc_case_year=$request->input('lc_case_year');
		$deadline=date("Y-m-d", strtotime($request->input('deadline')));
		$memo_no=$request->input('memo_no');
		$memo_date=date("Y-m-d", strtotime($request->input('memo_date')));
		$userid=Auth::user()->id;
		
		
		
		$hc_id = Lcr_hc_end::insertGetId(
		[
			'district' => $district,
			'subdivision' => $subdivision,
			'court' => $court,
			'hc_case_record' => $hc_case_type,
			'hc_case_no' => $hc_case_no,
			'hc_case_year' => $hc_case_year,
			'deadline' => $deadline,
			'memo_no' => $memo_no,
			'memo_date' => $memo_date,
			'created_by' => $userid,
			'created_at'=>Carbon::today(),
			'updated_at'=>Carbon::today()
		]
		);
		
		for($i=0;$i<sizeof($lc_case_type);$i++){
			Lcr_lc_detail::insert(
			[
				'hc_id' => $hc_id,
				'lower_case_record' => $lc_case_type[$i],
				'lower_case_no' => $lc_case_no[$i],
				'lower_case_year' => $lc_case_year[$i],
				'created_by' => $userid,
				'created_at'=>Carbon::today(),
				'updated_at'=>Carbon::today()
			]
			);
		}//for loop ends
	}//database_entry function ends

	public function fetch_details(Request $request){

		$data= array();

		$hc_records=Lcr_hc_end::with('case_type','lcr_case_details.lower_case_type')
					->where('court','=',Auth::user()->court_id)->get();
		$data["hc_records"]=$hc_records;
		
		
		$i=0;
		$strings[]="";
	
		return view('lcr.lower_index')->with('data',$data);
	

	}

	public function complaince_details($id){

		

			$data= array();
	
			$hc_records=Lcr_hc_end::with('case_type','lcr_case_details.lower_case_type')
						->where([
									['court','=',Auth::user()->court_id],
									['id','=',$id]
						])
						->get();
			$data["hc_records"]=$hc_records;

			//$data["memo_no"]= Lcr_hc_end::select('memo_no','memo_date')->get();
			//echo $data["memo_no"];exit();

			return view('lcr.lower_compliance')->with('data',$data);
		
	}

}//class lcrcontroller ends
