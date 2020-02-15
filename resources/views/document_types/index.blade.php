@extends('layouts.app') 
@section('content')
<!-- Main content -->
	<div id="info-panel" class="panel panel-default">
		<!-- IIIIIIIIIII -->
		<div id="info-panel-heading" class="panel-heading">ADD NEW DOCUMENT TYPE</div>
		<!-- IIIIIIIIIII -->
		    <div class="panel-body">

			<!-- New Task Form -->
			   
				    <div id="type_name-group" class="form-group our-form-group row">
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
						<button id="edit" type="submit"
								class="btn btn-warning edit info-form-button" style="display:none;">
								<i class="fa fa-btn fa-floppy-o"></i> Edit
						</button>
						<button id="reset" type="reset"
								class="btn btn-danger save-button info-form-button">
								<i class="fa fa-btn fa-floppy-o"></i> Reset
						</button>
					</div>
					<div id="type_id-group" class="form-group our-form-group row" style="display:none;">
						<label for="type_id" class="col-sm-2 col-sm-offset-1 control-label">Document id</label>
						<div class="col-sm-4" >
							<input id="type_id" type="text"
								class="form-control info-form-control" name="type_id"> <span
								id="type_id-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
								
								<!-- IIIIIIIIIII -->
							</span>
						</div>
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


<meta name="_token" content="{!! csrf_token() !!}" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="{{asset('js/jquery/jquery.min.js')}}"></script>

<script>

var table="";


 $(document).ready(function(){

	//Datatable Code For Showing Data :: START

	var table = $('#datatable-table').DataTable({
			"processing": true,
			"serverSide": true,
			"ajax":{
				"url":"{{url('Document')}}-Datatable-Server-Side",
				"dataType": "json",
				"type": "POST",
				"data":{ 
						_token: $('meta[name="csrf-token"]').attr('content')}
					},      
					"columns": [                
							{"data": "SL_NO" },
							{"data": "DOCUMENT_TYPE" },
							{"data": "ACTION" }
						]

				});



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
					table.api().ajax.reload();
				
				},
				error:function(response){

					swal("Error","","error");
					
				}
		});
		
	});

//event on clicking the edit pen in data table

	$(document).on("click",".edit-button",function(){
		//alert("abc");
	
		var data = table.row( $(this).parents('tr')).data();
		console.log(data);
		$("#type_name").val(data.DOCUMENT_TYPE);
		$("#type_id").val(data.ID);

		$("#edit").show();
		$("#save").hide();
		$("#reset").hide();
	
	});
	
// event on clicking edit button
	$(document).on("click","#edit",function(){
		
		var type_name=$("#type_name").val();
		var type_id= $("#type_id").val();;
	
		$.ajax({
			type:"POST",
			url:"document_edit",
			data:{
				_token: $('meta[name="csrf-token"]').attr('content'),
				type_name:type_name,
				id:type_id
			},
			success:function(response){
				swal("Updated","document type  has been updated","success");
			},
			error:function(response){
				swal("Not Updated","document type  has not been updated","error");
			}
		});
	});

//event on reset button
	// $(document).on("click","#reset",function(){
	// 	$("#type_name").val();
	// 	$("#type_id").val();

	// });

});

</script>
@endsection


