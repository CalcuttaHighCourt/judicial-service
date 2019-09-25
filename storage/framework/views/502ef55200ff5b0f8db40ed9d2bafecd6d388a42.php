 <?php $__env->startSection('title', 'ACRHistory'); ?>
<?php $__env->startSection('page_heading'); ?> ACRHistory <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
<style>
.select2-results__option{
    color:#d43c3c;
}
</style>
<div class="col-sm-12">
	<!-- Bootstrap Boilerplate... -->
	<div id="info-panel" class="panel panel-default">
		<!-- IIIIIIIIIII -->
		<div id="info-panel-heading" class="panel-heading">ADD ACR HISTORY</div>
		<!-- IIIIIIIIIII -->
		<div class="panel-body">
		<br><br>

			<!-- New Task Form -->
		
				<?php echo e(csrf_field()); ?>

				<input type="hidden" id="grade-id">
				<div id="jo_name-group" class="form-group our-form-group">
					<!-- IIIIIIIIIII -->
					<label for="jo_name" class="col-sm-3 col-sm-offset-1 control-label">Judicial Officer Name</label>
                    <label for="year" class="col-sm-3 control-label">Year of Assessment</label>
                    <label for="grade" class="col-sm-3 control-label">Grade</label>
					<div class="col-sm-3 col-sm-offset-1">
                    <div id="recruitment_batch_desc-group" class="form-group our-form-group">
					<!-- IIIIIIIIIII -->
							<select id="recruitment_batch_desc" class="form-control select2 info-form-control"
									name="recruitment_batch_desc"> 
									<option value="">Select Judicial Officer</option>
									<?php echo $__env->make('judicial_officers.judicial_officer_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
						</select>
					</div>
				</div>
					</div>
                    

               <div class="div_add_more form-group required row">
                                    
                        <div id="year_of_assessment-group" class="form-group our-form-group">
                        <!-- IIIIIIIIIII -->
                        
                        <div class="col-sm-3">
                            <input id="year_of_assessment" type="text"
                                class="form-control info-form-control year_of_assessment date" name="year_of_assessment"> <span
                                id="year_of_assessment-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
                                <strong id="year_of_assessment-strong" class="our-error-message-strong"></strong>
                                <!-- IIIIIIIIIII -->
                            </span>
                            <?php $__env->startSection('end_scripts_1'); ?>
                            <script type="text/javascript">
                            $(function(){
                                $(".date").datepicker({
                                    format: 'yyyy',
                                    showTodayButton:true,
                                    showClear:true,
                                    viewMode: "years", 
                                    minViewMode: "years"
                                });
                            
                            });
                            </script>
                            <?php $__env->stopSection(); ?>
                        </div>
                    </div>
                    <div class="col-sm-3 form-group our-form-group" id="grades-group">
                        
                        <select id="grade_id" class="form-control info-form-control" name="grades"> 
                                <option value="">Select ACR Grade</option>
                                <?php echo $__env->make('acr.grade_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </select>
                    </div>
                
          
               
			<div class="col-sm-1">
				<button id="add-new-button" type="submit" class="btn btn-primary add-new-button">
					<i class="fa fa-plus-circle"></i> Add New
				</button>
            </div>
        </div>

            <br><br>
           

			
				
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

            /* select2 initialisation */

            $(".select2").select2(); 
				
			$(document).on("click","#add-button",function(){
				var jo_name= $("#jo_name").val();
            });

            /*Cloning of Year and Grades */

            var div_clone = $(".div_add_more:first").clone();

            $(document).on("click","#add-new-button", function(){
                    
                $(".div_add_more:first").clone().insertAfter(".div_add_more:last");
                // $(".seizure_add_more:last").attr({src:"images/details_close.png",
                // 									class:"remove_add_more_seizure", 
                // 									alt:"remove",
                // 									id:""});
                $(".year_of_assessment:last").val('');
                $(".date").datepicker({
                    endDate:'0',
                    format: 'yyyy',
                    viewMode: "years", 
                    minViewMode: "years"
                }); // Date picker re-initialization
			
		    });         
		});

</script>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/acr/acr_history.blade.php ENDPATH**/ ?>