@extends('layouts.app') 
@section('content')

<style>    
.panel-heading  a:before {
   font-family: 'Glyphicons Halflings';
   content: "\e114";
   float: right;
   transition: all 0.5s;
}
.panel-heading.active a:before {
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	transform: rotate(180deg);
} 
</style>
<!-- Main content -->
<div id="info-panel2" class="panel panel-default">    
    <div id="datatable-panel-heading" class="panel-heading clearfix">       
        <div class="panel-title pull-left">Modify Details of Judicial Officers. . . </div>        
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-3">
                <label for="jo_code" class="control-label">
                    Judicial Officer
                 </label>
                 <select class="form-control info-form-control select2" style="width:100%" id="fetch_id">
                    <option value="">Select an Option</option>
                    @include('judicial_officers.judicial_officer_options')
                </select>   
            </div>            
            <div class="col-sm-2">
                <br/>
                <button type="buton" class="button btn btn-info" id="get_details">Get Details </button>                             
                <button type="buton" class="button btn btn-danger" id="reset">Reset</button>                 
            </div>
        </div>

        <br/><br/>

        <div id="details" style="display:none">
            <div class="wrapper center-block" style="background:#fff">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="background:#fff">
                    <div class="panel panel-default">
                        <div class="panel-heading active" role="tab" id="headingOne">
                            <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                Basic Details
                            </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
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
                                        <div class="col-xs-3">
                                            <label for="reg_no" class="control-label">
                                                Reg No.
                                            </label>
                                            <input type="integer" class="form-control" name="reg_no" id="reg_no" placeholder="Registration No.">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-3">
                                            <label for="jo_code" class="control-label">
                                                JO Code
                                            </label>
                                            <input type="text" class="form-control" name="jo_code" id="jo_code" placeholder="Judicial Officer Code">
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
                                    <div class="form-group">
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
                                            <input type="text" class="form-control date1" name="dor" id="dor" placeholder="dd-mm-yyyy">
                                        </div>
                                    </div> 
                                    <div class="form-group required">
                                        <div class="col-xs-3">
                                            <label for="recruitment_batch_id" class="control-label">
                                                Recruitment Batch 
                                            </label>
                                            <select id="recruitment_batch_id" class="form-control info-form-control select2" name="recruitment_batch_id" style="width:100%">
                                                <option value="">Select an Option</option>
                                                @include('recruitmentbatches.recruitmentbatch_options')
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <div class="col-xs-2">
                                            <label for="recruitment_batch_year" class="control-label">
                                                Batch Year 
                                            </label>
                                            <select class="form-control info-form-control select2" id="recruitment_batch_year" style="width:100%">
                                                <option value="">Select Year</option>
                                                @for($i=Date('Y');$i>=1950;$i--)
                                                    <option value="{{$i}}">{{$i}}</option>
                                                @endfor
                                            </select>
                                        </div>
                                    </div>            
                                    <div class="form-group"> 
                                        <div class="col-xs-3">
                                            <label class="control-label">Spouse Name (if Spouse is JO):</label>
                                            <select class="form-control info-form-control select2" style="width:100%" id="spouse_name">
                                                <option value="">Select an Option</option>
                                                @include('judicial_officers.judicial_officer_options')
                                            </select>                         
                                        </div>
                                    </div> 
                                    <label>
                                        &nbsp 
                                    </label>
                                    <div class="form-group required form-check"> 
                                        <label class="control-label">JO Gender:</label>
                                        &nbsp &nbsp
                                        <input class="form-check-input" name="gender" type="radio" value="M">
                                        <label class="form-check-label" style="font-size:medium">
                                            Male
                                        </label>
                            
                                        <input class="form-check-input" name="gender" type="radio" value="F">
                                        <label class="form-check-label" style="font-size:medium">
                                            Female
                                        </label>
                    
                                        <input class="form-check-input" name="gender" type="radio" value="O">
                                        <label class="form-check-label" style="font-size:medium">
                                            Other
                                        </label>
                                    </div>  
                                </form>
                                <div class="row">
                                    <br/><br/>
                                    <div class="col-sm-12">
                                        <div class="col-sm-4 col-sm-offset-4 text-center">
                                            <button class="btn btn-success update" value="update_basic_details"><i class="glyphicon glyphicon-ok-sign"></i> UPDATE</button>
                                        </div>
                                    </div>    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                Contact Details
                            </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <div class="row">
                                    <form class="form" action="##" method="">
                                        <div class="form-group required">
                                            <div class="col-xs-5">
                                                <label for="email_id_1" class="control-label">
                                                    Primary Email ID 
                                                </label>
                                                <input type="email" class="form-control" name="email_id_1" id="email_id_1" placeholder="xyz@abc.com">
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <div class="col-xs-5">
                                                <label for="email_id_2">
                                                    Secondary Email ID 
                                                </label>
                                                <input type="email" class="form-control" name="email_id_2" id="email_id_2" placeholder="xyz@abc.com">
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-xs-5">
                                                <label for="ph_no_1" class="control-label">
                                                    Primary Contact No. 
                                                </label>
                                                <input type="integer" class="form-control" name="ph_no_1" id="ph_no_1" placeholder="First Phone No.">
                                            </div>
                                        </div>    
                                        <div class="form-group">
                                            <div class="col-xs-5">
                                                <label for="ph_no_2">
                                                    Secondary Contact No. 
                                                </label>
                                                <input type="integer" class="form-control" name="ph_no_2" id="ph_no_2" placeholder="Second Phone No.">
                                            </div>
                                        </div>  
                                        <div class="form-group required">
                                            <div class="col-xs-3">
                                                <label for="home_state" class="control-label">
                                                    Home State 
                                                </label>
                                                <select id="home_state" class="form-control info-form-control select2" name="home_state" style="width:100%">
                                                    <option value="">Select an Option</option>
                                                        @include('states.state_options')
                                                    <option value="other">Other</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group required" id="div_home_district">
                                            <div class="col-xs-3">
                                                <label for="home_district" class="control-label">
                                                    Home District 
                                                </label>
                                                <select id="home_district" class="form-control info-form-control select2" name="home_district" style="width:100%">
                                                    <option value="">Select an Option</option>
                                                    @include('districts.district_options')

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group required" id="div_home_other_district" style="display:none">
                                            <div class="col-xs-3">
                                                <label for="home_other_district" class="control-label">
                                                    Home District 
                                                </label>
                                                <input id="home_other_district" class="form-control info-form-control" name="home_other_district" style="width:100%">                                        
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-4">
                                                <label for="home_town" class="control-label">
                                                    Home Town 
                                                </label>
                                                <input type="text" class="form-control" id="home_town" placeholder="Home Town Name">
                                            </div>
                                        </div>                                 
                                        <div class="form-group required">
                                            <div class="col-xs-5">
                                                <label for="permanent_address" class="control-label">
                                                    Permanent Address 
                                                </label>
                                                <textarea class="form-control" name="permanent_address" id="permanent_address" placeholder="Permanent Address"></textarea>
                                            </div>
                                        </div>                  
                                        <div class="form-group required">
                                            <div class="col-xs-5">
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
                                <br/><br/>
                                <div class="row">                                
                                    <div class="col-sm-12">
                                        <div class="col-sm-4 col-sm-offset-4 text-center">
                                            <button class="btn btn-success update" value="update_contact_details"><i class="glyphicon glyphicon-ok-sign"></i> UPDATE</button>
                                        </div>
                                    </div>       
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Qualification Details
                            </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <div class="row">
                                    <form class="form" action="##" method="">
                                        <br/>
                                        <div class="div_add_more_qualification">
                                            <div class="row">
                                                <div class="form-group required col-xs-3 col-xs-offset-1">
                                                    <label class="control-label">
                                                        Degree 
                                                    </label>
                                                    <select class="form-control info-form-control select2 degree_id" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @include('qualifications.qualification_options')
                                                    </select>
                                                </div>
                                                <div class="form-group required col-xs-3">
                                                    <label class="control-label">
                                                        Year of Passing 
                                                    </label>
                                                    <select class="form-control info-form-control select2 yop" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @for($i=Date('Y');$i>=1900;$i--)
                                                            <option value="{{$i}}">{{$i}}</option>
                                                        @endfor
                                                    </select>
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
                                <div class="row">
                                    <div class="col-sm-12">                                    
                                        <div class="col-sm-4 col-sm-offset-4 text-center">
                                            <button class="btn btn-success update" value="update_qualification_details"><i class="glyphicon glyphicon-ok-sign"></i> UPDATE</button>
                                        </div>
                                    </div>    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFour">
                            <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                Practice Details
                            </a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <div class="row">
                                    <br/>
                                    <form class="form" action="##" method="">                                        
                                        <div class="div_add_more_legal_practice">
                                            <div class="row">
                                                <div class="form-group required col-xs-3 col-xs-offset-1">
                                                    <label class="control-label">
                                                        Subdivision 
                                                    </label>
                                                    <select class="form-control info-form-control select2 subdivision_id" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @include('subdivisions.subdivision_options')
                                                    </select>
                                                </div>
                                                <div class="form-group required col-xs-3">
                                                    <label class="control-label">
                                                        From (Year)
                                                    </label>
                                                    <select class="form-control info-form-control select2 practice_from_year" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @for($i=Date('Y');$i>=1900;$i--)
                                                            <option value="{{$i}}">{{$i}}</option>
                                                        @endfor
                                                    </select>
                                                </div>   
                                                <div class="form-group required col-xs-3">
                                                    <label class="control-label">
                                                        To (Year)
                                                    </label>
                                                    <select class="form-control info-form-control select2 practice_to_year" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @for($i=Date('Y');$i>=1900;$i--)
                                                            <option value="{{$i}}">{{$i}}</option>
                                                        @endfor
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-xs-2">
                                                        <br/>
                                                        <img src="{{asset('images/details_open.png')}}" class="img_add_more_legal_practice" id="add_more_legal_practice">
                                                    </div>
                                                </div>
                                            </div>                          
                                            <hr/>                     
                                        </div> 
                                    </form>
                                </div>
                                <div class="row">
                                    <br/>
                                    <div class="col-sm-12">
                                        <div class="col-sm-4 col-sm-offset-4 text-center">
                                            <button class="btn btn-success update" value="update_practice_details"><i class="glyphicon glyphicon-ok-sign"></i> UPDATE</button>
                                        </div>
                                    </div>    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFive">
                            <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                Posting Details
                            </a>
                            </h4>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                <br/>
                                <div class="row">
                                    <form class="form" action="##" method=""> 
                                        <div class="div_add_more_posting col-xs-offset-1">
                                            <div class="row"> 
                                                <div class="form-group required col-xs-3">
                                                    <label class="control-label">
                                                            Posting Mode 
                                                    </label>
                                                    <select class="form-control info-form-control posting_select2 select2 mode_id" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @include('modes.mode_options')
                                                    </select>
                                                </div>
                                                <div class="form-group required col-xs-3">
                                                    <label class="control-label">
                                                            Grade / Rank 
                                                    </label>
                                                    <select class="form-control info-form-control select2 rank" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @include('ranks.rank_options')
                                                    </select>
                                                </div>
                                                <div class="mode_permanent_div">
                                                    <div class="form-group required col-xs-3">
                                                        <label class="control-label">
                                                                Designation 
                                                        </label>
                                                        <select class="form-control info-form-control posting_select2 select2 designation_id" style="width:100%">
                                                            <option value="">Select an Option</option>
                                                        </select>
                                                    </div>  
                                                </div>
                                                <div class="mode_deputation_div" style="display:none">
                                                    <div class="form-group required col-xs-3">
                                                        <label class="control-label">
                                                                Designation 
                                                        </label>
                                                        <input type="text" class="form-control other_designation" placeholder="Designation of Deputation">
                                                    </div>                                
                                                    <div class="form-group required col-xs-3">
                                                        <label class="control-label">
                                                                Place of Posting 
                                                        </label>
                                                        <input type="text" class="form-control other_place_posting" placeholder="Deputation Place">
                                                    </div>    
                                                </div>                              
                                            </div><br/>
                                            <div class="row">                                 
                                                <div class="col-xs-3 permanent_reporting_officer_div">
                                                    <label>
                                                            Reporting Officer 
                                                    </label>
                                                    <select class="form-control info-form-control posting_select2 select2 reporting_officer_id" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @include('judicial_officers.judicial_officer_options')
                                                    </select>
                                                </div>
                
                                                <div class="form-group required col-xs-2 deputation_reporting_officer_div deputation_zone" style="display:none">                                                    
                                                    <label class="control-label">
                                                            Zone 
                                                    </label>
                                                    <select class="form-control info-form-control select2 zone" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @include('zones.zone_options')
                                                    </select>                                                    
                                                </div>
                
                                                <div class="col-xs-3 deputation_reporting_officer_div" style="display:none">
                                                    <label>
                                                            Reporting Officer 
                                                    </label>
                                                    <input type="text" class="form-control other_reporting_officer" placeholder="Deputation Reporting Officer">
                                                </div>
                                                <div class="form-group col-xs-3 deputation_reporting_officer_div" style="display:none">
                                                    <label class="control-label">
                                                            Designation 
                                                    </label>
                                                    <input type="text" class="form-control other_reporting_officer_designation" placeholder="Of Reporting Officer">
                                                </div>
                                                <div class="form-group required col-xs-2">
                                                    <label class="control-label">
                                                            From Date  
                                                    </label>
                                                    <input type="text" class="form-control date from_date" placeholder="dd-mm-yyyy">
                                                </div>
                                                <div class="form-group col-xs-2">
                                                    <label class="control-label">
                                                            To Date 
                                                    </label>
                                                    <input type="text" class="form-control date to_date" placeholder="dd-mm-yyyy">
                                                </div>
                                                <div class="col-xs-3">
                                                    <label>
                                                            Remark
                                                    </label>
                                                    <textarea class="form-control posting_remark" placeholder="if any"></textarea>
                                                </div> 
                                                <div class="col-xs-1">
                                                    <br/>
                                                    <img src="{{asset('images/details_open.png')}}" class="img_add_more_posting" id="add_more_posting">
                                                </div>
                                            </div> 
                                            <hr>
                                        </div>                     
                                    </form>
                                </div>
                                <div class="row">
                                    <br/>
                                    <div class="col-sm-12">
                                        <div class="col-sm-4 col-sm-offset-4 text-center">
                                            <button class="btn btn-success update" value="update_posting_details"><i class="glyphicon glyphicon-ok-sign"></i> UPDATE</button>
                                        </div>
                                    </div>    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingSix">
                            <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                Profile Image
                            </a>
                            </h4>
                        </div>
                        <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                            <div class="panel-body">
                                <div class="row">
                                    <form class="form" action="##" method="" id="form_image" enctype="multipart/form-data">
                                        {{ csrf_field() }}
                                        <div class="text-center">  
                                            <img src="{{asset('images/FacelessMan.png')}}" class="avatar img-circle img-thumbnail" alt="avatar" style="height:20%;width:10%">
                                            <h6><span style="color:red">*</span>Supported Image File Type: jpeg / png / jpg / gif</h6>
                                            <h6><span style="color:red">*</span>Max File Size: 50 KB</h6>
                                            <input type="file" id="profile_image" name="profile_image" class="text-center center-block file-upload" accept="image/png, image/jpg, image/jpeg, image/gif">                                      
                                            <input type="integer" name="id" id="id" style="display:none">
                                        </div>
                                    </form>
                                </div>
                                <div class="row">
                                    <br/><br/>
                                    <div class="col-sm-12">
                                        <div class="col-sm-4 col-sm-offset-4 text-center">
                                            <button class="btn btn-success update" value="update_profile_image"><i class="glyphicon glyphicon-ok-sign"></i> UPDATE</button>
                                        </div>
                                    </div>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<meta name="_token" content="{!! csrf_token() !!}" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="{{asset('js/jquery/jquery.min.js')}}"></script>

