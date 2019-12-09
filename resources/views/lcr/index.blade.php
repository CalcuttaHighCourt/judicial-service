@extends('layouts.app') @section('title', 'LCR HC End')
@section('page_heading') LCR HC End @endsection
@section('center_main_content')
<style>
   .select2-results__option{
   color:#d43c3c;
   }
</style>
<div class="panel custom-panel">
    <div class="col-sm-12">
        <div id="info-panel" class="panel panel-default">
            <!-- IIIIIIIIIII -->
            <div id="info-panel-heading" class="panel-heading">REQUEST LOWER COURT RECORD FROM HIGH COURT END</div>
            <!-- IIIIIIIIIII -->
            <div class="panel-body">

                <!-- Lower Court Request Form -->
                <div id="lcr-form" class="form-horizontal">
                    {{ csrf_field() }}
                    <div class="col-md-12">Court Selection</div>
                    <div id="court_selection" class="form-group our-form-group">
                        <div class="col-md-4">
                            <select id="district" type="text" class="form-control select2 info-form-control district" name="district"> 
                                <option value="">Select District</option>
                                @include('districts.district_options')
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select id="subdivision" type="text" class="form-control select2 info-form-control subdivision" name="subdivision" disabled> 
                                <option value="">Select Subdivision </option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select id="court" type="text" class="form-control info-form-control select2 court" name="court" disabled> 
                                <option value="">Select Court</option>
								
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">High Court Case Records</div>
                    <div id="hc_case_selection" class="form-group our-form-group">
                        <div class="col-md-4">
                            <select id="hc_case_type" type="text" class="form-control select2 info-form-control hc_case_type" name="hc_case_type"> 
                                <option value="">Select Case Type</option>
                                    @foreach(App\Hc_case_type::orderBy('type_name', 'asc')->get() as $casetype)
                                        <option value="{{$casetype->id }}" @if (old('hc_case_type') == $casetype->type_name) selected="selected" @endif>{{$casetype->type_name}}</option>
                                    @endforeach
                            </select>
                        </div>
                        <div class="col-md-4">
                            <input id="hc_case_no" type="text" class="form-control info-form-control hc_case_no" name="hc_case_no" placeholder="Enter Case No.">
                        </div>
                        <div class="col-md-4">
                            <select id="hc_case_year" type="text" class="form-control info-form-control hc_case_year" name="hc_case_year"> 
                                <option value="">Select Year</option>
                                @for($hc_case_year=date('Y');$hc_case_year>=1900;$hc_case_year--){
                                "<option value='{{$hc_case_year}}'>{{$hc_case_year}}</option>
                                }
                                @endfor
                            </select>
                        </div>
                    </div>


                    <div class="col-md-12">Lower Court Case Records</div>
                    <div id="lower_case_selection" class="form-group our-form-group col-md-10" style="float:left;">
                        <div class="col-md-4" style="margin-bottom:10px;">
                            <select id="lc_case_type0" type="text" class="form-control select2 info-form-control lc_case_type" name="lc_case_tye"> 
                                <option value="">Select Case type</option>
                                    @foreach(App\lower_case_type::orderBy('type_name', 'asc')->get() as $casetype)
                                        <option value="{{$casetype->id }}" @if (old('lower_case_type') == $casetype->type_name) selected="selected" @endif>{{$casetype->type_name}}</option>
                                    @endforeach
                            </select>
                        </div>

                        <div class="col-md-4" style="margin-bottom:10px;">
                            <input id="lc_case_no0" type="text" class="form-control info-form-control lc_case_no" name="lc_case_no" placeholder="Enter Case No.">
                        </div>
                        <div class="col-md-4" style="margin-bottom:10px;">
                            <select id="lc_case_year0" type="text" class="form-control info-form-control lc_case_year" name="lc_case_year"> 
                                <option value="">Select Year</option>
                                    @for($lc_case_year=date('Y');$lc_case_year>=1900;$lc_case_year--){
                                        <option value='{{$lc_case_year}}'>{{$lc_case_year}}</option>
                                        }
                                    @endfor
                            </select>
                        </div>
                    </div><!-- lower_case_section ends -->
					<div class="col-md-2">
						<div class="col-md-6">
                            <button id="addrow" class="btn btn-success">+</button>
                        </div>
                        <div class="col-md-6">
                            <button id="removerow" class="btn btn-danger">-</button>
                        </div>
					</div>
                    <br>
                    <div class="row">
                        <div class="col-sm-4">
                            <input type="text" id="deadline" class="form-control info-form-control date deadline" placeholder="LCR Required Within This Date">
                        </div>
                        <div class="col-sm-4">
                            <input type="text" id="memo_no" class="form-control info-form-control memo_no" placeholder="Insert Memo No.">
                        </div>
                        <div class="col-sm-4">
                            <input type="text" id="memo_date" class="form-control date info-form-control memo_date" placeholder="Insert Memo Date.">
                        </div>
                    </div>

                    <div id="buttonset" class="form-group our-form-group">
                        <br>
                        <div class="col-sm-4">
                            <button id="request" class="btn btn-success" style="width:100%;">REQUEST LOWER COURT RECORD</button>
                        </div>
                        <div class="col-sm-4">
                            <button id="reset" class="btn btn-danger" style="width:100%;">RESET ALL FIELDS</button>
                        </div>
                    </div>
                </div>
            </div><!-- Lower Court Request Form ENDS -->
            
        </div>
        
        </div>
    </div>
    
