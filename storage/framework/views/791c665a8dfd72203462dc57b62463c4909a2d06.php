 
<?php $__env->startSection('content'); ?>
<!-- Main content -->


<br/><br/>
<div id="info-panel" class="panel panel-default">
   <div class="row" style="margin-left:-200px">
      <div class="col-sm-2">
         <!--left col-->
      </div>
      <!--/col-3-->
      <div class="col-sm-9" id="nav_tabs">
         <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" class="my-tab-navigation" href="#basic_details"> <span style="color:red">*</span>Basic Details </a></li>
            <li><a data-toggle="tab" class="my-tab-navigation" href="#contact_details"><span style="color:red">*</span>Contact Details </a></li>
            <li><a data-toggle="tab" class="my-tab-navigation" href="#qualification_details"> Qualification Detals </a></li>
            <li><a data-toggle="tab" class="my-tab-navigation" href="#legal_practice_details"> Practice Detals </a></li>
            <li><a data-toggle="tab" class="my-tab-navigation" href="#posting_details"> Posting Details </a></li>
            <li><a data-toggle="tab" class="my-tab-navigation" href="#upload_photo"><span style="color:red">*</span> Upload Photo </a></li>
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
                            <?php echo $__env->make('recruitmentbatches.recruitmentbatch_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </select>
                    </div>
                 </div>

                 <div class="form-group required">
                    <div class="col-xs-2">
                        <label for="recruitment_batch_year">
                            Batch Year 
                        </label>
                        <select class="form-control info-form-control select2" id="recruitment_batch_year" style="width:100%">
                            <option value="">Select Year</option>
                            <?php for($i=Date('Y');$i>=1900;$i--): ?>
                                <option value="<?php echo e($i); ?>"><?php echo e($i); ?></option>
                            <?php endfor; ?>
                        </select>
                    </div>
                </div>    
                                  
                 <div class="form-group"> 
                    <div class="col-xs-3">
                        <label class="control-label">Spouse Name (if Spouse is JO):</label>
                        <select class="form-control info-form-control select2" style="width:100%" id="spouse_name">
                            <option value="">Select an Option</option>
                            <?php echo $__env->make('judicial_officers.judicial_officer_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
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
                            <button class="btn btn-success submit"><i class="glyphicon glyphicon-ok-sign"></i> Submit</button>
                        </div>
                        <div class="col-sm-4 text-right">
                            <button class="btn btn-info next my-tab-navigation"><i class="glyphicon glyphicon-forward"></i> Next</button>
                        </div>
                    </div>    
                </div>
            </div>
            <!--/tab-pane-->

            <div class="tab-pane" id="contact_details">
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
                                            <?php echo $__env->make('states.state_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
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
               <div class="row">
                    <br/><br/>
                    <div class="col-sm-12">
                        <div class="col-sm-4 text-left">
                            <button class="btn btn-info previous my-tab-navigation"><i class="glyphicon glyphicon-backward"></i> Previous</button>
                        </div>
                        <div class="col-sm-4 text-center">
                            <button class="btn btn-success submit"><i class="glyphicon glyphicon-ok-sign"></i> Submit</button>
                        </div>
                        <div class="col-sm-4 text-right">
                            <button class="btn btn-info next my-tab-navigation"><i class="glyphicon glyphicon-forward"></i> Next</button>
                        </div>
                    </div>    
                </div>
            </div>
            <!--/tab-pane-->

            <div class="tab-pane" id="legal_practice_details">
                <div class="row">
                    <form class="form" action="##" method="">
                            <div class="div_add_more_legal_practice">
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-xs-4"><br/>
                                            <label>
                                                Subdivision 
                                            </label>
                                            <select class="form-control info-form-control select2 subdivision_id" style="width:100%">
                                                <option value="">Select an Option</option>
                                                <?php echo $__env->make('subdivisions.subdivision_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-3">
                                            <label>
                                                From (Year)
                                            </label>
                                            <select class="form-control info-form-control select2 practice_from_year" style="width:100%">
                                                <option value="">Select an Option</option>
                                                <?php for($i=Date('Y');$i>=1900;$i--): ?>
                                                    <option value="<?php echo e($i); ?>"><?php echo e($i); ?></option>
                                                <?php endfor; ?>
                                            </select>
                                        </div>
                                    </div>   
                                    <div class="form-group">
                                        <div class="col-xs-3">
                                            <label>
                                                To (Year)
                                            </label>
                                            <select class="form-control info-form-control select2 practice_to_year" style="width:100%">
                                                <option value="">Select an Option</option>
                                                <?php for($i=Date('Y');$i>=1900;$i--): ?>
                                                    <option value="<?php echo e($i); ?>"><?php echo e($i); ?></option>
                                                <?php endfor; ?>
                                            </select>
                                        </div>
                                        <div class="col-xs-2">
                                            <br>
                                            <img src="<?php echo e(asset('images/details_open.png')); ?>" class="img_add_more_legal_practice" id="add_more_legal_practice">
                                        </div>
                                    </div>
                                </div>                          
                                <hr/>                     
                            </div> 
                    </form>
                </div>
                <div class="row">
                    <br/><br/>
                    <div class="col-sm-12">
                        <div class="col-sm-4 text-left">
                            <button class="btn btn-info previous my-tab-navigation"><i class="glyphicon glyphicon-backward"></i> Previous</button>
                        </div>
                        <div class="col-sm-4 text-center">
                            <button class="btn btn-success submit"><i class="glyphicon glyphicon-ok-sign"></i> Submit</button>
                        </div>
                        <div class="col-sm-4 text-right">
                            <button class="btn btn-info next my-tab-navigation"><i class="glyphicon glyphicon-forward"></i> Next</button>
                        </div>
                    </div>    
                </div>
            </div>            
         <!--/tab-pane-->

         <div class="tab-pane" id="qualification_details">
            <div class="row">
                <form class="form" action="##" method="">
                        <div class="div_add_more_qualification">
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-xs-5"><br/>
                                        <label>
                                            Degree 
                                        </label>
                                        <select class="form-control info-form-control select2 degree_id" style="width:100%">
                                            <option value="">Select an Option</option>
                                            <?php echo $__env->make('qualifications.qualification_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label>
                                            Year of Passing 
                                        </label>
                                        <select class="form-control info-form-control select2 yop" style="width:100%">
                                            <option value="">Select an Option</option>
                                            <?php for($i=Date('Y');$i>=1900;$i--): ?>
                                                <option value="<?php echo e($i); ?>"><?php echo e($i); ?></option>
                                            <?php endfor; ?>
                                        </select>
                                    </div>
                                </div>   
                                <div class="form-group">
                                    <div class="col-xs-2">
                                        <br>
                                        <img src="<?php echo e(asset('images/details_open.png')); ?>" class="img_add_more_qualification" id="add_more_qualification">
                                    </div>
                                </div>
                            </div>                          
                            <hr/>                     
                        </div> 
                </form>
            </div>
            <div class="row">
                <br/><br/>
                <div class="col-sm-12">
                    <div class="col-sm-4 text-left">
                        <button class="btn btn-info previous my-tab-navigation"><i class="glyphicon glyphicon-backward"></i> Previous</button>
                    </div>
                    <div class="col-sm-4 text-center">
                        <button class="btn btn-success submit"><i class="glyphicon glyphicon-ok-sign"></i> Submit</button>
                    </div>
                    <div class="col-sm-4 text-right">
                        <button class="btn btn-info next my-tab-navigation"><i class="glyphicon glyphicon-forward"></i> Next</button>
                    </div>
                </div>    
            </div>
        </div>            
        <!--/tab-pane-->

        <!-- div structure of posting tab will not be changed at any cost; otherwise JS will not work-->
         <div class="tab-pane" id="posting_details">
             <br/>
             <div class="row">
                    <form class="form" action="##" method=""> 
                        <div class="div_add_more_posting">
                            <div class="row"> 
                                <div class="col-xs-3">
                                    <label>
                                            Posting Mode 
                                    </label>
                                    <select class="form-control info-form-control posting_select2 mode_id select2" style="width:100%">
                                        <option value="">Select an Option</option>
                                        <?php echo $__env->make('modes.mode_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    </select>
                                </div>
                                <div class="col-xs-3">
                                    <label>
                                            Grade / Rank 
                                    </label>
                                    <select class="form-control info-form-control rank select2" style="width:100%">
                                        <option value="">Select an Option</option>
                                        <?php echo $__env->make('ranks.rank_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    </select>
                                </div>
                                <div class="mode_permanent_div">
                                    <div class="col-xs-3">
                                        <label>
                                                Designation 
                                        </label>
                                        <select class="form-control info-form-control posting_select2 designation_id select2" style="width:100%">
                                            <option value="">Select an Option</option>
                                            <?php echo $__env->make('designations.designation_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                        </select>
                                    </div>                                
                                    <div class="col-xs-3">
                                        <label>
                                                Court 
                                        </label>
                                        <select class="form-control info-form-control posting_select2 court_id select2" style="width:100%">
                                            <option value="">Select an Option</option>
                                            <?php echo $__env->make('courts.court_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                        </select>
                                    </div>    
                                </div>
                                <div class="mode_deputation_div" style="display:none">
                                    <div class="col-xs-3">
                                        <label>
                                                Designation 
                                        </label>
                                        <input type="text" class="form-control other_designation" placeholder="Designation of Deputation">
                                    </div>                                
                                    <div class="col-xs-3">
                                        <label>
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
                                    <select class="form-control info-form-control posting_select2 reporting_officer_id select2" style="width:100%">
                                        <option value="">Select an Option</option>
                                        <?php echo $__env->make('judicial_officers.judicial_officer_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    </select>
                                </div>

                                <div class="col-xs-2 deputation_reporting_officer_div" style="display:none">
                                    <label>
                                            Zone 
                                    </label>
                                    <select class="form-control info-form-control zone select2" style="width:100%">
                                        <option value="">Select an Option</option>
                                        <?php echo $__env->make('zones.zone_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    </select>
                                </div>

                                <div class="col-xs-3 deputation_reporting_officer_div" style="display:none">
                                    <label>
                                            Reporting Officer 
                                    </label>
                                    <input type="text" class="form-control other_reporting_officer" placeholder="Deputation Reporting Officer">
                                </div>
                                <div class="col-xs-3 deputation_reporting_officer_div" style="display:none">
                                    <label>
                                            Designation 
                                    </label>
                                    <input type="text" class="form-control other_reporting_officer_designation" placeholder="Of Reporting Officer">
                                </div>
                                <div class="col-xs-2">
                                    <label>
                                            From Date 
                                    </label>
                                    <input type="text" class="form-control date from_date" placeholder="dd-mm-yyyy">
                                </div>
                                <div class="col-xs-2">
                                    <label>
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
                                    <br>
                                    <img src="<?php echo e(asset('images/details_open.png')); ?>" class="img_add_more_posting" id="add_more_posting">
                                </div>
                            </div> 
                            <hr>
                        </div>                     
                    </form>
                </div>
                <div class="row">
                    <br/><br/>
                    <div class="col-sm-12">
                        <div class="col-sm-4 text-left">
                            <button class="btn btn-info previous my-tab-navigation"><i class="glyphicon glyphicon-backward"></i> Previous</button>
                        </div>
                        <div class="col-sm-4 text-center">
                            <button class="btn btn-success submit"><i class="glyphicon glyphicon-ok-sign"></i> Submit</button>
                        </div>
                        <div class="col-sm-4 text-right">
                            <button class="btn btn-info next my-tab-navigation"><i class="glyphicon glyphicon-forward"></i> Next</button>
                        </div>
                    </div>    
                </div>
          </div>
          <!--/tab-pane-->     

         <div class="tab-pane" id="upload_photo">
             <div class="row">
                <form class="form" action="##" method="" id="form_image" enctype="multipart/form-data">
                    <?php echo e(csrf_field()); ?>

                    <div class="text-center">  
                        <img src="<?php echo e(asset('images/FacelessMan.png')); ?>" class="avatar img-circle img-thumbnail" alt="avatar" style="height:30%;width:20%">
                        <h6>Upload Photo...</h6>
                        <input type="file" id="profile_image" name="profile_image" class="text-center center-block file-upload" accept="image/png, image/jpg, image/jpeg, image/gif">                                      
                    </div>
                </form>
             </div>
             <div class="row">
                <br/><br/>
                <div class="col-sm-12">
                    <div class="col-sm-4 text-left">
                        <button class="btn btn-info previous my-tab-navigation"><i class="glyphicon glyphicon-backward"></i> Previous</button>
                    </div>
                    <div class="col-sm-4 text-center">
                        <button class="btn btn-success submit"><i class="glyphicon glyphicon-ok-sign"></i> Submit</button>
                    </div>
                </div>    
            </div>
          </div>
          <!--/tab-pane-->        		
      </div>      
      <!--/tab-content-->
   </div>
   <!--/col-9-->
</div>
<!--/row-->
</div>

<!--iframe for showing JO Details-->
<br/><br/>
<div class="col-sm-12 text-center" id="show_jo_details_pdf" style="display:none">
	<iframe id="iframe_report" src="" style="width:800px; height:400px;"></iframe>
</div>

<!--Datatable for showing JO Details-->
<br/><br/>
<div id="info-panel2" class="panel panel-default">    
    <div id="datatable-panel-heading" class="panel-heading clearfix">       
        <div class="panel-title pull-left">List of Judicial Officers. . . </div>
        <div class="pull-right">
            <button id="add-new-button" type="button" class="btn btn-primary add-new-button">
                <i class="fa fa-plus-circle"></i> Add New
            </button>
        </div>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped"
                id="datatable-table" style="width: 100%;">
                <!-- Table Headings -->
                <thead>
                    <tr>        
                        <th></th>                
                        <th>Reg. No</th>
                        <th>JO Code</th>
                        <th>JO Name</th>
                        <th>DOB</th>
                        <th>DOR</th>
                        <th>Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
</div>


<meta name="_token" content="<?php echo csrf_token(); ?>" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>

<script>
   $(document).ready(function() { 
        var clone_element_posting = $(".div_add_more_posting").clone();
        var clone_element_qualification = $(".div_add_more_qualification").clone();
        var clone_element_legal_practice = $(".div_add_more_legal_practice").clone();

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

       
        //next button event
        $('.next').click(function(){
            $('.nav > .active').next('li').find('a').trigger('click');
		});

        //previous button event
		$('.previous').click(function(){
			$('.nav > .active').prev('li').find('a').trigger('click');
		});	

        
        // Prevent default form submit
        $("form").submit(function(e){
            return false;
        });   

        // add new button in the heading of the datatable
        $('#add-new-button').click(function () {            
            $('html, body').animate({
                scrollTop: $('#info-panel').offset().top - 60,
            }, 1000);
        });

        //Other State Option :: START
        $(document).on("change","#home_state", function(){
            var state = $("#home_state").val();
            if(state == "other"){
                $("#div_home_district").hide();
                $("#div_home_other_district").show();
            }
            else{
                $("#div_home_district").show();
                $("#div_home_other_district").hide();
            }
        })        
        //Other State Option :: END

        //Deputation :: START
        $(document).on("change",".mode_id", function(){
            var option = $(this).find('option:selected').text();

            if(option=='deputation' || option=='Deputation'){
                 $(this).parent().parent().parent().find(".mode_permanent_div").hide();
                 $(this).parent().parent().parent().find(".permanent_reporting_officer_div").hide();
                 $(this).parent().parent().find(".mode_deputation_div").show();
                 $(this).parent().parent().parent().find(".deputation_reporting_officer_div").show();
            }
            else{
                $(this).parent().parent().parent().find(".mode_permanent_div").show();
                $(this).parent().parent().parent().find(".permanent_reporting_officer_div").show();
                $(this).parent().parent().parent().find(".mode_deputation_div").hide();
                $(this).parent().parent().parent().find(".deputation_reporting_officer_div").hide();
            }
        })
        //Deputation :: END
                

        //Datatable Code For Showing Data :: START
        var table = $("#datatable-table").DataTable({  
                            "processing": true,
                            "serverSide": true,
                            "order": [[1, 'asc']],
                            "ajax":{
                                    "url": "<?php echo e(route('list_of_jo')); ?>",
                                    "dataType": "json",
                                    "type": "POST",
                                    "data":{ 
                                        _token: $('meta[name="csrf-token"]').attr('content')
                                    },                                    
                            },
                            "columns": [   
                                {"data": "more_details",
                                "orderable": "false"},             
                                {"data": "registration_no"},
                                {"data": "jo_code"},
                                {"data": "officer_name"},
                                {"data": "date_of_birth"},
                                {"data": "date_of_retirement"},
                                {"data": "action",
                                "orderable": "false"}
                            ]
                        }); 

                        
                        $.fn.dataTable.ext.errMode = 'none';
 
                        $(".table").on( 'error.dt', function ( e, settings, techNote, message ) {
                            swal("An error has been reported by DataTable","","error");
                        }).DataTable();             

                                       
            // DataTable initialization with Server-Processing ::END

        // For JO Details PDF :: START
        $(document).on("click",".more_details",function(){  
          var element = $(this);        
          var tr = element.closest('tr');
          var row = table.row(tr);
          var row_data = table.row(tr).data();

          var registration_no = row_data['registration_no'];        
        
          var obj;    

          // fetch JO details only when the child row is hide
            if(!row.child.isShown()){ 

                    $.ajax({
                        type:"POST",
                        url:"<?php echo e(route('fetch_jo_details_pdf')); ?>",
                        data:{
                            _token: $('meta[name="csrf-token"]').attr('content'),
                            registration_no:registration_no
                        },
                        success:function(response){
                            //obj = $.parseJSON(response);             
                            url=response; 
                        },
                        error:function(response){
                            console.log(response);
                        },
                        async: false
                    }) 
            }

            if(row.child.isShown() ) {
                element.attr("src","images/details_open.png");
                row.child.hide();
            }
            else {
               
                element.attr("src","images/details_close.png");
               
                var child_string ='<div class="col-sm-12 text-center" id="show_jo_details_pdf">'+
	                                    '<iframe id="iframe_jo_details_pdf" src='+url+' style="width:800px; height:400px;"></iframe>'+
                                  '</div>';  

                row.child(child_string).show();
            }       
        })
        // For JO Details PDF :: END
        
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
            
            if(subdivision_id!="" && from_year!="" && to_year!=""){
                var clone_element3 = clone_element_legal_practice.clone();                
                clone_element3.insertAfter(".div_add_more_legal_practice:last");
                $(".img_add_more_legal_practice:last").attr({src:"images/details_close.png",
                                                        class:"remove_legal_practice", 
                                                        alt:"remove_legal_practice"
                                                    });
                $(".remove_legal_practice").removeAttr("id");
                $(".select2").select2();
            }
            else{
                swal("Invalid Entry","Entry all the fields before adding a new legal experience details","error");
                return false;
            }
			
		})
	    /*If multiple Legal Practice details added :: ENDS*/  



        /*If any Legal Practice row needs to remove :: STARTS*/
        $(document).on("click",".remove_legal_practice", function(){
			$(this).closest(".div_add_more_legal_practice").remove();
		}) 
        /*If any Legal Practice row needs to remove :: ENDS*/



        /*Fetch corresponding Districts of selected State :: STARTS*/
        $(document).on("change","#home_state",function(){
            var home_state = $(this).val();
            if(home_state!=""){
                $.ajax({
                    url:"<?php echo e(route('fetch_district')); ?>",
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
            //Profile Image Validation
            if($("#profile_image").val()==""){
                swal("Select Profile Image","","error");
                return false;
            }

            var ext = $('#profile_image').val().split('.').pop().toLowerCase();

            if ($.inArray(ext, ['gif','png','jpg','jpeg']) == -1){
                swal("Unsupported Image Type","Use gif / png / jpg / jpeg","error");
                return false;
            }

            var picsize = ($("#profile_image")[0].files[0].size);
            if (picsize > 51200){
                swal("Oversized Image","Image should be less than 50KB","error");
                return false;
            }
            var designation_id = new Array();
            var deputation_designation = new Array();
            var court_id = new Array();
            var zone_id = new Array();
            var deputation_posting_place = new Array();
            var mode_id = new Array();            
            var qualification_id = new Array();
            var passing_year = new Array();
            var reporting_officer_id = new Array();
            var other_reporting_officer_name = new Array();
            var other_reporting_officer_designation = new Array();
            var from_date = new Array();
            var to_date = new Array();
            var subdivision_id = new Array();
            var from_year = new Array();
            var to_year = new Array();
            var posting_remark = new Array();

            designation_id = [];
            $(".designation_id").each(function(){
                designation_id.push($(this).val());
            })

            deputation_designation = [];
            $(".other_designation").each(function(){
                deputation_designation.push($(this).val());
            })

            mode_id = [];
            $(".mode_id").each(function(){
                mode_id.push($(this).val());
            })

            court_id = [];   
            zone_id = [];         
            $(".court_id option:selected").each(function(){
                court_id.push($(this).val()); 
                zone_id.push($(this).attr('data-zone_id'));               
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
            

            ajax_url="";
            operation="";
            operated="";
            request_type="POST";
            if(type=="add"){                
                ajax_url="jo_entry";       

                operation="add";
                operated="Added";
            }
            else if(type=="update"){                          
                //ajax_url="jo_entry/"+formdata.registration_no;

                operation="update";
                operated="Updated";
            } 

            $.ajax({
                type: request_type,
                url: ajax_url,
                data: {
                    jo_code:$("#jo_code").val(),
                    registration_no:$("#reg_no").val(),
                    officer_name:$("#jo_name").val(),
                    gender:$("input[name='gender']:checked").val(),                    
                    spouse:$("#spouse_name").val(),
                    date_of_birth:$("#dob").val(),
                    home_state_id:$("#home_state").val(),
                    home_district_id:$("#home_district").val(),
                    hometown:$("#home_town").val(),
                    present_address:$("#current_address").val(),
                    permanent_address:$("#permanent_address").val(),                    
                    category_id:$("#category_id").val(),
                    blood_group:$("#blood_group").val(),
                    identification_mark:$("#identification_mark").val(),
                    aadhaar_no:$("#aadhar_no").val(),
                    pan_no:$("#pan_no").val(),
                    gpf_no:$("#gpf_no").val(),
                    mobile_no_1:$("#ph_no_1").val(),
                    mobile_no_2:$("#ph_no_2").val(),
                    email_id_1:$("#email_id_1").val(),
                    email_id_2:$("#email_id_2").val(),
                    recruitment_batch_id:$("#recruitment_batch_id").val(),
                    date_of_joining:$("#doj").val(),
                    date_of_confirmation:$("#doc").val(),
                    date_of_retirement:$("#dor").val(),
                    qualification_id:qualification_id,
                    passing_year:passing_year,
                    subdivision_id:subdivision_id,
                    from_year:from_year,
                    to_year:to_year,
                    designation_id:designation_id,
                    deputation_designation:deputation_designation,
                    reporting_officer_id:reporting_officer_id,
                    other_reporting_officer_name:other_reporting_officer_name,
                    other_reporting_officer_designation:other_reporting_officer_designation,
                    court_id:court_id,
                    zone_id:zone_id,
                    deputation_posting_place:deputation_posting_place,
                    mode_id:mode_id,
                    from_date:from_date,
                    to_date:to_date,
                    posting_remark:posting_remark,
                    _token: $('meta[name="csrf-token"]').attr('content'),
                },
                success: function (data, textStatus, jqXHR) {
                    if(data.judicial_officer!=null){

                        // image upload :: START
                        $.ajax({
                            url:"<?php echo e(route('jo_image_upload')); ?>",
                            method:"POST",
                            data: new FormData($("#form_image")[0]),
                            dataType:'JSON',
                            contentType: false,
                            cache: false,
                            processData: false,
                            success: function(data, textStatus, jqXHR){
                                swal("Judicial Officer"+operated+" Successfully","","success");
                                $("form").trigger("reset");   
                                $(".select2").val('').trigger('change');
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                if(jqXHR.status!=422 && jqXHR.status!=400){
                                    swal("Failed to "+operation+" Judicial Officer",errorThrown,"error");
                                }
                                else{
                                    msg = "";
                                    $.each(jqXHR.responseJSON.errors, function(key,value) {
                                        msg+=value+"\n";						
                                    });

                                    swal("Failed to "+operation+" Judicial Officer",msg,"error");
                                }
                            }
                        })
                        // image upload :: END
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if(jqXHR.status!=422 && jqXHR.status!=400){
                        swal("Failed to "+operation+" Judicial Officer",errorThrown,"error");
                    }
                    else{
                        msg = "";
                        $.each(jqXHR.responseJSON.errors, function(key,value) {
                            msg+=value+"\n";						
                        });

                        swal("Failed to "+operation+" Judicial Officer",msg,"error");
                    }
                }
            })
        }   


        $(".submit").click(function(){
            ajax_data('add');
        })  

        $("#update").click(function(){
            ajax_data('update');
        })    
        
   });

</script>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/jo_entry_form/index.blade.php ENDPATH**/ ?>