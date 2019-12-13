 
<?php $__env->startSection('content'); ?>
<!-- Main content -->

                                                                                                                                                                
<style>
    .select2-container--default .select2-selection--multiple .select2-selection__choice{
        background-color:#111;
        
    }
    .select2-container--default .select2-results__option{
    background-color: #28415b;
}
</style>
<br/>
   
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
            <!-- <li class="nav-item">
               <a class="nav-link active"  style="border-style:outset" data-toggle="tab" href="#acr">Annual Confidential Report</a>
            </li> -->
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
                    <label for="zone" class="col-sm-offset-1 col-sm-4 ">Current Zone of Posting:<span id="cur_zone_name" name="cur_zone_name"> <?php echo e($fetch_zone['current_zone']); ?></span></label></span></label>
                    <label for="zone" class="col-sm-offset-1 col-sm-4 ">Previous Zone of Posting:<span id="pre_zone_name" name="pre_zone_name"> <?php echo e($fetch_zone['previous_zone']); ?></span></label>
               </div>
               <hr>
               
               <div class="row">                   
                    <?php for($i=1 ; $i<=$fetch_zone['no_of_preference']; $i++): ?>
                   
                        <div id="posting_pref-group" class="form-group our-form-group">
                            <div class="col-sm-offset-1 col-sm-3">
                                <label for="posting_pref">Posting Preference <?php echo e($i); ?> </label>
                                <select id="priority_<?php echo e($i); ?>" class="form-control posting_pref" style="width:100%">
                                    <option value="">Select zone</option>
                                    <?php $__currentLoopData = $fetch_zone['zones']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $zones): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($zones['id']); ?>"><?php echo e($zones['zone_name']); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                        </div>
                    <?php endfor; ?>
                </div>   
                <div class="row">
                    <?php for($i=1 ; $i<=$fetch_zone['no_of_preference']; $i++): ?>
                        <div id="zone_pref_option_<?php echo e($i); ?>" class="col-sm-offset-1 col-sm-3">
                            <br>
                            <select id="station" class="form-control posting_pref" style="width:150%;height:200px;">
                                <option value=""></option>
                                        
                            </select>
                        </div>
                    <?php endfor; ?>
                </div>
                <div class="row">
                  <div class="col-sm-offset-1 col-sm-5">
                     <label for="remarks">Remarks</label>
                     <textarea class="form-control" rows="3" id="remarks"></textarea>
                  </div>
                </div>
                <div class="row">
                    <br>
                    <div class="col-sm-offset-2 col-sm-2">
                        <button id="draft" type="button"class="btn btn-warning draft-button info-form-button">Draft</button>
                    </div>
                    <div class="col-sm-2">
                        <button id="submit" type="button" class="btn btn-primary add-button info-form-button">
                            Final Submit
                        </button>
                  </div>
                </div>
               </div>
            </div>
         </div>
      </div>

     
      <br>
      <br>
      <!-- digital dairy starts here---->
      <br><br><br>
      <div class="tab-pan" id="daily_diary" style="display:none;">
         <div class="col-sm-offset-1 col-sm-11">
            <br><br>
            <div class="form-group row">
               <div class="date col-sm-offset-2 col-sm-2">
                  <input type="text" class="form-control date diary_date" id="date" placeholder="Choose Date" autocomplete="off" style="background-color:#F8FEFB;border:2px solid black;border-radius: 4px;">
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
                        class="btn btn-warning add-button info-form-button">Submit
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

<meta name="_token" content="<?php echo csrf_token(); ?>" />



<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>



<script type="text/javascript">
      $(document).ready(function(){

           /*Initialising the text editor*/
           
            $(".text_content").wysihtml5();
           
           /*LOADER*/

            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

         /*LOADER*/

        
        // });
        
      

        /*date initialization:start */

        	$(".diary_date").datepicker({
                format: "dd-mm-yyyy",
                endDate:'0',
                autoclose: true,   
                orientation: "auto",
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
                        
                        console.log(response);
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

        var posting_pref=  new Array();
        function send_data(flag){             

            posting_pref = [];
            $(".posting_pref").each(function(){
                posting_pref.push($(this).val());
            })

            var remarks= $("#remarks").val();

            $.ajax({

                type: "POST",
                url:"zone_pref_jr/draft", 
                data: {
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        posting_pref:posting_pref,
                        remarks:remarks,
                        flag:flag
                    } ,
                    success:function(response){
                        swal("Saved in Draft Mode","Zone Preference has been saved if draft mode ","success");
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
                })

        }

        $(document).on("click", "#draft",function(){


            send_data('N');
           
            });

            $(document).on("click", "#submit", function(){

                $("#submit").hide();
                $("#draft").hide();

                send_data('Y');

               

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

        if(pref_name1==null)
        {
            swal("Please Select the first preferences","","error");
            return false;
        }
        else if(pref_name2==null)
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
            // for(i=0;i<pref.length;i++){
            //     str+="Preference - "+(i+1)+" : "+pref_name[i]+"\n";
            // }

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




<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/zone_pref_jr/index.blade.php ENDPATH**/ ?>