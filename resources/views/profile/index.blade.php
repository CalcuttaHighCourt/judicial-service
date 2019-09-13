

@extends('layouts.app') @section('title', 'Judicial Officer Entry')
@section('page_heading') Judicial Officer Entry @endsection
@section('center_main_content')
<!-- styling the font color of options displaying in the select2 dropdown -->
<style>
.select2-results__option{
    color:#d43c3c;
}
</style>
<div id="info-panel" class="panel panel-default">
   <div class="row" style="margin-left:-200px">
      <div class="col-sm-3">
         <!--left col-->
      </div>
      <!--/col-3-->
      <div class="col-sm-9" id="nav_tabs">
         <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" class="my-tab-navigation" href="#basic_details"> Basic Details </a></li>
            <li><a data-toggle="tab" class="my-tab-navigation" href="#contact_details"> Contact Details </a></li>
            <li><a data-toggle="tab" class="my-tab-navigation" href="#qualification_details"> Qualification Detals </a></li>
            <li><a data-toggle="tab" class="my-tab-navigation" href="#posting_details"> Posting Details </a></li>
            <li><a data-toggle="tab" class="my-tab-navigation" href="#upload_photo"> Upload Photo </a></li>
         </ul>
         <div class="tab-content">
            <div class="tab-pane active" id="basic_details">
               <form class="form" action="##" method="">                 
                  <div class="form-group">
                     <div class="col-xs-6">
                        <label for="jo_name" class="control-label">
						   Name: {{ $profile[0]['officer_name'] }}
						</label>						                        
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-xs-6">
                        <label for="jo_code" class="control-label">
                           JO Code: {{ $profile[0]['jo_code']}}

                        </label>
                     </div>
				  </div>
				  <hr>
                  <div class="form-group">
                     <div class="col-xs-6">
                        <label for="guardian_name" class="control-label">
                           Guardian's Name: {{ $profile[0]['guardian_name']}}
                        </label>
                        
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-xs-6">
                        <label for="guardian_relationship" class="control-label">
                            Guardian Relationship: {{ $profile[0]['gurdian_relation']}} 
                        </label>                                                         
                     </div>
				  </div>     
				  <hr>             
                  <div class="form-group">
                    <div class="col-xs-6">
                        <label for="dob" class="control-label">
                             Date of Birth: {{ date('d-m-Y', strtotime($profile[0]['date_of_birth']))}}
                        </label>                        
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="doj" class="control-label">
                             Date of Joining: {{ date('d-m-Y', strtotime($profile[0]['date_of_joining'])) }}
                        </label>                        
                    </div>
				 </div>    
				 <hr>
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="doc" class="control-label">
                             Date of Confirmation: {{ date('d-m-Y', strtotime($profile[0]['date_of_confirmation'])) }}
                        </label>                        
                    </div>
                 </div>  
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="dor" class="control-label">
                             Date of Superannuation: {{ date('d-m-Y', strtotime($profile[0]['date_of_retirement'])) }}
                        </label>                      
                    </div>
				 </div>      
				 <hr>
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="religion_id">
                             Religion: {{ $profile[0]->religion['religion_name']}}
                        </label>						
                    </div>
                 </div>
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="category_id">
                             Category: {{ $profile[0]->caste['caste_name']}}	
                        </label>                        
                    </div>
				 </div>
				 <hr>
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="recruitment_batch_id" class="control-label">
                             Recruitment Batch: {{ $profile[0]['recruitment_batch_desc']}}
                        </label>                        
                    </div>
                 </div>
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="aadhar_no">
                             Aadhar No.: {{ $profile[0]['aadhaar_no']}}	
                        </label>                        				        
                    </div>
				 </div>    
				 <hr>
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="pan_no">
                             PAN No.: {{ $profile[0]['pan_no']}}
                        </label>                        
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="gpf_no">
                             GPF No.: {{ $profile[0]['gpf_no']}}
                        </label>                        
                    </div>
				 </div>    
				 <hr>
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="blood_group">
                             Blood Group: {{ $profile[0]['blood_group']}}	
                        </label>
                        
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="blood_group">
							Gender: 
							@if ($profile[0]['gender'] =="M")
								{{  "Male" }}
							@elseif ($profile[0]['gender'] =="F")
								{{  "Female" }}	
							@elseif ($profile[0]['gender'] =="O")
								{{  "Other" }}															
							@endif
                        </label>                        
                    </div>
				 </div>           
				 <hr>         
                 <div class="form-group">
                    <div class="col-xs-6">
                        <label for="identification_mark">
                             Identification Mark: {{ $profile[0]['identification_mark']}}
                        </label>
                        
                    </div>
                 </div>


                 
               </form>
            </div>
            <!--/tab-pane-->

            <div class="tab-pane" id="contact_details">
               <form class="form" action="##" method="">
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="email_id_1" class="control-label">
                                 Primary Email ID: {{ $profile[0]['email_id_1']}}
                            </label>                            
                        </div>
                    </div> 
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="email_id_2">
                                 Secondary Email ID: {{ $profile[0]['email_id_1']}}
                            </label>                            
                        </div>
					</div>  
					<hr>
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="email_id_3">
                                 Alternative Email ID: {{ $profile[0]['email_id_3']}}
                            </label>                            
                        </div>
                    </div> 
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="ph_no_1" class="control-label">
                                 Primary Contact No.: {{ $profile[0]['mobile_no_1']}}
                            </label>                            
                        </div>
					</div>    
					<hr>
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="ph_no_2">
                                 Secondary Contact No.: {{ $profile[0]['mobile_no_2']}}
                            </label>							
                        </div>
                    </div>    
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="ph_no_3">
                                 Alternative Contact No.: {{ $profile[0]['mobile_no_3']}}
                            </label>							
                        </div>
					</div> 
					<hr>   
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="home_state" class="control-label">
                                 Home State: {{ $profile[0]->state['state_name']}}
                            </label>
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="home_district" class="control-label">
                                 Home District: {{ $profile[0]->district['district_name']}}
                            </label>                            
                        </div>
					</div>
					<hr> 
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="home_town" class="control-label">
                                 Home Town: {{ $profile[0]['hometown']}}
                            </label>                            
                        </div>
					</div>    
					                            
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="permanent_address" class="control-label">
                                Permanent Address:  {{ $profile[0]['permanent_address']}}
                            </label>
                            	
                        </div>
					</div>      
					<hr>             
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="current_address" class="control-label">
                                 Current Address:  {{ $profile[0]['present_address']}}	
                            </label>							
                        </div>
                    </div> 

                    
               </form>
            </div>
            <!--/tab-pane-->

            <div class="tab-pane" id="qualification_details">
               <form class="form" action="##" method="">
                    <div class="div_add_more_qualification">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-xs-5"><br/>
                                    <label>									 
										@foreach($profile[0]->judicial_officer_qualifications  as $qualification)
											{{$qualification['qualification']['qualification_name']}} ({{$qualification['passing_year']}})
											@if(!$loop->last)
												 {{", "}}&nbsp;
											@endif
										@endforeach
									</label>
                                </div>
                            </div>


                        </div>                          
                        <hr/>                     
                    </div> 
               </form>
            </div>            
         <!--/tab-pane-->

         <div class="tab-pane" id="posting_details">
                <form class="form" action="##" method="">                    
                    <div class="text-center">
                        <h3 style="color:#d06666"><u>Posting Details (From Present to Past)</u></h3>
                    </div>
                    <div class="div_add_more_posting">
                        <div class="row"> 
                            <div class="col-xs-3">
                                <label>   Designation </label>
								
                                
                            </div>
                            <div class="col-xs-2">
                                <label> Posting Mode </label>

                            </div>
                            <div class="col-xs-3">
                                <label>    Court           </label>

                            </div>                   
                            <div class="col-xs-2">
                                <label>    Reporting Officer         </label>

                            </div>
                            <div class="col-xs-1">
                                <label>        From      </label>

                            </div>
                            <div class="col-xs-1">
                                <label>  To       </label>

                            </div>

						</div> 

						<hr>
						
						@foreach($profile[0]->judicial_officer_postings  as $details)
						<div class="row"> 
								<div class="col-xs-3">
									<label>   {{$details['designation']['designation_name'] }}</label>
									
									
								</div>
								<div class="col-xs-2">
									<label> {{$details['mode']['posting_mode'] }} </label>

								</div>
								<div class="col-xs-3">
									<label>    {{$details['court']['court_name'] }}         </label>

								</div>                   
								<div class="col-xs-2">
									<label>   {{$details['court']['court_name'] }}        </label>

								</div>
								<div class="col-xs-1">
									<label>        From      </label>

								</div>
								<div class="col-xs-1">
									<label>  To       </label>

								</div>

						</div> 
						<hr>      
					@endforeach
						
						
					</div>                     
				</form>			
          </div>
          <!--/tab-pane-->     

         <div class="tab-pane" id="upload_photo">
                <form class="form" action="##" method="">
                     <div class="text-center">  
                        <img src="{{asset('images/FacelessMan.png')}}" class="avatar img-circle img-thumbnail" alt="avatar" style="height:30%;width:20%">
                        <h6>Upload Photo...</h6>
                        <input type="file" id="file_input" class="text-center center-block file-upload">              
                         
                     </div>
                </form>
          </div>

          
          <!--/tab-pane-->        
		  <div class="row">
          <br/><br/>
        <div class="col-sm-12">
            <div class="col-sm-4 text-left">
                <button class="btn btn-info previous my-tab-navigation"><i class="glyphicon glyphicon-backward"></i> Previous</button>
            </div>
            <div class="col-sm-4 text-center">
                <button class="btn btn-success" id="submit"><i class="glyphicon glyphicon-ok-sign"></i> Submit</button>
            </div>
            <div class="col-sm-4 text-right">
                <button class="btn btn-info next my-tab-navigation"><i class="glyphicon glyphicon-forward"></i> Next</button>
            </div>
        </div>    
      </div>
      </div>
      
      <!--/tab-content-->
   </div>
   <!--/col-9-->
