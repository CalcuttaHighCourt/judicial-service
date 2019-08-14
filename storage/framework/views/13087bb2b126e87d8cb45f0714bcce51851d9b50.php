<?php

use App\Http\Controllers\PageController;
?>


<?php
$calendar_display = "month";
?>



<?php $__env->startSection('title', 'Lower Court Records'); ?>

<?php $__env->startSection('page_heading'); ?>
Lower Court Records
<?php $__env->stopSection(); ?>



<?php $__env->startSection('left_main_content'); ?>
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
                            <select id="hc_case_type" type="text" class="form-control info-form-control" name="hc_case_type"> 
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
                            <select id="lc_case_type" type="text" class="form-control info-form-control" name="lc_case_tye"> 
                                <option value="">Select Case type</option>
                                    <?php $__currentLoopData = App\Lower_case_type::orderBy('type_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $casetype): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($casetype->id); ?>" <?php if(old('lower_case_type') == $casetype->type_name): ?> selected="selected" <?php endif; ?>><?php echo e($casetype->type_name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>

                        <div class="col-md-4" style="margin-bottom:10px;">
                            <input id="lc_case_no" type="text" class="form-control info-form-control lc_case_no" name="lc_case_no" placeholder="Enter Case No.">
                        </div>
                        <div class="col-md-4" style="margin-bottom:10px;">
                            <select id="lc_case_year" type="text" class="form-control info-form-control lc_case_year" name="lc_case_year"> 
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





<?php $__env->stopSection(); ?>

<?php $__env->startSection('right_sidebar_content'); ?>


<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.2_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?>
<?php echo $__env->yieldContent('2_column_content'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('end_scripts_1'); ?>
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
                    $("#lower_case_selection").append('<div class="col-md-4 '+i+'" style="margin-bottom:10px;"><select id="lc_case_type'+i+'" type="text" class="form-control info-form-control" name="lc_case_tye"> <option value="">Select Case Type</option><option value="52">Act 39</option><option value="1">Act Viii Miscellaneous Case</option><option value="51">Act Xiv</option><option value="58">Bail</option><option value="59">CEX - Excise Case</option><option value="3">Civil Appeal</option><option value="4">Civil Execution</option><option value="5">Civil Misc</option><option value="6">Civil Revision</option><option value="7">Complaint Case</option><option value="55">C R Case</option><option value="8">Criminal Appeal</option><option value="9">Criminal Case</option><option value="11">Criminal Misc Case</option><option value="12">Criminal Revision</option><option value="10">Crl. Execution - Criminal Execution</option><option value="23">Divorce On Mutual Consent - Matri Suit Divorce Mutual Cons</option><option value="13">Electricity Act</option><option value="14">Estate Acquisition Appeal</option><option value="16">Gr Case</option><option value="17">Hindu Adapt. and Maint Act - Hindu Adapt. and Maint Case</option><option value="18">Insolvancy Petition</option><option value="19">L A C - Land Acquisition Cases</option><option value="20">L A Ex. - Land Acquisition Execution</option><option value="53">L A Suit</option><option value="21">M A C C - M.A.C.C</option><option value="22">M A C C Ex. - MACC Execution</option><option value="36">Maintenance Case - MR case for Maintenance</option><option value="24">Matrimonial Suit</option><option value="25">Mc - Misc Case</option><option value="54">M C Case</option><option value="29">Misc. Appeal</option><option value="26">Misc Case (pre-emption)</option><option value="30">Misc. Criminal Revision</option><option value="27">Misc Crl Case - Misc Criminal Case</option><option value="31">Misc. Execution Case</option><option value="57">Misc Petition (156) - Misc Petition</option><option value="28">Mjc - Misc Judicial Case</option><option value="32">Money Appeal</option><option value="33">Money Execution</option><option value="34">Money Suit</option><option value="35">M V Act - Motor Vehicle Case</option><option value="37">N D P S Case - NDPS Case</option><option value="38">NGR Case</option><option value="39">Other Appeal</option><option value="40">Other Suit</option><option value="41">Probate Suit</option><option value="15">S C C Ex. - Execution</option><option value="42">S C C Suit - SCC SUIT</option><option value="43">Sessions Case</option><option value="44">Sessions Trial</option><option value="45">Special Court Cases</option><option value="46">Succession Case</option><option value="47">Title Appeal</option><option value="48">Title Execution</option><option value="49">Title Suit</option><option value="50">Trust Suit</option></select></div><div class="col-md-4 '+i+'" style="margin-bottom:10px;"><input id="lc_case_no'+i+'" type="text" class="form-control info-form-control" name="lc_case_no"  placeholder="Enter Case No."></div><div class="col-md-4 '+i+'" style="margin-bottom:10px;"><select id="lccaseyear'+i+'" type="text" class="form-control info-form-control" name="lccaseyear"> <option value="">Select Year</option><?php for($year=date("Y");$year>=1900;$year--): ?>{<option value="<?php echo e($year); ?>"><?php echo e($year); ?></option>}<?php endfor; ?></select></div>');
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
                            }

                        }
                     });
                });

                $(document).on("click","#request",function(){
                
                });

                $(document).on("click","#reset",function(){

                     $("#district").val("");
                     $("#court_complex").val("");
                     $("#court").val("");
                     $("#hc_case_type").val("");
                     $("#hc_case_no").val("");
                     $("#hc_case_year").val("");
                     $(".lc_case_type").val("");
                     $(".lc_case_no").val("");
                     $(".lc_case_year").val("");
                     $("#deadline").val("");

                
                });
    
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/lcr/index.blade.php ENDPATH**/ ?>