@extends('layouts.app') 
@section('content')
<!-- Main content -->

<style>
.reorder {
  color: green;
}
.change_color{
    color: red;
}
</style>

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
                                <th style="color:green">Grade</th>   
                                <th>Pre Grade</th>  
                                <th style="display:none">JO ID</th> 
                                <th>JO Name</th>
                                <th>JO Code</th>
                                <th>Joining Date</th>
                                <th>From Date</th>
                                <th>Remark</th>
                                <th>Edit Position</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>        
                                <th style="color:green">Grade</th>   
                                <th>Pre Grade</th>  
                                <th style="display:none">JO ID</th>           
                                <th>JO Name</th>
                                <th>JO Code</th>
                                <th>Joining Date</th>
                                <th>From Date</th>
                                <th>Remark</th>
                                <th>Edit Position</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>

        
    </div>
    <!--/<div class="jo_grade_div">-->


    <br><br>


<br>

<button class="btn btn-success save" id="save" name="save">Save</button>

</div>




<meta name="_token" content="{!! csrf_token() !!}" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="{{asset('js/jquery/jquery.min.js')}}"></script>

<script>
    var editor; // use a global for the submit and return data rendering in the examples

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
                            table = $("#jo_grade_table").DataTable({  
                                "processing": false,
                                "serverSide": false, 
                                "bPaginate": false, 
                                "ajax":{
                                        "url": "{{route('fetch_jo_details')}}",
                                        "dataType": "json",
                                        "type": "POST",
                                        "data":{  _token: $('meta[name="csrf-token"]').attr('content'),
                                                    rank_id:jo_grade_rank_id,
                                                    date_of_gradation:date_of_gradation
                                             }
                                },                                
                                "columns": [
                                            {"data": "grade", 
                                             "class":"reorder data"},    
                                            {"data": "inicial",
                                             "class":"inicial"},               
                                            {"data": "judicial_officer_id",
                                             "class":"judicial_officer_id"},
                                            {"data": "jo_name",
                                             "class":"jo_name"},
                                            {"data": "jo_code",
                                             "class":"jo_code"},
                                            {"data": "date_of_joining",
                                             "class":"date_of_joining"},
                                            {"data": "from_date",
                                             "class":"from_date"},
                                            {"data": "remark",
                                             "class":"remark"},
                                            {"data": "to_grade", 
                                             "class":"to_grade"}
                                ],
                                "columnDefs": 
                                            [
                                                
                                                {
                                                    searchable: false,
                                                    orderable: false,
                                                    targets: 0,
                                                },
                                                {
                                                    searchable: false,
                                                    orderable: false,
                                                    targets: 1,
                                                },                                        
                                            ],

                                "rowReorder": 
                                            {
                                               dataSrc: 'grade'
                                            },                                            

                                "select": true

                            }); 
                            
                            table.column(2).visible( false ); // Hidden JO ID column



                            $("#jo_grade_div").show();

                }//else of if(jo_grade_rank_id =="" ){

            });
            //Create list to arrange :end



            //Double Click To Enable Content editable start
            $(document).on("click",".remark", function(){        
                        $(this).attr('contenteditable',true);
            });
            //Double Click To Enable Content editable end


            //Double Click To Enable Content editable start
            $(document).on("click",".to_grade", function(){        
                        $(this).attr('contenteditable',true);
            });
            //Double Click To Enable Content editable end
            
             //block using other characters except 0 to 9, required to give grade: start
             $(this).on('keydown', '.to_grade', function(e) 
            {            

                if(!((e.keyCode > 95 && e.keyCode < 106) || (e.keyCode > 47 && e.keyCode < 58) || e.keyCode == 8))             
                {
                    return false;
                }

            });
            //block using other characters except 0 to 9, required to give grade: end

            //To prevent updation when no changes to the data is made*/
            $(document).on("focusin",".to_grade", function(){
                current_grade = $(this).closest("tr").find(".reorder").text();
            })


            //Data Updation Code Starts
            $(document).on("focusout",".to_grade", function()
            {
                var element = $(this);        
                var tr = element.closest('tr');
                var row = table.row(tr);
                var row_data = table.row(tr).data();

                var judicial_officer_id = row_data['judicial_officer_id'];  

                var to_grade =element.closest("tr").find(".to_grade").text(); 

                if(to_grade == current_grade)
                {                  
                    element.closest("tr").find(".to_grade").text("");   
                    return false;
                }
                        
                if( isNaN (to_grade) )
                {
                    swal("Cannot Update grade!", "Grade must be in Number(s)", "error");        
                    element.closest("tr").find(".to_grade").text("");                                   
                    return false;
                } 
                else
                {
                    var data=Arrey();
                    data= $('#jo_grade_table').DataTable().rows( { order: 'applied' } ).data().toArray()
                    element.closest("tr").find(".to_grade").text(to_grade);   
                }

            }
            //Data Updation Code end

            $(document).on("click","#reset", function() {
                $("#jo_grade_div").hide();
                location.reload();
            });


            $(document).on("click","#save", function() {

                var data = table
                            .rows()
                            .data();


                console.log( $('#jo_grade_table').DataTable().rows( { order: 'applied' } ).data().toArray()  ); 
                return false;
                   

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





            });// end of $(document).on("click","#save", function() {



   });
//end of $(document).ready(function() { 
</script>

@endsection
