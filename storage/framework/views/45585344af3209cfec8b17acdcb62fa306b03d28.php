 
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
    <div id="info-panel-heading" class="panel-heading"><h3 ><strong>Search Over Zone Wise Continuous Service Period For Zone of Consideration List</strong> </h3></div>
    <!-- IIIIIIIIIII -->
        <div class="panel-body">
        <br><br>

            <div class="form-group row">
                <div class="col-sm-2 col-sm-offset-2">
                    <div id="zone_name-group" class="form-group required">
                        <label class="control-label">
                                Zone 
                            </label>
                        <!-- IIIIIIIIIII -->
                        <select id="zone_name" class="form-control select2 info-form-control zone_name"
                            name="zone_name" style="width:100%;height:100%;"> 
                            <option value="">Select Zone</option>
                            <?php echo $__env->make('zones.zone_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </select>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div id="cadre-group" class="form-group required">                   
                        <label class="control-label">
                            Cadre 
                        </label>
                        
                    <!-- IIIIIIIIIII -->
                        <select  id="cadre" class="form-control select2 info-form-control cadre"
                            name="cadre" style="width:100%;height:100%;">
                            <option value="">Select Cadre</option>
                            <?php echo $__env->make('ranks.rank_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </select>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div id="date_upto-group" class="form-group required">                   
                        <label class="control-label">
                            Considering Date Upto 
                        </label>
                        <!-- IIIIIIIIIII -->
                        <input type="text" class="form-control date" style="color:black;"id="date_upto" placeholder="dd-mm-yyyy">
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-2 col-sm-offset-2">
                    <div id="year-group" class="form-group required">
                    <!-- IIIIIIIIIII -->
                        <label class="control-label">
                                Continuous Service Period in Year
                        </label>
                        <select  id="year" class="form-control select2 info-form-control year"
                            name="year" style="width:100%;height:100%;">
                            <option value="0">Select Year(s)</option>
                            <?php for($i=1;$i<=15;$i++): ?>
								<option value="<?php echo e($i); ?>"><?php echo e($i); ?></option>
							<?php endfor; ?>
                        </select>
                    </div>
                </div>
                
                <div class="col-sm-2">
                    <div id="month-group" class="form-group our-form-group required">
                        <label class="control-label">
                            Continuous Service Period in Month(s)
                        </label>
                    <!-- IIIIIIIIIII -->
                        <select  id="month" class="form-control select2 info-form-control month"
                            name="month"style="width:100%;height:100%;">
                            <option value="0">Select Month</option>
                            <?php for($j=0;$j<=12;$j++): ?>
								<option value="<?php echo e($j); ?>"><?php echo e($j); ?></option>
							<?php endfor; ?>
                        </select>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div id="day-group" class="form-group required">
                        <label class="control-label">
                            Continuous Service Period in Days
                        </label>
                    <!-- IIIIIIIIIII -->
                        <select  id="day" class="form-control select2 info-form-control day"
                            name="day"style="width:100%;height:100%;">
                            <option value="0">Select Day</option>
                            <?php for($j=0;$j<=30;$j++): ?>
								<option value="<?php echo e($j); ?>"><?php echo e($j); ?></option>
							<?php endfor; ?>
                        </select>
                    </div>
                </div>
                <div class=" col-sm-2" id="search_div">
                   <br/> <br/>
                    <button class="btn btn-success submit" name="search" id="search" style="width: 100px; height: 34px;">Search</button>
                </div>
            </div>
        </div>
    </div>
    
    <br>

    <div class="box box-default" id="cadre_wise_search_table" style="display:none;">
        <div class="box-header with-border">
            <h3 class="box-title"><h3><strong> Zone of Consideration for Judicial Officers </strong></h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
            </div>              
        </div>
        <div class="box-body">
            <div class="col-sm-3 form-group">
                <a id="download" target="_blank" rel="noopener noreferrer" href="#"
						class="btn btn-primary add-button info-form-button" role="button">
					    
                        <button type="button" class="btn btn-primary" id="download_report">DOWNLOAD REPORT</button>
                </a>
            </div>
            <table class="table1 table-striped table-bordered" id="show_cadrewise_zonewise_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>OFFICER'S NAME</th>                        
                        <th>POSTING HISTORY<br/>DURING THIS PERIOD</th>
                        <th>LAST CONTINUOUS POSTING<br/>IN THIS ZONE</th>
                        <th>DATE OF RETIREMENT</th>
                    </tr>
                </thead>    
                <tbody id="tbody">
                </tbody>                
            </table>
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

         $(".select2").select2(); 
    

        // Datepicker Initialization
        $(".date").datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,   
            orientation: "auto",
            endDate: '+0d',
        });
       
        
        $(document).on("click","#search",function(){

            var zone = $("#zone_name option:selected").val();
            var cadre = $("#cadre option:selected").val();
            var year = $("#year option:selected").val();
            var month = $("#month option:selected").val();
            var day = $("#day option:selected").val();
            var date_upto = $("#date_upto").val();

            //console.log(cadre);

           if(zone== "" || cadre==""||year== "" || month==""||day== "" || date_upto==""){
                swal("Error","Please Fillup All Mandatory Fields","error");
                return false;
           }
           else{
               
                $('.table1').DataTable().destroy();

                $.ajax({
                    url: "search_for_zone_of_consideration",
                    type: "post",
                    data : {
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        zone:zone,
                        cadre:cadre,
                        year:year,
                        month:month,
                        day:day,
                        date_upto:date_upto
                    },
                    success:function(response){
                        obj = $.parseJSON(response);
                        console.log(obj);
                        var str = "";

                        $.each(obj, function(key,val){
                            str+= "<tr>"+
                                        "<td>"+(++key)+"</td>"+
                                        "<td>"+val.officer_name+"<br/>\n("+val.jo_code+")</td>"+
                                        "<td>"+val.posting_history+"</td>"+
                                        "<td>"+val.continuous_service_period+"<br/>\nSINCE "+val.from_date+"</td>"+
                                        "<td>"+val.retirement_date+"</td>"+
                                   "</tr>";
                        })

                        $("#tbody").html(str);
                        $('.table1').DataTable();
                        $("#cadre_wise_search_table").show();

                    }
                })
           }
            
        });

        
        $(document).on("click","#download_report",function(){             
            var zone = $("#zone_name option:selected").val();
            var cadre = $("#cadre option:selected").val();
            var year = $("#year option:selected").val();
            var month = $("#month option:selected").val();
            var day = $("#day option:selected").val();
            var date_upto = $("#date_upto").val();

            var download_url= "<?php echo e(url('download_zone_of_consideration')); ?>/"+zone+"/"+cadre+"/"+year+"/"+month+"/"+day+"/"+date_upto;
            console.log(download_url);
            $("#download").attr("href", download_url);
            return true;
     
        });
        
    });

</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/appointments/zone_of_consideration.blade.php ENDPATH**/ ?>