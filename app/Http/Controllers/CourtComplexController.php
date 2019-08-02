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
