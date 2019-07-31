<?php

use App\Http\Controllers\PageController;
?>


<?php
$calendar_display = "month";
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
            <div id="info-panel-heading" class="panel-heading"><br><strong>LOWER COURT RECORD</strong></div>
            <!-- IIIIIIIIIII -->
            <hr>
            <div class="panel-body">
                <span>As Per the requirement from the High Court Case Number:CRM / 10/ 2019 the following records to be complied within 05/12/2019.
                    <br>The Case Numbers are as follows : </span>
                <div class="col-sm-offset-1 col-sm-11">
                    <br>
                    <div class="col-sm-3"><span id="1">TS / 1/ 2019</span></div><div class="col-sm-3"><label><input type="checkbox" class="check1" value="1"> Available with me</label></div><br><br>
                    <div class="col-sm-3"><span id="2">TS/ 5/ 2018</span></div><div class="col-sm-3"><label><input type="checkbox" class="check1"value="2"> Available with me</label></div><br><br>
                    <div class="col-sm-3"><span id="3">TA / 50 / 2019</span></div><div class="col-sm-3"><label><input type="checkbox" class="check1" value="3"> Available with me</label></div><br><br>
                    <div class="float-left">
                        <strong>Actions to be taken:</strong><br><br>
                        <button id="forward" type="button" class="btn btn-warning forward">
                            Forward
                        </button>
                        <button id="comply" type="button" class="btn btn-success comply">
                            Comply
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
                <label for="remarks" class="col-sm-offset-1 col-sm-2 control-label">Remarks:</label> 
                    <input id="remarks" type="text" class="form-control info-form-control" name="remarks" style="width:30%;margin-bottom:2%;"value="Sir, I am sending LCR of"> 
                            <span id="remarks-span" class="help-block our-help-block">
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
                        <input id="remarks" type="text" class="form-control info-form-control" name="remarks" style="width:30%;margin-bottom:2%;"value="Sir, I am sending LCR of"> 
                            <span id="remarks-span" class="help-block our-help-block">
                                <!-- IIIIIIIIIII -->
                            </span>
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
                    <button id="submit_forward" type="button" class="btn btn-success submit_forward">
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
<?php $__env->startSection('end_scripts_2'); ?>
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

            
            if($(".check1").attr('checked',false)){
                     alert("hello");
            }

        });

        $(document).on("click", "#comply", function () {

            $("#forward_div").hide();
            $("#comply_div").show();

        });



    });


</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/lcr/lower_compliance.blade.php ENDPATH**/ ?>