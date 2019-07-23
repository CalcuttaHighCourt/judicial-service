<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\RecruitmentBatch;
use Auth;

class RecruitmentBatchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $response = [];
            $statusCode = 200;
            $recruitment_batches = array();
    
            try {
    
                $recruitment_batches = RecruitmentBatch::all();
    
    
                $response = array(
                    'recruitment_batches' => $recruitment_batches
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

    public function index_for_datatable(Request $request) {
        $response = [ ];
        $statusCode = 200;
        $recruitmentbatches = array();
        
        try {
            $draw=1;
            $records_total=0;
            
            $recruitmentbatches = RecruitmentBatch::all();
            
            $records_total=$recruitmentbatches->count();
            
            $draw=$request->draw;
            $offset=$request->start;
            $length=$request->length;
            $search=$request->search["value"];
            
            $order=$request->order;
            
            $filtered = RecruitmentBatch::where('recruitment_batch_desc', 'ilike','%'.$search.'%')->get();
            
            $records_filtered_count=$filtered->count();
            
            $ordered=$filtered;
            
            // for ($i = 0; $i < count($order); $i++) {
            //     $ordered = $ordered->orderBy($request->columns[$order[$i]['column']]['data'], strtoupper($order[$i]['dir']));
            //     print_r($ordered);exit;
            // }

            // $page_displayed = $ordered->get()->slice($offset, $length, true)->values();

            $response = array (
                    "draw" => $draw,
                    "recordsTotal" => $records_total,
                    "recordsFiltered" => $records_filtered_count,
                    "recruitmentbatches" => $ordered,
            );
        } catch ( \Exception $e ) {
            $response = array (
                    "draw" => $draw,
                    "recordsTotal" => $records_total,
                    "recordsFiltered" => 0,
                    "recruitmentbatches" => [],					
            );			
        } finally{
            return response ()->json ( $response, $statusCode );
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        {
            $response = [ 
                'recruitmentbatch' => [ ] 
            ];
            $statusCode = 200;
            $recruitmentbatch = null;

            $this->validate ( $request, [ 
                    'recruitment_batch_desc' => array('required','max:75','regex:/^[\pL\d\s]+$/u','unique:recruitment_batches,recruitment_batch_desc'),
                    'batch_year' => array('required','integer') 
            ] );

            try {
                $recruitment_batch_desc = strtoupper($request->input('recruitment_batch'));
                $batch_year = strtoupper($request->input('batch_year'));
                $request['created_by'] = Auth::user()->id;
                $recruitmentbatch = RecruitmentBatch::create ($request->all());

                $response = array (
                        'recruitmentbatch' => $recruitmentbatch 
                );   

            } catch ( \Exception $e ) {
                $response = array (
                        'exception' => true,
                        'exception_message' => $e->getMessage () 
                );
                $statusCode = 400;
            } finally{
                return response ()->json ( $response, $statusCode );           
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
   
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        $response = [
            'recruitmentbatch' => []
        ];
        $statusCode = 200;
        $recruitmentbatch = null;
        
        if (!ctype_digit(strval($id))) {
            $response = array(
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response()->json($response, $statusCode);
        }
        
        $this->validate($request, [
            'id' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'exists:recruitment_batches,id'),
            'batch_year' => array('required'),
            'recruitment_batch_desc' => array('required','integer')
            ]);

        try {
            $recruitmentbatch = RecruitmentBatch::find($id);
            if (!$recruitmentbatch) {
                throw new \Exception('Invalid Input');
            }
            $recruitmentbatch->batch_year = $request->batch_year;
            $recruitmentbatch->recruitment_batch_desc = $request->recruitment_batch_desc;

            $recruitmentbatch->created_by = Auth::user()->id;
            $recruitmentbatch->save();

            $response = array(
                'recruitmentbatch' => $recruitmentbatch
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
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $response = [
            'recruitmentbatch' => []
        ];
        $statusCode = 200;
        $recruitmentbatch = null;

        try {
            if (!ctype_digit(strval($id))) {
                throw new \Exception('Please check input');
            }
            $recruitmentbatch = RecruitmentBatch::find($id);

            if ($recruitmentbatch->judicial_officers->count() > 0) {
                $response = array(
                    'exception' => true,
                    'exception_message' => "Record(s) of Recruitment Batch: " . $recruitmentbatch->recruitment_batch_desc . " exists in Judicial Officer table.",
                );
                $statusCode = 400;
            }  else {
                if (!empty($recruitmentbatch)) {
                    $recruitmentbatch->delete();
                }
                $response = array(
                    'recruitmentbatch' => $recruitmentbatch
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
