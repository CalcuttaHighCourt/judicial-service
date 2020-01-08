@extends('layouts.app') 
@section('content')
<!-- Main content -->

<style>
.reorder {
  color: green;
}
.inicial{
    color: #C0BFBF;
}
.change_color{
    color: red;
}
.change_grade{

    color:#F81C05;
    background:#2AFCB6;
    border-radius:100%;             
    width:2px;
    height:2px;
    text-align:left;
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
                    Date 
                </label>
                <input type="text" class="form-control date" name="date_of_gradation" id="date_of_gradation" placeholder="dd-mm-yyyy">
            </div>

            <div class="col-xs-1">
                <label>   &nbsp;  </label>
                <br>
                <button class="btn btn-success submit" id="submit" name="submit">Submit</button>
            </div>

            <div class="col-xs-1">
                <label>   &nbsp;   </label>
                <br>
                <button class="btn btn-primary primary" id="reset" name="reset">Reset</button>
            </div>
        </div>

    </div>
    <!--/row-->

    <br>

    </div>
    <!--<div id="info-panel" class="panel panel-default">-->

    <br><br><br>

    <div class="jo_grade_div" id="jo_grade_div" name="jo_grade_div" style="display:none;" >
            <div id="info-panel2" class="panel panel-default">    
            <div id="datatable-panel-heading" class="panel-heading clearfix">       
                <div class="panel-title pull-left" id="list_header" name="list_header">Gradation List of Judicial Officers. . . </div>
            </div>

            <div class="panel-body box-body" style="overflow-x: auto;">
                <div class="table-responsive" >
                        <table class="table table-striped"  style="white-space: nowrap"  id="jo_grade_table" style="width: 100%;">
                            <!-- Table Headings -->
                            <thead>
                                <tr>                  
                                    <th style="color:green">Position</th>   
                                    <th>Formula</th> 
                                    <th>Officer Name || Code</th>
                                    <th>Date of Birth</th>
                                    <th>Joining Date</th>
                                    <th>Retirement</th>
                                    <th>From</th>
                                    <th>Remark</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>        
                                    <th style="color:green">Position</th>   
                                    <th>Formula</th> 
                                    <th>Officer Name || Code</th>
                                    <th>Date of Birth</th>
                                    <th>Joining Date</th>
                                    <th>Retirement</th>
                                    <th>From</th>
                                    <th>Remark</th>
                                    <th>Status</th>
                                </tr>
                            </tfoot>
                        </table>

                </div>
            </div>
       
    </div>
    <!--/<div class="jo_grade_div">-->


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

        // var d = new Date();
        // var month = d.getMonth()+1;
        // var day = d.getDate();

        // var current_date = (day<10 ? '0' : '') + day + '-' +
        //                 (month<10 ? '0' : '') + month + '-' + 
        //                 d.getFullYear() ;

        var current_date;
        var report_status;

        var table;
               

        //Fetch status and current date from server on the given date and rank: start
         $(this).one('change', '#date_of_gradation', function(e) {

                var jo_grade_rank_id= $("#jo_grade_rank_id option:selected").val();
                var date_of_gradation= $("#date_of_gradation").val();
                
                if(jo_grade_rank_id != "" && date_of_gradation !="")
                {
                    //access status using JOGradeController@jo_list_info 
                    $.ajax({
                            "url":  "{{route('jo_list_info')}}",
                            "type": "POST",                        
                            "data":{ _token: $('meta[name="csrf-token"]').attr('content'),
                                        rank_id:jo_grade_rank_id,
                                        date_of_gradation:date_of_gradation
                                    },                         
                            success:function(response){
                                if(response['status'] == "")
                                {
                                    swal("No grade list available", "of "+date_of_gradation, "error");   
                                    $("#jo_grade_rank_id").attr("disabled", "disabled");  
                                    $("#date_of_gradation").attr("disabled", "disabled");
                                    $(".submit").hide();
                                    $("#jo_grade_div").hide();    
                                    return false;
                                }
                                else
                                {
                                    current_date= response['current_date'];
                                    report_status= response['status'];
                                    $("#list_header").html($("#list_header").html() +"("+response['status']+")");
                                }
                            }

                        }); //end of ajax

                } //end of  if(jo_grade_rank_id != "" && date_of_gradation !="")                

            }); //end of  $(this).on('change', '#date_of_gradation', function(e) {


            $(this).one('change', '#jo_grade_rank_id', function(e) {

                var jo_grade_rank_id= $("#jo_grade_rank_id option:selected").val();
                var date_of_gradation= $("#date_of_gradation").val();

                if(jo_grade_rank_id != "" && date_of_gradation !="")
                {
                    //access status using JOGradeController@jo_list_info 
                    $.ajax({
                            "url":  "{{route('jo_list_info')}}",
                            "type": "POST",                        
                            "data":{ _token: $('meta[name="csrf-token"]').attr('content'),
                                        rank_id:jo_grade_rank_id,
                                        date_of_gradation:date_of_gradation
                                    },                         
                            success:function(response){
                                if(response['status'] == "")
                                {
                                    swal("No grade list available", "of "+date_of_gradation, "error");   
                                    $("#jo_grade_rank_id").attr("disabled", "disabled");  
                                    $("#date_of_gradation").attr("disabled", "disabled");
                                    $(".submit").hide();
                                    $("#jo_grade_div").hide();    
                                    return false;
                                }
                                else
                                {
                                    current_date= response['current_date'];
                                    report_status= response['status'];
                                    $("#list_header").html($("#list_header").html() +'('+response['status']+')');
                                }
                            }

                        }); //end of ajax

                } //end of  if(jo_grade_rank_id != "" && date_of_gradation !="")                

            }); //end of  $(this).on('change', '#date_of_gradation', function(e) {
        //Fetch status and current date from server on the given date and rank: end


            //Create list to arrange :start
           $(document).on("click","#submit", function() {

                var jo_grade_rank_id= $("#jo_grade_rank_id option:selected").val();
                var jo_grade_rank_name= $("#jo_grade_rank_id option:selected").html();

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

                        //show all rank wise jo list using 'JoGradeController@get_final_jo_graded_list'
                        table = $("#jo_grade_table").DataTable({  
                            "processing": true,
                            "serverSide": true,
                            "bPaginate": false,                             
                            "ajax":{
                                    "url": "{{route('show_jo_graded_list')}}",
                                    "dataType": "json",
                                    "type": "POST",
                                    "data":
                                        {  _token: $('meta[name="csrf-token"]').attr('content'),
                                            rank_id:jo_grade_rank_id,
                                            date_of_gradation:date_of_gradation
                                        },
                                    // "complete": function(response) 
                                    // {
                                    //   //  report_status=response.responseJSON.status;
                                    //     // insert_in_status(response.responseJSON.status);
                                        
                                    // }

                            },              
                                                
                            "columns": 
                            [
                                    {"data": "grade"}, 
                                    {"data": "formula"},
                                    {"data": "jo_name"},
                                    {"data": "date_of_birth"},
                                    {"data": "date_of_joining"},
                                    {"data": "date_of_retirement"},
                                    {"data": "from_date"},
                                    {"data": "remark"},
                                    {"data": "status", class:"status"}
                            ],

                            "initComplete": function(settings, json) {
                                // console.log(table.cell(0,8).data());
                                if(json.recordsTotal == 0)
                                {
                                    swal("No grade list available", "on the given date", "error");   
                                    $("#jo_grade_div").hide();    
                                    return false;
                                }

                            },

                            dom: 'Bfrtip',
                            
                            buttons:
                            [
                                
                                    {
                                        extend: 'colvis',
                                        collectionLayout: 'fixed four-column'
                                    },              
                                    {
                                        extend: 'excelHtml5',
                                        exportOptions:
                                        {
                                            columns: ':visible',
                                            stripNewlines: false
                                        },              
                                        title: 'J.O. Gradation List ('+report_status+') for '+jo_grade_rank_name +' on  '+date_of_gradation,
                                        messageTop: ' (Calcutta High Court)',
                                        messageBottom: 'Printed On '+current_date
                                    },
                                    {
                                        extend: 'pdfHtml5',
                                        orientation: 'potrait',
                                        pageSize: 'A4',
                                        exportOptions:
                                        {
                                            columns: ':visible', 
                                            stripNewlines: false
                                        },
                                        title: 'J.O. Gradation List ('+report_status+') for '+jo_grade_rank_name +' on  '+date_of_gradation,
                                        messageTop: ' (Calcutta High Court)',                      
                                        messageBottom: 'Printed On '+current_date + '\t\t\t\t\t\t\t\t\t\t\t\t\t Signature',
                                        customize: function(doc) 
                                        {                
                                            doc.defaultStyle.fontSize = 8; //<-- set datafontsize to 8 instead of default
                                            doc.styles.tableHeader.fontSize = 8; //set header fontsoze
                                            doc.defaultStyle.alignment = 'left';   
                                            doc.styles.tableHeader.alignment = 'left';      
                                            doc.content[0].margin = [ 20, 0, 0, 10 ] //left, top, right, bottom                                
                                            doc.content[1].margin = [ 220, 0, 0, 10 ] //left, top, right, bottom
                                            doc.content[2].margin = [ 10, 5, 0, 0 ] //left, top, right, bottom                                                               
                                            doc.content[3].margin = [ 10, 20, 0, 0 ] //left, top, right, bottom
                                            
                                        }
                                    }
                            ]

                        }); 


                        $("#jo_grade_div").show();
                        $("#jo_grade_rank_id").attr("disabled", "disabled");  
                        $("#date_of_gradation").attr("disabled", "disabled");
                        $(".submit").hide();

                }//else of if(jo_grade_rank_id =="" ){

            });
            //Create list to arrange :end


            $(document).on("click","#reset", function() {
                $("#jo_grade_table").DataTable().destroy();
                $("#jo_grade_div").hide();
                location.reload();
            });




   });
//end of $(document).ready(function() { 
</script>

@endsection
