 
<?php $__env->startSection('content'); ?>
<!-- Main content -->


<br/><br/>
<div id="info-panel" class="panel panel-default">
   <div class="row" style="margin-left:-200px">
      <div class="col-sm-2">
         <!--left col-->
      </div>
      <!--/col-3-->

        <div class="form-group required">
            <div class="col-xs-3">
                <label for="jo_grade_rank_id" class="control-label">
                    Rank 
                </label>

                <select id="jo_grade_rank_id" class="form-control info-form-control select2" name="jo_grade_rank_id" style="width:100%">
                    <option value="">Select an Option</option>
                    <?php echo $__env->make('ranks.rank_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </select>
            </div>


            <div class="col-xs-2" class="required">
                <label for="jo_grade_year" class="control-label">
                    Year 
                </label>
                <input type="text" class="form-control date" name="date_of_gradation" id="date_of_gradation" placeholder="dd-mm-yyyy">
            </div>
        </div>

        <div class="form-group">
            <div class="col-xs-1">
                <button class="btn btn-success submit" id="submit" name="submit">Submit</button>
            </div>
        </div>

        <div class="form-group">
            <div class="col-xs-1">
                <button class="btn btn-primary primary" id="reset" name="reset">Reset</button>
            </div>
        </div>

    </div>
    <!--/row-->

    <br>

    </div>
    <!--<div id="info-panel" class="panel panel-default">-->

    <br><br><br>

    <div class="jo_grade_div" >
            <div id="info-panel2" class="panel panel-default">    
            <div id="datatable-panel-heading" class="panel-heading clearfix">       
                <div class="panel-title pull-left">List of Judicial Officers. . . </div>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped"
                        id="jo_grade_table" style="width: 100%;">
                        <!-- Table Headings -->
                        <thead>
                            <tr>                        
                                <th>Sl No.</th>
                                <th>JO Name</th>
                                <th>JO Code</th>
                                <th>Joining Date</th>
                                <th>Remark</th>
                                <th>Edit Position</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>

        
    </div>
    <!--/<div class="jo_grade_div">-->


    <br><br>


<br>

</div>




<meta name="_token" content="<?php echo csrf_token(); ?>" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>

<script>
   $(document).ready(function() { 
       
           // Select2 initialization
           $(".select2").select2();

 
        // Datepicker Initialization
        $(".date").datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,   
            orientation: "auto",
            endDate: '+0d',
        });



         var table;

            //Create list to arrange :start
           $(document).on("click","#submit", function() {

                var jo_grade_rank_id= $("#jo_grade_rank_id option:selected").val();
                var date_of_gradation= $("#date_of_gradation").val();

                $("#list_box").find('option').remove(); 

                if(jo_grade_rank_id =="" ){
                    swal("Select Rank","Rank required","error");
                    return false;
                }
                else if(date_of_gradation=="" ){
                    swal("Select Date","Date required","error");
                    return false;
                }
                else{


                            $("#jo_grade_table").DataTable().destroy();


                //show all finnalized requisition for all department  using 'HomeController@get_all_finalized_requisition_for_report'
                var table2 = $("#jo_grade_table").DataTable({  
                                "processing": true,
                                "serverSide": true, 
                                "bPaginate": false, 
                                "ajax":{
                                        "url": "<?php echo e(route('fetch_jo_details')); ?>",
                                        "dataType": "json",
                                        "type": "POST",
                                        "data":{  _token: $('meta[name="csrf-token"]').attr('content'),
                                                rank_id:jo_grade_rank_id,
                                                date_of_gradation:date_of_gradation
                                             }
                                },
                                "columnDefs": 
                                            [
                                                { className: "", "targets": "_all" },
                                                {
                                                    "targets": 5,                                    
                                                    "defaultContent": '<img src=" <?php echo e(asset('images/position.png')); ?> " width="20" height="20" class="edit_position"  style="cursor:pointer;" alt="Edit Position" aria-hidden="true" title="Edit Position" > '
                                                }
                                                
                                            ],
                                "columns": [                      
                                            {"data": "sl_no"},             
                                            {"data": "jo_name"},
                                            {"data": "jo_code"},
                                            {"data": "date_of_joining"},
                                            {"data": "remark"},
                                            {"data": "edit_position"}
                                ]
                            }); 


                            //Datatable Code For Showing Data :: START


                            $("#jo_grade_div").show();

                            // if(response.length>0){
                            //     $.each(response, function(index,value){
                            //         $("#list_box").append('<option value="'+value.id+'" data-rank_id="'+value.rank_id+'" data-date_of_gradation="'+date_of_gradation+'" >'+value.officer_name+'|'+value.jo_code+'</option>');
                            //     })
                            //     $("#jo_grade_div").show();
                            // }
                            // else
                            // {
                            //     swal("No Judicial Found","No record found","error");
                            // }
                    //     }//end of success
                    // })
                }

            });
            //Create list to arrange :end


            $(document).on("click","#reset", function() {
                $("#jo_grade_div").hide();
                location.reload();
            });


            $(".up_down").click(function(){
                var $op = $('#list_box option:selected'),
                    $this = $(this);
                if($op.length){
                    ($this.val() == 'Up') ? 
                        $op.first().prev().before($op) : 
                        $op.last().next().after($op);
                }
            });




            $(document).on("click","#save", function() {

                var judicial_officer_id = new Array();
                var rank_id = new Array();
                var grade = new Array();
                var date_of_gradation = new Array();


                $("#list_box option").each(function(index,value){
                    judicial_officer_id.push($(this).val());
                    rank_id.push($(this).data("rank_id"));
                    date_of_gradation.push($(this).data("date_of_gradation"));
                    // data-grade="'+value.grade+'"

                });

                if(judicial_officer_id.length==0){
                    swal("Invalid Input","Grade list can not be empty","error");
                    return false;
                }
                else{
                    //alert(date_of_gradation);
                    

                    swal({
                    title: "Are you sure?",
                    text: "This will save the arranged grade list",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                    })
                    .then((willDelete) => {
                        if (willDelete) {
                            $.ajax({
                                url:"<?php echo e(route('save_jo_grade')); ?>",
                                type:"POST",
                                data:{
                                    judicial_officer_id:judicial_officer_id,
                                    rank_id:rank_id,
                                    date_of_gradation:date_of_gradation
                                },
                                success:function(response){
                                    swal("Arranged grade set Successfully","","success");
                                    $("#jo_grade_div").hide();
                                },
                                error:function(response) {  

                                        if(jqXHR.status!=422 && jqXHR.status!=400){
                                            swal("Failed to "+operation+" Judicial Officer grading",errorThrown,"error");
                                        }
                                        else{
                                            msg = "";
                                            $.each(jqXHR.responseJSON.errors, function(key,value) {
                                                msg+=value+"\n";						
                                            });

                                            swal("Failed to "+operation+" Judicial Officer grading",msg,"error");
                                        }

                                    }

                            })
                        }
                    });
                }
            });


   });
//end of $(document).ready(function() { 
</script>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\judicial-service\resources\views/jo_grade/index.blade.php ENDPATH**/ ?>