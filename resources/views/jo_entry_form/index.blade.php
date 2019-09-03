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
   <div class="row" style="margin-left:-250px">
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
                  <div class="form-group required">
                     <div class="col-xs-6">
                        <label for="jo_name" class="control-label">
                           Name
                        </label>
                        <input type="text" class="form-control" name="jo_name" id="jo_name" placeholder="Judicial Officer Name">
                     </div>
                  </div>
                  <div class="form-group required">
                     <div class="col-xs-6">
                        <label for="jo_code" class="control-label">
                           JO Code
                        </label>
                        <input type="text" class="form-control" name="jo_code" id="jo_code" placeholder="Judicial Officer Code">
                     </div>
                  </div>
                  <div class="form-group required">
                     <div class="col-xs-6">
                        <label for="guardian_name" class="control-label">
                           Guardian's Name
                        </label>
                        <input type="text" class="form-control" name="guardian_name" id="guardian_name" placeholder="Judicial Officer Guardian Name">
                     </div>
                  </div>
                  <div class="form-group required">
                     <div class="col-xs-6">
                        <label for="guardian_relationship" class="control-label">
                            Guardian Relationship 
                        </label>
                        <input type="text" class="form-control" name="guardian_relationship" id="guardian_relationship" placeholder="Relationship with Guardian">
                     </div>
                  </div>                  
                  <div class="form-group required">
                    <div class="col-xs-3">
                        <label for="dob" class="control-label">
                             Date of Birth 
                        </label>
                        <input type="text" class="form-control date" name="dob" id="dob" placeholder="dd-mm-yyyy">
                    </div>
                 </div>    
                 <div class="form-group required">
                    <div class="col-xs-3">
                        <label for="doj" class="control-label">
                             Date of Joining 
                        </label>
                        <input type="text" class="form-control date" name="doj" id="doj" placeholder="dd-mm-yyyy">
                    </div>
                 </div>    
                 <div class="form-group required">
                    <div class="col-xs-3">
                        <label for="doc" class="control-label">
                             Date of Confirmation 
                        </label>
                        <input type="text" class="form-control date" name="doc" id="doc" placeholder="dd-mm-yyyy">
                    </div>
                 </div>  
                 <div class="form-group required">
                    <div class="col-xs-3">
                        <label for="dor" class="control-label">
                             Date of Superannuation 
                        </label>
                        <input type="text" class="form-control date" name="dor" id="dor" placeholder="dd-mm-yyyy">
                    </div>
                 </div>      
                 <div class="form-group required">
                    <div class="col-xs-4">
                        <label for="religion_id" class="control-label">
                             Religion 
                        </label>
                        <select id="religion_id" class="form-control info-form-control select2" name="religion_id" style="width:100%">
                            <option value="">Select an Option</option>
                            @include('religions.religion_options')
                        </select>
                    </div>
                 </div>
                 <div class="form-group required">
                    <div class="col-xs-4">
                        <label for="category_id" class="control-label">
                             Category 
                        </label>
                        <select id="category_id" class="form-control info-form-control select2" name="category_id" style="width:100%">
                            <option value="">Select an Option</option>
                            @include('castes.caste_options')
                        </select>
                    </div>
                 </div>
                 <div class="form-group required">
                    <div class="col-xs-4">
                        <label for="recruitment_batch_id" class="control-label">
                             Recruitment Batch 
                        </label>
                        <select id="recruitment_batch_id" class="form-control info-form-control select2" name="recruitment_batch_id" style="width:100%">
                            <option value="">Select an Option</option>
                            @include('recruitmentbatches.recruitmentbatch_options')
                        </select>
                    </div>
                 </div>
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="aadhar_no">
                             Aadhar No. 
                        </label>
                        <input type="text" class="form-control" name="aadhar_no" id="aadhar_no" placeholder="Aadhar Card No.">
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="pan_no">
                             PAN No. 
                        </label>
                        <input type="text" class="form-control" name="pan_no" id="pan_no" placeholder="PAN Card No.">
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="pf_no">
                             PF No. 
                        </label>
                        <input type="text" class="form-control" name="pf_no" id="pf_no" placeholder="Profident Fund A/C No.">
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="blood_group">
                             Blood Group 
                        </label>
                        <input type="text" class="form-control" name="blood_group" id="blood_group" placeholder="Blood Group">
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="identification_mark">
                             Identification Mark 
                        </label>
                        <input type="text" class="form-control" name="identification_mark" id="identification_mark" placeholder="Identification Mark">
                    </div>
                 </div>
                 <label for="identification_mark_1">
                     &nbsp 
                 </label>
                 <div class="form-check form-check-inline"> 
                    <input class="form-check-input" name="gender" type="radio" value="male">
                    <label class="form-check-label" style="font-size:medium">
                        Male
                    </label>
        
                    <input class="form-check-input" name="gender" type="radio" value="female">
                    <label class="form-check-label" style="font-size:medium">
                        Female
                    </label>

                    <input class="form-check-input" name="gender" type="radio" value="other">
                    <label class="form-check-label" style="font-size:medium">
                        Other
                    </label>
                </div> 
               </form>
            </div>
            <!--/tab-pane-->

            <div class="tab-pane" id="contact_details">
               <form class="form" action="##" method="">
                    <div class="form-group required">
                        <div class="col-xs-4">
                            <label for="email_id_1" class="control-label">
                                 Primary Email ID 
                            </label>
                            <input type="email" class="form-control" name="email_id_1" id="email_id_1" placeholder="xyz@abc.com">
                        </div>
                    </div> 
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="email_id_2">
                                 Secondary Email ID 
                            </label>
                            <input type="email" class="form-control" name="email_id_2" id="email_id_2" placeholder="xyz@abc.com">
                        </div>
                    </div>  
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="email_id_3">
                                 Alternative Email ID 
                            </label>
                            <input type="email" class="form-control" name="email_id_3" id="email_id_3" placeholder="xyz@abc.com">
                        </div>
                    </div> 
                    <div class="form-group required">
                        <div class="col-xs-4">
                            <label for="ph_no_1" class="control-label">
                                 Primary Contact No. 
                            </label>
                            <input type="text" class="form-control" name="ph_no_1" id="ph_no_1" placeholder="First Phone No.">
                        </div>
                    </div>    
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="ph_no_2">
                                 Secondary Contact No. 
                            </label>
                            <input type="text" class="form-control" name="ph_no_2" id="ph_no_2" placeholder="Second Phone No.">
                        </div>
                    </div>    
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="ph_no_3">
                                 Alternative Contact No. 
                            </label>
                            <input type="text" class="form-control" name="ph_no_3" id="ph_no_3" placeholder="Third Phone No.">
                        </div>
                    </div>    
                    <div class="form-group required">
                        <div class="col-xs-4">
                            <label for="home_state" class="control-label">
                                 Home State 
                            </label>
                            <select id="home_state" class="form-control info-form-control select2" name="home_state" style="width:100%">
                                <option value="">Select an Option</option>
                                    @include('states.state_options')
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <div class="col-xs-4">
                            <label for="home_district" class="control-label">
                                 Home District 
                            </label>
                            <select id="home_district" class="form-control info-form-control select2" name="home_district" style="width:100%">
                                <option value="">Select an Option</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group required">
                        <div class="col-xs-4">
                            <label for="home_town" class="control-label">
                                 Home Town 
                            </label>
                            <input type="text" class="form-control" id="home_town" placeholder="Home Town Name">
                        </div>
                    </div>                                 
                    <div class="form-group required">
                        <div class="col-xs-6">
                            <label for="permanent_address" class="control-label">
                                Permanent Address 
                            </label>
                            <textarea class="form-control" name="permanent_address" id="permanent_address" placeholder="Permanent Address"></textarea>
                        </div>
                    </div>                  
                    <div class="form-group required">
                        <div class="col-xs-6">
                            <label for="current_address" class="control-label">
                                 Current Address 
                            </label>
                            <input class="form-check-input" type="checkbox" value="" id="same_address">
                            <label class="form-check-label" for="defaultCheck1">
                              Same as Permanent Address
                            </label>
                            <textarea class="form-control" name="current_address" id="current_address" placeholder="Current Address"></textarea>
                        </div>
                    </div> 
               </form>
            </div>
            <!--/tab-pane-->

            <div class="tab-pane" id="qualification_details">
               <form class="form" action="##" method="">
                    <div class="div_add_more_qualification">
                        <div class="row">
                            <div class="form-group required">
                                <div class="col-xs-5"><br/>
                                    <label class="control-label">
                                         Degree 
                                    </label>
                                    <select class="form-control info-form-control select2 degree_id" style="width:100%">
                                        <option value="">Select an Option</option>
                                        @include('qualifications.qualification_options')
                                    </select>
                                </div>
                            </div>
                            <div class="form-group required">
                                <div class="col-xs-3">
                                    <label class="control-label">
                                         Year of Passing 
                                    </label>
                                    <select class="form-control info-form-control select2 yop" style="width:100%">
                                        <option value="">Select an Option</option>
                                        @for($i=Date('Y');$i>=1947;$i--)
                                            <option value="{{$i}}">{{$i}}</option>
                                        @endfor
                                    </select>
                                </div>
                            </div>   
                            <div class="form-group">
                                <div class="col-xs-2">
                                    <br>
                                    <img src="{{asset('images/details_open.png')}}" class="img_add_more_qualification" id="add_more_qualification">
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
                        <h3 style="color:#d06666"><u>Present Posting Details</u></h3>
                    </div>
                    <div class="row">
                        <div class="form-group required">
                            <div class="col-xs-3">
                                <label class="control-label">
                                     From Date 
                                </label>
                                <input type="text" class="form-control date" placeholder="dd-mm-yyyy">                            
                            </div>
                        </div> 
                        <div class="form-group required">
                            <div class="col-xs-3">
                                <label class="control-label">
                                     Designation 
                                </label>
                                <select class="form-control info-form-control designation_id select2" style="width:100%">
                                    <option value="">Select an Option</option>
                                    @include('designations.designation_options')
                                </select>
                            </div>
                        </div> 
                        <div class="form-group required">
                            <div class="col-xs-3">
                                <label class="control-label">
                                     Posting Mode 
                                </label>
                                <select class="form-control info-form-control mode_id select2" style="width:100%">
                                    <option value="">Select an Option</option>
                                    @include('modes.mode_options')
                                </select>
                            </div>
                        </div> 
                    </div>
                    <div class="row">                                        
                        <div class="form-group">
                            <div class="col-xs-3">
                                <label>
                                     Court 
                                </label>
                                <select class="form-control info-form-control court_id select2" style="width:100%">
                                    <option value="">Select an Option</option>
                                </select>
                            </div>
                        </div>  
                        <div class="form-group required">
                            <div class="col-xs-3">
                                <label class="control-label">
                                     Reporting Officer 
                                </label>
                                <select id="reporting_officer_id" class="form-control info-form-control select2" style="width:100%">
                                    <option value="">Select an Option</option>
                                    @include('judicial_officers.judicial_officer_options')
                                </select>
                            </div>
                        </div> 
                        <div class="form-group required">
                            <div class="col-xs-3">
                                <label class="control-label">
                                     Reviewing Officer 
                                </label>
                                <select id="reviewing_officer_id" class="form-control info-form-control reviewing_officer_id select2" style="width:100%">
                                    <option value="">Select an Option</option>
                                    @include('judicial_officers.judicial_officer_options')
                                </select>
                            </div>
                        </div> 
                    </div> 

                    <hr>

                    <div class="text-center">
                        <h3 style="color:#d06666"><u>Previous Posting Details</u></h3>
                    </div>
                    <div class="div_add_more_posting">
                        <div class="row">
                            <div class="form-group required">
                                <div class="col-xs-3">
                                    <label class="control-label">
                                         Posting Tenure 
                                    </label>
                                    <input type="text" class="form-control posting_tenure" placeholder="dd-mm-yyyy TO dd-mm-yyyy">                            
                                </div>
                            </div> 
                            <div class="form-group required">
                                <div class="col-xs-3">
                                    <label class="control-label">
                                         Designation 
                                    </label>
                                    <select class="form-control info-form-control posting_select2 designation_id select2" style="width:100%">
                                        <option value="">Select an Option</option>
                                        @include('designations.designation_options')
                                    </select>
                                </div>
                            </div> 
                            <div class="form-group required">
                                <div class="col-xs-3">
                                    <label class="control-label">
                                         Posting Mode 
                                    </label>
                                    <select class="form-control info-form-control posting_select2 mode_id select2" style="width:100%">
                                        <option value="">Select an Option</option>
                                        @include('modes.mode_options')
                                    </select>
                                </div>
                            </div>                             
                        </div>
                        <div class="row">                                                                   
                            <div class="form-group">
                                <div class="col-xs-3">
                                    <label>
                                         Court 
                                    </label>
                                    <select class="form-control info-form-control posting_select2 court_id select2" style="width:100%">
                                        <option value="">Select an Option</option>
                                        @include('courts.court_options')
                                    </select>
                                </div>
                            </div>  
                            <div class="form-group">
                                <div class="col-xs-3">
                                    <label>
                                         Reporting Officer 
                                    </label>
                                    <select class="form-control info-form-control posting_select2 reporting_officer_id select2" style="width:100%">
                                        <option value="">Select an Option</option>
                                        @include('judicial_officers.judicial_officer_options')
                                    </select>
                                </div>
                            </div> 
                            <div class="form-group">
                                <div class="col-xs-3">
                                    <label>
                                         Reviewing Officer 
                                    </label>
                                    <select class="form-control info-form-control posting_select2 reviewing_officer_id select2" style="width:100%">
                                        <option value="">Select an Option</option>
                                        @include('judicial_officers.judicial_officer_options')
                                    </select>
                                </div>
                            </div> 
                            <div class="form-group">
                                <div class="col-xs-2">
                                    <br>
                                    <img src="{{asset('images/details_open.png')}}" class="img_add_more_posting" id="add_more_posting">
                                </div>
                            </div> 
                        </div> 
                        <hr>
                    </div>                     
                </form>
          </div>
          <!--/tab-pane-->     

         <div class="tab-pane" id="upload_photo">
                <form class="form" action="##" method="">
                     <div class="text-center">  
                        <img src="{{asset('images/FacelessMan.png')}}" class="avatar img-circle img-thumbnail" alt="avatar" style="height:30%;width:20%">
                        <h6>Upload Photo...</h6>
                        <input type="file" class="text-center center-block file-upload">              
                         
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
                <button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Submit</button>
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
            toggleActive: false,
            endDate: "today"
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
            var posting_tenure = $(".div_add_more_posting:last").find(".posting_tenure").val();
            var designation_id = $(".div_add_more_posting:last").find(".designation_id").val();
            var mode_id = $(".div_add_more_posting:last").find(".mode_id").val();
            var court_complex_id = $(".div_add_more_posting:last").find(".court_complex_id").val();

            if(posting_tenure!="" && designation_id!="" && mode_id!="" && court_complex_id!=""){                
                var clone_element2 = clone_element_posting.clone();
                clone_element2.insertAfter(".div_add_more_posting:last");                
                $(".select2").select2();                
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

        function ajax_data(){
            var designation_id = new Array();
            var court_id = new Array();
            var court_complex_id = new Array();
            var mode_id = new Array();
            var from_date = new Array();
            var to_id = new Array();
            var qualification_id = new Array();
            var passing_year = new Array();

            var formData = {
                jo_code: $("#jo_code").val(),

                officer_name: $("#jo_name").val(),

                gender: $("input[name='gender']:checked").val(),

                guardian_name:$("#guardian_name").val(),

                gurdian_relation:$("#guardian_relationship").val(),

                date_of_birth: $("#dob").val(),

                home_state_id:$("#home_state").val(),

                home_district_id:$("#home_district").val(),	

                hometown:$("#home_town").val(),

                present_address:$("#current_address").val(),

                permanent_address:$("#permanent_address").val(),

                religion_id:$("#religion_id").val(),

                category_id:$("#category_id").val(),   

                blood_group:$("#blood_group").val(),

                identification_mark:$("#identification_mark").val(),  

                aadhaar_no:$("#aadhaar_no").val(),

                pan_no:$("#pan_no").val(),

                pf_no:$("#pf_no").val(), 

                mobile_no_1:$("#ph_no_1").val(),

                mobile_no_2:$("#ph_no_2").val(),

                mobile_no_3:$("#ph_no_3").val(),

                email_id_1:$("#email_id_1").val(),

                email_id_2:$("#email_id_2").val(),

                email_id_3:$("#email_id_3").val(),

                recruitment_batch_id:$("#recruitment_batch_id").val(),

                date_of_joining:$("#doj").val(),

                date_of_confirmation:$("#doc").val(),

                date_of_retirement:$("#dor").val(),
            
                present_reporting_officer_id:$("#reporting_officer_id").val(),

                reviewing_officer_id:$("#reviewing_officer_id").val(),	
            };
        }
        
   });

</script>

@endsection

@section('body_attributes') @parent class="" @endsection