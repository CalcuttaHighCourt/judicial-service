@extends('layouts.app') 
@section('content')
<!-- Main content -->

	<div id="info-panel" class="panel panel-default">
		<!-- IIIIIIIIIII -->
		<div id="info-panel-heading" class="panel-heading">ADD NEW DESIGNATION</div>
		<!-- IIIIIIIIIII -->
		<div class="panel-body">

			<!-- New Task Form -->
			<div class="row">
				<div id="department_name-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
					<label for="department_name" class="col-sm-offset-1 col-sm-2 control-label">Designation</label>
					<div class="col-sm-4">
						<input id="designation_name" type="text"
							class="form-control info-form-control" name="designation_name"> <span
							id="designation_name-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
							<strong id="designation_name-strong" class="our-error-message-strong"></strong>
							<!-- IIIIIIIIIII -->
						</span>
					</div>
				</div>
			</div>
			<div class="row">
				<div id="rank_id-group" class="form-group our-form-group">
					<label for="rank_name" class="col-sm-offset-1 col-sm-2 control-label">Rank</label>
					<div class="col-sm-4">
						<select id="rank_id" class="form-control info-form-control"
								name="rank_id"> @include('ranks.rank_options')
						</select>
					</div>
				</div>
			</div>
			<div class="row">
			<br>
				<div id="button-group" class="form-group our-form-group col-sm-offset-4 col-sm-3">
					<button id="save" type="submit"
							class="btn btn-success save-button info-form-button">
							<i class="fa fa-btn fa-floppy-o"></i> Save
					</button>
					<button id="reset" type="reset"
							class="btn btn-danger save-button info-form-button">
							<i class="fa fa-btn fa-floppy-o"></i> Reset
					</button>
				</div>
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
			<div class="panel-title pull-left">Designation Master</div>
			
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
							<th>Designation Name</th>
							<th>Rank</th>
							<th>Action</th>
						</tr>

					</thead>
					<tbody></tbody>
					<!-- Table Footer -->
				</table>
			</div>

		</div>
	</div>


<meta name="_token" content="{!! csrf_token() !!}" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script src="{{asset('js/jquery/jquery.min.js')}}"></script>

<script>


 $(document).ready(function(){
 //Datatable Code For Showing Data :: START

// var table = $('#datatable-table').dataTable({
// 		"processing": true,
// 		"serverSide": true,
// 		"ajax":{
// 			"url":"{{url('Designation')}}-Datatable-Server-Side",
// 			"dataType": "json",
//             "type": "GET",
// 			"data":{ 
// 					_token: $('meta[name="csrf-token"]').attr('content')}
//                 },      
// 		 		"columns": [                
// 						{"class": "sl_no",
//                         "data": "SL NO" },
// 						{"class": "designation_name",
// 						"data": "DESIGNATION NAME" },
// 						{"class": "rank_id",
// 						"data": "RANK" },
// 						{"class": "edit",
// 						"data": "ACTION" }
// 					]

// 				});




	$(document).on("click","#save",function(){

		var lcr_department_name= $("#designation_name").val();
		var rank_id=$("#rank_id").val();

		$.ajax({
			type:"POST",
			url:"designations",
			data: {
					_token: $('meta[name="csrf-token"]').attr('content'),
					designation_name:designation_name,
					rank_id:rank_id
				},
				success:function(response){

					swal("Successfull","Department has been successfully added","success");
					table.api().ajax.reload();
				
				},
				error:function(response){

					swal("Error","","error");
					
				}
		});
		
	});

});

</script>
@endsection


