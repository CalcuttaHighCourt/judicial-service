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
                <div class="panel-title pull-left">List of Judicial Officers. . . </div>
            </div>

            <div class="panel-body box-body" style="overflow-x: auto;">
                <div class="table-responsive" >
                        <table class="table table-striped"  style="white-space: nowrap"  id="jo_grade_table" style="width: 100%;">
                            <!-- Table Headings -->
                            <thead>
                                <tr>                  
                                    <th style="color:green">Position</th>   
                                    <th style="color:black">Pre-Pos.</th>  
                                    <th>Formula</th> 
                                    <th>Officer Name || Code</th>
                                    <th>Date of Birth</th>
                                    <th>Joining Date</th>
                                    <th>Retirement</th>
                                    <th>From</th>
                                    <th>Remark</th>
                                    <th>Edit Pos.</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>        
                                    <th style="color:green">Position</th>   
                                    <th style="color:black">Pre-Pos.</th> 
                                    <th>Formula</th>           
                                    <th>Officer Name || Code</th>
                                    <th>Date of Birth</th>
                                    <th>Joining Date</th>
                                    <th>Retirement</th>
                                    <th>From</th>
                                    <th>Remark</th>
                                    <th>Edit Pos.</th>
                                </tr>
                            </tfoot>
                        </table>

                </div>
            </div>


        <div class="row" style="margin-left:-200px">

            <div class="col-xs-2">
            </div>
            <!--/col-3-->

            <div class="col-xs-2">
            <button class="btn btn-primary draft" id="draft" name="draft">Draft</button>
            </div>

            <div class="col-xs-2">
            <button class="btn btn-success finalized" id="finalized" name="finalized">Final</button>
            </div>
            <!--/col-3-->

            <div class="col-xs-1">
            <button class="btn btn-danger danger" id="close" name="close">Close</button>
            </div>
            <!--/col-3-->


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



         var table;
         


         
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

                            //show all rank wise jo list using 'JoGradeController@rank_wise_jo_list'
                            table = $("#jo_grade_table").DataTable({  
                                "processing": false,
                                "serverSide": false, 
                                "bPaginate": false, 
                                "ajax":{
                                        "url": "{{route('rank_wise_jo_list')}}",
                                        "dataType": "json",
                                        "type": "POST",
                                        "data":
                                            {  _token: $('meta[name="csrf-token"]').attr('content'),
                                                rank_id:jo_grade_rank_id,
                                                date_of_gradation:date_of_gradation
                                            }
                                },                                
                                "columns": 
                                [
                                        {"data": "grade", 
                                            "class":"reorder data"},    
                                        {"data": "inicial",
                                            "class":"inicial"},
                                        {"data": "formula",
                                            "class":"formula"},
                                        {"data": "jo_name",
                                            "class":"jo_name"},
                                        {"data": "date_of_birth",
                                            "class":"date_of_birth"},
                                        {"data": "date_of_joining",
                                            "class":"date_of_joining"},
                                        {"data": "date_of_retirement",
                                            "class":"date_of_retirement"},
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
                                        }
                                ]
                            }); 
                            


                            // ,

                            // "rowReorder": 
                            // {
                            //         dataSrc: 'grade',
                            //         snapX: true
                            // },                                            

                            // "select": true

                            //$(".rank_type").val(jo_grade_rank_name+" from");
                            $("#jo_grade_div").show();

                }//else of if(jo_grade_rank_id =="" ){

            });
            //Create list to arrange :end

            //grade color change on row drag using mouse:start
            // var position;
            // $('#jo_grade_table').on('row-reorder.dt', function(e, details, edit){

            //     console.log( details);

            //     // for(var i = 0; i < details.length; i++)
            //     // {
            //     //     console.log(
            //     //         'Node', details[i].node, 
            //     //         'moved from', details[i].oldPosition, 
            //     //         'to', details[i].newPosition
            //     //     );                    
            //     // }               

            //     if(details.length>0)
            //     {
            //         position=details[0].newPosition;
            //         console.log("position "+position);

            //         console.log("cell value "+table.cell(position,0).nodes().to$().text());
                    
            //         table.cell(position,0).nodes().to$().css('color','#F81C05');
            //         table.cell(position,0).nodes().to$().css('background','#2AFCB6');
            //         table.cell(position,0).nodes().to$().css('border-radius','100%');
            //         table.cell(position,0).nodes().to$().css('width','2px');
            //         table.cell(position,0).nodes().to$().css('height','2px');
            //         table.cell(position,0).nodes().to$().css('border', '2px solid #666');
            //         table.cell(position,0).nodes().to$().css('text-align', 'center');
            //     }

            // });
            //grade color change on row drag  using mouse :end


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

            var current_grade;
            
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

                var remark =element.closest("tr").find(".remark").text(); 
                var to_grade =element.closest("tr").find(".to_grade").text(); 

                //to get the row count
                var row_count = table.rows().count();

                // var info = table.page.info();
                // alert(info.recordsTotal );


                if(to_grade=="")
                {   
                    element.closest("tr").find(".to_grade").text("");   
                    return false;
                }                                 
                else if( isNaN (to_grade) )
                {
                    swal("Cannot Update grade!", "Grade must be in Number(s)", "error");        
                    element.closest("tr").find(".to_grade").text("");                                   
                    return false;
                } 
                else if( to_grade <= 0  ||  to_grade > row_count )
                {
                    swal("Cannot Update grade!", "Grade cannot be zero(0)", "error");        
                    element.closest("tr").find(".to_grade").text("");                                   
                    return false;
                } 
                else if(to_grade == current_grade)
                {            
                    swal("Cannot Update grade!", "Current Grade:"+current_grade+", Given Grade:"+to_grade, "error");             
                    element.closest("tr").find(".to_grade").text("");   
                    return false;
                }       
                else
                {

                    to_grade-=1;
                    current_grade-=1;

                    var rowMoveTo = table.row(tr).data();
                    
                    //down to up, eg.: to_grade= 2; current_grade=row 8 --> send to_grade= row 2
                    if(to_grade < current_grade)
                    {
                        for (var i = current_grade; i > to_grade; --i) 
                        {
                            var rowData = table.row(i - 1).data();
                            rowData['grade']++;
                        
                            table.row(i).data(rowData);
                        }
                    }
                    //up to down, eg.: to_grade= 8; current_grade=row 2 --> send to_grade= row 8
                    else
                    {                                
                        for (var i = current_grade ; i < to_grade ; ++i) 
                        {
                            var rowData = table.row(i + 1).data();                           
                            rowData['grade']--;
                        
                            table.row(i).data(rowData);
                        }
                    }                                      

                                    
                    rowMoveTo["to_grade"] = to_grade+1;
                    rowMoveTo["grade"] = to_grade+1;
                    rowMoveTo["remark"] = remark;
                    
                    //fit the row to the given position
                    table.row(to_grade).data(rowMoveTo);

                    table.draw(true);


                    // change color of the row who has ever changed
                    for (var i = 0; i < row_count; i++) 
                    {                                              
                        if(table.cell(i,9).nodes().to$().text() !="")
                        {
                            table.row(i).nodes().to$().css('color','#196FFC'); 
                            table.row(i).nodes().to$().css('background','#AAFADF');
                            table.row(i).nodes().to$().css('font-weight','bold');  

                            table.cell(i,0).nodes().to$().css('color','#196FFC');  
                            table.cell(i,0).nodes().to$().css('background','#F9FAAA');     
                            table.cell(i,1).nodes().to$().css('color','#F6836E');
                        }
                        else
                        {
                            table.row(i).nodes().to$().css('color','black'); 
                            table.row(i).nodes().to$().css('background','white');
                            table.row(i).nodes().to$().css('font-weight','normal');  

                            table.cell(i,0).nodes().to$().css('color','green');       
                            table.cell(i,0).nodes().to$().css('background','white');   
                            table.cell(i,1).nodes().to$().css('color','#C0BFBF');
                        }
                    }

                   // swal("Grade Updated", "From Grade:"+current_grade+", To Grade:"+to_grade, "success");  
                }

            });
            //Data Updation Code end


            $(document).on("click","#reset", function() {
                $("#jo_grade_table").DataTable().destroy();
                $("#jo_grade_div").hide();
                location.reload();
            });


            $(document).on("click","#close", function() {
                $("#jo_grade_table").DataTable().destroy();
                $("#jo_grade_div").hide();
                location.reload();
            });

            $(document).on("click","#draft", function() {

                //fecth all rows including remark
                var graded_jo_list = table.rows( { order: 'applied' } ).data().toArray();

                var jo_grade_rank_id= $("#jo_grade_rank_id option:selected").val();
                var date_of_gradation= $("#date_of_gradation").val();
                var status="Draft";

                    swal({
                    title: "Draft ready ?",
                    text: "This will draft the arranged grade list",
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
                                    graded_jo_list:graded_jo_list,
                                    rank_id:jo_grade_rank_id,
                                    date_of_gradation:date_of_gradation,
                                    status: status
                                },
                                success:function(response){
                                    swal("Arranged grade drafted Successfully","","success");
                                    $("#jo_grade_div").hide();
                                    location.reload();
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


                $(document).on("click","#finalized", function() {

                    //fecth all rows including remark
                    var graded_jo_list = table.rows( { order: 'applied' } ).data().toArray();

                    var jo_grade_rank_id= $("#jo_grade_rank_id option:selected").val();
                    var date_of_gradation= $("#date_of_gradation").val();
                    var status="Finalized";

                        swal({
                        title: "Grading Final?",
                        text: "This will finalized the arranged grade list",
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
                                        graded_jo_list:graded_jo_list,
                                        rank_id:jo_grade_rank_id,
                                        date_of_gradation:date_of_gradation,
                                        status: status
                                    },
                                    success:function(response){
                                        swal("Arranged grade set Successfully","","success");
                                        $("#jo_grade_div").hide();
                                        location.reload();
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



                 });// end of $(document).on("click","#finalized", function() {



   });
//end of $(document).ready(function() { 
</script>

@endsection
