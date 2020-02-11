 
<?php $__env->startSection('content'); ?>
<!-- Main content -->
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


<meta name="_token" content="<?php echo csrf_token(); ?>" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>

<script>

var table="";

 $(document).ready(function(){

	//Datatable Code For Showing Data :: START

	var table = $('#datatable-table').DataTable({
			"processing": true,
			"serverSide": true,
			"ajax":{
				"url":"<?php echo e(url('Document')); ?>-Datatable-Server-Side",
				"dataType": "json",
				"type": "POST",
				"data":{ 
						_token: $('meta[name="csrf-token"]').attr('content')}
					},      
					"columns": [                
							{"data": "SL NO" },
							{"data": "DOCUMENT TYPE" },
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



	$(document).on("click",".edit-button",function(){
		//alert("abc");
	
		var data = table.row( $(this).parents('tr')).data();
		console.log(data.type_name);
		$("#type_name-id").val(data.id);
		$("#type_name").val(data.type_name);
			// console.log(data);
			// view_data( data );
		});

	// function view_data(data){
	// 		populate_form(data);
	// }

	// function populate_form(data){
		
	// 	$("#type_name-id").val(data.id);
	// 	$("#type_name").val(data.type_name);
	// }

});

</script>
<?php $__env->stopSection(); ?>



<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/document_types/index.blade.php ENDPATH**/ ?>