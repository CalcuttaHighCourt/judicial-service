 <?php $__env->startSection('title', 'Grade_details'); ?>
<?php $__env->startSection('page_heading'); ?> Grade_Details <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
<div class="col-sm-12">
	<!-- Bootstrap Boilerplate... -->
	<div id="info-panel" class="panel panel-default">
		<!-- IIIIIIIIIII -->
		<div id="info-panel-heading" class="panel-heading">ADD GRADES OF ACR</div>
		<!-- IIIIIIIIIII -->
		<div class="panel-body">
		<br><br>

			<!-- New Task Form -->
		
				<?php echo e(csrf_field()); ?>

				<input type="hidden" id="grade-id">
				<div id="grade_name-group" class="form-group our-form-group">
					<!-- IIIIIIIIIII -->
					<label for="grade_name" class="col-sm-2 col-sm-offset-1 control-label">Grade Name</label>

					<div class="col-sm-3">
						<input id="grade_name" type="text"
							class="form-control info-form-control" name="grade_name"> <span
							id="grade_name-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
							<strong id="grade_name-strong" class="our-error-message-strong"></strong>
							<!-- IIIIIIIIIII -->
						</span>
					</div>
					
					<div class="col-sm-2">
						<button id="add-button" type="submit"
                                class="btn btn-primary add-button info-form-button">
                            <i class="fa fa-btn fa-plus-circle"></i> Add Grade
                        </button>
					</div>
				</div>
				

			
				
				<div id="info-panel-buttons" class="form-group hide">
                    <div class="col-md-6 col-md-offset-4">
                        <button id="add-button" type="submit"
                                class="btn btn-primary add-button info-form-button">
                            <i class="fa fa-btn fa-plus-circle"></i> Add Grade
                        </button>
                        <button id="save-button" type="submit"
                                class="btn btn-warning save-button info-form-button">
                            <i class="fa fa-btn fa-floppy-o"></i> Save
                        </button>
                        <button id="delete-confirm-button" type="submit"
                                class="btn btn-danger delete-confirm-button info-form-button">
                            <i class="fa fa-btn fa-trash-o"></i> Confirm Delete
                        </button>
                        <button id="close-button" type="submit"
                                class="btn btn-info close-button info-form-button">
                            <i class="fa fa-btn fa-times-circle"></i> Close
                        </button>
                    </div>
                </div>
			</form>
		</div>
	</div>

	<div id="datatable-panel" class="panel panel-default">
		<div id="datatable-panel-heading" class="panel-heading clearfix">
			<div class="panel-title pull-left">ACR Grade Master</div>
			<!-- <div class="pull-right">
				<button id="add-new-button" type="submit" class="btn btn-primary add-new-button">
					<i class="fa fa-plus-circle"></i> Add New
				</button>
			</div> -->
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-striped notice-types-table"
					id="datatable-table" style="width: 100%;">

					<!-- Table Headings -->
					<thead>
						<tr>
							<th>#</th>
							<th>Grade Name</th>
							<th>Action</th>
						</tr>

					</thead>
					<tbody></tbody>
					<!-- Table Footer -->
					<tfoot>
						<tr>
							<th>#</th>
							<th>Grade Name</th>
							<th>Action</th>
						</tr>
					</tfoot>
				</table>
			</div>

		</div>
	</div>
</div>

<!--loader starts-->

<div class="col-md-offset-5 col-md-3" id="wait" style="display:none;">
    <img src='images/loader.gif'width="25%" height="10%" />
      <br>Loading..
</div>
   
<!--loader ends-->

<div id="test-div"></div>

<?php $__env->stopSection(); ?> <?php echo $__env->make('layouts.1_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?> <?php echo $__env->yieldContent('1_column_content'); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('meta'); ?>
##parent-placeholder-cb030491157b26a570b6ee91e5b068d99c3b72f6##
<meta name="_token" content="<?php echo csrf_token(); ?>" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('end_scripts'); ?> ##parent-placeholder-36ee17f40f3980c360dd4f0dee7896f1cfc0384a##

<!--  -->

<script>
		$(document).ready(function() {

		/*LOADER*/

			$(document).ajaxStart(function() {
                    $("#wait").css("display", "block");
                });
                $(document).ajaxComplete(function() {
                    $("#wait").css("display", "none");
                });

            /*LOADER*/
				
			$(document).on("click","#add-button",function(){
				var grade_name= $("#grade_name").val();

				$.ajax({
						type:"POST",
						url:"grades",
						data:{
							  _token: $('meta[name="csrf-token"]').attr('content'), 
							  grade_name:grade_name
						}, 
						success:function(response)
						{
							$("#grade_name").val("");
							swal("Successful","ACR Grade has been added successfully","success");
							table.ajax.reload();  
						},
						error:function(response)
						{
							swal("Failed","ACR Grade can not be added","error");
						}
					})
				});

				
            //Datatable Code For Showing Data :: START

			var table= $("#datatable-table").dataTable({
						"processing":true,
					  	"serverSide":true,
						  "ajax":{
                                    "url": "show_grades",
                                    "dataType": "json",
                                    "type": "POST",
                                    "data":{ 
                                        _token: $('meta[name="csrf-token"]').attr('content')}
                                    },
                            "columns": [                
                                {"class": "id",
                                  "data": "ID" },
                                {"class": "grade name",
                                  "data": "GRADE NAME" },
                                {"class": "delete",
                                  "data": "ACTION" }
                            ]
                        }); 

			});

</script>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/acr/grade_details.blade.php ENDPATH**/ ?>