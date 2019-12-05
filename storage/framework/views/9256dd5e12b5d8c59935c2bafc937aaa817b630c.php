 <?php $__env->startSection('title', 'Document Type'); ?>
<?php $__env->startSection('page_heading'); ?> DocumentType <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
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

<?php $__env->stopSection(); ?> <?php echo $__env->make('layouts.1_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?> <?php echo $__env->yieldContent('1_column_content'); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('meta'); ?>
##parent-placeholder-cb030491157b26a570b6ee91e5b068d99c3b72f6##
<meta name="_token" content="<?php echo csrf_token(); ?>" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('end_scripts'); ?> ##parent-placeholder-36ee17f40f3980c360dd4f0dee7896f1cfc0384a##

<script type="text/javascript">
var table="";
$(function() {
	// table = $('#datatable-table').DataTable({
	// 	"processing": true,
	// 	"serverSide": true,
	// 	"ajax":{
	// 		url:"<?php echo e(url('Department')); ?>-Datatable-Server-Side",
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
<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/document_types/index.blade.php ENDPATH**/ ?>