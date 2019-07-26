<?php
use App\Http\Controllers\PageController;
?>


<?php
	$calendar_display="month";
?>



<?php $__env->startSection('title', 'Home'); ?>

<?php $__env->startSection('page_heading'); ?>
	Home Page
<?php $__env->stopSection(); ?>



<?php $__env->startSection('left_main_content'); ?>





<div class="panel custom-panel">
	<div class="col-sm-12">
		<div id="info-panel" class="panel panel-deafult">
			<!-- IIIIIIIIIII -->
			<div id="info-panel-heading" class="panel-heading"><br>LOWER COURT RECORD</div>
			<!-- IIIIIIIIIII -->
			
			<hr>
			<div class="panel-body">
				<span>As Per the requirement from the High Court Case Number:CRM / 10/ 2019 the following records to be complied within 05/12/2019.
					<br>The Case Numbers are as follows : </span>
						<div class="col-sm-offset-1 col-sm-11">
						<br>
							TS / 1/ 2019 &nbsp; <label><input type="checkbox" value="1"> Available with me</label><br><br>
							TS/ 5/ 2018	 &nbsp; <label><input type="checkbox" value="2"> Available with me</label><br><br>
							TA / 50 / 2019 &nbsp; <label><input type="checkbox" value="3"> Available with me</label><br><br>
							<div class="float-left">
								<strong>Actions to be taken:</strong><br><br>
								<button id="forward" type="button" class="btn btn-warning forward">
									Forward
								</button>
								<button id="comply" type="button" class="btn btn-success comply">
									Comply
								</button>
								<button id="seek_info" type="button" class="btn btn-info seek_info">
									Seek Information
								</button>
							</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="col-sm-12">
					<label for="court_name" class="col-md-2 control-label">Court Name</label>
					<div class="col-md-3">
						<select id="court_name" class="form-control info-form-control"
							name="court_name"> 
							<option value="">Select Court Name</option>
							<?php echo $__env->make('courts.court_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
						</select>
					</div>
					<div class="col-sm-3">
						<button id="forward" type="button" class="btn btn-success forward">
							 Submit
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	


<?php $__env->stopSection(); ?>
 
<?php $__env->startSection('right_sidebar_content'); ?>
	
	
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.2_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?>
	<?php echo $__env->yieldContent('2_column_content'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?>
<?php $__env->stopSection(); ?>

<script type="text/javascript">

 	$(document).ready(function(){

		 /*LOADER*/

            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

         /*LOADER*/
});


</script>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\Judicial-Service\resources\views/lcr/lower_compliance.blade.php ENDPATH**/ ?>