{{--
<!-- views/departments/index.blade.php -->
--}}
@extends('layouts.app') @section('title', 'Document Type')
@section('page_heading') DocumentType @endsection
@section('center_main_content')
<!-- Bootstrap Boilerplate... -->
<div class="col-sm-12">
	<div id="info-panel" class="panel panel-default">
		<!-- IIIIIIIIIII -->
		<div id="info-panel-heading" class="panel-heading">ADD NEW DOCUMENT TYPE</div>
		<!-- IIIIIIIIIII -->
		    <div class="panel-body">

			<!-- New Task Form -->
			    <input type="hidden" id="type_name-id">
				    <div id="type_name-group" class="form-group our-form-group">
                        <!-- IIIIIIIIIII -->
                        <label for="type_name" class="col-sm-2 col-sm-offset-1 control-label">Document Type</label>

					<div class="col-sm-4">
						<input id="type_name" type="text"
							class="form-control info-form-control" name="type_name"> <span
							id="type_name-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
							<strong id="type_name-strong" class="our-error-message-strong"></strong>
							<!-- IIIIIIIIIII -->
						</span>
					</div>
					<button id="save" type="submit"
							class="btn btn-success save-button info-form-button">
							<i class="fa fa-btn fa-floppy-o"></i> Save
					</button>
					<button id="reset" type="reset"
							class="btn btn-danger save-button info-form-button">
							<i class="fa fa-btn fa-floppy-o"></i> Reset
					</button>
				</div>
				

				<div id="info-panel-buttons" class="form-group hide">
					<div class="col-md-6 col-md-offset-4">
						<button id="add-button" type="submit"
							class="btn btn-primary add-button info-form-button">
							<i class="fa fa-btn fa-plus-circle"></i> Add New Document Types
						</button>
					</div>
				{{--@foreach($errors->all() as $error) {{$error}}@endforeach--}}
			</div>
		</div>

	<div id="datatable-panel" class="panel panel-default">
		<div id="datatable-panel-heading" class="panel-heading clearfix">
			<div class="panel-title pull-left">Document Type Master</div>
			
			<div class="pull-right">
				<button id="add-new-button" type="submit" class="btn btn-primary add-new-button">
					<i class="fa fa-plus-circle"></i> Add New
				</button>
			</div>
		</div>
		
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-striped notice-types-table"
					id="datatable-table" style="width: 100%;">

					<!-- Table Headings -->
					<thead>
						<tr>
							<th></th>
							<th>Document Name</th>
							<th>Action</th>
						</tr>

					</thead>
					<tbody></tbody>
					<!-- Table Footer -->
				</table>
			</div>

		</div>
	</div>
</div>
<div id="test-div"></div>

@endsection @include('layouts.1_column_content')


@section('main_container') @yield('1_column_content') @endsection

@section('meta')
@parent
<meta name="_token" content="{!! csrf_token() !!}" />
@endsection

@section('end_scripts') @parent

<script type="text/javascript">
var table="";
$(function() {
	// table = $('#datatable-table').DataTable({
	// 	"processing": true,
	// 	"serverSide": true,
	// 	"ajax":{
	// 		url:"{{url('Department')}}-Datatable-Server-Side",
	// 		dataSrc:"departments"
	// 	},

	// 	"columnDefs": 
	// 		[
	// 			{ className: "table-text", "targets": "_all" },
				
	// 			{
	// 				"targets": -1,
	// 				"data": null,
	// 				"searchable": false,
	// 				"sortable":false,
	// 				"defaultContent": '<button type="submit" class="btn btn-warning edit-button"><i class="fa fa-pencil"></i></button>',
	// 			},
	// 		],
	// 	"columns": 
	// 		[
	// 			{
	// 				"data": null,
	// 				"defaultContent": "",
	// 				"searchable": false,
	// 				"orderable": false,
	// 			},
	// 			{
	// 				"data": "department_name",
	// 			},		
	// 			{
	// 				"data": null
	// 			},
	// 		],
	// 	"order": [[ 1, 'asc' ]]
	// });




	$(document).on("click","#save",function(){

		var type_name= $("#type_name").val();

		$.ajax({
			type:"POST",
			url:"document_types",
			data: {
					_token: $('meta[name="csrf-token"]').attr('content'),
					type_name:type_name
				},
				success:function(response){

					swal("Successfull","Document type has been successfully added","success");
				
				},
				error:function(response){

					swal("Error","","error");
					
				}
		});
		
	});

});

</script>
@endsection

@section('body_attributes') @parent class="" @endsection
