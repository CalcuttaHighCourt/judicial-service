 
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

                <select class="form-control info-form-control select2" id="jo_grade_year" style="width:100%">
                    <option value="">Select Year</option>
                    <?php for($i=Date('Y');$i>=1900;$i--): ?>
                        <option value="<?php echo e($i); ?>"><?php echo e($i); ?></option>
                    <?php endfor; ?>
                </select>
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

    <div class="row" style="margin-left:-200px">
        <div class="col-xs-2">
         <!--left col-->
        </div>
        <!--/col-3-->

        <div class="col-xs-9">
         <!--left col-->

            <div id="jo_grade_div" class="form-group" style="display:none;">
            <div class="row">
                <div class="col-md-7 col-md-offset-1">
                    <table class="table table-bordered">
                        <tr>
                            <td>
                                <b>List of Judicial Officer(s):</b><br/>
                                <select multiple="multiple" id='list_box' name='list_box' style="width:100%; height:400px;border:none; background-color:white"">
                                </select>
                            </td>
                            
                            <td style='width:50px;text-align:center;vertical-align:middle;'>                            
                                <br/><button type='button' class="up_down" id='btnUp' value ='Up'><img src="<?php echo e(asset('images/sort_asc.png')); ?>" width="20" height="20" aria-hidden="true" alt="Up" ></button>
                                <br/>
                                <br/><button type='button' class="up_down" id='btnDown' value ='Down'><img src="<?php echo e(asset('images/sort_desc.png')); ?>" width="20" height="20" aria-hidden="true" alt="Down" ></button>
                                <br>
                                <br>
                                <button class="btn btn-success save" style="margin-top:200px" id="save" name="save">Save</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
        <!--/col-3-->

        
    </div>
    <!--/row-->


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

            //Create list to arrange :start
           $(document).on("click","#submit", function() {

                var jo_grade_rank_id= $("#jo_grade_rank_id option:selected").val();
                var jo_grade_year= $("#jo_grade_year option:selected").val();

                $("#list_box").find('option').remove(); 

                if(jo_grade_rank_id =="" ){
                    swal("Select Rank","Rank required","error");
                    return false;
                }
                else if(jo_grade_year=="" ){
                    swal("Select Year","Year required","error");
                    return false;
                }
                else{
                    $.ajax({
                        url:"<?php echo e(route('fetch_jo_details')); ?>",
                        type:"POST",
                        data:{
                            rank_id:jo_grade_rank_id,
                            year:jo_grade_year
                        },
                        success:function(response){
                            //console.log(response);

                            if(response.length>0){
                                $.each(response, function(index,value){
                                    $("#list_box").append('<option value="'+value.id+'" data-rank_id="'+value.rank_id+'" data-grade_year="'+jo_grade_year+'" >'+value.officer_name+'|'+value.jo_code+'</option>');
                                })
                                $("#jo_grade_div").show();
                            }
                            else
                            {
                                swal("No Judicial Found","No record found","error");
                            }
                        }//end of success
                    })
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
                var grade_year = new Array();


                $("#list_box option").each(function(index,value){
                    judicial_officer_id.push($(this).val());
                    rank_id.push($(this).data("rank_id"));
                    grade_year.push($(this).data("grade_year"));
                    // data-grade="'+value.grade+'"

                });

                if(judicial_officer_id.length==0){
                    swal("Invalid Input","Grade list can not be empty","error");
                    return false;
                }
                else{
                    //alert(judicial_officer_id);
                    

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
                                    grade_year:grade_year
                                },
                                success:function(response){
                                    swal("Arranged grade set Successfully","","success");
                                    $("#jo_grade_div").hide();
                                },
                                error:function(response) {  
                                    if(response.responseJSON.errors.hasOwnProperty('judicial_officer_id'))
                                        swal("Cannot add Judicial Officer Grade", ""+response.responseJSON.errors.judicial_officer_id[0], "error");

                                    if(response.responseJSON.errors.hasOwnProperty('rank_id'))
                                        swal("Cannot add Rank in Judicial Officer Grade", ""+response.responseJSON.errors.rank_id[0], "error");
                                    
                                    if(response.responseJSON.errors.hasOwnProperty('grade_year'))
                                        swal("Cannot add Year in Judicial Officer Grade", ""+response.responseJSON.errors.grade_year[0], "error");
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