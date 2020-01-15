 
<?php $__env->startSection('content'); ?>
<style>
   .select2-results__option{
   color:#d43c3c;
   }
</style>

<!-- Bootstrap Boilerplate... -->
<div id="info-panel" class="panel panel-default">
<!-- IIIIIIIIIII -->
<div id="info-panel-heading" class="panel-heading"><h2>Station Preference Details</h2></div>
<!-- IIIIIIIIIII -->
<div class="panel-body">
<br><br>
<!-- New Task Form -->

<div class="form-group required row">
    <div class="form-group required row">
        
    </div>
      <div id="view_details" class="panel-body">
         <div class="row place_of_posting" id="place_of_posting" style="display:none;">
            <span class="col-sm-5 col-sm-offset-4"><strong>Current Place of Posting:</strong>&nbsp;&nbsp;<span id="current_place_of_posting" style="color:red"></span></span>
         </div>
         <div class="table-responsive">
            <div style="overflow-x:auto;">
                <table class="table table-bordered table-striped" id="details_for_posting_preference" style="width: 100%;white-space: nowrap;">
                    <thead>
                        <tr>                            
                            <th>SL NO.</th>
                            <th>JO NAME</th>
                            <th>POSTED AS</th>
                            <th>STATION PREFERENCE</th>
                            <th>PREFERENCE REMARK</th>
                            <th>OTHER INFO.</th>
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
  
    $.ajax({
            type: "POST",
            url: "show_details_for_posting_preference",                
            data:{_token: $('meta[name="csrf-token"]').attr('content')
            },
        success:function(response){
                var obj = $.parseJSON(response);
                console.log(obj);
                var i;
                var str="";
                for(i=0;  i < obj.display_pref_for_jo.length; i++){
                    str+="<tr>"+
                    //sl no
                    "<td>"+(i+1)+"</td>"+
                    //jo_name | jo_code
                    "<td>"+obj.display_pref_for_jo[i].officer_name+" | "+obj.display_pref_for_jo[i].jo_code+"</td>";
                    //posted as
                    var j;
                    for(j=0; j < obj.posted_as[i].length; j++)
                    {
                        str+="<td>"+obj.posted_as[i][j].designation_name+"</td>";
                    }
                    //Station preference
                    str+="<td>";
                    if( obj.preference_details[i].length>0){
                        for(j=0; j < obj.preference_details[i].length; j++)
                        {   
                            str+=(j+1)+"."+obj.preference_details[i][j].station_name+"<br>\n";                      
                        }
                    }
                    else{
                        str+="Preference not yet given"
                    }
                    
                    str+="</td>";

                    //JO Remarks
                    str+="<td>"+obj.preference_details[i]['0'].remarks+"</td>";                              
                    
                    //other info
                    //zone tenure details
                    str+="<td><u>Zone-wise Posting history</u>";
                    for(j=0;j < obj.zone_tenure[i].length; j++){
                        str+=obj.zone_tenure[i][j];
                    }
                    if( obj.practice_subdivision[i].length>0){
                        str+="<br><br>\n\n";
                        //practice subdivisions
                        for(j=0; j < obj.practice_subdivision[i].length; j++){
                            str+="<u>Legal Expeirence at :</u> "+obj.practice_subdivision[i][j].subdivision_name;
                        }
                    }
                    else{
                        str+="";
                    }

                    //spouse info
                    if(obj.spouse_details[i].length>0){
                        str+="<br>\n";
                        for(j=0;j < obj.spouse_details[i].length; j++){
                            for(k=0 ; k < obj.spouse_details[j].length; k++){
                                str+="<u>Spouse : </u>"+obj.spouse_details[i][j][k].officer_name+"<br>\n"+obj.spouse_details[i][j][k].designation_name;
                            }
                        }
                    }
                    else{
                        str+="";
                    }
                    str+="</td>"+"</tr>"; 
                }

                $("#tbody").html(str);
                $(".table").DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'pdfHtml5',
                            orientation: 'landscape',
                            pageSize: 'LEGAL',
                            exportOptions: {
                                columns: ':visible',
                                stripNewlines: false
                            },
                        title: 'High Court At Calcutta',
                        messageTop: function () {
                                       
                              return 'Posting Preference Details of The Judicial Officers who have submitted their Choice of posting';
                        },
                        
                        
                        }
                    ]
                });
   
            //console.log(str);       
                
            }
        }); 
    
     
   /*Cloning of Year and Grades */
   
         
         
   });
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/appointments/index.blade.php ENDPATH**/ ?>