 <?php $__env->startSection('title', 'JudicialOfficers'); ?>
<?php $__env->startSection('page_heading'); ?> JudicialOfficers <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
<!-- Bootstrap Boilerplate... -->
<div class="col-sm-12">
	<div id="info-panel" class="panel panel-default">
		<!-- IIIIIIIIIII -->
		<div id="info-panel-heading" class="panel-heading">Profile</div>
		<!-- IIIIIIIIIII -->
		<div class="panel-body">
			
			<!-- New Task Form -->
			<div class="row">
				<label for="officer_name" class="col-md-4 control-label">Name</label>

				<div class="col-md-6">	<?php echo e($profile[0]['officer_name']); ?>	</div>
			</div>

			<div class="row">
				<label for="jo_code" class="col-md-4 control-label">JO Code</label>

				<div class="col-md-6">	<?php echo e($profile[0]['jo_code']); ?>	</div>
			</div>
				
			<div class="row">
				<label for="guardian_name" class="col-md-4 control-label">Guardian Name </label>

				<div class="col-md-6">	<?php echo e($profile[0]['guardian_name']); ?>	</div>
			</div>

			<div class="row">
				<label for="gurdian_relation" class="col-md-4 control-label">Relationship With Guardian</label>

				<div class="col-md-6">	<?php echo e($profile[0]['gurdian_relation']); ?>	</div>
			</div>

				
				
				
			<div class="row">
				<label for="date_of_birth" class="col-md-4 control-label">Date of Birth</label>

				<div class="col-md-6">	<?php echo e($profile[0]['date_of_birth']); ?>	</div>
			</div>

			<div class="row">
				<label for="date_of_joining" class="col-md-4 control-label">Date of Joining</label>

				<div class="col-md-6">	<?php echo e($profile[0]['date_of_joining']); ?>	</div>
			</div>

			<div class="row">
				<label for="date_of_confirmation" class="col-md-4 control-label">Date of Confirmation</label>
				
				<div class="col-md-6">	<?php echo e($profile[0]['date_of_confirmation']); ?>	</div>
			</div>

			<div class="row">
				<label for="date_of_retirement" class="col-md-4 control-label">Date of Retirement</label>

				<div class="col-md-6">	<?php echo e($profile[0]['date_of_retirement']); ?>	</div>
			</div>

			<div class="row">
				<label for="present_address" class="col-md-4 control-label">Present Address</label>

				<div class="col-md-6">	<?php echo e($profile[0]['present_address']); ?>	</div>
			</div>

			<div class="row">
				<label for="permanent_address" class="col-md-4 control-label">Permanent Address</label>

				<div class="col-md-6">	<?php echo e($profile[0]['permanent_address']); ?>	</div>
			</div>

			<div class="row">
				<label for="hometown" class="col-md-4 control-label">Hometown</label>

				<div class="col-md-6">	<?php echo e($profile[0]['hometown']); ?>	</div>
			</div>

			<div class="row">
				<label for="district_name" class="col-md-4 control-label">Home District Name</label>

				<div class="col-md-6">	<?php echo e($profile[0]['district_name']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="state_name" class="col-md-4 control-label">State Name</label>

				<div class="col-md-6">	<?php echo e($profile[0]['state_name']); ?>	</div>
			</div>
						
			<div class="row">
				<label for="category_id" class="col-md-4 control-label">Category</label>

				<div class="col-md-6">	<?php echo e($profile[0]['category_id']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="religion_name" class="col-md-4 control-label">Religion</label>

				<div class="col-md-6">	<?php echo e($profile[0]['religion_name']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="recruitment_batch_desc" class="col-md-4 control-label">Recruitment Batch</label>

				<div class="col-md-6">	<?php echo e($profile[0]['recruitment_batch_desc']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="aadhaar_no" class="col-md-4 control-label">Aadhaar No</label>

				<div class="col-md-6">	<?php echo e($profile[0]['aadhaar_no']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="pan_no" class="col-md-4 control-label">PAN</label>
				
				<div class="col-md-6">	<?php echo e($profile[0]['pan_no']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="gpf_no" class="col-md-4 control-label">GPF No.</label>

				<div class="col-md-6">	<?php echo e($profile[0]['gpf_no']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="blood_group" class="col-md-4 control-label">Blood Group</label>

				<div class="col-md-6">	<?php echo e($profile[0]['blood_group']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="identification_mark" class="col-md-4 control-label">Identification Mark</label>

				<div class="col-md-6">	<?php echo e($profile[0]['identification_mark']); ?>	</div>
			</div>
											
			<div class="row">
				<label for="mobile_no_1" class="col-md-4 control-label">Mobile No</label>

				<div class="col-md-6">	<?php echo e($profile[0]['mobile_no_1']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="mobile_no_2" class="col-md-4 control-label">Mobile No 2</label>

				<div class="col-md-6">	<?php echo e($profile[0]['mobile_no_2']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="mobile_no_3" class="col-md-4 control-label">Mobile No 3</label>

				<div class="col-md-6">	<?php echo e($profile[0]['mobile_no_3']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="email_id_1" class="col-md-4 control-label">Email</label>

				<div class="col-md-6">	<?php echo e($profile[0]['email_id_1']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="email_id_1" class="col-md-4 control-label">Email 2</label>

				<div class="col-md-6">	<?php echo e($profile[0]['email_id_1']); ?>	</div>
			</div>
							
			<div class="row">
				<label for="email_id_3" class="col-md-4 control-label">Email 3</label>

				<div class="col-md-6">	<?php echo e($profile[0]['email_id_3']); ?>	</div>
			</div>

							
			<div class="row">
				<label for="gender" class="col-md-4 control-label">Gender</label>

				<div class="col-md-6">	<?php echo e($profile[0]['gender']); ?>	</div>
			</div>

		</div>
	</div>

</div>


<?php $__env->stopSection(); ?> <?php echo $__env->make('layouts.1_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?> <?php echo $__env->yieldContent('1_column_content'); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('meta'); ?>
##parent-placeholder-cb030491157b26a570b6ee91e5b068d99c3b72f6##
<meta name="_token" content="<?php echo csrf_token(); ?>" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('end_scripts'); ?> ##parent-placeholder-36ee17f40f3980c360dd4f0dee7896f1cfc0384a##


<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\judicial-service\resources\views/profile/index.blade.php ENDPATH**/ ?>