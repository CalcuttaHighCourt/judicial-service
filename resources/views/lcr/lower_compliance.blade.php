<?php

use App\Http\Controllers\PageController;
?>
@extends('layouts.app')
{{--@include('services.display_board.display_board_block')--}}
<?php
$calendar_display = "month";
?>
@section('title', 'Home')
@section('page_heading')
Home Page
@endsection
@section('left_main_content')
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
                    <div class="col-sm-3"><span class="check">TS / 1/ 2019</span></div><div class="col-sm-3"><label><input type="checkbox" class="check1" value="1"> Available with me</label></div><br><br>
                    <div class="col-sm-3"><span class="check">TS/ 5/ 2018</span></div><div class="col-sm-3"><label><input type="checkbox" class="check1"value="2"> Available with me</label></div><br><br>
                    <div class="col-sm-3"><span class="check">TA / 50 / 2019</span></div><div class="col-sm-3"><label><input type="checkbox" class="check1" value="3"> Available with me</label></div><br><br>
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
                <h3>No Valid Record Found</h3>
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
                        @include('courts.court_options')
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
                        @section('end_scripts_1')
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
                        @endsection
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
<div class="panel custom-panel" id="not_found_div" style="display:none;">
    <div class="col-sm-12">
        <div id="info-panel" class="panel panel-deafult">
            <div class="panel-body">
                <div id="not_found_remarks-group" class="form-group our-form-group">
                    <!-- IIIIIIIIIII -->
                    <div class="col-sm-12">
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
@endsection
@section('right_sidebar_content')
@endsection
@include('layouts.2_column_content')
@section('main_container')
@yield('2_column_content')
@endsection
@section('body_attributes')
@endsection
@section('end_scripts_2')
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
                       str+=$(this).parent().parent().prev().find(".check").html();
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

             var str="";
            var count=0;

                $(".check1").each(function(){
                    if($(this). prop("checked") == true)
                        count++;
                })

                if(count<3){
                    swal("Can not Comply","Comply only when all the records are with you","error");
                    $("#comply_div").hide();
                }

                        
                var i=0;
                $(".check1").each(function(){                    
                    if($(this). prop("checked") == true){ 
                        i++;                      
                       str+=$(this).parent().parent().prev().find(".check").html();
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
            $("#not_found_div").show();
        });

        $(document).on("click", "#submit_comply", function () {

            //  var remarks="";
            //  var memo_no="";
            //  var memo_date="";


            
            swal("Successfully Complied","The requested LCR has been submitted","success");
        
        });

        $(document).on("click", "#submit_forward", function () {
            
            swal("Successfully Forwarded","The required LCR has been forwarded","success");
        
        });    

        $(document).on("click", "#submit_not_found", function () {
        
            swal("Successfully Sent","Your remark has been sent","success");

        });


    });


</script>
@endsection