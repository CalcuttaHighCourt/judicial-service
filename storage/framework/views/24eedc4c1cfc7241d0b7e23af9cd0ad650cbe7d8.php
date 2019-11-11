 <?php $__env->startSection('title', 'JudicialOfficerPostingPreference'); ?>
<?php $__env->startSection('page_heading'); ?> JudicialOfficerPostingPreference <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
                                                                                                                                                                                                    
<style>
    .select2-container--default .select2-selection--multiple .select2-selection__choice{
        background-color:#111;
        
    }
    .select2-container--default .select2-results__option{
    background-color: #28415b;
}
</style>

<div class="col-sm-12">
   <!-- Bootstrap Boilerplate... -->
   <div id="info-panel" class="panel panel-default">
      <br>
      <div class="col-sm-offset-1 col-sm-11">
         <!-- IIIIIIIIIII -->
         <ul class="nav nav-pills" role="tablist">
            <li class="nav-item">
               <a class="nav-link active" id="posting_details" style="border-style:outset" data-toggle="tab" href="#postings">Posting Details</a>
            </li>
            <li class="nav-item">
               <a class="nav-link active" id="judicial_diary" style="border-style:outset" data-toggle="tab" href="#daily_diary">Judicial diary</a>
            </li>
            <li class="nav-item">
               <a class="nav-link active"  style="border-style:outset" data-toggle="tab" href="#acr">Annual Confidential Report</a>
            </li>
         </ul>
      </div>
      <!-- IIIIIIIIIII -->
      <div class="tab-content clearfix">
         <div class="tab-pan" id="postings">
            <!-- New Task Form -->
            <div id="content" class="col-sm-offset-1 col-sm-11 content">
               <br><br>
               <input type="hidden" id="JudicialOfficerPostingPreference-id">
               <div id="officer_name-group" class="form-group row our-form-group">
                  <label for="officer_name" class="col-sm-offset-1 col-sm-4 ">Officer Name: <?php echo e(Auth::user()->name); ?></label>
               </div>
               <div id="zone-group" class="form-group row our-form-group">
                  <label for="zone" class="col-sm-offset-1 col-sm-4 ">Current Zone of Posting:<span id="cur_zone_name" name="cur_zone_name" data-cur_zone_val="<?php echo e($zone_pref_details['current_zone']['zone_id']); ?>"> <?php echo e($zone_pref_details['current_zone']['zone_name']); ?></span></label>
                  <label for="zone" class="col-sm-offset-1 col-sm-4 ">Previous Zone of Posting:<span id="pre_zone_name" name="pre_zone_name" data-pre_zone_val="<?php echo e($zone_pref_details['just_prev_zone']['zone_id']); ?>"> <?php echo e($zone_pref_details['just_prev_zone']['zone_name']); ?></span></label>
               </div>
               <hr>
               <div id="posting_pref-group" class="form-group row our-form-group">
                  <div class="col-sm-offset-1 col-sm-3">
                     <label for="posting_pref1">Posting Preference 1</label>
                     <select id="posting_pref1" class="form-control posting_pref" style="width:150px" name="posting_pref1">
                        <option value="">Select zone1</option>
                        <?php echo $__env->make('zones.zone_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                     </select>
                  </div>
                  <div class="col-sm-3">
                     <label for="posting_pref2">Posting Preference 2</label>
                     <select id="posting_pref2" class="form-control  posting_pref" style="width:150px" name="posting_pref2">
                        <option value="">Select zone2</option>
                        <?php echo $__env->make('zones.zone_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                     </select>
                  </div>
                  <div class="col-sm-3">
                     <label for="remarks">Remarks</label>
                     <textarea class="form-control" rows="3" id="remarks"></textarea>
                  </div>
                  <div class="col-sm-2">
                     <br>
                     <button id="draft" type="button"class="btn btn-warning draft-button info-form-button">
                     Draft
                     </button>
                  </div>
                  <div class="col-sm-offset-1 col-sm-2">
                     <button id="submit" type="button" class="btn btn-primary add-button info-form-button">
                     Final Submit
                     </button>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <br>
      <br>
      <!-- digital dairy starts here---->
      <div class="tab-pan" id="daily_diary" style="display:none;">
         <div class="col-sm-offset-1 col-sm-11">
            <br><br>
            <div class="form-group row">
               <div class="date col-sm-offset-2 col-sm-2">
                  <input type="text" class="form-control date diary_date" id="date" placeholder="Choose Date" autocomplete="off">
               </div>
               <div class="col-sm-3">
                  <button id="submit_diary" type="button"
                     class="btn btn-primary add-button info-form-button">
                  Submit
                  </button>
               </div>
            </div>
        </div>
    <div class="col-sm-12">
   <!-- Bootstrap Boilerplate... -->
   <div id="info-panel" class="panel panel-default">
         <div class="box col-sm-offset-1">
            <div class="box-header" id="diary_editor" style="display:none;">
               <h3 class="box-title col-sm-offset-3" >DAILY WORKSHEET
                  <small>of : <span id="date_span"></span></small>
               </h3>
               <!-- /.box-header -->
               <div class="box-body pad col-sm-offset-1 col-sm-10">
                  <form>
                     <textarea class="text_content" id="text_content" placeholder="Place some text here"
                        style="width: 100%; height: 100%; font-size: 100%; line-height: 80%x; border: 1px solid #dddddd; padding: 10px;"></textarea>
                  </form>
                  <div class="col-sm-offset-5 col-sm-3">
                     <button id="submit_worksheet" type="button"
                        class="btn btn-warning add-button info-form-button">
                     Submit
                     </button>
                  </div>
               </div>
            </div>
         </div>
      </div>
    </div>
   </div> 
      <!-- /.col-->
   </div>
</div>
<!-- /.box-header -->
</div>
<!-- /.col-->
</div>
<div id="test-div"></div>

<?php $__env->stopSection(); ?> <?php echo $__env->make('layouts.1_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?> <?php echo $__env->yieldContent('1_column_content'); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('meta'); ?>
##parent-placeholder-cb030491157b26a570b6ee91e5b068d99c3b72f6##
<meta name="_token" content="<?php echo csrf_token(); ?>" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('end_scripts'); ?> ##parent-placeholder-36ee17f40f3980c360dd4f0dee7896f1cfc0384a##


<script type="text/javascript">
      $(document).ready(function(){

       

            $(".text_content").wysihtml5();
           /*LOADER*/

            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

         /*LOADER*/

         /*Datatable initialisation */

        // var table="";
        // $(function() {
         
        //  table = $('#datatable-table').DataTable({
            
        //     "processing": true,
        //     "serverSide": true,
        //     "ajax": {
        //         type:"post",
        //         url: "zone_pref_details/table_show",
        //         dataSrc: "judicial_officer_posting_preferences"
        //     },

        //     "columnDefs":
        //             [
        //                 {className: "table-text", "targets": "_all"},
                       
        //                 {
        //                     "targets": -1,
        //                     "data": null,
        //                     "searchable": false,
        //                     "sortable": false,
        //                     "defaultContent": '<button type="submit" class="btn btn-warning edit-button"><i class="fa fa-pencil"></i> </button>',
        //                 }
                       
        //              ],
        //     "columns":
        //             [
        //                 {
        //                     "data": null,
        //                     "defaultContent": "",
        //                     "searchable": false,
        //                     "orderable": false,
        //                 },
                        
        //                 {
        //                     "data": "zone_name",
        //                 },
        //                 {
        //                     "data": "created_at",
        //                 },
        //                 {
        //                     "data": "remarks",
        //                 },
        //                 {
        //                     "data": "",
        //                 },
                        
        //             ],
        //     "order": [[2, 'desc']]
        //         });
        //         table.on( 'draw.dt', function () {
                
        //             $('.edit-button').click(function(){
        //                 var data = table.row( $(this).parents('tr') ).data();
        //                 //console.log(data);
        //                 if(data.remarks=="Not Mentioned")
        //                 {
        //                     $("#remarks").val("");
        //                 }
        //                 else{
        //                     $("#remarks").val(data.remarks);
        //                 }

        //                 var zone_name=(data.zone_name);
        //                 var zone_id=(data.zone_id);
        //                 $('.posting_pref').val("");
        //                // console.log(data.zone_name);
        //                 $('.posting_pref option[value=' + zone_id + ']').attr('selected', true).trigger("change");

        //                 $("#file_prefix").attr("readonly","readonly");
        //             });
                    
	    //         });
        //     });
   

    // function populate_form(data){
	
    //         $("#judicial_officer_id").val(data.id);
            
    //         $("#officer_name").val(data.officer_name);

    //         $("#remarks").val(data.guardian_name);
    
    // }
            // function make_active_button(type){
            //     $("#"+type+"-button").addClass("active");
            // }
            // function make_form_readonly(make_readonly){
            //     if(make_readonly){
            //         $('#info-form input').attr('readonly', 'readonly');
            //         $('#info-form textarea').attr('readonly', 'readonly');
            //         $('#info-form select').attr('readonly', 'readonly');
            //     }
            //     else{
            //         $('#info-form input').removeAttr('readonly');
            //         $('#info-form textarea').removeAttr('readonly');
            //         $('#info-form select').removeAttr('readonly');
            //     }
            // }
            // function show_button(type){
            //     $("#"+type+"-button").show();
            //     $("#"+type+"-button").removeAttr("disabled");
                
            //     $("#info-panel-buttons").removeClass("hide");
            //     //$("#"+type+"-button").removeClass("disabled");
            // }
        /*datatable for preference ends  */

        /*date initialization:start */

        	$(".diary_date").datepicker({
                endDate:'0',
                format: 'dd-mm-yyyy'
            }).on('change', function () {
                $('.datepicker').hide();
            }); 

        /*date initialization:end */

        $(document).on("click","#judicial_diary",function(){
            $("#postings").hide();
            $("#daily_diary").show();
            
         });

         $(document).on("click","#posting_details",function(){
            $("#daily_diary").hide();
            $("#postings").show();
            
         });


    //To remove current zone & previous zone, from drop down list : start

        var cur_zone_name= $("#cur_zone_name").data('cur_zone_val');
        var pre_zone_name = $("#pre_zone_name").data('pre_zone_val');;

        $(".posting_pref option[value='"+cur_zone_name+"']").remove();
        $(".posting_pref option[value='"+pre_zone_name+"']").remove();

    //To remove current zone & previous zone, from drop down list : end

       
        $(document).on("click","#submit_diary",function(){

           $("#diary_editor").show();
            $("#date_span").html($(".diary_date").val());
            $("#submit_diary").hide();

            var date=$("#date").val();

             $.ajax({

                        type:"POST",
                        url:"zone_pref_jr/worksheet_show",
                        data:{
                            _token: $('meta[name="csrf-token"]').attr('content'),
                            date:date
                        },
                        success:function(response){
                        
                            if(response.length>0)
                                $("iframe").contents().find("html").find("body").html(response['0'].description);
                               
                            else
                                $("iframe").contents().find("html").find("body").html("");
                        },
          
                });
        });

        $(document).on("change","#date",function(){

            $("#submit_diary").show();
        });


        $(document).on("click","#submit_worksheet",function(){

        
            var date=$("#date").val();
            var details=$("#text_content").val();

            $.ajax({

                type:"POST",
                url:"zone_pref_jr/worksheet",
                data:{
                    _token: $('meta[name="csrf-token"]').attr('content'),
                    date:date,
                    details:details
                },
                success:function(response)
                {
                    
                    $("#date").val('');
                    $("#text_content").val('');
                    swal("Saved Successfully","","success");
                },
                error:function(response)
                {
                    swal("Error","","error");
                }

            });
        });

        
        
            $(document).on("click", "#search",function(){

                var jo_code = $("#officer_name").val();

           
                
                $.ajax({

                    type:"POST",
                    url:"jo_posting/search",
                    data:{
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        jo_code:jo_code                      
                },
                success:function(response)
                {
                    //console.log(response);
                   
                    $("#jo_details").show();

                   // $("#officer_name").val('');
                    var details="";
                    details+=      '<tr>'+
                                        '<td>'+response[0].jo_code+'</td>'+
                                        '<td>'+response[0].designation_name+'</td>'+
                                        '<td>'+response[0].district_name+'</td>'+
                                        '<td>'+response[0].zone_name+'</td>'+
                                        '<td>'+response[0].from_date+'</td>'+
                                        '<td>'+response[0].duration+'</td>'+
                                    '</tr>';

                                //console.log(details);
                    $('table tbody').html(details);
                },
                error:function(response) {  
                           
                    }                
                
                });

            });//end of search

    $(document).on("click","#submit",function(){

        var pref=$("#posting_pref").val();
        var pref_name1=$("#posting_pref1 option:selected").text(); 
        var pref_name2=$("#posting_pref2 option:selected").text(); 
        var remarks=$("#remarks").val();       

        if(pref1==null)
        {
            swal("Please Select the first preferences","","error");
            return false;
        }
        else if(pref2==null)
        {
            swal("Please Select the second preferences","","error");
            return false;
        }
        
        else if(pref.length<2)
        {
            swal("Please Select Minimum 2 preferences","","error");
            return false;
        }
        
        else
        {
            var str="";
            var i;
            for(i=0;i<pref.length;i++){
                str+="Preference - "+(i+1)+" : "+pref_name[i]+"\n";
            }

            swal({
                    title: "Are You Sure?",
                    text: str,
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
            .then((willApprove) => {
                if(willApprove) {                           

                    //Add dept using ajax : start
                        $.ajax({
                            type:"POST",
                            url:"zone_pref/submit",
                            data:{
                                _token: $('meta[name="csrf-token"]').attr('content'),
                                pref:pref,
                                remarks:remarks
                            },                                                          
                            success:function(response){
                                   console.log(response);                              
                                swal("Preference Added Successfully","Successful","success");
                                

                            },
                            error:function(response) {  
                                if(response.responseJSON.errors.hasOwnProperty('pref'))
                                    swal("Cannot Add New Department", ""+response.responseJSON.errors.pref['0'], "error");                                                       
                                }

                            });//Add dept using ajax : end
                            
                    }//end of swal if(willApprove)
                    $("#content").hide();
                    $("#table_content").show();
                })//permission to save given verification           


        } //end of else  if(pref.length<2)

                                      
    });//end of  $(document).on("click","#submit",function()

});


</script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/zone_pref_jr/index.blade.php ENDPATH**/ ?>