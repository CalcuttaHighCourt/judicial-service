 <?php $__env->startSection('title', 'Department'); ?>
<?php $__env->startSection('page_heading'); ?> Department <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
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

<?php $__env->stopSection(); ?> <?php echo $__env->make('layouts.1_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?> <?php echo $__env->yieldContent('1_column_content'); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('meta'); ?>
##parent-placeholder-cb030491157b26a570b6ee91e5b068d99c3b72f6##
<meta name="_token" content="<?php echo csrf_token(); ?>" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('end_scripts'); ?> ##parent-placeholder-36ee17f40f3980c360dd4f0dee7896f1cfc0384a##

<script>


 $(document).ready(function(){
 //Datatable Code For Showing Data :: START

var table = $('#datatable-table').dataTable({
		"processing": true,
		"serverSide": true,
		"ajax":{
			"url":"<?php echo e(url('Department')); ?>-Datatable-Server-Side",
			"dataType": "json",
            "type": "POST",
			"data":{ 
					_token: $('meta[name="csrf-token"]').attr('content')}
                },      
		 		"columns": [                
						{"class": "sl_no",
                        "data": "SL NO" },
						{"class": "department_name",
						"data": "DEPARTMENT NAME" },
						{"class": "edit",
						"data": "ACTION" }
					]

				});




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
					table.api().ajax.reload();
				
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/lcr_departments/index.blade.php ENDPATH**/ ?>