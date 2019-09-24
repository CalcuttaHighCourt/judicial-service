<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\GradeDetail;
use Auth;

class gradeController extends Controller
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
        $grades = array();

        try {

            $grades = GradeDetail::all();


            $response = array(
                'grades' => $grades
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
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $response = [ 
            'grade' => [ ] 
        ];
        $statusCode = 200;
        $grade = null;

        $this->validate ( $request, [ 
                'grade_name' => array('required','max:75','regex:/^[\pL\d\s]+$/u','unique:grade_details,grade_name') 
        ] );

        try {

            $grade_name = strtoupper($request->input('grade_name'));
            $request['created_by'] = Auth::user()->id;
            $mode = GradeDetail::create ($request->all ());

            $response = array (
                    'grade' => $grade 
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

  

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // $response = [
            //         'state' => []
            //     ];
            //     $statusCode = 200;
            //     $state = null;
        
            //     try {
            //         if (!ctype_digit(strval($id))) {
            //             throw new \Exception('Invalid Input');
            //         }
            //         $state = State::find($id);
            //         $response = array(
            //             'state' => $state
            //         );
            //     } catch (\Exception $e) {
            //         $response = array(
            //             'exception' => true,
            //             'exception_message' => $e->getMessage()
            //         );
            //         $statusCode = 400;
            //     } finally {
            //         return response()->json($response, $statusCode);
            //     }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
    //     $response = [
            //         'state' => []
            //     ];
            //     $statusCode = 200;
            //     $state = null;
                
            //     if (!ctype_digit(strval($id))) {
            //         $response = array(
            //             'exception' => true,
            //             'exception_message' => 'Invalid Input'
            //         );
        
            //         $statusCode = 400;
            //         return response()->json($response, $statusCode);
            //     }
                
            //     $this->validate($request, [
            //         'state_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u', 'unique:states,state_name,'.$id.',id'),
            //     ]);
        
            //     try {
            //         $state = State::find($id);
            //         if (!$state) {
            //             throw new \Exception('Invalid Input');
            //         }
            //         $state->state_name = $request->state_name;
            //         $state->created_by = Auth::user()->id;
            //         $state->save();
        
            //         $response = array(
            //             'state' => $state
            //         );
            //     } catch (\Exception $e) {
            //         $response = array(
            //             'exception' => true,
            //             'exception_message' => $e->getMessage()
            //         );
            //         $statusCode = 400;
            //     } finally {
            //         return response()->json($response, $statusCode);
            //     }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
     {
        $response = [
                'grade' => []
            ]; 
            $statusCode = 200;
            $state = null; 
            try {
                if (!ctype_digit(strval($id))) {
                    throw new \Exception('Please check input');
                }
                $grade = Grade::find($id); 
    
                if ($grade->count() > 0) {
                    $response = array(
                        'exception' => true,
                        'exception_message' => "Records of grade: " . $grade->grade_name . " exists in Grade table.", //Should be changed #29
                    );
                    $statusCode = 400;
                } elseif ($grade->judicial_officers->count() > 0) { 
                    $response = array(
                        'exception' => true,
                        'exception_message' => "Records of grade: " . $grade->grade_name . " exists in Judicial Officers table.", //Should be changed #29
                    );
                    $statusCode = 400;
                } else {
    
                    if (!empty($grade)) { 
                        $grade=$grade->delete();                    
                    }
                    $response = array(
                        'grade' => $grade
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
