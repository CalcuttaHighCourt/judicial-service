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
                                    <div class="form-group">
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
                                        <div class="form-group">
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
                                        <div class="form-group">
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
                                                <div class="form-group col-xs-3">
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
                                                <div class="form-group col-xs-3">
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
                                                <div class="form-group col-xs-3">
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
                                                <div class="form-group required col-xs-2">
                                                    <label class="control-label">
                                                            Posting Mode 
                                                    </label>
                                                    <select class="form-control info-form-control posting_select2 select2 mode_id" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @include('modes.mode_options')
                                                    </select>
                                                </div>
                                                <div class="form-group required col-xs-2">
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
                                                            @include('designations.designation_options')
                                                        </select>
                                                    </div> 
                                                    
                                                    <div class="form-group required col-xs-2">
                                                        <label class="control-label">
                                                                Place of Posting 
                                                        </label>
                                                        <select class="form-control info-form-control place_of_posting select2" style="width:100%">
                                                            <option value="">Select an Option</option>
                                                            @include('place_of_posting.place_of_posting_option')
                                                        </select>
                                                    </div>  

                                                    <div class="form-group col-xs-3">
                                                        <label class="control-label">
                                                                Additional Charge 
                                                        </label>
                                                        <textarea class="form-control additional_designation" placeholder="Additional Designations with its time period (if any)"></textarea>                                                        
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
                                                <div class="form-group zone_div required col-xs-2" style="display:none">                                                    
                                                    <label class="control-label">
                                                            Zone 
                                                    </label>
                                                    <select class="form-control info-form-control select2 zone" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @include('zones.zone_options')
                                                    </select>                                                    
                                                </div>                            
                                                <div class="col-xs-3 permanent_reporting_officer_div">
                                                    <label>
                                                            Reporting Officer 
                                                    </label>
                                                    <select class="form-control info-form-control posting_select2 select2 reporting_officer_id" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @include('judicial_officers.judicial_officer_options')
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
                                                <div class="form-group col-xs-12">
                                                    <img src="{{asset('images/details_open.png')}}" class="img_add_more_posting" id="add_more_posting">                                                    
                                                </div>                                                
                                            </div>                                             
                                            <hr style="border: 2px solid chocolate;border-radius: 5px;">
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
                        <div class="panel-heading" role="tab" id="headingSeven">
                            <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                Career Progression
                            </a>
                            </h4>
                        </div>
                        <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
                            <div class="panel-body">
                                <div class="row">
                                    <br/>
                                    <form class="form" action="##" method="">                                        
                                        <div class="div_add_more_career_progression">
                                            <div class="row">
                                                <div class="form-group required col-xs-3 col-xs-offset-1">
                                                    <label class="control-label">
                                                        Rank 
                                                    </label>
                                                    <select class="form-control info-form-control career_progression career_progression_rank" style="width:100%">
                                                        <option value="">Select an Option</option>                                                        
                                                    </select>
                                                </div>
                                                <div class="form-group required col-xs-3">
                                                    <label class="control-label">
                                                        Career Progression Stages
                                                    </label>
                                                    <select class="form-control info-form-control career_progression career_progression_stage" style="width:100%">
                                                        <option value="">Select an Option</option>                                                                                                               
                                                    </select>
                                                </div> 
                                                <div class="form-group required col-xs-2">
                                                    <label class="control-label">
                                                            Date of Confirmation
                                                    </label>
                                                    <input type="text" class="form-control date cp_date" placeholder="dd-mm-yyyy">
                                                </div>  
                                                <div class="form-group">
                                                    <div class="col-xs-2">
                                                        <br/>
                                                        <img src="{{asset('images/details_open.png')}}" class="img_add_more_career_progression" id="add_more_career_progression">
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
                                            <button class="btn btn-success update" value="update_career_progression_details"><i class="glyphicon glyphicon-ok-sign"></i> UPDATE</button>
                                        </div>
                                    </div>    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingEight">
                            <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                                Document Upload
                            </a>
                            </h4>
                        </div>
                        <div id="collapseEight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingEight">
                            <div class="panel-body">                            
                                <div class="row">
                                    <br/>
                                    <form class="form" action="##" method="" id="form_add_document" enctype="multipart/form-data">
                                        {{ csrf_field() }}
                                        <div class="div_add_more_jo_document">
                                            <div class="row">
                                                <div class="form-group required col-xs-3 col-xs-offset-1">
                                                    <label class="control-label">
                                                        Document Type 
                                                    </label>
                                                    <select class="form-control info-form-control select2" name="document_type[]" style="width:100%">
                                                        <option value="">Select an Option</option>
                                                        @include('document_types.document_types_options')                                                        
                                                    </select>
                                                </div>
                                                <div class="form-group required col-xs-3">
                                                    <label class="control-label">
                                                        Document
                                                    </label>                                                    
                                                    <input type="file" name="document[]" class="text-center center-block document" accept="application/pdf">                                      
                                                    <input type="integer" name="jo_id[]" style="display:none">        
                                                    <h6><span style="color:red">*</span>Supported File Type: pdf; Max Size: 2 MB</h6>
                                                </div>   
                                                <div class="form-group col-xs-3">
                                                    <label>
                                                        Remark
                                                    </label>
                                                    <textarea class="form-control" name="document_remark[]" placeholder="if any"></textarea>
                                                </div>                                               
                                                <div class="form-group">
                                                    <div class="col-xs-2">
                                                        <br/>
                                                        <img src="{{asset('images/details_open.png')}}" class="img_add_more_document" id="add_more_document">
                                                    </div>
                                                </div>
                                            </div>                   
                                        </div> 
                                    </form>
                                </div>
                                <div class="row">
                                    <br/>
                                    <div class="col-sm-12">
                                        <div class="col-sm-4 col-sm-offset-4 text-center">
                                            <button class="btn btn-success" id="add_jo_document"><i class="glyphicon glyphicon-ok-sign"></i> ADD</button>
                                        </div>
                                    </div>  
                                </div>                         
                                <br />
                                <div id="info-panel2" class="panel panel-default">    
                                    <div id="datatable-panel-heading" class="panel-heading clearfix">       
                                        <div class="panel-title pull-left">List of Documents. . . </div>                                        
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-striped" 
                                                id="datatable-documents" style="width: 100%;">                                                
                                                <thead>
                                                    <tr>    
                                                        <th style="display:none">Hidden ID</th>    
                                                        <th>Sl No.</th>                
                                                        <th>Document Type</th>
                                                        <th>Document</th>
                                                        <th>Uploaded On</th>
                                                        <th>Remarks</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbody">
                                                </tbody>
                                            </table>
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
                                            <h6><span style="color:red">*</span>Max File Size: 2 MB</h6>
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

