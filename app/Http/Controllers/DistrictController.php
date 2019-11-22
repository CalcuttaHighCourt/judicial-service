<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\District;
use App\State;
use Auth;

class DistrictController extends Controller {

    public function index() {
        $response = [];
        $statusCode = 200;
        $districts = array();

        try {

            $districts = District::all();


            $response = array(
                'districts' => $districts
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

    public function index2(Request $request) {
        $response = [];
        $statusCode = 200;
        $districts = array();

        try {
            $draw = 1;
            $records_total = 0;

            $districts = District::all();
            $records_total = $districts->count();

            $draw = $request->draw;
            $offset = $request->start;
            $length = $request->length;
            $search = $request->search["value"];

            $order = $request->order;

            $filtered = District::where('district_name', 'ilike', '%' . $search . '%')
                    ->orWhere('state_name', 'ilike', '%' . $search . '%')
                    ->join('states', 'districts.state_id', '=', 'states.id')
                    ->select('districts.*', 'states.state_name as state_name');

            $records_filtered_count = $filtered->count();



            $ordered = $filtered;

            for ($i = 0; $i < count($order); $i++) {
                $ordered = $ordered->orderBy($request->columns[$order[$i]['column']]['data'], strtoupper($order[$i]['dir']));
            }

            $page_displayed = $ordered->get()->slice($offset, $length, true)->values();

            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => $records_filtered_count,
                "districts" => $page_displayed,
            );
        } catch (\Exception $e) {
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => 0,
                "districts" => [],
            );
        } finally {
            return response()->json($response, $statusCode);
        }
    }

    public function store(Request $request) {
        $response = [
            'district' => []
        ];
        $statusCode = 200;
        $district = null;

        $this->validate($request, [
            'district_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:districts,district_name'),
            'state_id' => array('required', 'integer', 'exists:states,id')
        ]);


        try {
            $request['created_by'] = Auth::user()->id;

            $district = District::create($request->all());
            $response = array(
                'district' => $district
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

    public function show($id) {
        $response = [
            'district' => []
        ];
        $statusCode = 200;
        $district = null;

        try {
            if (!ctype_digit(strval($id))) {
                throw new \Exception('Invalid Input');
            }
            $district = District::find($id);
            $response = array(
                'district' => $district
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

    public function update(Request $request, $id) {
        $response = [
            'district' => []
        ];
        $statusCode = 200;
        $district = null;

        if (!ctype_digit(strval($id))) {
            $response = array(
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }

        $this->validate($request, [
            'district_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:districts,district_name,' . $id . ',id'),
            'state_id' => array('required', 'integer', 'exists:states,id'),
        ]);

        try {
            $district = District::find($id);
            if (!$district) {
                throw new \Exception('Invalid Input');
            }

            $request['created_by'] = Auth::user()->id;

            $district->district_name = $request->district_name;
            $district->created_by = $request->created_by;

            $district->save();

            $response = array(
                'district' => $district
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

    public function destroy($id) {
        $response = [
            'district' => []
        ];
        $statusCode = 200;
        $district = null;

        try {
            if (!ctype_digit(strval($id))) {
                throw new \Exception('Please check input');
            }
            $district = District::find($id);

            if ($district->judicial_officers->count() > 0) {
                $response = array(
                    'exception' => true,
                    'exception_message' => "Record(s) of District: " . $district->district_name . " exists in Judicial Officer table.",
                );
                $statusCode = 400;
            } else if ($district->subdivisions->count() > 0) {
                $response = array(
                    'exception' => true,
                    'exception_message' => "Record(s) of District: " . $district->district_name . " exists in Subdivision table.",
                );
                $statusCode = 400;
            } 
            else {
                if (!empty($district)) {
                    $district->delete();
                }
                $response = array(
                    'district' => $district
                );
            }
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

}
