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
		
		
		$request->validate([
			'district' => 'required',
			'court_complex' => 'required',
			'court' => 'required',
			'hc_case_type' => 'required',
			'hc_case_no' => 'required',
			'hc_case_year' => 'required',
			'deadline' => 'required'
		]);
		
		
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
	}//database_entry function ends

	public function fetch_details(Request $request){

		$data= array();

		/*
		$hc_records=Lcr_hc_end::join('hc_case_types','hc_case_types.id','=','lcr_hc_ends.hc_case_record')
		->select('hc_case_types.type_name','hc_case_no','hc_case_year','deadline')->get();
		*/
		$hc_records=Lcr_hc_end::with('case_type','lcr_case_details.lower_case_type')->get();
		$data["hc_records"]=$hc_records;
		/*
		//join('lcr_lc_details','lcr_lc_details.hc_id','=','lcr_hc_ends.id')
										join('hc_case_types','hc_case_types.id','=','lcr_hc_ends.id')
										//->join('lower_case_types','lower_case_types.id','=','lcr_lc_details.id')
										->distinct()
										->select('hc_case_types.type_name','hc_case_no','hc_case_year')
										->get();
		*/
		$i=0;
		$strings[]="";
		
		// foreach($hc_records as $hc_record)
		// {
		// 	foreach($hc_record->lcr_case_details as $lcr_case_detail)
		// 	{
		// 		echo $lcr_case_detail->lower_case_type->type_name."/".$lcr_case_detail->lower_case_no."/".$lcr_case_detail->lower_case_year."<br/>";
		// 	}
		// 	echo "in ".$hc_record->case_type->type_name."/".$hc_record->hc_case_no."/".$hc_record->hc_case_year."<br/><br/>";
			// foreach($data[$i] as $lcr)			
			// 	$strings[$i]+=$lcr['lower_case_type'].'/'.$lcr['lower_case_no'].'/'.$lcr['lower_case_year'].'is required by Hon’ble High Court in the Case No:'.$lcr['hc_case_type'].$lcr['hc_case_no'].$lcr['hc_case_year'].' within '.date('d-m-Y',strtotime($lcr[0]['deadline'])).'.';
			// $i++;
		//}
    // echo "<pre>";
    //     print_r($data);
    // echo "</pre>";
    // exit();

		//return view('lcr.lower_index',compact('data'));
		return view('lcr.lower_index')->with('data',$data);
		//return view('lcr.lower_index')->with(compact('data',$data));

	}

}//class lcrcontroller ends