</div>
<div class="panel custom-panel">
    <div class="col-sm-12">
<!--Datatable-->
        <div id="info-panel" class="panel panel-default">
            <!-- IIIIIIIIIII -->
            <div id="info-panel-heading" class="panel-heading">LOWER COURT RECORD STATUS DETAILS</div>
            <!-- IIIIIIIIIII -->
                <div class="panel-body">
                    <div class="box box-default" id="show_all_data">
                        
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table class="table table-striped table-bordered" id="show_LCR_status" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>High Court Case No.</th>
                                            <th>Memo Details</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>   
                                    <tbody></tbody>                 
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection @include('layouts.1_column_content')


@section('main_container') @yield('1_column_content') @endsection

@section('meta')
@parent
<meta name="_token" content="{!! csrf_token() !!}" />
@endsection

@section('end_scripts') @parent
<script>

        $(document).ready(function(){

              $(".select2").select2(); //select2 initialization

            $('.date').datepicker({
                format: "dd-mm-yyyy",
                weekStart: 1,
                todayBtn: "linked",
                clearBtn: true,
                daysOfWeekHighlighted: "0,6",
                autoclose: true,
                todayHighlight: true,
                toggleActive: false,
                startDate: '+0d'
            });

      

        //Datatable Code For Showing Data :: START

        var table = $("#show_LCR_status").dataTable({  
                            "processing": true,
                            "serverSide": true,
                            "ajax":{
                                    "url": "{{route('fetch_status')}}",
                                    "dataType": "json",
                                    "type": "POST",
                                    "data":{ 
                                        _token: $('meta[name="csrf-token"]').attr('content')}
                                    },
                            "columns": [                
                                {"class": "sl_no",
                                  "data": "SL NO" },
                                {"class": "hc_case_no data",
                                  "data": "HIGH COURT CASE NO" },
                                {"class": "memo_details data",
                                  "data": "MEMO DETAILS" },
                                {"class": "status data",
                                "data": "STATUS" },
                                {"class": "track_lcr",
                                  "data": "ACTION" }
                            ]
                        });
            
            var i = 0;
                $("#addrow").on("click",function(){
                    i++;
                    $("#lower_case_selection").append('<div class="col-md-4 '+i+'" style="margin-bottom:10px;"><select id="lc_case_type'+i+'" type="text" class="form-control info-form-control lc_case_type" name="lc_case_tye"><option value="">Select Case Type</option>@foreach(App\Lower_case_type::orderBy("type_name", "asc")->get() as $casetype)<option value="{{$casetype->id }}" @if (old("lower_case_type") == $casetype->type_name) selected="selected" @endif>{{$casetype->type_name}}</option>@endforeach</select></div><div class="col-md-4 '+i+'" style="margin-bottom:10px;"><input id="lc_case_no'+i+'" type="text" class="form-control info-form-control lc_case_no" name="lc_case_no"  placeholder="Enter Case No."></div><div class="col-md-4 '+i+'" style="margin-bottom:10px;"><select id="lc_case_year'+i+'" type="text" class="form-control info-form-control lc_case_year" name="lc_case_year"> <option value="">Select Year</option>@for($lc_case_year=date("Y");$lc_case_year>=1900;$lc_case_year--){<option value="{{$lc_case_year}}">{{$lc_case_year}}</option>}@endfor</select></div>');
                });

                
                $("#removerow").on("click",function () {
                    if(i!=0){
                    $('.'+i).remove();
                    i--;
                    }
                });

                $(document).on("change","#district",function(){
                     
                     var district= $("#district option:selected").val();

                     $.ajax({

                        url:"lcr_hc_end_populate/subdivision",
                        method: "POST",
                        data :{_token: $('meta[name="csrf-token"]').attr('content'),
                              district: district
                        },
                        success: function(response){                            
                            if(response.length)
                            {
                                $("#subdivision").removeAttr("disabled");
                                $("#subdivision").find('option').not(':first').remove();

                                $.each(response, function(key,value){
                                    $("#subdivision").append('<option value="'+value.id+'">'+value.subdivision_name +'</option>');

                                });
                            }
                            else
                            {
                                $("#subdivision").find('option').not(':first').remove();
                                $("#court").find('option').not(':first').remove();
								$("#subdivision").prop("disabled", true);
								$("#court").prop("disabled", true);
                            }

                        }
                     });
                });

                $(document).on("change","#subdivision",function(){
                     
                     var subdivision= $("#subdivision option:selected").val();

                     $.ajax({

                        url:"lcr_hc_end_populate/court",
                        method: "POST",
                        data :{_token: $('meta[name="csrf-token"]').attr('content'),
                            subdivision: subdivision
                        },
                        success: function(response){                            
                            if(response.length)
                            {
                                $("#court").removeAttr("disabled");
                                $("#court").find('option').not(':first').remove();

                                $.each(response, function(key,value){
                                    $("#court").append('<option value="'+value.id+'">'+value.court_name +'</option>');

                                });
                            }
                            else
                            {
                                $("#court").find('option').not(':first').remove();
								$("#court").prop("disabled",true);
                            }

                        }
                     });
                });

				
				//on click request button database entry occurs

                $(document).on("click","#request",function(){
					var district = $("#district option:selected").val();
					var subdivision = $("#subdivision option:selected").val();
					var court = $("#court option:selected").val();
					var hc_case_type = $("#hc_case_type option:selected").val();
					var hc_case_no = $("#hc_case_no").val();
					var hc_case_year = $("#hc_case_year option:selected").val();
					var deadline = $("#deadline").val();
                    var memo_no= $("#memo_no").val();
                    var memo_date= $("#memo_date").val();
					var lc_case_type = new Array;
					var lc_case_no = new Array;
					var lc_case_year = new Array;
					for(j=0;j<=i;j++){
						lc_case_type.push($("#lc_case_type"+j+" option:selected").val());
						lc_case_no.push($("#lc_case_no"+j).val());
						lc_case_year.push($("#lc_case_year"+j+" option:selected").val());
					}
					if(district==""){
						swal("District is mandetory","You must select a district","error");
						return false;
					}
					if(subdivision==""){
						swal("Court Complex is mandetory","You must select a court complex","error");
						return false;
					}
					if(court==""){
						swal("Court is mandetory","You must select a court","error");
						return false;
					}
					if(hc_case_type==""){
						swal("High Court Case Type is mandetory","You must select HC Case Type","error");
						return false;
					}
					if(hc_case_no==""){
						swal("High Court Case No. is mandetory","You must enter HC Case No.","error");
						return false;
					}
					if(hc_case_year==""){
						swal("High Court Case Year is mandetory","You must select HC Case Year","error");
						return false;
					}
					for(j=0;j<=i;j++){
						if(lc_case_type[j] == ""){
							swal("Lower Court Case Type in Row-"+(j+1)+" is mandetory","You must select LC Case Type","error");
							return false;
						}
						if(lc_case_no[j] == ""){
							swal("Lower Court Case No. in Row-"+(j+1)+" is mandetory","You must select LC Case No.","error");
							return false;
						}
						if(lc_case_year[j] == ""){
							swal("Lower Court Case Year in Row-"+(j+1)+" is mandetory","You must select LC Case Year","error");
							return false;
						}
					}
					if(deadline == ""){
						swal("LCR required within date field is mandetory","You must pick a date for LCR data requirement deadline","error");
						return false;
					}
					
					$.ajax({
                        url:"lcr_request_by_hc/databaseentry",
                        method: "POST",
                        data :{_token: $('meta[name="csrf-token"]').attr('content'),
                            district:district,
							subdivision:subdivision,
							court:court,
							hc_case_type:hc_case_type,
							hc_case_no:hc_case_no,
							hc_case_year:hc_case_year,
							lc_case_type:lc_case_type,
							lc_case_no:lc_case_no,
							lc_case_year:lc_case_year,
							deadline:deadline,
                            memo_no:memo_no,
                            memo_date:memo_date
                        },
                        success: function(response){   
							swal("LOWER COURT RECORD REQUESTED SUCCESSFULLY","WITHIN - "+deadline,"success");
                            table.api().ajax.reload(); 
                        },
						error: function(jqXHR, textStatus, errorThrown) {
                            alert("Error Occured! Please Try Again.");
                        }
                     });
                });

                $(document).on("click","#reset",function(){

                     $("#district").val("");
                     
					 $("#subdivision").find('option').not(':first').remove();
					 $("#subdivision").prop("disabled", true);
					 
                     $("#court").find('option').not(':first').remove();
					 $("#court").prop("disabled", true);
                     
					 $("#hc_case_type").val("");
                     $("#hc_case_no").val("");
                     $("#hc_case_year").val("");
                     
					 $("#lc_case_type0").val("");
                     $("#lc_case_no0").val("");
                     $("#lc_case_year0").val("");
					 
					 for(j=i;j>0;j--){
						$('.'+j).remove();
					 }
					 
					 $("#deadline").val("");      
                     $("#memo_no").val("");                  
                     $("#memo_date").val("");        
                });
    
    });
</script>
@endsection