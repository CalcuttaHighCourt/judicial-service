@extends('layouts.app') 
@section('content')
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
    <div id="info-panel-heading" class="panel-heading"><h2><strong>Zone & Period Wise Search</strong> </h2></div>
    <!-- IIIIIIIIIII -->
        <div class="panel-body">
        <br><br>
        <!-- New Task Form -->

            <div class="form-group row">
                <div class="col-sm-2">
                    <div id="zone_name-group" class="form-group required">
                        <label class="control-label">
                                Zone 
                            </label>
                        <!-- IIIIIIIIIII -->
                        <select id="zone_name" class="form-control select2 info-form-control zone_name"
                            name="zone_name" style="width:100%;height:100%;"> 
                            <option value="">Select Zone</option>
                            @include('zones.zone_options')
                        </select>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div id="cadre-group" class="form-group ">                   
                        <label class="control-label">
                            Cadre 
                        </label>
                        
                    <!-- IIIIIIIIIII -->
                        <select  id="cadre" class="form-control select2 info-form-control cadre"
                            name="cadre" style="width:100%;height:100%;">
                            <option value="">Select Cadre</option>
                            @include('ranks.rank_options')
                        </select>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div id="terminal_date-group" class="form-group ">                   
                        <label class="control-label">
                            Terminal Date
                        </label>
                        <!-- IIIIIIIIIII -->
                        <input type="text" class="form-control date" id="terminal_date" placeholder="dd-mm-yyyy">
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-2">
                    <div id="year-group" class="form-group">
                    <!-- IIIIIIIIIII -->
                         <label class="control-label">
                                Year 
                        </label>
                        <select  id="year" class="form-control select2 info-form-control year"
                            name="year" style="width:100%;height:100%;">
                            <option value="0">Select Year</option>
                            @for($i=1;$i<=15;$i++)
								<option value="{{$i}}">{{$i}}</option>
							@endfor
                        </select>
                    </div>
                </div>
                
                <div class="col-sm-2">
                    <div id="month-group" class="form-group our-form-group">
                        <label class="control-label">
                                Month 
                        </label>
                    <!-- IIIIIIIIIII -->
                        <select  id="month" class="form-control select2 info-form-control month"
                            name="month"style="width:100%;height:100%;">
                            <option value="0">Select Month</option>
                            @for($j=0;$j<=12;$j++)
								<option value="{{$j}}">{{$j}}</option>
							@endfor
                        </select>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div id="day-group" class="form-group">
                        <label class="control-label">
                             Day
                        </label>
                    <!-- IIIIIIIIIII -->
                        <select  id="day" class="form-control select2 info-form-control day"
                            name="day"style="width:100%;height:100%;">
                            <option value="0">Select Day</option>
                            @for($j=0;$j<=30;$j++)
								<option value="{{$j}}">{{$j}}</option>
							@endfor
                        </select>
                    </div>
                </div>
                <div class=" col-sm-2" id="search_div">
                   <br>
                    <button class="btn btn-success submit" name="search" id="search" style="width: 100px; height: 34px;">Search</button>
                </div>
            </div>
            <div class="imp_notes">
                <span style="color:red;">*</span>Please give a time period by selecting atleast any one from year/month/day
            </div>
            <br>
            <div class="box box-default" id="cadre_wise_search_table" style="display:none;">
            <div class="box-header with-border">
                <h3 class="box-title"><h2><strong> List of Zone Wise Period Wise Judicial Officer List </strong></h2>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
                <hr>
                <div class="form-group row">
                    <div class="col-sm-offset-3 col-sm-3">
                        <label class="control-label">
                            <h4><strong><i class="fa fa-check-square-o" style="font-size:16px;color:green"></i>Enable The Window for all</strong></h4> 
                        </label>
                    </div>
                    <div class="col-sm-3 form-group" id="enable_window_flag">
                        <button class="btn btn-success enable_window_flag" name="enable_window_flag" id="enable_window_flag" style="width: 100px; height: 34px;">ON</button>
                    </div>
                </div>
            </div>
            <div class="box-body">
                <table class="table1 table-striped table-bordered" id="show_cadrewise_zonewise_table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>OFFICER'S NAME/JO CODE</th>
                            <th>CURRENT POSTING</th>
                            <th>TENURE</th>
                            <th>ENABLE WINDOW</th>
                        </tr>
                    </thead>                    
                </table>
            </div>
        </div>
    </div>
