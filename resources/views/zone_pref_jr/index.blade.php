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
    <ul class="nav nav-pills" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="posting_details" style="border-style:outset" data-toggle="tab" href="#postings">Posting Details</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" id="judicial_diary" style="border-style:outset" data-toggle="tab" href="#daily_diary">Judicial diary</a>
        </li>
    <li class="nav-item">
      <a class="nav-link active"  style="border-style:outset" data-toggle="tab" href="#acr">Annual Confidential Report</a>
    </li>
  </ul>
	
	<!-- IIIIIIIIIII -->

    <div class="tab-content clearfix">
        <div class="tab-pan" id="postings">
		<!-- New Task Form -->
                <br><br>
       			<input type="hidden" id="JudicialOfficerPostingPreference-id">
                <div id="officer_name-group" class="form-group row our-form-group">
                    <label for="officer_name" class="col-sm-offset-1 col-md-5 ">Officer Name: {{Auth::user()->name}}</label>
                </div>
                <div id="jo_code-group" class="form-group row our-form-group">
                    <label for="jo_code" id="jo_code" class="col-sm-offset-1 col-sm-3">Code: </label>
                </div>
                <div id="zone-group" class="form-group row our-form-group">
<<<<<<< HEAD
=======
<<<<<<< HEAD
                    <label for="zone" class="col-sm-offset-1 col-sm-2 ">Current Zone of Posting:<span id="cur_zone_name" name="cur_zone_name"> {{$zone_pref_details['current_zone']['zone_name']}}</span></label>
                </div>
                <div id="zone-group" class="form-group row our-form-group">
                    <label for="zone" class="col-sm-offset-1 col-sm-2 ">Previous Zone of Posting:<span id="pre_zone_name" name="pre_zone_name"> {{$zone_pref_details['just_prev_zone']['zone_name']}}</span></label>
=======
<<<<<<< HEAD
>>>>>>> c635937b653c1d2226b4a5c511fa152087894b9f
                    <label for="zone" class="col-sm-offset-1 col-sm-2 ">Current Zone of Posting:<span id="cur_zone_name" name="cur_zone_name" data-cur_zone_val="{{$zone_pref_details['current_zone']['zone_id']}}"> {{$zone_pref_details['current_zone']['zone_name']}}</span></label>
                </div>
                <div id="zone-group" class="form-group row our-form-group">
                    <label for="zone" class="col-sm-offset-1 col-sm-2 ">Previous Zone of Posting:<span id="pre_zone_name" name="pre_zone_name"  data-pre_zone_val="{{$zone_pref_details['just_prev_zone']['zone_id']}}"> {{$zone_pref_details['just_prev_zone']['zone_name']}}</span></label>
<<<<<<< HEAD
=======
=======
                    <label for="zone" class="col-sm-offset-1 col-sm-2 ">Current Zone of Posting:<span id="cur_zone_name" name="cur_zone_name"> {{$zone_pref_details['current_zone']['zone_name']}}</span></label>
                </div>
                <div id="zone-group" class="form-group row our-form-group">
                    <label for="zone" class="col-sm-offset-1 col-sm-2 ">Previous Zone of Posting:<span id="pre_zone_name" name="pre_zone_name"> {{$zone_pref_details['just_prev_zone']['zone_name']}}</span></label>
>>>>>>> 085ba25beb3373603c49a166582df24431fa75be
>>>>>>> 2e2720d541665bc05fe0124bae015783e68693dd
>>>>>>> c635937b653c1d2226b4a5c511fa152087894b9f
                </div>
            
            <hr>
        
            <div id="posting_pref-group" class="form-group row our-form-group">
                
                <div class="col-sm-offset-1 col-md-2">
                    <label for="posting_pref1">Posting Preference </label>
<<<<<<< HEAD
                    <select id="posting_pref" class="form-control select2 js-example-basic-multiple posting_pref" style="width:150px" name="posting_pref" multiple="multiple">
=======
<<<<<<< HEAD
                    <select id="posting_pref" onkeypress="myFunction()" class="form-control select2 js-example-basic-multiple posting_pref" style="width:150px" name="posting_pref" multiple="multiple">
=======
<<<<<<< HEAD
                    <select id="posting_pref" class="form-control select2 js-example-basic-multiple posting_pref" style="width:150px" name="posting_pref" multiple="multiple">
