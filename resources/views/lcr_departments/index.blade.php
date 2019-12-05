{{--
<!-- views/departments/index.blade.php -->
--}}
@extends('layouts.app') @section('title', 'Department')
@section('page_heading') Department @endsection
@section('center_main_content')
<!-- Bootstrap Boilerplate... -->
<div class="col-sm-12">
	<div id="info-panel" class="panel panel-default">
		<!-- IIIIIIIIIII -->
		<div id="info-panel-heading" class="panel-heading">ADD NEW DEPARTMENT FOR LCR</div>
		<!-- IIIIIIIIIII -->
		<div class="panel-body">

			<!-- New Task Form -->
			<input type="hidden" id="Department-id">
				<div id="department_name-group" class="form-group our-form-group">
					<!-- IIIIIIIIIII -->
					<label for="department_name" class="col-md-4 control-label">Department</label>

					<div class="col-sm-4">
						<input id="department_name" type="text"
							class="form-control info-form-control" name="department_name"> <span
							id="department_name-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
							<strong id="department_name-strong" class="our-error-message-strong"></strong>
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
							<i class="fa fa-btn fa-plus-circle"></i> Add New Department
						</button>
					</div>
				{{--@foreach($errors->all() as $error) {{$error}}@endforeach--}}
			</div>
		</div>

	<div id="datatable-panel" class="panel panel-default">
		<div id="datatable-panel-heading" class="panel-heading clearfix">
			<div class="panel-title pull-left">Department Master</div>
			
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
							<th>Department Name</th>
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

		var lcr_department_name= $("#department_name").val();

		$.ajax({
			type:"POST",
			url:"departments",
			data: {
					_token: $('meta[name="csrf-token"]').attr('content'),
					lcr_department_name:lcr_department_name
				},
				success:function(response){

					swal("Successfull","Department has been successfully added","success");
				
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
