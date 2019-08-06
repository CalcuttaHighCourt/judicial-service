<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Zone;
use App\CourtComplex;
use App\Subdivision;
use App\State;
use Auth;

class CourtComplexController extends Controller
{
    public function index() {
        $response = [];
        $statusCode = 200;
        $court_complexes = array();

        try {
            $court_complexes = CourtComplex::all();

            $response = array(
                'court_complexes' => $court_complexes
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
        $CourtComplex = array();

        try {
            $draw = 1;
            $records_total = 0;

            $CourtComplex = CourtComplex::all();
            $records_total = $CourtComplex->count();

            $draw = $request->draw;
            $offset = $request->start;
            $length = $request->length;
            $search = $request->search["value"];

            $order = $request->order;

            $filtered = CourtComplex::where('court_complex_name', 'ilike', '%'.$search.'%')
                                ->orWhere('district_name', 'ilike', '%'.$search.'%')
                                ->join('court_complexes', 'court_complexes.district_id', '=', 'districts.id')
                                ->select('court_complexes.*', 'districts.district_name as district_name');

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
                "courts" => $page_displayed,
            );
        } catch (\Exception $e) {
            $response = array(
                "draw" => $draw,
                "recordsTotal" => $records_total,
                "recordsFiltered" => 0,
                "courts" => [],
            );
        } finally {
            return response()->json($response, $statusCode);
        }
    }
    
    public function store(Request $request)
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
