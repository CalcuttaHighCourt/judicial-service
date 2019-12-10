 
<?php $__env->startSection('content'); ?>
<style>
   .select2-results__option{
   color:#d43c3c;
   }
</style>

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
         <div class="row place_of_posting" id="place_of_posting" style="display:none;">
            <span class="col-sm-5 col-sm-offset-4"><strong>Current Place of Posting:</strong>&nbsp;&nbsp;<span id="current_place_of_posting" style="color:yellow"></span></span>
         </div>
         <div class="table-responsive">
            <div style="overflow-x:auto;">
                <table class="table table-bordered table-striped" id="grade_details_result" style="width: 100%;white-space: nowrap;">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Officer Name</th>
                            <th>JO Code</th>
                            <th>Designation</th>
                            <th>Court Name</th>
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

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>


<meta name="_token" content="<?php echo csrf_token(); ?>" />

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
   
        $("#grade_details_result").DataTable().destroy();
   
   
   		var judicial_officer= $("#judicial_officer").val();
        var to_assessment_year= $("#to_assessment_year").val();
        var from_assessment_year= $("#from_assessment_year").val();
        var grade=$("#grade option:selected").val();
        var designation=$("#designation option:selected").val();   
        
   
        $.ajax({
   
            type: "POST",
            url:"acr_fetch/search",
            data: {
                _token: $('meta[name="csrf-token"]').attr('content'),
                judicial_officer:judicial_officer,
                to_assessment_year: to_assessment_year,
                from_assessment_year:from_assessment_year,
                grade:grade,
                designation:designation
            },
            success:function(response)
            {                       
                console.log(response);
                        
                var d = new Date();
                    var month = d.getMonth()+1;
                    var day = d.getDate();
                var current_date = (day<10 ? '0' : '') + day + '-' +
                        (month<10 ? '0' : '') + month + '-' + 
                        d.getFullYear() ;
    
                var str = "";                       
                $.each(response, function(key,value){
                    str += "<tr>"+
                                "<td>"+ (key+1) +"</td>"+
                                "<td>"+ value.officer_name + "</td>"+
                                "<td bgcolor=blue><strong>"+ value.jo_code + "</strong></td>"+
                                "<td>"+ value.designation_name + "</td>"+
                                "<td>"+ value.court_name + "</td>"+
                                "<td>"+ value.year + "</td>"+
                                "<td>"+ value.grade_name + "</td>"+
                            "</tr>";

                    if(value.place_of_posting!=""){
                        $("#current_place_of_posting").html(value.place_of_posting['0'].court_name);
                        $("#place_of_posting").show();
                    }
                    else{
                        $("#place_of_posting").hide();
                        $("#current_place_of_posting").html('');
                    }
            })
   
        
            // $("#current_place_of_posting").html(response[0].court_name);
        
            $("#tbody").html(str);
            $(".table").DataTable({
                dom: 'Blfrtip',
                buttons: [
                    {
                        extend: 'pdfHtml5',
                        orientation: 'portrait',
                        pageSize: 'LEGAL',
                        exportOptions: {
                                columns: ':visible',
                                stripNewlines: false
                            },
                        title: 'Calcutta High Court',
                        messageTop: function () {
                    
                          var  current_posting=$("#current_place_of_posting").html();
                                if ( current_posting =="") {
                                    return 'ACR Grade History Details';
                                }
                                else {
                                    return 'ACR Grade History Details \n Current Place of Posting: '+$("#current_place_of_posting").html();
                                }
                            },
                            messageBottom: 'Printed On '+current_date,
                            customize: function(doc) {                                
                                doc.content[1].margin = [ 210, 0, 0, 20 ] //left, top, right, bottom   
                                doc.content[3].margin = [ 0, 50, 0, 20 ] //left, top, right, bottom                                    
                        }
                    },
                    {
                            extend: 'excelHtml5',
                            exportOptions: {
                                columns: ':visible',
                                stripNewlines: false
                            },
                            title: 'Calcutta High Court',
                            messageTop: function () {
                    
                                var  current_posting=$("#current_place_of_posting").html();

                                    if ( current_posting =="") {
                                        return 'ACR Grade History Details';
                                    }
                                    else {
                                        return 'ACR Grade History Details \n Current Place of Posting: '+$("#current_place_of_posting").html();
                                    }
                                },
                            messageBottom: 'Printed On '+current_date
                        },
                ]
            });
   
            $("#view_details").show();
        }
       
    });
        
   });
             
   
   /*Cloning of Year and Grades */
   
             
   /*If multiple grades and year of assessment one wants to enter and want to remove one :: STARTS*/
        
    $(document).on("click","#reset-button",function(){
        $("#judicial_officer").val("").trigger("change");
        $("#grade").val("").trigger("change");
        $("#designation").val("").trigger("change");
        $("#jo_code").val("");
        $("#to_assessment_year").val("");
        $("#from_assessment_year").val("");
        $("#view_details").hide();
    
    });
   
   });
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/acr/acr_fetch.blade.php ENDPATH**/ ?>