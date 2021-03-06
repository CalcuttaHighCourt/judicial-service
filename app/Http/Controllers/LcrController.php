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
use DB;

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
		$court=$request->input('court');//this should be open 
		//$court=Auth::user()->court_id;//for the timing till the login id is not created for all users after that the above line will be in use
		$hc_case_type=$request->input('hc_case_type');
		$hc_case_no=$request->input('hc_case_no');
		$hc_case_year=$request->input('hc_case_year');
		$lc_case_type=$request->input('lc_case_type');
		$lc_case_no=$request->input('lc_case_no');
		$lc_case_year=$request->input('lc_case_year');
		$status_flag='null';
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
			'status_flag' => $status_flag,
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
					->where([
						['court','=',Auth::user()->court_id],
						['status_flag','<>','comply']
					])->get();
		$data["hc_records"]=$hc_records;

		//print_r($data); exit;
		
		
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

	public function submit_comply(Request $request){

		$this->validate($request, [
            'remarks' => array('required', 'max:75'),
            'memo_no' => array('required'),
            'memo_date' => array('required'),
		]);
		
		
				$remarks = $request->input('remarks');
				$memo_no = $request->input('memo_no');
				$memo_date = $request->input('memo_date');
				$created_by = Auth::user()->id;
				
				$data = [
					'status_flag'=>'comply',
					'updated_at'=>Carbon::today()
				];
				
				
				Lcr_hc_end::where([
					['memo_no','ilike',$memo_no],
					['memo_date','ilike',$memo_date]		
				])->update($data);

					
	return 1;

	

	}

	public function submit_forward(Request $request){

		$this->validate($request, [
            'remarks' => array('required', 'max:75'),
            'memo_no' => array('required', 'max:75'),
			'memo_date' => array('required', 'max:75'),
			'forwarding_court_name' => array('required')
		]);
		

		$remarks = $request->input('remarks');
        $memo_no = $request->input('memo_no');
		$memo_date = $request->input('memo_date');
		$forwarding_court_name = $request->input('forwarding_court_name');
		$created_by = Auth::user()->id;

		$data = [
			'status_flag'=>'forward',
			'forwarding_court' => $forwarding_court_name,
			'updated_at'=>Carbon::today()
		];
		
		
		Lcr_hc_end::where([
			['memo_no','ilike',$memo_no],
			['memo_date','ilike',$memo_date]		
		])->update($data);

	return 1;
		
	}

	public function fetch_status_details(Request $request){

		$columns = array( 
			0 =>'SL NO', 
			1 =>'HIGH COURT CASE NO',
			2 =>'MEMO DETAILS',
			3 =>'STATUS',
			4 =>'ACTION'
		);

		$totalData = Lcr_hc_end::count();

		$totalFiltered = $totalData; 

		$limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if(empty($request->input('search.value'))){
			$lcr_hc_ends = Lcr_hc_end::join('hc_case_types','lcr_hc_ends.hc_case_record','=','hc_case_types.id')
						->select('hc_case_types.type_name','lcr_hc_ends.hc_case_no','lcr_hc_ends.hc_case_year',
								 'lcr_hc_ends.memo_no', 'lcr_hc_ends.memo_date','lcr_hc_ends.status_flag')
						->offset($start)
						->limit($limit)
						->orderBy('memo_no',$dir)
						->get();

						
			 $totalFiltered = Lcr_hc_end::count();
		}
		else{
			$search = $request->input('search.value');
			$lcr_hc_ends =Lcr_hc_end::join('hc_case_types','lcr_hc_ends.hc_case_record','=','hc_case_types.id')
									->select('hc_case_types.type_name','lcr_hc_ends.hc_case_no','lcr_hc_ends.hc_case_year',
									'lcr_hc_ends.memo_no', 'lcr_hc_ends.memo_date','lcr_hc_ends.status_flag')
									->offset($start)
									->limit($limit)
									->orderBy('memo_no',$dir)
									->get();

									

			$totalFiltered = Lcr_hc_end::join('hc_case_types','lcr_hc_ends.hc_case_record','=','hc_case_types.id')
							->select('hc_case_types.type_name','lcr_hc_ends.hc_case_no','lcr_hc_ends.hc_case_year',
							'lcr_hc_ends.memo_no', 'lcr_hc_ends.memo_date','lcr_hc_ends.status_flag')
							->offset($start)
							->limit($limit)
							->orderBy('memo_no',$dir)
							->count();
		}

		$data = array();

		$nestedData['SL NO'] = 0;


		if($lcr_hc_ends){
			foreach($lcr_hc_ends as $lcr_hc_end){
				
				//print_r($lcr_hc_end); exit();

				$nestedData['SL NO'] += 1;
				$nestedData['HIGH COURT CASE NO'] = $lcr_hc_end->type_name."/".$lcr_hc_end->hc_case_no."/".$lcr_hc_end->hc_case_year;
				$nestedData['MEMO DETAILS'] = $lcr_hc_end->memo_no." Dated " .date("d-m-Y", strtotime($lcr_hc_end->memo_date));
				if( !empty($lcr_hc_end->status_flag)){
					$nestedData['STATUS'] = $lcr_hc_end->status_flag;
				}
				else{
					$nestedData['STATUS'] = 'Action Not Taken';
				}
				
				$nestedData['ACTION'] = "<i class='fa fa-map-marker' aria-hidden='true'> Track LCR</i>";

				//print_r($nestedData['Memo Details']); exit();



				$data[] = $nestedData;
			}
			
			$json_data = array(
				"draw" => intval($request->input('draw')),
				"recordsTotal" => intval($totalData),
				"recordsFiltered" =>intval($totalFiltered),
				"data" => $data
			);
	
			echo json_encode($json_data);
		}

	}

}//class lcrcontroller ends
