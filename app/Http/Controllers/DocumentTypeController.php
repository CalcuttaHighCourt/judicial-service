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
			0 =>'SL NO', 
			1 =>'DOCUMENT TYPE',
			2 =>'ACTION'
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
                $nestedData['SL NO'] = ++$i;
                $nestedData['DOCUMENT TYPE'] = $document->type_name;
                $nestedData['ACTION'] = "<i class='fa fa-edit' aria-hidden='true'></i>";

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
    public function update(Request $request, $id)
    {
        //
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
