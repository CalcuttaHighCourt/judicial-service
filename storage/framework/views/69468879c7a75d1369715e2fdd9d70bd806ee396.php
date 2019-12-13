 
<?php $__env->startSection('content'); ?>
<!-- Main content -->

<style>
   .select2-results__option{
   color:#d43c3c;
   }
</style>
<div class="panel custom-panel">
 
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
                    <div class="float-left action">
                        <strong>Actions to be taken:</strong><br><br>
                        <button id="forward" type="button" class="btn btn-warning forward">
                            Forward
                        </button>
                        <button id="comply" type="button" class="btn btn-success comply">
                            Comply
                        </button>
                        <a href="<?php echo e(URL::previous()); ?>">
                            <button id="back" type="button" class="btn btn-primary back" style="display:none;">
                                Back
                            </button>
                        </a>
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
                
                    <label for="forwarding_court_name" class="col-sm-offset-1 col-sm-2 control-label">Court Name</label>

                    <select id="forwarding_court_name" class="form-control select2 info-form-control"name="court_name" style="width:30%;margin-bottom:2%;" >
                        <option value="">Select Court Name</option>
                        <?php echo $__env->make('courts.court_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                    </select>
                                                
                    <hr>

                    <label for="remarks" class="col-sm-offset-1 col-sm-2 control-label">Record No.: </label> 
                            <span id="forward_remark-span" class="help-block our-help-block" style="float-left">
                                <!-- IIIIIIIIIII -->
                            </span>
                       
                </div>

                <div id="memo_no-group" class="form-group our-form-group">
                    <!-- IIIIIIIIIII -->
                    <div class="col-sm-12">
                    <label for="memo_no_forward_div" class="col-sm-offset-1 col-sm-2 control-label">Memo No.</label>
                    <div class="col-sm-offset-3">
                        <span id="memo_no_forward_div" class="help-block our-help-block"><?php echo e(($data['hc_records']['0']['memo_no'])); ?></span>
                    </div>
                </div>
                </div>
                <div class="col-sm-12">
                    <!-- IIIIIIIIIII -->
                    <label for="memo_date" class="col-sm-offset-1 col-sm-2 control-label">Memo Date</label>
                    <div class="col-sm-offset-3">
                            <span id="memo_date_forward_div" class="help-block our-help-block">
                            <?php echo e(($data['hc_records']['0']['memo_date'])); ?>

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
                </div>
                <hr>
                <div class="col-sm-12">
                    <label for="memo_no_comply_div" class="col-sm-offset-1 col-sm-2 control-label">Memo No.</label>
                    <div class="col-sm-offset-3">
                        <span id="memo_no_comply_div" class="help-block our-help-block"><?php echo e(($data['hc_records']['0']['memo_no'])); ?></span>
                    </div>
                </div>
                <div class="col-sm-12">
                    <!-- IIIIIIIIIII -->
                    <label for="memo_date" class="col-sm-offset-1 col-sm-2 control-label">Memo Date</label>
                    <div class="col-sm-offset-3">
                            <span id="memo_date_comply_div" class="help-block our-help-block">
                            <?php echo e(($data['hc_records']['0']['memo_date'])); ?>

                            </span>
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

<meta name="_token" content="<?php echo csrf_token(); ?>" />




<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>


<script type="text/javascript">
    $(document).ready(function () {

          $(".select2").select2(); //select2 initialization

          //$(document).("#memo_no_comply_div").val();

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

        $(document).on("click","#submit_comply",function(){

            var remarks;
            var memo_no;
            var memo_date;
           
            remarks= $("#remarks").val();
            memo_no= $("#memo_no_comply_div").html();
            memo_date = $("#memo_date_comply_div").html();

            $("#comply").hide();

            $.ajax({

                type:"POST",
                url:"<?php echo e(route('submit_comply')); ?>",
                data:{
                _token: $('meta[name="csrf-token"]').attr('content'),
                remarks:remarks,
                memo_no:memo_no,
                memo_date:memo_date,
                },
                success(response){
                    swal("successfully complied","LCR has been send to high court","success")
                },
                error: function (jqXHR, textStatus, errorThrown) {
                        if(jqXHR.status!=422 && jqXHR.status!=400){
                            swal("Server Error",errorThrown,"error");
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

        $("#comply").hide();
        $("#forward").hide();   
        $("#back").show();  


        //$(".action").hide();

        });
      

        
        $(document).on("click", "#submit_forward", function () {

           
            var remarks= $("#remarks").val();
            var forwarding_court_name= $("#forwarding_court_name option:selected").val();
            memo_no= $("#memo_no_forward_div").html();
            memo_date = $("#memo_date_forward_div").html();
            
            $.ajax({

                type:"POST",
                url:"<?php echo e(route('submit_forward')); ?>",
                data:{
                _token: $('meta[name="csrf-token"]').attr('content'),
                remarks:remarks,
                memo_no:memo_no,
                memo_date:memo_date,
                forwarding_court_name:forwarding_court_name,
                
                },
                success(response){
                    swal("successfully forwarded","LCR has been send to high court","success")
                },
                error: function (jqXHR, textStatus, errorThrown) {
                        if(jqXHR.status!=422 && jqXHR.status!=400){
                            swal("Server Error",errorThrown,"error");
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

                $("#comply").hide();
                $("#forward").hide();   
                $("#back").show();  

            }); 

             

        });   


</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/lcr/lower_compliance.blade.php ENDPATH**/ ?>