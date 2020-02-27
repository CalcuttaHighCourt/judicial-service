 
<?php $__env->startSection('content'); ?>
<style>
   .select2-results__option{
   color:#d43c3c;
   }

  .select2-container--default .select2-selection--multiple .select2-selection__choice{
        background-color:#111;
        
    }
    .select2-container--default {
    background-color: #28415b;
}
</style>


<!-- Bootstrap Boilerplate... -->
<div id="info-panel" class="panel panel-default">
<!-- IIIIIIIIIII -->
<div id="info-panel-heading" class="panel-heading"><h2>Activate the Posting Preference Window for Judicial Officers </h2></div>
<!-- IIIIIIIIIII -->
<div class="panel-body">
<br><br>
<!-- New Task Form -->

<div class="form-group required row">
    <div class="form-group required row">
            <div class="col-sm-offset-2 col-sm-3">
                <div id="zone_name-group" class="form-group our-form-group">
                <!-- IIIIIIIIIII -->
                    <select class="form-control info-form-control select2" id="zone" >
                        <option value="">Select an Option</option>
                        <?php echo $__env->make('zones.zone_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                    </select>
                </div>
            </div>
            <div class="col-sm-offset-1 col-sm-3 form-group" id="zone_wise_period_wise_search">
                <input type="button" name="zone_wise_period_wise_search" id="zone_wise_period_wise_search" data-width="100px">
            </div>
        </div>
        <div class="form-group required row">
            <div class="col-sm-offset-2 col-sm-3">
                <div id="judicial_officer-group" class="form-group our-form-group">
                <!-- IIIIIIIIIII -->
                    <select  id="judicial_officer" class="form-control select2 info-form-control judicial_officer"
                    name="judicial_officer" multiple style="width:300px;"> 
                            <?php $__currentLoopData = $judicial_officers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>                        
                                <option value="<?php echo e($data->id); ?>"><?php echo e($data->officer_name); ?> |  <?php echo e($data->jo_code); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
            </div>
            <div class="col-sm-offset-1 col-sm-3 form-group" id="pref_window_flag">
                <input type="checkbox" name="pref_window_flag" id="display_flag" data-toggle="toggle" data-width="100px">
            </div>
        </div>
    </div>
</div>
    <div class="form-group required row">
        <div class="box box-default" id="show_jo_pref_data">
            <div class="box-header with-border">
                <h3 class="box-title"> The List Of Judicial Officer With Acive Preference Window</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            <div class="box-body">
                <table class="table table-striped table-bordered" id="show_jo_pref_details">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>OFFICER'S NAME</th>
                            <th>WINDOW OPENNING DATE</th>
                            <th>PREFEREENCE SUBMISSION STATUS</th>
                            <th>DISABLE WINDOW</th>
                            <tbody id="tbody"></tbody>
                        </tr>
                    </thead>                    
                </table>
            </div>
        </div>
    </div>


<!--loader starts-->
<div class="col-sm-offset-5 col-md-3" id="wait" style="display:none;">
   <img src='images/loader.gif'width="25%" height="10%" />
   <br>Loading..
</div>
<!--loader ends-->

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>


<meta name="_token" content="<?php echo csrf_token(); ?>" />

<!--  -->
<script>
   $(document).ready(function() {
    
        /*LOADER*/
    
        $(document).ajaxStart(function() {
            $("#wait").css("display", "block");
        });
        $(document).ajaxComplete(function() {
            $("#wait").css("display", "none");
        });
    
        /*LOADER*/
    
        /* select2 initialisation */
    
        $(".select2").select2({
            placeholder:"Select Judicial Officer"
        }); 
    
        $('#display_flag').bootstrapToggle({
            on: 'Activate',
            off: 'Deactivate',
            onstyle: 'success',
            offstyle: 'danger'
        }); // Toggle button initialization


        // Activating the preference window :: STARTS
        $(document).on("change","#display_flag",function(){

            if($(this).is(":checked")!=false){
                var judicial_officer=$("#judicial_officer").val();
            
                $.ajax({
                    type:"POST",
                    url:"activate_window_for_jo_preference",
                    data:{
                        _token: $('meta[name="csrf-token"]').attr('content'), 
                        judicial_officer:judicial_officer
                    },
                    success:function(response){
                        $("#judicial_officer").val('');
                        $("#judicial_officer").val('').trigger('change');
                        swal("Successfull","Window has been opened successfully for the selected judicial officers","success");
                        $('#display_flag').bootstrapToggle('off'); 
                        //table.ajax.reload();  
                    },
                    error:function (jqXHR, textStatus, errorThrown) {
                        if(jqXHR.status!=422 && jqXHR.status!=400){
                            swal("Server Error",errorThrown,"error");
                        }
                        else{								
                            swal("Invalid Input","","error");
                        }
                    } 
                });  

            }
            
        });
        // Activating the preference window :: ENDS

         var table = $("#show_jo_pref_details").DataTable({  
                        "processing": true,
                        "serverSide": true,
                        "ajax":{
                                "url": "datatable_for_active_window",
                                "dataType": "json",
                                "type": "POST",
                                "data":{ _token: $('meta[name="csrf-token"]').attr('content')}
                            },
                            "columns": [  
                                {"data": "sl_no"},              
                                {"data": "officer_name" },
                                {"data": "window_openning_date" },
                                {"data": "window_status" },
                                {"data": "action"}
                            ]
                        });
                     
                        $.fn.dataTable.ext.errMode = 'none';
 
                        $(".table").on( 'error.dt', function ( e, settings, techNote, message ) {
                            swal("An error has been reported by DataTable","","error");
                        }).DataTable();      

        $(document).on("click",".disable",function(){
            var data = table.row($(this).parents('tr')).data();
            //console.log(data.id);
            id=data.id;
            $.ajax({
                    url:"disable_window_for_jo_pref",
                    type:"POST",
                    data :{ 
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        id: id
                    },
                    success(response){
                        swal("Successfull","disabled successfully","success");
                    },
                    error(response){
                        swal("Error","disabled has not been done","error");
                    }
            })
            
        });  

            
    });

</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/appointments/preference_window_open.blade.php ENDPATH**/ ?>