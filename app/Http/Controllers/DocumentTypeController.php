<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DocumentType;
use Auth;

class DocumentTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('document_types.index');
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
            'document' => []
        ];
        $statusCode = 200;
        $document = null;

        $this->validate($request, [
            'type_name' => array('required', 'max:75', 'regex:/^[\pL\d\s]+$/u'),
            
        ]);


        try {
                       
            $department = DocumentType::create($request->all());
            $response = array(
                'document' => $document
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
    public function index_for_datatable(Request $request)
    {
        
        $columns = array( 
			0 =>'SL_NO', 
			1 =>'DOCUMENT_TYPE',
            2 =>'ACTION',
            3 =>'ID'
        );
        
        $totalData = DocumentType::count();

        $totalFiltered = $totalData; 
        
        $limit = $request->input('length');
		$start = $request->input('start');
		$order = $columns[$request->input('order.0.column')];
		$dir = $request->input('order.0.dir');

		if(empty($request->input('search.value'))){
            $documents = DocumentType::offset($start)
                            ->limit($limit)
                            ->orderBy('type_name',$dir)
                            ->get();
                        
             $totalFiltered = DocumentType::count();
        }

        else{
			$search = $request->input('search.value');
            $documents =DocumentType::where('type_name','ILIKE',"%{$search}%")
                                    ->offset($start)
                                    ->limit($limit)
                                    ->orderBy('type_name',$dir)
									->get();

									

			$totalFiltered = DocumentType::where('type_name',"%{$search}%")
                                           ->limit($limit)
                                            ->count();
        }
        
        $data = array();

        $i=0;

        if($documents){
            foreach($documents as $document){
                $nestedData['SL_NO'] = ++$i;
                $nestedData['DOCUMENT_TYPE'] = $document->type_name;
                $nestedData['ACTION'] = "<button type='submit' class='btn btn-warning edit-button'><i class='fa fa-pencil'></i> </button>";
                $nestedData['ID'] =  $document->id;

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

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update_documents(Request $request)
    {
        $response = [ 
            'document_type' => [ ] 
        ];
        $statusCode = 200;
        $document_type = null;

        $id=$request->id;

        if(!ctype_digit(strval( $id))){
            $response = array (
                'exception' => true,
                'exception_message' => 'Invalid Input'
            );

            $statusCode = 400;
            return response ()->json ( $response, $statusCode );
        }

        
        try {            
            $document_type = DocumentType::find($id);
            if(!$document_type){
                throw new \Exception('Invalid Input');
            }
            
            
            $document_type->type_name = $request->type_name;
            $document_type->id = $request->id;
                       
            $document_type->save();
            
            $response = array (
                'document_type' => $document_type 
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
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