<script>
    $(document).ready(function() {  
        var clone_element_qualification = $(".div_add_more_qualification").clone();
        var clone_element_legal_practice = $(".div_add_more_legal_practice").clone();
        var clone_element_posting = $(".div_add_more_posting").clone();

   
        $('.panel-collapse').on('show.bs.collapse', function () {
            $(this).siblings('.panel-heading').addClass('active');
        });

        $('.panel-collapse').on('hide.bs.collapse', function () {
            $(this).siblings('.panel-heading').removeClass('active');
        });


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
            autoclose: true,   
            orientation: "auto",
            endDate: '+0d',
        });

         // Datepicker Initialization for Superannuation
        $(".date1").datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,   
            orientation: "auto",
        });

        // Select2 initialization
        $(".select2").select2();

        
        /*If multiple Qualification details added :: STARTS*/
		$(document).on("click","#add_more_qualification", function(){           
            var clone_element2 = clone_element_qualification.clone();                
            clone_element2.insertAfter(".div_add_more_qualification:last");
            $(".img_add_more_qualification:last").attr({src:"images/details_close.png",
                                                    class:"remove_qualification", 
                                                    alt:"remove_qualification"
                                                });
            $(".remove_qualification").removeAttr("id");
            $(".select2").select2(); 
		})
	    /*If multiple Qualification details added :: ENDS*/    



        /*If any Qualification details row needs to remove :: STARTS*/
        $(document).on("click",".remove_qualification", function(){
			$(this).closest(".div_add_more_qualification").remove();
		}) 
        /*If any Qualification details row needs to remove :: ENDS*/


        /*If multiple Legal Practice details added :: STARTS*/
		$(document).on("click","#add_more_legal_practice", function(){
            var subdivision_id = $(".div_add_more_legal_practice:last").find(".subdivision_id").val();
            var from_year = $(".div_add_more_legal_practice:last").find(".practice_from_year").val();
            var to_year = $(".div_add_more_legal_practice:last").find(".practice_to_year").val();
            
            var clone_element3 = clone_element_legal_practice.clone();                
            clone_element3.insertAfter(".div_add_more_legal_practice:last");
            $(".img_add_more_legal_practice:last").attr({src:"images/details_close.png",
                                                    class:"remove_legal_practice", 
                                                    alt:"remove_legal_practice"
                                                });
            $(".remove_legal_practice").removeAttr("id");
            $(".select2").select2();        
			
		})
	    /*If multiple Legal Practice details added :: ENDS*/  



        /*If any Legal Practice row needs to remove :: STARTS*/
        $(document).on("click",".remove_legal_practice", function(){
			$(this).closest(".div_add_more_legal_practice").remove();
		}) 
        /*If any Legal Practice row needs to remove :: ENDS*/


        /*If multiple posting details added :: STARTS*/
		$(document).on("click","#add_more_posting", function(){           
            var clone_element2 = clone_element_posting.clone();
            clone_element2.insertAfter(".div_add_more_posting:last");  

            // Select2 Re-initialization
            $(".select2").select2();  

            // Datepicker Re-initialization
            $(".date").datepicker({
                format: "dd-mm-yyyy",
                endDate:'0',
                autoclose: true,   
                orientation: "auto",
            });               

            
            $(".img_add_more_posting:last").attr({src:"images/details_close.png",
                                                    class:"remove_posting", 
                                                    alt:"remove_posting"
                                                });
            $(".remove_posting:last").removeAttr("id");        
			
		})
	    /*If multiple posting details added :: ENDS*/   



        /*If any posting details row needs to remove :: STARTS*/
        $(document).on("click",".remove_posting", function(){
			$(this).closest(".div_add_more_posting").remove();
		}) 
        /*If any posting details row needs to remove :: ENDS*/


        //Deputation :: START
        var flag_mode;
        $(document).on("change",".mode_id", function(){
            var option = $(this).find('option:selected').text();

            if(option=='deputation' || option=='Deputation'){
                 $(this).parent().parent().parent().find(".mode_permanent_div").hide();
                 $(this).parent().parent().parent().find(".permanent_reporting_officer_div").hide();
                 $(this).parent().parent().find(".mode_deputation_div").show();
                 $(this).parent().parent().parent().find(".deputation_reporting_officer_div").show();
                 flag_mode = 'deputation';
            }
            else{
                $(this).parent().parent().parent().find(".mode_permanent_div").show();
                $(this).parent().parent().parent().find(".permanent_reporting_officer_div").show();
                $(this).parent().parent().parent().find(".mode_deputation_div").hide();
                $(this).parent().parent().parent().find(".deputation_reporting_officer_div").hide();
                flag_mode = 'regular';
            }
        })
        //Deputation :: END


        /*Fetch corresponding Districts of selected State :: STARTS*/
        var state_flag;
        $(document).on("change","#home_state",function(){
            var home_state = $(this).val();
            var state = $("#home_state option:selected").text();
            if(state == "West Bengal" || state == "WEST BENGAL" || state == "west bengal"){
                $("#div_home_district").show();
                $("#div_home_other_district").hide();
                state_flag = 'west_bengal';                
            }
            else{
                $("#div_home_district").hide();
                $("#div_home_other_district").show();
                state_flag = 'other';
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


        // Reset
        $(document).on("click","#reset", function(){
            location.reload(true);
        })

        // Populating Basic Details - Contact Details - Profile Image
        function populateJoBasicDetails(data){
            $("#jo_name").val(data.officer_name);
            $("#reg_no").val(data.registration_no);
            $("#jo_code").val(data.jo_code);
            $("#dob").val(data.date_of_birth);
            $("#doj").val(data.date_of_joining);
            $("#doc").val(data.date_of_confirmation);
            $("#dor").val(data.date_of_retirement);
            $("#recruitment_batch_id").val(data.recruitment_batch_id);
            $("#recruitment_batch_year").val(data.recruitment_batch_year);
            $("#spouse_name").val(data.spouse);
            
            if(data.gender=='M')
                $("input[name=gender][value=M]").prop('checked', true);
            else if(data.gender=='F')
                $("input[name=gender][value=F]").prop('checked', true);
            else if(data.gender=='O')
                $("input[name=gender][value=O]").prop('checked', true);

            $("#email_id_1").val(data.email_id_1);
            $("#email_id_2").val(data.email_id_2);
            $("#ph_no_1").val(data.mobile_no_1);
            $("#ph_no_2").val(data.mobile_no_2);
            $("#home_state").val(data.home_state_id);
            $("#home_district").val(data.home_district_id);
            $("#home_other_district").val(data.other_home_district);
            $("#home_town").val(data.hometown);
            $("#permanent_address").val(data.permanent_address);
            $("#current_address").val(data.present_address);
            $('.avatar').attr('src',data.profile_image);

            $(".select2").trigger("change");

        }

        // Populating Qualification Details
        function populateJoQualificationDetails(data){
            if(data.length>0){
                $.each(data, function(key,val){
                    $(".degree_id:last").val(val.qualification_id);
                    $(".yop:last").val(val.passing_year);

                    $(".select2").trigger("change");
                    $("#add_more_qualification").trigger('click');
                    $(".remove_qualification").remove();
                })
                $(".div_add_more_qualification:last").remove();
            }            
        }


        // Populating Practice Details
        function populateJoPracticeDetails(data){
            if(data.length>0){
                $.each(data, function(key,val){
                    $(".subdivision_id:last").val(val.subdivision_id);
                    $(".practice_from_year:last").val(val.from_year);
                    $(".practice_to_year:last").val(val.to_year);


                    $(".select2").trigger("change");
                    $("#add_more_legal_practice").trigger('click');
                    $(".remove_legal_practice").remove();
                })
                $(".div_add_more_legal_practice:last").remove();
            }            
        }

        // Populating Posting Details
        function populateJoPostingDetails(data){
            if(data.length>0){
                $.each(data, function(key,val){
                    $(".mode_id:last").val(val.mode_id);
                    $(".rank:last").val(val.rank_id);
                    $(".designation_id:last").val(val.designation_id);
                    $(".other_designation:last").val(val.deputation_designation);
                    $(".other_place_posting:last").val(val.deputation_posting_place);
                    $(".from_date:last").val(val.from_date);
                    $(".to_date:last").val(val.to_date);
                    $(".posting_remark:last").val(val.posting_remark);
                    $(".other_reporting_officer:last").val(val.other_reporting_officer_name);
                    $(".other_reporting_officer_designation:last").val(val.other_reporting_officer_designation);
                    

                    $(".select2").trigger("change");
                    $(".deputation_zone").hide();
                    $("#add_more_posting").trigger('click');
                    $(".remove_posting").remove();
                })
                $(".div_add_more_posting:last").remove();
            }            
        }

        // Get JO Details
        $(document).on("click","#get_details", function(){
            if($("#fetch_id").val() !=""){
                $(this).hide();
                $("#fetch_id").attr("disabled",true);
                
                // hidden id for profile image form
                $("#id").val($("#fetch_id").val());
                
                $.ajax({
                    type:"post",
                    url:"{{route('fetch_jo_details')}}",
                    data: {
                        jo_id:$("#fetch_id").val(),
                        _token: $('meta[name="_token"]').attr('content'),
                    },
                    success:function(response){
                        populateJoBasicDetails(response['basic_contact_details']);
                        populateJoQualificationDetails(response['qualification_details']);
                        populateJoPracticeDetails(response['practice_details']); 
                        populateJoPostingDetails(response['posting_details']);                        
                       
                        $("#details").show();
                    },
                    error:function (jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                })
            }
            else{
                swal("Invalid Input","Select Judicial Officer","error");
                return false;
            }
        })


        // Data Updation :: start        
        $(document).on("click",".update", function(){
            //update basic details
            if($(this).val()=='update_basic_details'){
                $.ajax({
                    type:"post",
                    url:"{{route('update_basic_details')}}",
                    data:{
                        id:$("#fetch_id").val(),
                        jo_code:$("#jo_code").val(),
                        registration_no:$("#reg_no").val(),
                        officer_name:$("#jo_name").val(),
                        gender:$("input[name='gender']:checked").val(),                    
                        spouse:$("#spouse_name").val(),
                        date_of_birth:$("#dob").val(),
                        recruitment_batch_id:$("#recruitment_batch_id").val(),
                        recruitment_batch_year: $("#recruitment_batch_year").val(),
                        date_of_joining:$("#doj").val(),
                        date_of_confirmation:$("#doc").val(),
                        date_of_retirement:$("#dor").val(),
                        _token: $('meta[name="csrf-token"]').attr('content'),
                    },
                    success: function (data, textStatus, jqXHR) { 
                        swal("Basic Details Updated Successfully","","success");
                        return false;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if(jqXHR.status!=422 && jqXHR.status!=400){
                            swal("Failed to Update Details",errorThrown,"error");
                        }
                        else{
                            msg = "";
                            $.each(jqXHR.responseJSON.errors, function(key,value) {
                                msg+=value+"\n";						
                            });

                            swal("Failed to Update Details",msg,"error");
                        }
                    }
                })
            }
            //update contact details
            else if($(this).val()=='update_contact_details'){
                $.ajax({
                    type:"post",
                    url:"{{route('update_contact_details')}}",
                    data:{
                        id:$("#fetch_id").val(),
                        home_state_id:$("#home_state").val(),
                        state_flag:state_flag,
                        home_district_id:$("#home_district").val(),
                        other_home_district:$("#home_other_district").val(),                                        
                        hometown:$("#home_town").val(),
                        present_address:$("#current_address").val(),
                        permanent_address:$("#permanent_address").val(),                                        
                        mobile_no_1:$("#ph_no_1").val(),
                        mobile_no_2:$("#ph_no_2").val(),
                        email_id_1:$("#email_id_1").val(),
                        email_id_2:$("#email_id_2").val(),
                        _token: $('meta[name="csrf-token"]').attr('content'),
                    },
                    success: function (data, textStatus, jqXHR) { 
                        swal("Contact Details Updated Successfully","","success");
                        return false;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if(jqXHR.status!=422 && jqXHR.status!=400){
                            swal("Failed to Update Details",errorThrown,"error");
                        }
                        else{
                            msg = "";
                            $.each(jqXHR.responseJSON.errors, function(key,value) {
                                msg+=value+"\n";						
                            });

                            swal("Failed to Update Details",msg,"error");
                        }
                    }
                })
            }
            //update profile image
            else if($(this).val()=='update_profile_image'){
                if($("#profile_image").val()!=""){
                    $.ajax({
                        method:"POST",
                        url:"{{route('update_profile_image')}}",
                        data: new FormData($("#form_image")[0]),
                        dataType:'JSON',
                        contentType: false,
                        cache: false,
                        processData: false, 
                        success: function (data, textStatus, jqXHR) { 
                            swal("Profile Image Updated Successfully","","success");
                            return false;
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            if(jqXHR.status!=422 && jqXHR.status!=400){
                                swal("Failed to Update Image",errorThrown,"error");
                            }
                            else{
                                msg = "";
                                $.each(jqXHR.responseJSON.errors, function(key,value) {
                                    msg+=value+"\n";						
                                });

                                swal("Failed to Update Image",msg,"error");
                            }
                        }
                    })
                }
            }
        })
        // Data Updation :: end


    });

</script>
@endsection