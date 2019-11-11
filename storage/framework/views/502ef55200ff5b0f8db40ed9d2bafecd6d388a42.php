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
            <div class="row">
				<?php echo e(csrf_field()); ?>

				<input type="hidden" id="grade-id">
				<div id="jo_name-group" class="form-group our-form-group">
					<!-- IIIIIIIIIII -->
					<label for="jo_name" class="col-sm-3 col-sm-offset-1 control-label">Judicial Officer Name</label>
                   
					<div class="col-sm-3">
                        <div id="judicial_officer-group" class="form-group our-form-group">
                        <!-- IIIIIIIIIII -->
							<select id="judicial_officer" class="form-control select2 info-form-control judicial_officer"
									name="judicial_officer"> 
									<option value="">Select Judicial Officer</option>
									<?php echo $__env->make('judicial_officers.judicial_officer_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            

               <div class="form-group required row">
                    <!-- IIIIIIIIIII -->
                     <div class="row">
                            <label for="year" class="col-sm-3 col-sm-offset-1 control-label">Year of Assessment</label>
                            <label for="grade" class="col-sm-3 col-sm-offset-1 control-label">Grade</label>
                    </div>
                    <div id="year_of_assessment-group" class="form-group our-form-group div_add_more ">
                        <div class="col-sm-3  col-sm-offset-1">
                            <div id="assessment_year-group" class="form-group our-form-group">
                            <!-- IIIIIIIIIII -->
                                <select id="assessment_year" class="form-control info-form-control assessment_year"
                                        name="assessment_year"> 
                                        <option value="">Select Assessment Year</option>
                                       
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-3 col-sm-offset-1 form-group our-form-group" id="grades-group">
                        
                            <select id="grade_id" class="form-control info-form-control grades" name="grades"> 
                                    <option value="">Select ACR Grade</option>
                                    <?php echo $__env->make('acr.grade_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            </select>
                        </div>
            
                        <div class="col-sm-1">
                            <button id="add-new-button" type="button" class="fa fa-plus-circle btn btn-primary add-new-button">
                               Add New
                            </button>
                        <br><br>
                        </div>
                        
                    </div>
                   
                    <div class="col-sm-1 col-sm-offset-4">
                        <button id="submit" type="button" class="btn btn-success submit">
                            Submit
                        </button>
                    </div>

                    <div class="col-sm-1 col-sm-offset-1">
                        <button id="reset" type="button" class="btn btn-danger reset">
                            Reset
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

		/*LOADER :: START*/

			$(document).ajaxStart(function() {
                    $("#wait").css("display", "block");
                });
                $(document).ajaxComplete(function() {
                    $("#wait").css("display", "none");
                });

        /*LOADER :: END*/

         //var div_clone = $(".div_add_more:first").clone();

        /* select2 initialisation :: START*/

            $(".select2").select2(); 

		

			$(document).on("click","#add-button",function(){
				var jo_name= $("#jo_name").val();
            });

        /* select2 initialisation :: END*/

        /* Populate year of assessment :: START*/

            $(document).on("change","#judicial_officer",function(){

                var judicial_id=$("#judicial_officer").val();
                $(".grades").val(" ");

                $.ajax({
                    type:"POST",
                    url:"populate_assessment_year/history",
                    data:{
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        judicial_id:judicial_id,
                    },
                    success:function(response)
                    {
                        console.log(response);
                        $('.assessment_year').children('option:not(:first)').remove();
                        var i;                        
                        for(i=response[0].max_to_date;i>=response[0].min_from_date;i--){
                            $('.assessment_year').append($('<option>').val(i).text(i))
                        }

                    }
                    

                });
            });

        /* Populate year of assessment :: END*/

        /*Cloning of Year and Grades :: START*/

           

            $(document).on("click","#add-new-button", function(){

                 $("#judicial_officer").attr('disabled',true);

                 $(".div_add_more:first").clone().insertAfter(".div_add_more:last");   
               
                $(".add-new-button:last").attr({
                                        class:"btn btn-danger remove fa fa-minus-circle", 
										id:""});
                $(".remove").text("Remove");
               
                $(".assessment_year:last").val('');
                 
                //div_clone.find(".select2").select2();
                //div_clone.find(".assessment_year").css("width","300px")//re-initialization
                //div_clone.append( clone );
			});  

        /*Cloning of Year and Grades :: END */
            
        /*If multiple grades and year of assessment one wants to enter and want to remove one :: START*/

            $(document).on("click",".remove", function(){
                $(this).closest(".div_add_more").remove();
            });     
		/*If multiple grades and year of assessment one wants to enter and want to remove one :: END*/

        $(document).on("click","#submit", function(){


            var grades = new Array();
            var year_of_assessment = new Array();

            var judicial_officer=$("#judicial_officer").val();
            var jo_code=$("#judicial_officer option:selected").data('jo_code');    

            grades=[];

            $(".grades").each(function(){
                grades.push($(this).val());
            })

            year_of_assessment=[];
            $(".assessment_year").each(function(){
            year_of_assessment.push($(this).val());
            })

            $.ajax({

                type: "POST",
                url:"acr_history/store",
                data: {
                    _token: $('meta[name="csrf-token"]').attr('content'),
                    judicial_officer,
                    grades,
                    year_of_assessment,
                    jo_code
                },
                success:function(response){
                    swal("ACR Has Been Submitted","","success");
                    setTimeout(function(){
                            window.location.reload(true);
                    },2000);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if(jqXHR.status!=422 && jqXHR.status!=400){
                        swal("Duplicate Data not allowed",errorThrown,"error");
                    }
                    else{
                        msg = "";
                        $.each(jqXHR.responseJSON.errors, function(key,value) {
                            msg+=value+"\n";						
                        });
                        swal("Invalid Input",msg,"error");
                    }
                }
            });
        });
        $(document).on("click","#reset", function(){
            $(".grades").val(" ");
            $("#judicial_officer").val("").trigger("change");
            $(".assessment_year").val(" ").trigger("change");
        
        });

    });

</script>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/acr/acr_history.blade.php ENDPATH**/ ?>