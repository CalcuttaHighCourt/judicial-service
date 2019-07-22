{{--
<!-- views/JudicialOfficerPostingPreference/index.blade.php -->
--}}
@extends('layouts.app') @section('title', 'JudicialOfficerPostingPreference')
@section('page_heading') JudicialOfficerPostingPreference @endsection
@section('center_main_content')
<style>
    .select2-container--default .select2-selection--multiple .select2-selection__choice{
        background-color:#111;
        
    }
    .select2-container--default .select2-results__option{
    background-color: #28415b;
}
</style>
<!-- Bootstrap Boilerplate... -->
<div id="info-panel" class="panel panel-default">
	<!-- IIIIIIIIIII -->
    <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#add_new">Posting Details</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#daily_dairy">Judicial Dairy</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">Annual Confidential Report</a>
    </li>
  </ul>
	
	<!-- IIIIIIIIIII -->
	<div class="panel-body">

		<!-- New Task Form -->
		<form id="info-form add_new" class="form-horizontal" role="form" method="POST"
			action="{{ url('/admin/JudicialOfficerPostingPreference') }}">
			{{ csrf_field() }}
			<input type="hidden" id="JudicialOfficerPostingPreference-id">
			<div id="officer_name-group" class="form-group row our-form-group">
                <label for="officer_name" class="col-md-5 ">Officer Name: {{Auth::user()->name}}</label>
            </div>
            <div id="jo_code-group" class="form-group row our-form-group">
                <label for="jo_code" class="col-md-3">Code: {{Auth::user()->jo_code}}</label>
            </div>
            <div id="zone-group" class="form-group row our-form-group">
                <label for="zone" class="col-md-2 ">Current Zone of Posting:<span id="cur_zone_name" name="cur_zone_name">{{$zone_pref_details['current_zone']['zone_name']}}</span></label>
            </div>
            <div id="zone-group" class="form-group row our-form-group">
                <label for="zone" class="col-md-2 ">Previous Zone of Posting:<span id="pre_zone_name" name="pre_zone_name">{{$zone_pref_details['just_prev_zone']['zone_name']}}</span></label>
            </div>
            <hr>
        
            <div id="posting_pref-group" class="form-group row our-form-group">
                
                <div class="col-md-2">
                <label for="posting_pref">Posting Preference </label>
                <select id="posting_pref" class="form-control select2 js-example-basic-multiple posting_pref" style="width:150px" name="posting_pref" multiple="multiple">
                    
							 @foreach($zone_pref_details['zones'] as $zone)
                                    <option value="{{$zone->id}}">{{$zone->zone_name}}</option>
                             @endforeach
                    </select>
				</div>
                         

				<div class="col-md-2">
                    <br>
					<button id="submit" type="button"
						class="btn btn-primary add-button info-form-button">
						Submit
					</button>
				</div>
            </div>
            <br><br>

            <div class="table-responsive" style="display:none;"  id="jo_details" name="jo_details">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>Officer Name</th>                    
                  <th>JO Code</th>
                  <th>Previous Zone</th>                  
                  <th>Current Zone</th>
                  <th>Court Complex</th>                  
                  <th>Court</th>
                  <th>Designation</th>                  
                  <th>Date From</th>
                  <th>Preference 1</th>
                  <th>Preference 2</th>

                </tr>
              </thead>
              <tbody>          
              </tbody>
            </table>
          </div>
		</form>
	</div>
</div>



	</div>
</div>
<div id="test-div"></div>

@endsection @include('layouts.1_column_content')


@section('main_container') @yield('1_column_content') @endsection

@section('meta')
@parent
<meta name="_token" content="{!! csrf_token() !!}" />
@endsection

@section('end_scripts') @parent


<script type="text/javascript">
      $(document).ready(function(){

            $('.select2').select2({
                placeholder:"Select an option",
            });

           /*LOADER*/

            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

         /*LOADER*/
   
        //Addition of Ps_Details starts
        
            $(document).on("click", "#search",function(){

                var jo_code = $("#officer_name").val();

            //    $("#jo_details").show();
                
                $.ajax({

                    type:"POST",
                    url:"jo_posting/search",
                    data:{
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        jo_code:jo_code                      
                },
                success:function(response)
                {
                    //console.log(response);
                   
                    $("#jo_details").show();

                   // $("#officer_name").val('');
                    var details="";
                    details+=      '<tr>'+
                                        '<td>'+response[0].jo_code+'</td>'+
                                        '<td>'+response[0].designation_name+'</td>'+
                                        '<td>'+response[0].district_name+'</td>'+
                                        '<td>'+response[0].zone_name+'</td>'+
                                        '<td>'+response[0].from_date+'</td>'+
                                        '<td>'+response[0].duration+'</td>'+
                                    '</tr>';

                                //console.log(details);
                    $('table tbody').html(details);
                },
                error:function(response) {  
                           
                    }                
                
                });

            });//end of search

    $(document).on("click","#submit",function(){

        var pref=$("#posting_pref").val();
        var pref_name=$("#posting_pref option:selected").text();        

        if(pref==null)
        {
            swal("Please Select your preferences","","error");
            return false;
        }
        else if(pref.length<2)
        {
            swal("Please Select Minimum 2 preferences","","error");
            return false;
        }
        else
        {
            var str="";
            var i;
            for(i=0;i<pref.length;i++){
                str+="Preference - "+(i+1)+" : "+pref_name[i]+"\n";
                //console.log(i);
            }

            swal({
                    title: "Are You Sure?",
                    text: str,
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
            .then((willApprove) => {
                if(willApprove) {                           

                    //Add dept using ajax : start
                        $.ajax({
                            type:"POST",
                            url:"zone_pref/submit",
                            data:{
                                _token: $('meta[name="csrf-token"]').attr('content'),
                                pref:pref
                            },                                                          
                            success:function(response){
                                // console.log(response);                                     
                                swal("Preference Added Successfully","Successful","success");
                                table.api().ajax.reload();   

                            },
                            error:function(response) {  
                                if(response.responseJSON.errors.hasOwnProperty('pref'))
                                    swal("Cannot Add New Department", ""+response.responseJSON.errors.pref['0'], "error");                                                       
                                }

                            });//Add dept using ajax : end
                            
                    }//end of swal if(willApprove)

                })//permission to save given verification           


        } //end of else  if(pref.length<2)

                                      
    });//end of  $(document).on("click","#submit",function()

});


</script>
@endsection

@section('body_attributes') @parent class="" @endsection