=======
                    <select id="posting_pref" onkeypress="myFunction()" class="form-control select2 js-example-basic-multiple posting_pref" style="width:150px" name="posting_pref" multiple="multiple">
>>>>>>> 085ba25beb3373603c49a166582df24431fa75be
>>>>>>> 2e2720d541665bc05fe0124bae015783e68693dd
>>>>>>> c635937b653c1d2226b4a5c511fa152087894b9f
                        
                    @include('zones.zone_options')
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
        </div>
        <br><br>
        <div class="tab-pan" id="daily_diary" style="display:none;">     
            <div class="form-group row">
                <div class="date col-sm-offset-2 col-sm-2">
                    <input type="text" class="form-control date diary_date" id="date" placeholder="Choose Date" autocomplete="off">
                </div>
                   
                <div class="col-sm-3">
                    <button id="submit_diary" type="button"
                        class="btn btn-primary add-button info-form-button">
                        Submit
                    </button>
                </div>
             </div>
             <br>
             <div class="box col-sm-offset-1">
                <div class="box-header" id="diary_editor" style="display:none;">
                    <h3 class="box-title col-sm-offset-3" >DAILY WORKSHEET
                        <small>of : <span id="date_span"></span></small>
                    </h3>
                
            
                     
            <!-- /.box-header -->
            <div class="box-body pad col-sm-offset-1 col-sm-10">
              <form>
                <textarea class="text_content" id="text_content" placeholder="Place some text here"
                          style="width: 100%; height: 100%; font-size: 100%; line-height: 80%x; border: 1px solid #dddddd; padding: 10px;"></textarea>
              </form>
              <div class="col-sm-offset-5 col-sm-3">
                <button id="submit_worksheet" type="button"
                    class="btn btn-warning add-button info-form-button">
                    Submit
                </button>
            </div>
            </div>

            </div>
        </div>
        </div>
        <!-- /.col-->
      </div>
         </div>
            <!-- /.box-header -->
            
        </div>
    
        <!-- /.col-->
       
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

            $(".text_content").wysihtml5();
           /*LOADER*/

            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

         /*LOADER*/

         /*date initialization:start */

        	$(".diary_date").datepicker({
                endDate:'0',
                format: 'dd-mm-yyyy'
            }).on('change', function () {
                $('.datepicker').hide();
            }); 

        /*date initialization:end */

        $(document).on("click","#judicial_diary",function(){
            $("#postings").hide();
            $("#daily_diary").show();
            
         });

         $(document).on("click","#posting_details",function(){
            $("#daily_diary").hide();
            $("#postings").show();
            
         });


    //To remove current zone & previous zone, from drop down list : start

        var cur_zone_name= $("#cur_zone_name").data('cur_zone_val');
        var pre_zone_name = $("#pre_zone_name").data('pre_zone_val');;

        $("#posting_pref option[value='"+cur_zone_name+"']").remove();
        $("#posting_pref option[value='"+pre_zone_name+"']").remove();

    //To remove current zone & previous zone, from drop down list : end


       
        $(document).on("click","#submit_diary",function(){

           $("#diary_editor").show();
            $("#date_span").html($(".diary_date").val());
            $("#submit_diary").hide();

            var date=$("#date").val();

             $.ajax({

                        type:"POST",
                        url:"zone_pref_jr/worksheet_show",
                        data:{
                            _token: $('meta[name="csrf-token"]').attr('content'),
                            date:date
                        },
                        success:function(response){
                            if(response.length>0)
                                $("iframe").contents().find("html").find("body").html(response['0'].description);
                            else
                                $("iframe").contents().find("html").find("body").html("");
                        },
          
                });
        });

        $(document).on("change","#date",function(){

            $("#submit_diary").show();
        });


        $(document).on("click","#submit_worksheet",function(){

        
            var date=$("#date").val();
            var details=$("#text_content").val();

            $.ajax({

                type:"POST",
                url:"zone_pref_jr/worksheet",
                data:{
                    _token: $('meta[name="csrf-token"]').attr('content'),
                    date:date,
                    details:details
                },
                success:function(response)
                {
                    
                    $("#date").val('');
                    $("#text_content").val('');
                    swal("Saved Successfully","","success");
                },
                error:function(response)
                {
                    swal("Error","","error");
                }

            });
        });

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
                                                                 
                                swal("Preference Added Successfully","Successful","success");
                                

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