<!--loader starts-->
<div class="col-md-offset-5 col-md-3" id="wait" style="display:none;">
    <img src="{{asset('images/loader.gif')}}" width="25%" height="10%" />
      <br>Loading..
</div>

<!--loader starts-->

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
        var clone_element_document = $(".div_add_more_jo_document").clone();
        var clone_element_career_progression;
   
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


        /*LOADER*/
        $(document).ajaxStart(function() {
            $("#wait").css("display", "block");
        });
        
        $(document).ajaxComplete(function() {
            $("#wait").css("display", "none");
        });
        /*LOADER*/

        
        /*If multiple Qualification details added :: STARTS*/
		$(document).on("click","#add_more_qualification", function(){           
            var clone_element2 = clone_element_qualification.clone();                
            clone_element2.insertAfter(".div_add_more_qualification:last");
            $(".img_add_more_qualification:last").attr({src:"{{asset('images/details_close.png')}}",
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
            $(".img_add_more_legal_practice:last").attr({src:"{{asset('images/details_close.png')}}",
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

            
            $(this).attr({src:"{{asset('images/details_close.png')}}",
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


        /*If multiple Career Progression details added :: STARTS*/
		$(document).on("click","#add_more_career_progression", function(){           
            var clone_element4 = clone_element_career_progression.clone();                
            clone_element4.insertAfter(".div_add_more_career_progression:last");
            $(".img_add_more_career_progression:last").attr({src:"{{asset('images/details_close.png')}}",
                                                    class:"remove_career_progression", 
                                                    alt:"remove_career_progression"
                                                });
            $(".remove_career_progression").removeAttr("id");

            //select2 Re-initialization
            $(".career_progression").select2(); 

            // Datepicker Re-initialization
            $(".date").datepicker({
                format: "dd-mm-yyyy",
                endDate:'0',
                autoclose: true,   
                orientation: "auto",
            });               

            
		})
	    /*If multiple Career Progression details added :: ENDS*/   


        /*If any Career Progression details row needs to remove :: STARTS*/
        $(document).on("click",".remove_career_progression", function(){
			$(this).closest(".div_add_more_career_progression").remove();
		}) 
        /*If any Career Progression details row needs to remove :: ENDS*/


         /*If multiple documents added :: STARTS*/
		$(document).on("click","#add_more_document", function(){           
            var clone_element5 = clone_element_document.clone();
            clone_element5.insertAfter(".div_add_more_jo_document:last");  

            // Select2 Re-initialization
            $(".select2").select2();  

           
            $(".img_add_more_document:last").attr({src:"{{asset('images/details_close.png')}}",
                                                    class:"remove_document", 
                                                    alt:"remove_document"
                                                });
            $(".remove_document:last").removeAttr("id");        
			
		})
	    /*If multiple documents added :: ENDS*/   



        /*If any documents row needs to remove :: STARTS*/
        $(document).on("click",".remove_document", function(){
			$(this).closest(".div_add_more_jo_document").remove();
		}) 
        /*If any documents row needs to remove :: ENDS*/


        /*Fetch corresponding Career Progression Stages for a Rank ::STARTS*/
        $(document).on("change",".career_progression_rank",function(){
            var element = $(this);
            var target_element = element.parent().next().find(".career_progression_stage");

            if(element.val()!=""){
                $.ajax({
                    type:"post",
                    url:"{{route('fetch_rankwise_career_progression_stages')}}", 
                    async:false,
                    data:{
                        _token:$('meta[name="_token"]').attr('content'),
                        rank_id:element.val(),
                    },
                    success:function(response){
                        target_element.children('option:not(:first)').remove();
                        $.each(response, function(key,val){
                            target_element.append($('<option>').val(val.id).text(val.stage_name));     
                        });
                    },
                    error:function (jqXHR, textStatus, errorThrown) {
                        swal("Server Error","","error");
                    }
                })
            }
            else{
                target_element.children('option:not(:first)').remove();
            }
        })
        /*Fetch corresponding Career Progression Stages for a Rank ::ENDS*/



        //Deputation :: START
        var flag_mode;
        $(document).on("change",".mode_id", function(){
            var option = $(this).find('option:selected').text();

            if(option=='deputation' || option=='Deputation'){
                 $(this).parent().parent().parent().find(".mode_permanent_div").hide();
                 $(this).parent().parent().parent().find(".permanent_reporting_officer_div").hide();
                 $(this).parent().parent().find(".mode_deputation_div").show();
                 $(this).parent().parent().parent().find(".zone_div").show();
                 $(this).parent().parent().parent().find(".deputation_reporting_officer_div").show();
                 flag_mode = 'deputation';
            }
            else{
                $(this).parent().parent().parent().find(".mode_permanent_div").show();
                $(this).parent().parent().parent().find(".permanent_reporting_officer_div").show();
                $(this).parent().parent().parent().find(".mode_deputation_div").hide();
                $(this).parent().parent().parent().find(".zone_div").hide();
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

            if(data.profile_image!=null)
                $('.avatar').attr('src',data.profile_image);
            

            $(".select2").trigger("change");
            $("#home_state").trigger("change");

        }

        // Populating Qualification Details
        function populateJoQualificationDetails(data){
            if(data.length>0){
                $.each(data, function(key,val){
                    $(".degree_id:last").val(val.qualification_id);
                    $(".yop:last").val(val.passing_year);

                    $(".select2").trigger("change");
                    $("#add_more_qualification").trigger('click');
                    //$(".remove_qualification").remove();
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
                    //$(".remove_legal_practice").remove();
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
                    $(".place_of_posting:last").val(val.place_of_posting);
                    $(".additional_designation:last").val(val.additional_designation);
                    $(".other_designation:last").val(val.deputation_designation);
                    $(".other_place_posting:last").val(val.deputation_posting_place);
                    $(".from_date:last").val(val.from_date);
                    $(".to_date:last").val(val.to_date);
                    $(".posting_remark:last").val(val.posting_remark);
                    $(".permanent_reporting_officer_div:last").val(val.reporting_officer_id);
                    $(".reporting_officer_id:last").val(val.reporting_officer_id);
                    $(".other_reporting_officer:last").val(val.other_reporting_officer_name);
                    $(".other_reporting_officer_designation:last").val(val.other_reporting_officer_designation);
                    $(".zone:last").val(val.zone_id);
                    

                    $(".select2").trigger("change");
                    $(".mode_id").trigger("change");
                    $("#add_more_posting").trigger('click');
                    //$(".remove_posting").remove();
                })
                $(".div_add_more_posting:last").remove();
                $(".remove_posting:last").attr({src:"{{asset('images/details_open.png')}}",
                                                class:"add_posting", 
                                                alt:"add_posting",
                                                id:"add_more_posting"
                                            });
            }            
        }

        // Populating Career Progress Details
        function populateJoCareerProgressionDetails(data){
            if(data.length>0){
                $.each(data, function(key,val){
                    $(".career_progression_rank:last").val(val.rank_id);
                    $(".career_progression_rank:last").trigger("change");
                    $(".career_progression_stage:last").val(val.progression_stage_id);
                    $(".career_progression_stage:last").trigger("change");
                    $(".cp_date:last").val(val.date_of_confirmation);

                    $("#add_more_career_progression").trigger('click');                    
                })
                $(".div_add_more_career_progression:last").remove();
            }   
        }

        // Populating JO Documents
        function populateJoDocuments(data){
            var tbody="";
            $.each(data, function(key,val){
                tbody+="<tr>"+
                            "<td class=\"document_id\" style=\"display:none\">"+val.id+"</td>"+
                            "<td>"+(key+1)+"</td>"+
                            "<td>"+val.type_name+"</td>"+                            
                            "<td>"+
                                '<a href="'+val.document+'" target="_blank">'+
                                    val.document_path+
                                "</a>"+
                            "</td>"+
                            "<td>"+val.created_at+"</td>"+
                            "<td>"+val.remark+"</td>"+
                            "<td><i class='fa fa-trash delete' aria-hidden='true' title='Delete' style=\"cursor:pointer\"></i></td>"+
                        "</tr>";
            });

            $("#tbody").html(tbody);
            $("#datatable-documents").DataTable();
        }

        // Get JO Details
        $(document).on("click","#get_details", function(){
            if($("#fetch_id").val() !=""){
                $(this).hide();
                $("#fetch_id").attr("disabled",true);
                
                // hidden id for profile image form
                $("#id").val($("#fetch_id").val());
                // hidden id for document form
                $('[name="jo_id[]"]').val($("#fetch_id").val()); 
                
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

                        $.each(response['ranks'], function(key,val){
                            $(".career_progression_rank").append($('<option>').val(val.id).text(val.rank_name));     
                        });
                        clone_element_career_progression = $(".div_add_more_career_progression").clone();
                        $(".career_progression").select2();
                        populateJoCareerProgressionDetails(response['career_progression']);  

                        populateJoDocuments(response['documents']);

                        $("#details").show();
                    },
                    error:function (jqXHR, textStatus, errorThrown) {
                        swal("Server Error","","error");
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
            //update posting details
            else if($(this).val()=='update_posting_details'){
                var designation_id = new Array();
                var place_of_posting = new Array();
                var additional_designation = new Array();
                var deputation_designation = new Array();
                var zone_id = new Array();
                var deputation_posting_place = new Array();
                var mode_id = new Array();
                var flag_mode = new Array();
                var rank_id = new Array();
                var reporting_officer_id = new Array();
                var other_reporting_officer_name = new Array();
                var other_reporting_officer_designation = new Array();
                var from_date = new Array();
                var to_date = new Array();         
                var posting_remark = new Array();
                
                deputation_designation = [];
                $(".other_designation").each(function(){
                    deputation_designation.push($(this).val());
                })

                mode_id = [];
                flag_mode = [];
                zone_id = [];
                $(".mode_id").each(function(){
                    mode_id.push($(this).val());

                    if($(this).find('option:selected').text()=='deputation' || $(this).find('option:selected').text()=='Deputation'){
                        flag_mode.push('deputation');
                        var zone = $(this).parent().parent().parent().find(".zone_div").find(".zone").find("option:selected").val();
                    }
                    else{
                        flag_mode.push('regular');
                        var zone = $(this).parent().next().next().find(".place_of_posting").find('option:selected').data('zone');
                    }

                    zone_id.push(zone);
                })

                rank_id = [];
                $(".rank").each(function(){
                    rank_id.push($(this).val());
                })
                
                designation_id = [];
                $(".designation_id").each(function(){
                    designation_id.push($(this).val());         
                })

                place_of_posting = [];
                $(".place_of_posting").each(function(){
                    place_of_posting.push($(this).val());         
                })

                additional_designation = [];
                $(".additional_designation").each(function(){
                    additional_designation.push($(this).val());         
                })

                deputation_posting_place = [];
                $(".other_place_posting").each(function(){
                    deputation_posting_place.push($(this).val());
                })
            
                reporting_officer_id = [];
                $(".reporting_officer_id").each(function(){
                    reporting_officer_id.push($(this).val());
                })

                other_reporting_officer_name = [];
                $(".other_reporting_officer").each(function(){
                    other_reporting_officer_name.push($(this).val());
                })

                other_reporting_officer_designation = [];
                $(".other_reporting_officer_designation").each(function(){
                    other_reporting_officer_designation.push($(this).val());
                })

                posting_remark = [];
                $(".posting_remark").each(function(){
                    posting_remark.push($(this).val());
                })

                from_date = [];
                $(".from_date").each(function(){
                    from_date.push($(this).val());
                })

                to_date = [];
                $(".to_date").each(function(){
                    to_date.push($(this).val());
                })

                $.ajax({
                    type:"post",
                    url:"{{route('update_posting_details')}}",
                    data:{
                        id:$("#fetch_id").val(),
                        designation_id:designation_id,
                        place_of_posting:place_of_posting,
                        deputation_designation:deputation_designation,
                        additional_designation:additional_designation,
                        mode_id:mode_id,
                        flag_mode:flag_mode,
                        rank_id:rank_id,
                        zone_id:zone_id,
                        deputation_posting_place:deputation_posting_place,
                        reporting_officer_id:reporting_officer_id,                                        
                        other_reporting_officer_name:other_reporting_officer_name,
                        other_reporting_officer_designation:other_reporting_officer_designation,
                        posting_remark:posting_remark,
                        from_date:from_date,
                        to_date:to_date,
                        _token: $('meta[name="csrf-token"]').attr('content'),
                    },
                    success: function (data, textStatus, jqXHR) { 
                        swal("Posting Details Updated Successfully","","success");
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
             //update practice details
             else if($(this).val()=='update_practice_details'){
                var subdivision_id = new Array();
                var from_year = new Array();
                var to_year = new Array();

                subdivision_id = [];
                $(".subdivision_id").each(function(){
                    subdivision_id.push($(this).val());
                })

                from_year = [];
                $(".practice_from_year").each(function(){
                    from_year.push($(this).val());
                })

                to_year = [];
                $(".practice_to_year").each(function(){
                    to_year.push($(this).val());
                })

                $.ajax({
                    type:"post",
                    url:"{{route('update_practice_details')}}",
                    data:{
                        id:$("#fetch_id").val(),
                        subdivision_id:subdivision_id,
                        from_year:from_year,
                        to_year:to_year,
                        _token: $('meta[name="csrf-token"]').attr('content'),
                    },
                    success: function (data, textStatus, jqXHR) { 
                        swal("Practice Details Updated Successfully","","success");
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
            //update qualification details
            else if($(this).val()=='update_qualification_details'){
                var qualification_id = new Array();
                var passing_year = new Array();     

                qualification_id = [];
                $(".degree_id").each(function(){
                    qualification_id.push($(this).val());
                })

                passing_year = [];
                $(".yop").each(function(){
                    passing_year.push($(this).val());
                })

                $.ajax({
                    type:"post",
                    url:"{{route('update_qualification_details')}}",
                    data:{
                        id:$("#fetch_id").val(),
                        qualification_id:qualification_id,
                        passing_year:passing_year,
                        _token: $('meta[name="csrf-token"]').attr('content'),
                    },
                    success: function (data, textStatus, jqXHR) { 
                        swal("Qualification Details Updated Successfully","","success");
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
            //update qualification details
            else if($(this).val()=='update_career_progression_details'){
                var rank_id = new Array();
                var career_progression_stage = new Array();
                var cp_date = new Array();     

                rank_id = [];
                $(".career_progression_rank").each(function(){
                    rank_id.push($(this).val());
                })

                career_progression_stage = [];
                $(".career_progression_stage").each(function(){
                    career_progression_stage.push($(this).val());
                })

                cp_date = [];
                $(".cp_date").each(function(){
                    cp_date.push($(this).val());
                })

                $.ajax({
                    type:"post",
                    url:"{{route('update_career_progression_details')}}",
                    data:{
                        id:$("#fetch_id").val(),
                        rank_id:rank_id,
                        career_progression_stage:career_progression_stage,
                        cp_date:cp_date,
                        _token: $('meta[name="csrf-token"]').attr('content'),
                    },
                    success: function (data, textStatus, jqXHR) { 
                        swal("Career Progression Details Updated Successfully","","success");
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
        })
        // Data Updation :: end


        // Add JO Documents :: START
        $(document).on("click", "#add_jo_document", function(){
            $.ajax({
                method:"POST",
                url:"{{route('upload_jo_document')}}",
                data: new FormData($("#form_add_document")[0]),
                dataType:'JSON',
                contentType: false,
                cache: false,
                processData: false, 
                success: function (data, textStatus, jqXHR) { 
                    swal("Document Uploaded Successfully","","success");
                    return false;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if(jqXHR.status!=422 && jqXHR.status!=400){
                        swal("Failed to Upload Document",errorThrown,"error");
                    }
                    else{
                        msg = "";
                        $.each(jqXHR.responseJSON.errors, function(key,value) {
                            msg+=value+"\n";						
                        });

                        swal("Failed to Upload Document",msg,"error");
                    }
                }
            })
        })
        // Add JO Documents :: END

        // Remove JO Document :: START
        $(document).on("click",".delete", function(){
            swal({
                    title: "Are you sure ?",
                    text: "This document will be removed permanently",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                    if (willDelete) {
                        var element = $(this);
                        var row = element.parent().parent();

                        var document_id = row.find('.document_id').text();
                        
                        $.ajax({
                            method:"post",
                            url:"{{route('remove_jo_document')}}",
                            data:{                    
                                document_id:document_id,
                                _token: $('meta[name="csrf-token"]').attr('content'),
                            },
                            success:function(response){
                                swal("Document Removed Successfully","","success");
                                row.remove();
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                if(jqXHR.status!=422 && jqXHR.status!=400){
                                    swal("Failed to Remove Document",errorThrown,"error");
                                }
                                else{
                                    msg = "";
                                    $.each(jqXHR.responseJSON.errors, function(key,value) {
                                        msg+=value+"\n";						
                                    });

                                    swal("Failed to Remove Document",msg,"error");
                                }
                            }
                        })
                    }
                });            
        })
        // Remove JO Document :: END

    });

</script>
@endsection