</div>
<!--/row-->




@endsection @include('layouts.1_column_content')


@section('main_container') @yield('1_column_content') @endsection

@section('meta')
@parent
<meta name="_token" content="{!! csrf_token() !!}" />
@endsection

@section('end_scripts') @parent

<script>
   $(document).ready(function() {   
        var clone_element_posting = $(".div_add_more_posting").clone();
        var clone_element_qualification = $(".div_add_more_qualification").clone();

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            }
        });

       /* Display the selected image while uploading the file :: STARTS */ 
        var readURL = function(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
            
            reader.readAsDataURL(input.files[0]);
            }
        }
        
        
        $(".file-upload").on('change', function(){
            readURL(this);
        });
        /* Display the selected image while uploading the file :: ENDS */  

        
        // Datepicker Initialization
        $(".date").datepicker({
            format: "dd-mm-yyyy",
            weekStart: 1,
            todayBtn: "linked",
            clearBtn: true,
            daysOfWeekHighlighted: "0,6",
            autoclose: true,
            todayHighlight: true,
            toggleActive: false            
        });

        // Select2 initialization
        $(".select2").select2();

       
        //next button event
        $('.next').click(function(){
            $('.nav > .active').next('li').find('a').trigger('click');
			$('html, body').animate({
				scrollTop: $("#nav_tabs").offset().top
			}, 1000);
		});

        //previous button event
		$('.previous').click(function(){
			$('.nav > .active').prev('li').find('a').trigger('click');
			$('html, body').animate({
				scrollTop: $("#nav_tabs").offset().top
			}, 1000)
		});	

        function prev_next_btn_display(){
            var target_tab_index=$(e.target).closest('li').index() + 1;
            var tab_length=$('#nav_tabs > ul > li').length;
            if(target_tab_index==1){
                $('.previous').hide();
                $('.next').show();
            }
            else if(target_tab_index==tab_length){
                $('.previous').show();
                $('.next').hide();
            }
            else{
                $('.previous').show();
                $('.next').show();
            }
        }


        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            //e.target // activated tab
            //e.relatedTarget // previous tab
            //alert( $(e.target).closest('li').index() + 1 );
            //console.log($('#nav_tabs > ul > li').length+" "+$('.nav > .active').next('li').index());
            prev_next_btn_display();
        });

        // Prevent default form submit
        $("form").submit(function(e){
            return false;
        });   

        
        /*If multiple posting details added :: STARTS*/
		$(document).on("click","#add_more_posting", function(){
            var from_date = $(".div_add_more_posting:last").find(".from_date").val();
            var designation_id = $(".div_add_more_posting:last").find(".designation_id").val();
            var mode_id = $(".div_add_more_posting:last").find(".mode_id").val();
            var court_id = $(".div_add_more_posting:last").find(".court_id").val();

            if(from_date!="" && designation_id!="" && mode_id!=""){                
                var clone_element2 = clone_element_posting.clone();
                clone_element2.insertAfter(".div_add_more_posting:last");                
                // Select2 Re-initialization
                $(".select2").select2();  

                // Datepicker Re-initialization
                $(".date").datepicker({
                    format: "dd-mm-yyyy",
                    weekStart: 1,
                    todayBtn: "linked",
                    clearBtn: true,
                    daysOfWeekHighlighted: "0,6",
                    autoclose: true,
                    todayHighlight: true,
                    toggleActive: false,
                    endDate: "today"
                });
              
                $(".img_add_more_posting:last").attr({src:"images/details_close.png",
                                                        class:"remove_posting", 
                                                        alt:"remove_posting"
                                                    });
                $(".remove_posting:last").removeAttr("id");
            }
            else{
                swal("Invalid Entry","Entry all mandatory fields before adding a new posting details","error");
                return false;
            }
			
		})
	    /*If multiple posting details added :: ENDS*/    

        /*If any posting details row needs to remove :: STARTS*/
        $(document).on("click",".remove_posting", function(){
			$(this).closest(".div_add_more_posting").remove();
		}) 
        /*If any posting details row needs to remove :: ENDS*/

        /*If multiple Qualification details added :: STARTS*/
		$(document).on("click","#add_more_qualification", function(){
            var degree = $(".div_add_more_qualification:last").find(".degree_id").val();
            var passing_year = $(".div_add_more_qualification:last").find(".yop").val();
            
            if(degree!="" && passing_year!=""){
                var clone_element2 = clone_element_qualification.clone();                
                clone_element2.insertAfter(".div_add_more_qualification:last");
                $(".img_add_more_qualification:last").attr({src:"images/details_close.png",
                                                        class:"remove_qualification", 
                                                        alt:"remove_qualification"
                                                    });
                $(".remove_qualification").removeAttr("id");
                $(".select2").select2();
            }
            else{
                swal("Invalid Entry","Entry both the fields before adding a new degree","error");
                return false;
            }
			
		})
	    /*If multiple Qualification details added :: ENDS*/    

        /*If any Qualification details row needs to remove :: STARTS*/
        $(document).on("click",".remove_qualification", function(){
			$(this).closest(".div_add_more_qualification").remove();
		}) 
        /*If any Qualification details row needs to remove :: ENDS*/


        /*Fetch corresponding Districts of selected State :: STARTS*/
        $(document).on("change","#home_state",function(){
            var home_state = $(this).val();
            if(home_state!=""){
                $.ajax({
                    url:"{{route('fetch_district')}}",
                    type:"post",
                    data:{
                        _token: $('meta[name="_token"]').attr('content'),
                        state:home_state
                    },
                    success:function(response){
                        $("#home_district").children('option:not(:first)').remove();
                        $.each(response[0].districts,function(index,value){							
                            $("#home_district").append('<option value="'+value.id+'">'+value.district_name+'</option>');											
                        })
                    },
                    error:function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                })
            }
        })

        /*Fetch corresponding Districts of selected State :: ENDS*/
        

        /*Current Address is Same As Permanenet Address :: STARTS*/
        $(document).on("change","#same_address", function(){
            if(this.checked)
                $("#current_address").val($("#permanent_address").val());
            
            else
                $("#current_address").val('');
            
        });
        /*Current Address is Same As Permanenet Address :: ENDS*/

        function ajax_data(type){
            var designation_id = new Array();
            var court_id = new Array();
            var court_complex_id = new Array();
            var mode_id = new Array();            
            var qualification_id = new Array();
            var passing_year = new Array();
            var reporting_officer_id = new Array();
            var reviewing_officer_id = new Array();
            var from_date = new Array();
            var to_date = new Array();

            designation_id = [];
            $(".designation_id").each(function(){
                designation_id.push($(this).val());
            })

            mode_id = [];
            $(".mode_id").each(function(){
                mode_id.push($(this).val());
            })

            court_id = [];
            court_complex_id = [];
            $(".court_id").each(function(){
                court_id.push($(this).val());
                court_complex_id.push($(this).find(':selected').attr('data-court_complex_id'));
            })

            reporting_officer_id = [];
            $(".reporting_officer_id").each(function(){
                reporting_officer_id.push($(this).val());
            })

            reviewing_officer_id = [];
            $(".reviewing_officer_id").each(function(){
                reviewing_officer_id.push($(this).val());
            })

            qualification_id = [];
            $(".degree_id").each(function(){
                qualification_id.push($(this).val());
            })

            passing_year = [];
            $(".yop").each(function(){
                passing_year.push($(this).val());
            })

            from_date = [];
            $(".from_date").each(function(){
                from_date.push($(this).val());
            })

            to_date = [];
            $(".to_date").each(function(){
                to_date.push($(this).val());
            })
         

            var formData = new FormData();
            
            formData.append("jo_code", $("#jo_code").val());

            formData.append("officer_name", $("#jo_name").val());

            formData.append("gender", $("input[name='gender']").val());

            formData.append("guardian_name",$("#guardian_name").val());

            formData.append("gurdian_relation",$("#guardian_relationship").val());

            formData.append("date_of_birth", $("#dob").val());

            formData.append("home_state_id",$("#home_state").val());

            formData.append("home_district_id",$("#home_district").val());	

            formData.append("hometown",$("#home_town").val());

            formData.append("present_address",$("#current_address").val());

            formData.append("permanent_address",$("#permanent_address").val());

            formData.append("religion_id",$("#religion_id").val());

            formData.append("category_id",$("#category_id").val());   

            formData.append("blood_group",$("#blood_group").val());

            formData.append("identification_mark",$("#identification_mark").val());  

            formData.append("aadhaar_no",$("#aadhar_no").val());

            formData.append("pan_no",$("#pan_no").val());

            formData.append("gpf_no",$("#gpf_no").val()); 

            formData.append("mobile_no_1",$("#ph_no_1").val());

            formData.append("mobile_no_2",$("#ph_no_2").val());

            formData.append("mobile_no_3",$("#ph_no_3").val());

            formData.append("email_id_1",$("#email_id_1").val());

            formData.append("email_id_2",$("#email_id_2").val());

            formData.append("email_id_3",$("#email_id_3").val());

            formData.append("recruitment_batch_id",$("#recruitment_batch_id").val());

            formData.append("date_of_joining",$("#doj").val());

            formData.append("date_of_confirmation",$("#doc").val());

            formData.append("date_of_retirement",$("#dor").val());

            formData.append("file",	$("#file_input").prop('files')[0]);

            formData.append("qualification_id",JSON.stringify(qualification_id));

            formData.append("passing_year",JSON.stringify(passing_year));

            formData.append("designation_id",JSON.stringify(designation_id));

            formData.append("court_id",JSON.stringify(court_id));

            formData.append("court_complex_id",JSON.stringify(court_complex_id));

            formData.append("mode_id",JSON.stringify(mode_id));

            formData.append("from_date",JSON.stringify(from_date));

            formData.append("to_date",JSON.stringify(to_date));
            
        
            

            // for (var pair of formData.entries()) {
            //     console.log(pair[0]+ ', ' + pair[1]); 
            // }

            ajax_url="";
            operation="";
            operated="";
            request_type="POST";
            if(type=="add"){
                formData["_method"]="POST";
                ajax_url="jo_entry";       

                operation="add";
                operated="Added";
            }
            else if(type=="update"){
                formData["_method"]="PUT";            
                ajax_url="jo_entry/"+formdata.jo_code;

                operation="update";
                operated="Updated";
            } 

            $.ajax({
                type: request_type,
                url: ajax_url,
                data: formData,
                dataType: 'json',
                processData: false,
                contentType: false,
                success: function (data, textStatus, jqXHR) {
                    if(data.judicial_officer!=null){
                        swal("Judicial Officer"+operated+" Successfully","","success");
                        $("form").trigger("reset");   
                        $(".select2").val('').trigger('change');
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if(jqXHR.status!=422 && jqXHR.status!=400){
                        swal("Failed to "+operation+" Judicial Officer",errorThrown,"error");
                    }
                    else{
                        msg = ""
                        $.each(jqXHR.responseJSON.errors, function(key,value) {
                            msg+=value+"\n";						
                        });

                        swal("Failed to "+operation+" Judicial Officer",msg,"error");
                    }
                }
            })
        }   


        $("#submit").click(function(){
            ajax_data('add');
        })  

        $("#update").click(function(){
            ajax_data('update');
        })    
        
   });

</script>

@endsection

@section('body_attributes') @parent class="" @endsection