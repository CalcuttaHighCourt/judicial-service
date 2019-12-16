@extends('layouts.app') 
@section('content')
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
                    @include('ranks.rank_options')
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
                                <br/><button type='button' class="up_down" id='btnUp' value ='Up'><img src="{{asset('images/sort_asc.png')}}" width="20" height="20" aria-hidden="true" alt="Up" ></button>
                                <br/>
                                <br/><button type='button' class="up_down" id='btnDown' value ='Down'><img src="{{asset('images/sort_desc.png')}}" width="20" height="20" aria-hidden="true" alt="Down" ></button>
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




<meta name="_token" content="{!! csrf_token() !!}" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="{{asset('js/jquery/jquery.min.js')}}"></script>

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
                    $.ajax({
                        url:"{{route('fetch_jo_details')}}",
                        type:"POST",
                        data:{
                            rank_id:jo_grade_rank_id,
                            date_of_gradation:date_of_gradation
                        },
                        success:function(response){
                            console.log(response);

                            if(response.length>0){
                                $.each(response, function(index,value){
                                    $("#list_box").append('<option value="'+value.id+'" data-rank_id="'+value.rank_id+'" data-date_of_gradation="'+date_of_gradation+'" >'+value.officer_name+'|'+value.jo_code+'</option>');
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
                                url:"{{route('save_jo_grade')}}",
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

@endsection
