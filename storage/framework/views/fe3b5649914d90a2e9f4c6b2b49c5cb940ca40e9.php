 <?php $__env->startSection('title', 'JudicialOfficerPostingPreference'); ?>
<?php $__env->startSection('page_heading'); ?> JudicialOfficerPostingPreference <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
<!-- Bootstrap Boilerplate... -->
<div id="info-panel" class="panel panel-default">
	<!-- IIIIIIIIIII -->
	<div id="info-panel-heading" class="panel-heading">ADD NEW</div>
	<!-- IIIIIIIIIII -->
	<div class="panel-body">

		<!-- New Task Form -->
		<form id="info-form" class="form-horizontal" role="form" method="POST"
			action="<?php echo e(url('/admin/JudicialOfficerPostingPreference')); ?>">
			<?php echo e(csrf_field()); ?>

			<input type="hidden" id="JudicialOfficerPostingPreference-id">
			<div id="officer_name-group" class="form-group row our-form-group">
                <label for="officer_name" class="col-md-4 control-label">Officer Name</label>
                <div class="col-md-6">
                    <select id="officer_name" class="form-control info-form-control"
                            name="officer_name"><option value="">Select an option</option>
							 <?php echo $__env->make('judicial_officers.judicial_officer_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                    </select>
                </div>
            </div>

            
			<div id="info-panel-buttons" class="form-group">
				<div class="col-md-6 col-md-offset-4">
					<button id="search" type="button"
						class="btn btn-primary add-button info-form-button">
						<i class="fa fa-btn fa-plus-circle"></i> Search
					</button>
				</div>
			</div>
            <div class="table-responsive" style="display:none;" id="jo_details" name="jo_details">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>Officer Code</th>
                  <th>Designation</th>
                  <th>District</th>
                  <th>Zone</th>
                  <th>From</th>
                  <th>Duration</th>
                </tr>
              </thead>
              <tbody>          
              </tbody>
            </table>
          </div>
		</form>
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
      $(document).ready(function(){
           /*LOADER*/

            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

         /*LOADER*/
            
        //Addition of Ps_Details starts
        
            $(document).on("click", "#search",function(){

                var jo_code = $("#officer_name").val();

            //    $("#jo_details").show();
                
                $.ajax({

                    type:"POST",
                    url:"jo_posting/search",
                    data:{
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        jo_code:jo_code                      
                },
                success:function(response)
                {
                    //console.log(response);
                   
                    $("#jo_details").show();

                   // $("#officer_name").val('');
                    var details="";
                    details+=      '<tr>'+
                                        '<td>'+response[0].jo_code+'</td>'+
                                        '<td>'+response[0].designation_name+'</td>'+
                                        '<td>'+response[0].district_name+'</td>'+
                                        '<td>'+response[0].zone_name+'</td>'+
                                        '<td>'+response[0].from_date+'</td>'+
                                        '<td>'+response[0].duration+'</td>'+
                                    '</tr>';

                                //console.log(details);
                    $('table tbody').html(details);
                },
                error:function(response) {  

                $("#jo_details").show();

                // $("#officer_name").val('');
                var details="";
                details+=      '<tr>'+
                                    '<td  colspan="4" style="text-align:center">No Record Found</td>'+
                                '</tr>';

             //console.log(details);
 $('table tbody').html(details);
                                                
                }                
                });

                            });
            });


</script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\Judicial-Service\resources\views/jo_postings/index.blade.php ENDPATH**/ ?>