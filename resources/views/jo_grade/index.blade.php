@extends('layouts.app') 

@section('content')
<!-- Main content -->

<link rel="stylesheet" href="{{asset('css/rowReordering_css/rowReorder.dataTables.min.css')}}">
<!-- <link rel="stylesheet" href="{{asset('css/rowReordering_css/editor.dataTables.min.css')}}">
<link rel="stylesheet" href="{{asset('css/rowReordering_css/jquery.dataTables.min.css')}}"> -->
<link rel="stylesheet" href="{{asset('css/rowReordering_css/select.dataTables.min.css')}}">

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
                <div class="panel-title pull-left" id="list_header" name="list_header">List of Judicial Officers. . . </div>
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


        <div class="row">

            <div class="col-xs-4">
            </div>
            <!--/col-3-->

            <div class="col-xs-2">
            <button class="btn btn-primary draft" id="draft" name="draft">Draft List</button>
            </div>

            <div class="col-xs-2">
            <button class="btn btn-success finalized" id="finalized" name="finalized">Final List</button>
            </div>
            <!--/col-3-->



        </div>

        <div class="row" style="padding-top:20px">
            <div class="col-xs-2">
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


        var status;

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
                            if(response['status'] == "Finalized")
                            {
                                swal("Grade List already Finalized", "of "+date_of_gradation, "error");    
                                $("#jo_grade_rank_id").attr("disabled", "disabled");  
                                $("#date_of_gradation").attr("disabled", "disabled");
                                $(".submit").hide();
                                $("#jo_grade_div").hide();    
                                return false;
                            }
                            else if(response['status'] == "Draft")
                            {                                
                                status= response['status'];
                                $("#list_header").html($("#list_header").html() +'('+response['status']+')');
                                swal("View/ Modify Drafted List", "of "+date_of_gradation , "");   
                            }
                            else
                            {
                                status= response['status'];
                                $("#list_header").html($("#list_header").html() +'(New)');
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
                        if(response['status'] == "Finalized")
                        {
                            swal("Grade List already Finalized", "of "+date_of_gradation, "error");    
                            $("#jo_grade_rank_id").attr("disabled", "disabled");  
                            $("#date_of_gradation").attr("disabled", "disabled");
                            $(".submit").hide();
                            $("#jo_grade_div").hide();    
                            return false;
                        
                        }
                        else if(response['status'] == "Draft")
                        {
                            status= response['status'];
                            $("#list_header").html($("#list_header").html() +'('+response['status']+')');
                            swal("View/ Modify Drafted List", "of "+date_of_gradation , "");   
                        }
                        else
                        {
                            status= response['status'];
                            $("#list_header").html($("#list_header").html() +'(New)');
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

                            //show all rank wise jo list using 'JoGradeController@rank_wise_jo_list'
                            table = $("#jo_grade_table").DataTable({  
                                "processing": false,
                                "serverSide": false, 
                                "bPaginate": false, 
                                "stateSave": true,
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
                                ],                               
                                "initComplete": function(settings, json) {
                                    if(json.recordsTotal ==-1)
                                    {
                                        swal("Grade List already Finalized", "of "+date_of_gradation, "error");   
                                        $("#jo_grade_div").hide();    
                                        return false;
                                    }

                                }


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

                            $("#jo_grade_rank_id").attr("disabled", "disabled");  
                            $("#date_of_gradation").attr("disabled", "disabled");
                            $(".submit").hide();
                              

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
                current_to_grade = $(this).closest("tr").find(".to_grade").text();
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


                if(to_grade=="" && current_to_grade =="")
                {   
                    element.closest("tr").find(".to_grade").text(current_to_grade);   
                    return false;
                }     
                else if(to_grade=="" && current_to_grade !="") // to avoid removing edit position, without any reason
                {   
                    swal("Cannot remove Edit Position!", "Must contain Given Grade", "error");  
                    element.closest("tr").find(".to_grade").text(current_to_grade);   
                    return false;
                }                              
                else if( isNaN (to_grade) )
                {
                    swal("Cannot Update grade!", "Grade must be in Number(s)", "error");        
                    element.closest("tr").find(".to_grade").text(current_to_grade);                                   
                    return false;
                } 
                else if( to_grade <= 0)
                {
                    swal("Cannot Update grade!", "Grade must be greater than zero(0)", "error");        
                    element.closest("tr").find(".to_grade").text(current_to_grade);                                   
                    return false;
                } 
                else if( to_grade > row_count )
                {
                    swal("Cannot Update grade!", "Grade doesn't exist", "error");        
                    element.closest("tr").find(".to_grade").text(current_to_grade);                                   
                    return false;
                } 
                else if(to_grade == current_grade)
                {            
                    swal("Cannot Update grade!", "Current Grade:"+current_grade+", Given Grade:"+to_grade, "error");             
                    element.closest("tr").find(".to_grade").text(current_to_grade);   
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
                    rowMoveTo["inicial"] = current_grade+1;
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


//delete datatable row
// $('#id tbody').on('click', function(){
//     table
//         .row($(this).parents('tr'))
//         .remove()
//         .draw();
// });

            $(document).on("click","#reset", function() {
                $("#jo_grade_table").DataTable().destroy();
                $("#jo_grade_div").hide();
                location.reload();
            });



            $(document).on("click","#draft", function() {

                save_status_as="Draft";
                save_ordered_list(save_status_as);                   

            });// end of $(document).on("click","#save", function() {


            $(document).on("click","#finalized", function() {

                save_status_as="Finalized";
                save_ordered_list(save_status_as);
                
            });// end of $(document).on("click","#finalized", function() {


            //*** Importent :counter to point to the row while accessing all_datatable_data[count]['judicial_officer_id']
            var count=0;

            function save_ordered_list(save_status_as)
            {
                var row_count = table.rows().count();
                var date_of_gradation= $("#date_of_gradation").val();
                var jo_grade_rank_id= $("#jo_grade_rank_id option:selected").val();

                //fetch all rows in datatable (**but without 'remark')
                var all_datatable_data= table.rows().data().toArray();
                console.log(all_datatable_data[count]['judicial_officer_id']);

                var graded_jo_list = [];
                //headers need to send
                var headers = ['judicial_officer_id','grade','remark'];
                
                //to fetch all headers present in table
                // $('#jo_grade_table th').each(function(index, item) {
                //     headers[index] = $(item).html();
                // });
                
                //create arrey to send via ajax including judicial_officer_id, grade, remark
                $('#jo_grade_table tr').has('td').each(function() {
                    var temp_row = {}; // to temporay create a single row
                    
                    //iterate to the selected td fetch currently added/edited grade & remark  
                    $('td', $(this)).each(function(index, item) {

                        if(index == 0 && $(item).html() == all_datatable_data[count]['grade'] ) //0th position is grade
                        {   //add judicial_officer_id
                            temp_row[headers[0]]=all_datatable_data[count]['judicial_officer_id'];

                            //add grade/position
                            temp_row[headers[1]]=$(item).html();      

                            count++;                                       
                        }                            
                        else if(index == 8 && $(item).html() == all_datatable_data[count]['remark']  ) //starting from 0, 8th column is ramrk 
                        {   //add remark
                            temp_row[headers[2]] = $(item).html();
                        }
                            
                    });

                    //push the created row in the arrey
                    graded_jo_list.push(temp_row);

                });

                //*** Importent: re-initialize  counter to point to the first row again
                count=0;
               

                var message_title, message_text, result;

                if(save_status_as == "Draft")
                {
                    message_title= "Draft ready ?";
                    message_text= "This will draft the arranged grade list";
                    result= "Arranged grade drafted Successfully";
                }
                else if(save_status_as == "Finalized" )
                {
                    message_title= "Grading Final ?";
                    message_text= "This will finalized the arranged grade list";
                    result= "Arranged grade Finalized Successfully";
                }


                swal({
                    title: message_title,
                    text: message_text,
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
                                    status: save_status_as
                                },
                                success:function(response){
                                    swal(result,"of "+date_of_gradation,"success");
                                    $("#jo_grade_div").hide();
                                    //location.reload();
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

            }//end of function save_ordered_list(graded_jo_list, jo_grade_rank_id, date_of_gradation, status)

   });
//end of $(document).ready(function() { 
</script>

@endsection