</div>
 <div class="box box-default">
 
    <div id="info-panel-opening-window-heading" class="panel-heading"><h2><strong>Activate the Posting Preference Window for Judicial Officers</strong> </h2></div>
    <!-- IIIIIIIIIII -->
        <div class="panel-body-opening-window">
            <br><br>
            <!-- New Task Form -->
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-3">
                    <div id="judicial_officer-group" class="form-group required">
                        <label class="control-label">
                               Judicial Officer 
                        </label>
                        <!-- IIIIIIIIIII -->
                        <select  id="judicial_officer" class="form-control select2_multi info-form-control judicial_officer"
                        name="judicial_officer" multiple style="width:300px;"> 
                            @foreach($judicial_officers  as $data)                        
                                <option value="{{$data->id}}">{{$data->officer_name}} |  {{$data->jo_code}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-offset-1 col-sm-3 form-group" id="pref_window_flag">
                   <br>
                    <input type="checkbox" name="pref_window_flag" id="display_flag" data-toggle="toggle" data-width="100px">
                </div>
            </div>
        </div>
                        <!-- New Task Form -->
        
        <div class="box box-default" id="jo_details_with_active_window">
            <div class="box-header with-border">
                <h3 class="box-title"><h2><strong> The List Of Judicial Officer With Active Preference Window</strong></h2>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
                <hr>
                <div class="form-group row">
                    <div class="col-sm-offset-3 col-sm-3">
                        <label class="control-label">
                            <h4><strong><i class="fa fa-ban" style="font-size:16px;color:red;"></i>Disable The Window for all</strong></h4> 
                        </label>
                    </div>
                    <div class="col-sm-3 form-group" id="disable_window_flag">
                        <button class="btn btn-danger diasble_display_flag" name="diasble_display_flag" id="diasble_display_flag" style="width: 100px; height: 34px;">OFF</button>
                    </div>
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

<script src="{{asset('js/jquery/jquery.min.js')}}"></script>


<meta name="_token" content="{!! csrf_token() !!}" />

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
    
    
        $(".select2_multi").select2({
            placeholder:"Select Judicial Officer"
        }); 


        // Datepicker Initialization
        $(".date").datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,   
            orientation: "auto",
            endDate: '+0d',
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
                        table.ajax.reload();  
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
                     
        // $.fn.DataTable.ext.errMode = 'none';

        // $(".table").on( 'error.dt', function ( e, settings, techNote, message ) {
        //     swal("An error has been reported by DataTable","","error");
        // }).DataTable();      

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
                        table.ajax.reload(); 
                    },
                    error(response){
                        swal("Error","disabled has not been done","error");
                    }
            })
            
        });

         
        //disable window for all jo
        $(document).on("click","#diasble_display_flag",function(){
            $.ajax({
                url:"disable_pref_window_for_all_active_jo",
                type:"POST",
                data :{ 
                    _token: $('meta[name="csrf-token"]').attr('content'),
                },
                success(response){
                    swal("Successfull","All judicial officers having active preference window are disabled successfully","success");
                    table.ajax.reload(); 
                },
                error(response){
                    swal("Error","Preference window has not been disabled","error");
                }
            })
        });

        //enable window for all jo
        // $(document).on("click","#enable_window_flag",function(){
        //     $.ajax({
        //         url:"enable_pref_window_for_all_active_jo",
        //         type:"POST",
        //         data :{ 
        //             _token: $('meta[name="csrf-token"]').attr('content'),
        //         },
        //         success(response){
        //             swal("Successfull","Windows for all judicial officers have been successfully enabled","success");
        //             table.ajax.reload(); 
        //         },
        //         error(response){
        //             swal("Error","Preference window can not be enabled","error");
        //         }
        //     })
        // });
        
        $(document).on("click","#search",function(){

            var zone = $("#zone_name option:selected").val();
            var cadre = $("#cadre option:selected").val();
            var year = $("#year option:selected").val();
            var month = $("#month option:selected").val();
            var day = $("#day option:selected").val();
            var terminal_date = $("#terminal_date").val();

            //console.log(cadre);

           if(zone== ""){
                swal("Error","Please Enter The Zone","error");
           }
           else{
               if( year==0 && month==0 && day==0){
                   swal("Select Time Period","Please insert the Time period","error");
               }
               else{
                $('.table1').DataTable().destroy();
                   
                var table1 = $("#show_cadrewise_zonewise_table").DataTable({  
                        "processing": true,
                        "serverSide": true,
                        "ajax":{
                                "url": "datatable_for_zonewise_posting",
                                "dataType": "json",
                                "type": "POST",
                                "data":{ _token: $('meta[name="csrf-token"]').attr('content'),
                                        zone:zone,
                                        cadre:cadre,
                                        year:year,
                                        month:month,
                                        day:day,
                                        terminal_date:terminal_date
                                    }
                            },
                            "columns": [  
                                {"data": "sl_no"},              
                                {"data": "officer_name" },
                                {"data": "current_zone_posting_details" },
                                {"data": "duration_in_last_zone" },
                                {"data": "action"}
                            ]
                        });
                    //alert ('ABC');
                    $("#cadre_wise_search_table").show();
                }
           }
            
        });

        //enable window for individual jo
        
        $(document).on("click",".enable",function(){
            var $tr = $(this).closest('tr');
            var data = $('#show_cadrewise_zonewise_table').DataTable().row($tr).data();
            id=data.id;
            $.ajax({
                    url:"enable_window_for_jo_pref",
                    type:"POST",
                    data :{ 
                        _token: $('meta[name="csrf-token"]').attr('content'),
                         id: id
                    },
                    success(response){
                        swal("Successfull","Enabled Successfully","success");
                    },
                    error(response){
                        swal("Error","Enabled has not been done","error");
                    }
            })
            
        }); 
            
    });

</script>
@endsection
