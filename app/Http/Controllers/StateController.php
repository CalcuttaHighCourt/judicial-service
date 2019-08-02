<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\State;
use Auth;

class StateController extends Controller {

    public function index() {
        $response = [];
        $statusCode = 200;
        $states = array();

        try {

            $states = State::all();


            $response = array(
                'states' => $states
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
        $states = array();

        try {
            $draw = 1;
            $records_total = 0;

            $states = State::all();
            $records_total = $states->count();

            $draw = $request->draw;
            $offset = $request->start;
            $length = $request->length;
            $search = $request->search["value"];

            $order = $request->order;

            $filtered = State::where('state_name', 'ilike', '%' . $search . '%');

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
                "states" => $page_displayed,
            );
        } catch (\Exception $e) {
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => 0,
                "states" => [],
            );
        } finally {
            return response()->json($response, $statusCode);
        }
    }

    public function store(Request $request) {
        $response = [
            'state' => []
        ];
        $statusCode = 200;
        $state = null;

        $this->validate($request, [
            'state_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:states,state_name')
        ]);


        try {
            $state_name = strtoupper($request->input('state_name'));
            $request['created_by'] = Auth::user()->id;

            $state = State::create($request->all());
            $response = array(
                'state' => $state
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
            'state' => []
        ];
        $statusCode = 200;
        $state = null;

        try {
            if (!ctype_digit(strval($id))) {
                throw new \Exception('Invalid Input');
            }
            $state = State::find($id);
            $response = array(
                'state' => $state
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
            'state' => []
        ];
        $statusCode = 200;
        $state = null;
        
        if (!ctype_digit(strval($id))) {
            $response = array(
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }
        
        $this->validate($request, [
            'state_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:states,state_name,'.$id.',id'),
        ]);

        try {
            $state = State::find($id);
            if (!$state) {
                throw new \Exception('Invalid Input');
            }
            $state->state_name = $request->state_name;
            $state->created_by = Auth::user()->id;
            $state->save();

            $response = array(
                'state' => $state
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
            'state' => []
        ]; 
        $statusCode = 200;
        $state = null; 
        try {
            if (!ctype_digit(strval($id))) {
                throw new \Exception('Please check input');
            }
            $state = State::find($id); 

            if ($state->districts->count() > 0) {
                $response = array(
                    'exception' => true,
                    'exception_message' => "Records of state: " . $state->state_name . " exists in Districts table.", //Should be changed #29
                );
                $statusCode = 400;
            } elseif ($state->judicial_officers->count() > 0) { 
                $response = array(
                    'exception' => true,
                    'exception_message' => "Records of state: " . $state->state_name . " exists in Judicial Officers table.", //Should be changed #29
                );
                $statusCode = 400;
            } else {

                if (!empty($state)) { 
                    $state=$state->delete();                    
                }
                $response = array(
                    'state' => $state
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
