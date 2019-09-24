 <?php $__env->startSection('title', 'LCR HC End'); ?>
<?php $__env->startSection('page_heading'); ?> LCR HC End <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
<div class="panel custom-panel">
    <div class="col-sm-12">
        <div id="info-panel" class="panel panel-default">
            <!-- IIIIIIIIIII -->
            <div id="info-panel-heading" class="panel-heading">REQUEST LOWER COURT RECORD</div>
            <!-- IIIIIIIIIII -->
            <div class="panel-body">

                <!-- Lower Court Request Form -->
                <div id="lcr-form" class="form-horizontal">
                    <?php echo e(csrf_field()); ?>

                    <div class="col-md-12">Court Selection</div>
                    <div id="court_selection" class="form-group our-form-group">
                        <div class="col-md-4">
                            <select id="district" type="text" class="form-control info-form-control district" name="district"> 
                                <option value="">Select District</option>
                                <?php echo $__env->make('districts.district_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select id="court_complex" type="text" class="form-control info-form-control court_complex" name="court_complex" disabled> 
                                <option value="">Select Court Complex </option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select id="court" type="text" class="form-control info-form-control court" name="court" disabled> 
                                <option value="">Select Court</option>
								
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">High Court Case Records</div>
                    <div id="hc_case_selection" class="form-group our-form-group">
                        <div class="col-md-4">
                            <select id="hc_case_type" type="text" class="form-control info-form-control hc_case_type" name="hc_case_type"> 
                                <option value="">Select Case Type</option>
                                    <?php $__currentLoopData = App\Hc_case_type::orderBy('type_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $casetype): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($casetype->id); ?>" <?php if(old('hc_case_type') == $casetype->type_name): ?> selected="selected" <?php endif; ?>><?php echo e($casetype->type_name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <input id="hc_case_no" type="text" class="form-control info-form-control hc_case_no" name="hc_case_no" placeholder="Enter Case No.">
                        </div>
                        <div class="col-md-4">
                            <select id="hc_case_year" type="text" class="form-control info-form-control hc_case_year" name="hc_case_year"> 
                                <option value="">Select Year</option>
                                <?php for($hc_case_year=date('Y');$hc_case_year>=1900;$hc_case_year--): ?>{
                                "<option value='<?php echo e($hc_case_year); ?>'><?php echo e($hc_case_year); ?></option>
                                }
                                <?php endfor; ?>
                            </select>
                        </div>
                    </div>


                    <div class="col-md-12">Lower Court Case Records</div>
                    <div id="lower_case_selection" class="form-group our-form-group col-md-10" style="float:left;">
                        <div class="col-md-4" style="margin-bottom:10px;">
                            <select id="lc_case_type0" type="text" class="form-control info-form-control lc_case_type" name="lc_case_tye"> 
                                <option value="">Select Case type</option>
                                    <?php $__currentLoopData = App\lower_case_type::orderBy('type_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $casetype): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($casetype->id); ?>" <?php if(old('lower_case_type') == $casetype->type_name): ?> selected="selected" <?php endif; ?>><?php echo e($casetype->type_name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>

                        <div class="col-md-4" style="margin-bottom:10px;">
                            <input id="lc_case_no0" type="text" class="form-control info-form-control lc_case_no" name="lc_case_no" placeholder="Enter Case No.">
                        </div>
                        <div class="col-md-4" style="margin-bottom:10px;">
                            <select id="lc_case_year0" type="text" class="form-control info-form-control lc_case_year" name="lc_case_year"> 
                                <option value="">Select Year</option>
                                    <?php for($lc_case_year=date('Y');$lc_case_year>=1900;$lc_case_year--): ?>{
                                        <option value='<?php echo e($lc_case_year); ?>'><?php echo e($lc_case_year); ?></option>
                                        }
                                    <?php endfor; ?>
                            </select>
                        </div>
                    </div><!-- lower_case_section ends -->
					<div class="col-md-2">
						<div class="col-md-6">
                            <button id="addrow" class="btn btn-success">+</button>
                        </div>
                        <div class="col-md-6">
                            <button id="removerow" class="btn btn-danger">-</button>
                        </div>
					</div>
                    <br>
                    <div id="buttonset" class="form-group our-form-group">
                        <div class="col-md-4">
                            <input type="text" id="deadline" class="form-control info-form-control deadline" placeholder="LCR Required Within This Date">
                        </div>
                        <div class="col-md-4">
                            <button id="request" class="btn btn-success" style="width:100%;">REQUEST LOWER COURT RECORD</button>
                        </div>
                        <div class="col-md-4">
                            <button id="reset" class="btn btn-danger" style="width:100%;">RESET ALL FIELDS</button>
                        </div>
                    </div>
                </div><!-- Lower Court Request Form ENDS -->
            </div>
        </div>
    </div>
</div>

<?php $__env->stopSection(); ?> <?php echo $__env->make('layouts.1_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?> <?php echo $__env->yieldContent('1_column_content'); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('meta'); ?>
##parent-placeholder-cb030491157b26a570b6ee91e5b068d99c3b72f6##
<meta name="_token" content="<?php echo csrf_token(); ?>" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('end_scripts'); ?> ##parent-placeholder-36ee17f40f3980c360dd4f0dee7896f1cfc0384a##
<script>

        $(document).ready(function(){

            $('#deadline').datepicker({
                format: "dd-mm-yyyy",
                weekStart: 1,
                todayBtn: "linked",
                clearBtn: true,
                daysOfWeekHighlighted: "0,6",
                autoclose: true,
                todayHighlight: true,
                toggleActive: false,
                startDate: '+0d'
            });
            
            var i = 0;
                $("#addrow").on("click",function(){
                    i++;
                    $("#lower_case_selection").append('<div class="col-md-4 '+i+'" style="margin-bottom:10px;"><select id="lc_case_type'+i+'" type="text" class="form-control info-form-control lc_case_type" name="lc_case_tye"><option value="">Select Case Type</option><?php $__currentLoopData = App\Lower_case_type::orderBy("type_name", "asc")->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $casetype): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><option value="<?php echo e($casetype->id); ?>" <?php if(old("lower_case_type") == $casetype->type_name): ?> selected="selected" <?php endif; ?>><?php echo e($casetype->type_name); ?></option><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?></select></div><div class="col-md-4 '+i+'" style="margin-bottom:10px;"><input id="lc_case_no'+i+'" type="text" class="form-control info-form-control lc_case_no" name="lc_case_no"  placeholder="Enter Case No."></div><div class="col-md-4 '+i+'" style="margin-bottom:10px;"><select id="lc_case_year'+i+'" type="text" class="form-control info-form-control lc_case_year" name="lc_case_year"> <option value="">Select Year</option><?php for($lc_case_year=date("Y");$lc_case_year>=1900;$lc_case_year--): ?>{<option value="<?php echo e($lc_case_year); ?>"><?php echo e($lc_case_year); ?></option>}<?php endfor; ?></select></div>');
                });

                
                $("#removerow").on("click",function () {
                    if(i!=0){
                    $('.'+i).remove();
                    i--;
                    }
                });

                $(document).on("change","#district",function(){
                     
                     var district= $("#district option:selected").val();

                     $.ajax({

                        url:"lcr_hc_end_populate/court_complex",
                        method: "POST",
                        data :{_token: $('meta[name="csrf-token"]').attr('content'),
                              district: district
                        },
                        success: function(response){                            
                            if(response.length)
                            {
                                $("#court_complex").removeAttr("disabled");
                                $("#court_complex").find('option').not(':first').remove();

                                $.each(response, function(key,value){
                                    $("#court_complex").append('<option value="'+value.id+'">'+value.court_complex_name +'</option>');

                                });
                            }
                            else
                            {
                                $("#court_complex").find('option').not(':first').remove();
                                $("#court").find('option').not(':first').remove();
								$("#court_complex").prop("disabled", true);
								$("#court").prop("disabled", true);
                            }

                        }
                     });
                });

                $(document).on("change","#court_complex",function(){
                     
                     var court_complex= $("#court_complex option:selected").val();

                     $.ajax({

                        url:"lcr_hc_end_populate/court",
                        method: "POST",
                        data :{_token: $('meta[name="csrf-token"]').attr('content'),
                            court_complex: court_complex
                        },
                        success: function(response){                            
                            if(response.length)
                            {
                                $("#court").removeAttr("disabled");
                                $("#court").find('option').not(':first').remove();

                                $.each(response, function(key,value){
                                    $("#court").append('<option value="'+value.id+'">'+value.court_name +'</option>');

                                });
                            }
                            else
                            {
                                $("#court").find('option').not(':first').remove();
								$("#court").prop("disabled",true);
                            }

                        }
                     });
                });

				
				//on click request button database entry occurs
                $(document).on("click","#request",function(){
					var district = $("#district option:selected").val();
					var court_complex = $("#court_complex option:selected").val();
					var court = $("#court option:selected").val();
					var hc_case_type = $("#hc_case_type option:selected").val();
					var hc_case_no = $("#hc_case_no").val();
					var hc_case_year = $("#hc_case_year option:selected").val();
					var deadline = $("#deadline").val();
					var lc_case_type = new Array;
					var lc_case_no = new Array;
					var lc_case_year = new Array;
					for(j=0;j<=i;j++){
						lc_case_type.push($("#lc_case_type"+j+" option:selected").val());
						lc_case_no.push($("#lc_case_no"+j).val());
						lc_case_year.push($("#lc_case_year"+j+" option:selected").val());
					}
					if(district==""){
						swal("District is mandetory","You must select a district","error");
						return false;
					}
					if(court_complex==""){
						swal("Court Complex is mandetory","You must select a court complex","error");
						return false;
					}
					if(court==""){
						swal("Court is mandetory","You must select a court","error");
						return false;
					}
					if(hc_case_type==""){
						swal("High Court Case Type is mandetory","You must select HC Case Type","error");
						return false;
					}
					if(hc_case_no==""){
						swal("High Court Case No. is mandetory","You must enter HC Case No.","error");
						return false;
					}
					if(hc_case_year==""){
						swal("High Court Case Year is mandetory","You must select HC Case Year","error");
						return false;
					}
					for(j=0;j<=i;j++){
						if(lc_case_type[j] == ""){
							swal("Lower Court Case Type in Row-"+(j+1)+" is mandetory","You must select LC Case Type","error");
							return false;
						}
						if(lc_case_no[j] == ""){
							swal("Lower Court Case No. in Row-"+(j+1)+" is mandetory","You must select LC Case No.","error");
							return false;
						}
						if(lc_case_year[j] == ""){
							swal("Lower Court Case Year in Row-"+(j+1)+" is mandetory","You must select LC Case Year","error");
							return false;
						}
					}
					if(deadline == ""){
						swal("LCR required within date field is mandetory","You must pick a date for LCR data requirement deadline","error");
						return false;
					}
					
					$.ajax({
                        url:"lcr_request_by_hc/databaseentry",
                        method: "POST",
                        data :{_token: $('meta[name="csrf-token"]').attr('content'),
                            district:district,
							court_complex: court_complex,
							court:court,
							hc_case_type:hc_case_type,
							hc_case_no:hc_case_no,
							hc_case_year:hc_case_year,
							lc_case_type:lc_case_type,
							lc_case_no:lc_case_no,
							lc_case_year:lc_case_year,
							deadline:deadline
                        },
                        success: function(response){   
							swal("LOWER COURT RECORD REQUESTED SUCCESSFULLY","WITHIN - "+deadline,"success");
                        },
						error: function(jqXHR, textStatus, errorThrown) {
                            alert("Some Server Error Occured! Please Try Again.");
                        }
                     });
                });

                $(document).on("click","#reset",function(){

                     $("#district").val("");
                     
					 $("#court_complex").find('option').not(':first').remove();
					 $("#court_complex").prop("disabled", true);
					 
                     $("#court").find('option').not(':first').remove();
					 $("#court").prop("disabled", true);
                     
					 $("#hc_case_type").val("");
                     $("#hc_case_no").val("");
                     $("#hc_case_year").val("");
                     
					 $("#lc_case_type0").val("");
                     $("#lc_case_no0").val("");
                     $("#lc_case_year0").val("");
					 
					 for(j=i;j>0;j--){
						$('.'+j).remove();
					 }
					 
					 $("#deadline").val("");                
                });
    
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/lcr/index.blade.php ENDPATH**/ ?>