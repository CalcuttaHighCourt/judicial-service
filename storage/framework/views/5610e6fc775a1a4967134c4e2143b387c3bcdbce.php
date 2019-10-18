 <?php $__env->startSection('title', 'ACRFetch'); ?>
<?php $__env->startSection('page_heading'); ?> ACRFetch <?php $__env->stopSection(); ?>
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
<div id="info-panel-heading" class="panel-heading">FETCH ACR HISTORY</div>
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
<div class="row">
   <div id="grade-group" class="form-group our-form-group">
      <!-- IIIIIIIIIII -->
      <label for="grade" class="col-sm-3 col-sm-offset-1 control-label">Grade</label>
      <div class="col-sm-3">
         <div id="grades-group" class="form-group our-form-group">
            <!-- IIIIIIIIIII -->
            <select id="grade" class="form-control select2 info-form-control grade"name="grade">
               <option value="">Select Grade</option>
               <?php echo $__env->make('acr.grade_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </select>
         </div>
      </div>
   </div>
</div>
<div class="row">
   <div id="designation-group" class="form-group our-form-group">
      <!-- IIIIIIIIIII -->
      <label for="designation" class="col-sm-3 col-sm-offset-1 control-label">Designation</label>
      <div class="col-sm-3">
         <div id="designations-group" class="form-group our-form-group">
            <!-- IIIIIIIIIII -->
            <select id="designation" class="form-control select2 info-form-control designation"name="designation">
               <option value="">Select Designation</option>
               <?php echo $__env->make('designations.designation_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </select>
         </div>
      </div>
   </div>
</div>
<div class="row">
   <div id="jo_code-group" class="form-group our-form-group">
      <!-- IIIIIIIIIII -->
      <label for="jo_code" class="col-sm-3 col-sm-offset-1 control-label">Jo Code</label>
      <div class="col-sm-3">
         <div id="jo_code-group" class="form-group our-form-group">
            <!-- IIIIIIIIIII -->
           <input type="text"  class="form-control jo_code" id="jo_code"  placeholder="Jo Code">
         </div>
      </div>
   </div>
</div>
<div class="form-group required row">
   <div id="from_assessment_year-group" class="form-group our-form-group">
      <label for="from_time_frame" class="col-sm-3 col-sm-offset-1 control-label from_time_frame">From Date</label>
      <label for="to_time_frame" class="col-sm-3 col-sm-offset-1 control-label to_time_frame">To Date</label>
      <div class="col-sm-3">
      </div>
      <div class="form-group required row">
         <!-- IIIIIIIIIII -->
         <div class="row">
         </div>
         <div id="from_assessment_year-group" class="form-group our-form-group">
            <div class="col-sm-3  col-sm-offset-1">
               <input id="from_assessment_year" type="text"
                  class="form-control info-form-control from_assessment_year date" name="from_assessment_year"> 
               <span
                  id="from_assessment_year-span" class="help-block our-help-block">
                  <!-- IIIIIIIIIII -->
                  <strong id="from_assessment_year-strong" class="our-error-message-strong"></strong>
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
            <div class="col-sm-3  col-sm-offset-1">
               <input id="to_assessment_year" type="text"
                  class="form-control info-form-control to_assessment_year date" name="to_assessment_year"> 
               <span
                  id="to_assessment_year-span" class="help-block our-help-block">
                  <!-- IIIIIIIIIII -->
                  <strong id="to_assessment_year-strong" class="our-error-message-strong"></strong>
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
            <div class="col-sm-1">
               <button id="search-button" type="button" class="btn btn-primary search-button">
               Search
               </button>
            </div>
            <div class="col-sm-1 ">
               <button id="reset-button" type="button" class="btn btn-danger reset-button">
               Reset
               </button>
            </div>
         </div>
      </div>
      <div id="view_details" class="panel-body" style="display:none;">
         <div class="row">
            <span class="col-sm-2 col-sm-offset-3"><strong>Jo Code:</strong>&nbsp;&nbsp;<span id="jo_code"></span></span>
            <span class="col-sm-2 col-sm-offset-1"><strong>Current Posting:</strong>&nbsp;&nbsp;<span id="current_posting"></span></span>
         </div>
         <div class="table-responsive">
            <table class="table table-bordered table-striped" id="grade_details_result" style="width: 100%;">
               <thead>
                  <tr>
                     <th></th>
                     <th>Officer Name</th>
                     <th>JO Code</th>
                     <th>Designation</th>
                     <th>Current Posting</th>
                     <th>Assessment year</th>
                     <th>Grade</th>
                  </tr>
               </thead>
               <tbody id="tbody">
               </tbody>
            </table>
         </div>
      </div>
   </div>
</div>
<!--loader starts-->
<div class="col-sm-offset-5 col-md-3" id="wait" style="display:none;">
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
   		
   	$(document).on("click","#search-button",function(){
   
        $("#grade_details_result").dataTable().fnDestroy();
   
   
   		var judicial_officer= $("#judicial_officer").val();
        var to_assessment_year= $("#to_assessment_year").val();
        var from_assessment_year= $("#from_assessment_year").val();
        var jo_code=$("#judicial_officer option:selected").data('jo_code');  
   
        if(to_assessment_year<=from_assessment_year)
        {
            swal("date range is improper","","error");
            $("#to_assessment_year").val('');
            $("#from_assessment_year").val('');
            $("#view_details").hide();
        }
        else{
            $("#view_details").show();
        }

        $.ajax({

            type: "POST",
            url:"acr_fetch/search",
            data: {
                _token: $('meta[name="csrf-token"]').attr('content'),
                judicial_officer:judicial_officer,
                to_assessment_year: to_assessment_year,
                from_assessment_year:from_assessment_year,
                jo_code:jo_code
            },
            success:function(response)
            {                       
            console.log(response);
            if(response['grade_details']!="")
                $("#jo_code").html(response['grade_details'][0]['jo_code']);

            if(response['current_posting']!="")
                $("#current_posting").html(response['current_posting'][0]['court_complex']['zone']['zone_name']);
            
            var d = new Date();
                var month = d.getMonth()+1;
                var day = d.getDate();
            var current_date = (day<10 ? '0' : '') + day + '-' +
                    (month<10 ? '0' : '') + month + '-' + 
                    d.getFullYear() ;

            var str = "";                       
            $.each(response.grade_details, function(key,value){
                str += "<tr>"+
                            "<td>"+ (key+1) +"</td>"+
                            "<td>"+ " " + "</td>"+
                            "<td>"+ value.jo_code + "</td>"+
                            "<td>"+ " " + "</td>"+
                            "<td>"+ " " + "</td>"+
                            "<td>"+ value.year + "</td>"+
                            "<td>"+ value.grade_detail.grade_name + "</td>"+
                        "</tr>";
            })

            

            $("#tbody").html(str);
            $("table").dataTable({
                dom: 'Blfrtip',
                buttons: [
                    {
                        extend: 'pdfHtml5',
                        orientation: 'portrait',
                        pageSize: 'LEGAL',
                        title: 'Calcutta High Court',
                        messageTop: 'Grade Details of '+$("#judicial_officer option:selected").html()+' from: '+from_assessment_year+' To '+to_assessment_year,
                        messageBottom: 'Printed On '+current_date,
                        customize: function(doc) {                                
                            doc.content[1].margin = [ 200, 0, 0, 20 ] //left, top, right, bottom   
                            doc.content[2].margin = [ 200, 0, 0, 20 ] //left, top, right, bottom                                    
                        }
                    }
                ]
            });
            }
                 //     error: function (jqXHR, textStatus, errorThrown) {
                 //     if(jqXHR.status!=422 && jqXHR.status!=400){
                 //         swal("Server Error",errorThrown,"error");
                 //     }
                 //     else{
                 //         msg = "";
                 //         $.each(jqXHR.responseJSON.errors, function(key,value) {
                 //             msg+=value+"\n";						
                 //         });
                 //         swal("Invalid Input",msg,"error");
                 //     }
                 // }
                 });
             });
   
             /*Cloning of Year and Grades */
   
             
         /*If multiple grades and year of assessment one wants to enter and want to remove one :: STARTS*/
              
         $(document).on("click","#reset-button",function(){
             $("#judicial_officer").val(" ");
             $("#to_assessment_year").val(" ");
             $("#from_assessment_year").val(" ");
            
         });
   
     });
   
</script>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/acr/acr_fetch.blade.php ENDPATH**/ ?>