 <?php $__env->startSection('title', 'LCR Lower Court End'); ?>
<?php $__env->startSection('page_heading'); ?> LCR Lower Court End <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
<div class="panel custom-panel">
    <div class="col-sm-12">
        <div id="info-panel" class="panel panel-deafult">
            <!-- IIIIIIIIIII -->
            <div id="info-panel-heading" class="panel-heading"><br><strong>LOWER COURT RECORD</strong></div>
            <!-- IIIIIIIIIII -->
            <hr>
            <div class="panel-body">
            <?php $__currentLoopData = $data['hc_records']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $hc_record): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

            
            <span id="hc_case_no"> As Per the requirement from the High Court Case Number : <span id="lower" style="background-color:#ffffff;color:#C11111;"><strong><?php echo e(($hc_record['case_type']['type_name'])); ?>/<?php echo e($hc_record['hc_case_no']); ?>/<?php echo e($hc_record['hc_case_year']); ?></strong></span>
                    the following records to be complied  within </span><span id="deadline" style="background-color:#ffffff;color:#C11111;"><strong><?php echo e($hc_record['deadline']); ?></strong></span>
                    <br>
                    <br>
                 <?php $__currentLoopData = $hc_record['lcr_case_details']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lc): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                    <div class="col-sm-6">
                        <span id="lower" style="background-color:#ffffff;color:#C11111;">
                            <strong><?php echo e(($lc['lower_case_type']['type_name'])); ?>/<?php echo e(($lc['lower_case_no'])); ?>/<?php echo e(($lc['lower_case_year'])); ?></strong>
                        </span>
                    </div>
                    <div class="col-sm-3">
                        <label><input type="checkbox" class="check1" value="1"> Available with me</label>
                    </div>
                    <br><br>
                    
                 <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    
                    <hr>
             <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> 
                    <div class="float-left">
                        <strong>Actions to be taken:</strong><br><br>
                        <button id="forward" type="button" class="btn btn-warning forward">
                            Forward
                        </button>
                        <button id="comply" type="button" class="btn btn-success comply">
                            Comply
                        </button>
                        <button id="pray_for_time" type="button" class="btn btn-info pray_for_time">
                            Pray For Time
                        </button>
                        <button id="not_found" type="button" class="btn btn-danger not_found">
                            Not Found
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel custom-panel" id="forward_div" style="display:none;">
    <div class="col-sm-12">
        <div id="info-panel" class="panel panel-deafult">
            <div class="panel-body">
            
                <div class="col-sm-12">
                    <h4><strong>Forwarding</strong></h4>
                    <hr>
                    <label for="remarks" class="col-sm-offset-1 col-sm-2 control-label">Remarks:</label> 
                    <textarea class="form-control" rows="2" id="remarks" style="width:30%;margin-bottom:2%;">forwarding the required LCRs</textarea>
                
                        <label for="remarks" class="col-sm-offset-1 col-sm-2 control-label">Record No.: </label> 
                            <span id="forward_remark-span" class="help-block our-help-block" style="float-left">
                                <!-- IIIIIIIIIII -->
                            </span>
                        
                    <hr>
                        <label for="court_name" class="col-sm-offset-1 col-sm-2 control-label">Court Name</label>

                        <select id="court_name" class="form-control info-form-control"name="court_name" style="width:30%;margin-bottom:2%;" >
                            <option value="">Select Court Name</option>
                            <?php echo $__env->make('courts.court_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </select>
                </div>

                <div id="memo_no-group" class="form-group our-form-group">
                    <!-- IIIIIIIIIII -->
                    <div class="col-sm-12">
                        <label for="memo_no" class="col-sm-offset-1 col-sm-2 control-label">Memo No.</label>

                        <input id="memo_no" type="text"
                               class="form-control info-form-control" name="memo_no" style="width:30%;margin-bottom:2%;"> 
                        <span
                            id="memo_no-span" class="help-block our-help-block">
                            <!-- IIIIIIIIIII -->
                            <strong id="memo_no-strong" class="our-error-message-strong"></strong>
                            <!-- IIIIIIIIIII -->
                        </span>
                    </div>
                </div>
                <div id="memo_date-group" class="form-group our-form-group">
                    <!-- IIIIIIIIIII -->
                    <div class="col-sm-12">
                        <label for="memo_date" class="col-sm-offset-1 col-sm-2 control-label">Memo Date</label>

                        <input id="memo_date" type="text"
                               class="form-control info-form-control memo_date" name="memo_date" style="width:30%;margin-bottom:2%;"> 
                        <span
                            id="memo_date-span" class="help-block our-help-block">
                            <!-- IIIIIIIIIII -->
                            <strong id="memo_date-strong" class="our-error-message-strong"></strong>
                            <!-- IIIIIIIIIII -->
                        </span>

                    </div>
                </div>
                <br>
                <div class="col-sm-offset-3 col-sm-3">
                    <button id="submit_forward" type="button" class="btn btn-success submit_forward">
                        Submit
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel custom-panel" id="comply_div" style="display:none;">
    <div class="col-sm-12">
        <div id="info-panel" class="panel panel-deafult">
            <div class="panel-body" >
                <div class="col-sm-12">
                    <label for="remarks" class="col-sm-offset-1 col-sm-2 control-label">Remarks:</label> 
                    <textarea class="form-control" rows="2" id="remarks" style="width:30%;margin-bottom:2%;">Sir, I am sending LCR of</textarea>
                    <label for="remarks" class="col-sm-offset-1 col-sm-2 control-label">Record No.: </label> 
                    <div class="col-sm-offset-3">
                        <span id="comply_remark-span" class="help-block our-help-block">
                            <!-- IIIIIIIIIII -->
                        </span>
                    </div>
                    <hr>
                    <label for="memo_no" class="col-sm-offset-1 col-sm-2 control-label">Memo No.</label>

                    <input id="memo_no" type="text"
                        class="form-control info-form-control" name="memo_no" style="width:30%;margin-bottom:2%;"> 
                    <span
                        id="memo_no-span" class="help-block our-help-block">
                        <!-- IIIIIIIIIII -->
                        <strong id="memo_no-strong" class="our-error-message-strong"></strong>
                        <!-- IIIIIIIIIII -->
                    </span>
                </div>
                <div class="col-sm-12">
                    <div id="memo_date-group" class="form-group our-form-group">
                        <!-- IIIIIIIIIII -->
                        <label for="memo_date" class="col-sm-offset-1 col-sm-2 control-label">Memo Date</label>
                        <input id="memo_date" type="text"
                               class="form-control info-form-control memo_date" name="memo_date" style="width:30%;margin-bottom:2%;"> 
                        <span id="memo_date-span" class="help-block our-help-block">
                            <!-- IIIIIIIIIII -->
                            <strong id="memo_date-strong" class="our-error-message-strong"></strong>
                            <!-- IIIIIIIIIII -->
                        </span>
                        <?php $__env->startSection('end_scripts_1'); ?>
                        <script type="text/javascript">
                            $(".memo_date").datepicker({

                                format: "dd-mm-yyyy",
                                weekStart: 1,
                                todayBtn: "linked",
                                clearBtn: true,
                                daysOfWeekHighlighted: "0,6",
                                autoclose: true,
                                todayHighlight: true,
                                toggleActive: false,
                                endDate: "today"
                            });
                        </script>
                        <?php $__env->stopSection(); ?>
                    </div>
                </div>
                <div class="col-sm-offset-3 col-sm-3">
                    <button id="submit_comply" type="button" class="btn btn-success submit_comply">
                        Submit
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel custom-panel" id="pray_for_time_div" style="display:none;">
    <div class="col-sm-12">
        <div id="info-panel" class="panel panel-deafult">
            <div class="panel-body">
                <div id="pray_for_time_remarks-group" class="form-group our-form-group">
                    <!-- IIIIIIIIIII -->
                    <div class="col-sm-12">
                    <h4><strong>Praying for Time to the Hon'ble High Court</strong></h4>
                    <hr>
                        <label for="pray_for_time_remarks" class="col-sm-offset-1 col-sm-2 control-label">Remarks</label>
                         <textarea class="form-control" rows="2" id="pray_for_time_remarks" style="width:30%;margin-bottom:2%;">Write your remakrs here</textarea>
                        
                    </div>
                    <div id="memo_no-group" class="form-group our-form-group">
                        <!-- IIIIIIIIIII -->
                        <div class="col-sm-12">
                            <label for="memo_no" class="col-sm-offset-1 col-sm-2 control-label">Memo No.</label>
                            <input id="memo_no" type="text"
                                class="form-control info-form-control" name="memo_no" style="width:30%;margin-bottom:2%;"> 
                        </div>
                    </div>
                
                    <br>
                    <div class="col-sm-offset-3 col-sm-3">
                        <button id="submit_pray_for_time" type="button" class="btn btn-success submit_pray_for_time">
                            Submit
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel custom-panel" id="not_found_div" style="display:none;">
    <div class="col-sm-12">
        <div id="info-panel" class="panel panel-deafult">
            <div class="panel-body">
                <div id="not_found_remarks-group" class="form-group our-form-group">
                    <!-- IIIIIIIIIII -->
                    <div class="col-sm-12">
                        <h4><strong>No Valid Record Found</strong></h4>
                        <hr>
                        <label for="not_found_remarks" class="col-sm-offset-1 col-sm-2 control-label">Remarks</label>
                         <textarea class="form-control" rows="2" id="remarks" style="width:30%;margin-bottom:2%;">Write your remakrs here</textarea>
                        
                    </div>
                    <div id="memo_no-group" class="form-group our-form-group">
                        <!-- IIIIIIIIIII -->
                        <div class="col-sm-12">
                            <label for="memo_no" class="col-sm-offset-1 col-sm-2 control-label">Memo No.</label>
                            <input id="memo_no" type="text"
                                class="form-control info-form-control" name="memo_no" style="width:30%;margin-bottom:2%;"> 
                        </div>
                    </div>
                
                    <br>
                    <div class="col-sm-offset-3 col-sm-3">
                        <button id="submit_not_found" type="button" class="btn btn-success submit_not_found">
                            Submit
                        </button>
                    </div>
                </div>
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
<script type="text/javascript">
    $(document).ready(function () {

        /*LOADER*/

        $(document).ajaxStart(function () {
            $("#wait").css("display", "block");
        });
        $(document).ajaxComplete(function () {
            $("#wait").css("display", "none");
        });

        /*LOADER*/

        $(document).on("click", "#forward", function () {

            $("#comply_div").hide();
            $("#forward_div").show();
            $("#not_found_div").hide();
            $("#pray_for_time_div").hide();

            var str="";
            var count=0;

                $(".check1").each(function(){
                    if($(this). prop("checked") == false)
                        count++;
                })
            
            if(count==0)
            {
                swal("Can not Forward","Atleast 1 should be unchecked","error");
                $("#forward_div").hide();
            }

                var i=0;
                $(".check1").each(function(){                    
                    if($(this). prop("checked") == false){ 
                        i++;                      
                       str+=$(this).parent().parent().prev().find("#lower").html();
                       if(count-i==1)
                        str+=" and ";
                      else if(i==count)
                        str+="";
                      else
                        str+=" , ";
                        //alert("Checkbox is unchecked." );
                    }
                    $("#forward_remark-span").html(str);
            });

        });
      

        $(document).on("click", "#comply", function () {

            $("#forward_div").hide();
            $("#comply_div").show();
            $("#not_found_div").hide();
            $("#pray_for_time_div").hide();

             var str="";
            var count=0;

                $(".check1").each(function(){
                    if($(this). prop("checked") == true)
                        count++;
                })

                if(count<1){
                    swal("Can not Comply","Comply only when all the records are with you","error");
                    $("#comply_div").hide();
                }
                else{
                    swal("Complied","Comply only when all the records are with you","success");

                }

                        
                var i=0;
                $(".check1").each(function(){                    
                    if($(this). prop("checked") == true){ 
                        i++;                      
                       str+=$(this).parent().parent().prev().find("#lower").html();
                       if(count-i==1)
                        str+=" and ";
                      else if(i==count)
                        str+="";
                      else
                        str+=" , ";
                        //alert("Checkbox is unchecked." );
                    }
                    $("#comply_remark-span").html(str);
            });

        });

        $(document).on("click","#not_found", function () {

            $("#forward_div").hide();
            $("#comply_div").hide();
            $("#pray_for_time_div").hide();
            $("#not_found_div").show();

        });

         $(document).on("click","#pray_for_time", function () {

            $("#forward_div").hide();
            $("#comply_div").hide();
            $("#pray_for_time_div").show();
            $("#not_found_div").hide();
         
        });

        $(document).on("click", "#submit_comply", function () {

            //  var remarks="";
            //  var memo_no="";
            //  var memo_date="";


            
            swal("Successfully Complied","The requested LCR has been submitted","success");
        
        });

        $(document).on("click", "#submit_forward", function () {

            var remarks=$("#remarks").text();
            var memo_no=$("#memo_no").val();
            var memo_date=$("#memo_date").val();
            var court_name= $("#court_name option:selected").val();

        });    // $.ajax({
            //     url:"lcr_lower_court/forward",
            //     method: "POST",
            //     data :{_token: $('meta[name="csrf-token"]').attr('content'),
            //         remarks:remarks,
            //         memo_no:memo_no,
            //         memo_date:memo_date,
            //         court_name:court_name
                // },
                // success:function(response)
                // {
                //     swal("Forwarded","The required LCR has been forwarded","success");
                // },
                // error:function(response){
                //     swal("Error Occured","Memo no, Memo Date And Court Name is mendatory","error")
                // }
            

            
            
            // if(memo_no=="")
            // {
            //     swal("EMPTY FIELD","Memo No can not be empty","error");
            // }
    
           
        
         $(document).on("click", "#submit_not_found", function () {
        
            swal("Successfully Sent","Your remark has been sent","success");

        });


    });


</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/lcr/lower_compliance.blade.php ENDPATH**/ ?>