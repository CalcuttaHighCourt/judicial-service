 
<?php $__env->startSection('content'); ?>
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
                    <?php echo $__env->make('ranks.rank_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
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
                                    <th>Formula</th> 
                                    <th>Officer Name || Code</th>
                                    <th>Date of Birth</th>
                                    <th>Joining Date</th>
                                    <th>Retirement</th>
                                    <th>From</th>
                                    <th>Remark</th>
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




<meta name="_token" content="<?php echo csrf_token(); ?>" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>

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

        var d = new Date();
        var month = d.getMonth()+1;
        var day = d.getDate();

        var current_date = (day<10 ? '0' : '') + day + '-' +
                        (month<10 ? '0' : '') + month + '-' + 
                        d.getFullYear() ;

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

                            //show all rank wise jo list using 'JoGradeController@get_final_jo_graded_list'
                            table = $("#jo_grade_table").DataTable({  
                                "processing": true,
                                "serverSide": true,
                                "bPaginate": false,                             
                                "ajax":{
                                        "url": "<?php echo e(route('show_jo_graded_list')); ?>",
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
                                        {"data": "grade"}, 
                                        {"data": "formula"},
                                        {"data": "jo_name"},
                                        {"data": "date_of_birth"},
                                        {"data": "date_of_joining"},
                                        {"data": "date_of_retirement"},
                                        {"data": "from_date"},
                                        {"data": "remark"}
                                ],             
                                "initComplete": function(settings, json) {
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
                                            title: 'Judicial Officer Gradation Report on  '+date_of_gradation + ', for the post of '+jo_grade_rank_name,
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
                                            title: 'Judicial Officer Gradation Report on  '+date_of_gradation + ', for the post of '+jo_grade_rank_name,
                                            messageTop: ' (Calcutta High Court)',                      
                                            messageBottom: 'Printed On '+current_date + '\t\t\t\t\t\t\t\t\t\t\t\t\t Signature',
                                            customize: function(doc) 
                                            {                                
                                                doc.content[0].margin = [ 30, 0, 0, 20 ] //left, top, right, bottom                                
                                                doc.content[1].margin = [ 120, 0, 0, 20 ] //left, top, right, bottom
                                                doc.content[2].margin = [ 120, 5, 0, 0 ] //left, top, right, bottom                                                               
                                                doc.content[3].margin = [ 120, 5, 0, 0 ] //left, top, right, bottom
                                                
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

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\judicial-service\resources\views/jo_grade/show_grade.blade.php ENDPATH**/ ?>