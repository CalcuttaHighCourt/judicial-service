 <?php $__env->startSection('title', 'States'); ?>
<?php $__env->startSection('page_heading'); ?> States <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
<div id="info-panel" class="panel panel-default">
   <div class="row">
      <div class="col-sm-3">
         <!--left col-->
      </div>
      <!--/col-3-->
      <div class="col-sm-9">
         <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#basic_details"><h4>Basic Details</h4></a></li>
            <li><a data-toggle="tab" href="#contact_details"><h4>Contact Details</h4></a></li>
            <li><a data-toggle="tab" href="#qualification_details"><h4>Qualification Detals</h4></a></li>
            <li><a data-toggle="tab" href="#posting_details"><h4>Posting Details</h4></a></li>
            <li><a data-toggle="tab" href="#upload_photo"><h4>Upload Photo</h4></a></li>
         </ul>
         <div class="tab-content">
            <div class="tab-pane active" id="basic_details">
               <form class="form" action="##" method="">                 
                  <div class="form-group">
                     <div class="col-xs-6">
                        <label for="jo_name">
                           <h4>Name</h4>
                        </label>
                        <input type="text" class="form-control" name="jo_name" id="jo_name" placeholder="Judicial Officer Name">
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-xs-6">
                        <label for="jo_code">
                           <h4>JO Code</h4>
                        </label>
                        <input type="text" class="form-control" name="jo_code" id="jo_code" placeholder="Judicial Officer Code">
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-xs-6">
                        <label for="guardian_name">
                           <h4>Guardian's name</h4>
                        </label>
                        <input type="text" class="form-control" name="guardian_name" id="guardian_name" placeholder="Judicial Officer Guardian Name">
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-xs-6">
                        <label for="guardian_relationship">
                           <h4>Guardian Relationship</h4>
                        </label>
                        <input type="text" class="form-control" name="guardian_relationship" id="guardian_relationship" placeholder="Relationship with Guardian">
                     </div>
                  </div>                  
                  <div class="form-group">
                    <div class="col-xs-3">
                        <label for="dob">
                            <h4>Date of Birth</h4>
                        </label>
                        <input type="text" class="form-control date" name="dob" id="dob" placeholder="dd-mm-yyyy">
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-3">
                        <label for="doj">
                            <h4>Date of Joining</h4>
                        </label>
                        <input type="text" class="form-control date" name="doj" id="doj" placeholder="dd-mm-yyyy">
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-3">
                        <label for="doc">
                            <h4>Date of Confirmation</h4>
                        </label>
                        <input type="text" class="form-control date" name="doc" id="doc" placeholder="dd-mm-yyyy">
                    </div>
                 </div>  
                 <div class="form-group">
                    <div class="col-xs-3">
                        <label for="dor">
                            <h4>Date of Superannuation</h4>
                        </label>
                        <input type="text" class="form-control date" name="dor" id="dor" placeholder="dd-mm-yyyy">
                    </div>
                 </div>      
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="religion_id">
                            <h4>Religion</h4>
                        </label>
                        <select id="religion_id" class="form-control info-form-control select2" name="religion_id">
                            <option value="">Select an Option</option>
                            <?php echo $__env->make('religions.religion_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </select>
                    </div>
                 </div>
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="caste_id">
                            <h4>Caste</h4>
                        </label>
                        <select id="caste_id" class="form-control info-form-control select2" name="caste_id">
                            <option value="">Select an Option</option>
                            <?php echo $__env->make('castes.caste_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </select>
                    </div>
                 </div>
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="recruitment_batch_id">
                            <h4>Recruitment Batch</h4>
                        </label>
                        <select id="recruitment_batch_id" class="form-control info-form-control select2" name="recruitment_batch_id">
                            <option value="">Select an Option</option>
                            <?php echo $__env->make('recruitmentbatches.recruitmentbatch_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </select>
                    </div>
                 </div>
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="aadhar_no">
                            <h4>Aadhar No.</h4>
                        </label>
                        <input type="text" class="form-control" name="aadhar_no" id="aadhar_no" placeholder="Aadhar Card No.">
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="pan_no">
                            <h4>PAN No.</h4>
                        </label>
                        <input type="text" class="form-control" name="pan_no" id="pan_no" placeholder="PAN Card No.">
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="pf_no">
                            <h4>PF No.</h4>
                        </label>
                        <input type="text" class="form-control" name="pf_no" id="pf_no" placeholder="Profident Fund A/C No.">
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="blood_group">
                            <h4>Blood Group</h4>
                        </label>
                        <input type="text" class="form-control" name="blood_group" id="blood_group" placeholder="Blood Group">
                    </div>
                 </div>    
                 <div class="form-group">
                    <div class="col-xs-4">
                        <label for="identification_mark">
                            <h4>Identification Mark</h4>
                        </label>
                        <input type="text" class="form-control" name="identification_mark" id="identification_mark" placeholder="Identification Mark">
                    </div>
                 </div>
                 <label for="identification_mark_1">
                    <h4>&nbsp</h4>
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
                  <div class="text-center">
                     <div class="col-xs-12">
                        <br><br>
                        <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                        <button class="btn btn-lg btn-danger" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                     </div>
                  </div>
               </form>
            </div>
            <!--/tab-pane-->

            <div class="tab-pane" id="contact_details">
               <form class="form" action="##" method="post">
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="email_id_1">
                                <h4>Primary Email ID</h4>
                            </label>
                            <input type="email" class="form-control" name="email_id_1" id="email_id_1" placeholder="xyz@abc.com">
                        </div>
                    </div> 
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="email_id_2">
                                <h4>Secondary Email ID</h4>
                            </label>
                            <input type="email" class="form-control" name="email_id_2" id="email_id_2" placeholder="xyz@abc.com">
                        </div>
                    </div>  
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="email_id_3">
                                <h4>Alternative Email ID</h4>
                            </label>
                            <input type="email" class="form-control" name="email_id_3" id="email_id_3" placeholder="xyz@abc.com">
                        </div>
                    </div> 
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="ph_no_1">
                                <h4>Primary Contact No.</h4>
                            </label>
                            <input type="text" class="form-control" name="ph_no_1" id="ph_no_1" placeholder="First Phone No.">
                        </div>
                    </div>    
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="ph_no_2">
                                <h4>Secondary Contact No.</h4>
                            </label>
                            <input type="text" class="form-control" name="ph_no_2" id="ph_no_2" placeholder="Second Phone No.">
                        </div>
                    </div>    
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="ph_no_3">
                                <h4>Alternative Contact No.</h4>
                            </label>
                            <input type="text" class="form-control" name="ph_no_3" id="ph_no_3" placeholder="Third Phone No.">
                        </div>
                    </div>    
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="home_state">
                                <h4>Home State</h4>
                            </label>
                            <select id="home_state" class="form-control info-form-control select2" name="home_state">
                                <option value="">Select an Option</option>
                                    <?php echo $__env->make('states.state_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="home_state">
                                <h4>Home District</h4>
                            </label>
                            <select id="home_district" class="form-control info-form-control select2" name="home_district">
                                <option value="">Select an Option</option>
                                <?php echo $__env->make('districts.district_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="home_town">
                                <h4>Home Town</h4>
                            </label>
                            <input type="text" class="form-control" id="home_town" placeholder="Home Town Name">
                        </div>
                    </div>                                 
                    <div class="form-group">
                        <div class="col-xs-6">
                        <label for="permanent_address">
                            <h4>Permanent Address</h4>
                        </label>
                        <textarea class="form-control" name="permanent_address" id="permanent_address" placeholder="Permanent Address"></textarea>
                        </div>
                    </div>                  
                    <div class="form-group">
                        <div class="col-xs-6">
                            <label for="current_address">
                                <h4>Current Address</h4>
                            </label>
                            <input class="form-check-input" type="checkbox" value="" id="same_address">
                            <label class="form-check-label" for="defaultCheck1">
                              Same as Permanent Address
                            </label>
                            <textarea class="form-control" name="current_address" id="current_address" placeholder="Current Address"></textarea>
                        </div>
                    </div>    
                  <div class="text-center">                
                     <div class="col-xs-12">
                            <br><br>
                        <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                        <button class="btn btn-lg btn-danger" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                     </div>
                  </div>
               </form>
            </div>
            <!--/tab-pane-->

            <div class="tab-pane" id="qualification_details">
               <form class="form" action="##" method="post">
                    <div class="form-group">
                        <div class="col-xs-5">
                            <label for="degree_id">
                                <h4>Degree</h4>
                            </label>
                            <select id="degree_id" class="form-control info-form-control select2" name="degree_id">
                                <option value="">Select an Option</option>
                                <?php echo $__env->make('qualifications.qualification_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-5">
                            <label for="dop">
                                <h4>Date of Passing</h4>
                            </label>
                            <input type="text" class="form-control date" name="dop" id="dop" placeholder="dd-mm-yyyy">                            
                        </div>
                    </div>   
                    <div class="form-group">
                        <div class="col-xs-2">
                            <br><br>
                            <img src="<?php echo e(asset('images/details_open.png')); ?>">
                        </div>
                    </div>                    
                    <div class="text-center">                
                        <div class="col-xs-12">
                            <br><br>
                            <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                            <button class="btn btn-lg btn-danger" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                        </div>
                    </div>
               </form>
            </div>            
         <!--/tab-pane-->

         <div class="tab-pane" id="posting_details">
                <form class="form" action="##" method="post">
                    <div class="form-group">
                        <div class="col-xs-3">
                            <label for="posting_from_date">
                                <h4>From Date</h4>
                            </label>
                            <input type="text" class="form-control date" name="posting_from_date" id="posting_from_date" placeholder="dd-mm-yyyy">                            
                        </div>
                    </div>  
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="designation_id">
                                <h4>Designation</h4>
                            </label>
                            <select id="designation_id" class="form-control info-form-control select2" name="designation_id">
                                <option value="">Select an Option</option>
                                <?php echo $__env->make('designations.designation_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            </select>
                        </div>
                    </div> 
                    <div class="form-group">
                        <div class="col-xs-3">
                            <label for="mode_id">
                                <h4>Posting Mode</h4>
                            </label>
                            <select id="mode_id" class="form-control info-form-control select2" name="mode_id">
                                <option value="">Select an Option</option>
                                <?php echo $__env->make('modes.mode_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            </select>
                        </div>
                    </div> 
                    <div class="form-group">
                        <div class="col-xs-3">
                            <label for="court_complex_id">
                                <h4>Court Complex</h4>
                            </label>
                            <select id="court_complex_id" class="form-control info-form-control select2" name="court_complex_id">
                                <option value="">Select an Option</option>
                                <?php echo $__env->make('court_complexes.court_complex_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            </select>
                        </div>
                    </div>                     
                    <div class="form-group">
                        <div class="col-xs-4">
                            <label for="court_id">
                                <h4>Court</h4>
                            </label>
                            <select id="court_id" class="form-control info-form-control select2" name="court_id">
                                <option value="">Select an Option</option>
                                <?php echo $__env->make('courts.court_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            </select>
                        </div>
                    </div>                     
                    <div class="form-group">
                        <div class="col-xs-3">
                            <label for="to_date">
                                <h4>To Date</h4>
                            </label>
                            <input type="text" class="form-control date" name="to_date" id="to_date" placeholder="dd-mm-yyyy">                            
                        </div>
                    </div>  
                    <div class="form-group">
                        <div class="col-xs-2">
                            <br><br>
                            <img src="<?php echo e(asset('images/details_open.png')); ?>">
                        </div>
                    </div>   
                     <div class="text-center">                                       
                         <div class="col-xs-12">
                             <br><br>
                             <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                             <button class="btn btn-lg btn-danger" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                         </div>
                     </div>
                </form>
          </div>
          <!--/tab-pane-->     

         <div class="tab-pane" id="upload_photo">
                <form class="form" action="##" method="post">
                     <div class="text-center">  
                        <img src="<?php echo e(asset('images/FacelessMan.png')); ?>" class="avatar img-circle img-thumbnail" alt="avatar" style="height:30%;width:20%">
                        <h6>Upload Photo...</h6>
                        <input type="file" class="text-center center-block file-upload">              
                         <div class="col-xs-12">
                             <br><br>
                             <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                             <button class="btn btn-lg btn-danger" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                         </div>
                     </div>
                </form>
          </div>
          <!--/tab-pane-->        
      </div>
      <!--/tab-content-->
   </div>
   <!--/col-9-->
</div>
<!--/row-->



<?php $__env->startSection('end_scripts'); ?> ##parent-placeholder-36ee17f40f3980c360dd4f0dee7896f1cfc0384a##

<script>
   $(document).ready(function() {      
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
   });
</script>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/jo_entry_form/index.blade.php ENDPATH**/ ?>