 <?php $__env->startSection('title', 'JudicialOfficers'); ?>
<?php $__env->startSection('page_heading'); ?> JudicialOfficers <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
<!-- Bootstrap Boilerplate... -->
<div id="info-panel" class="panel panel-default">
	<!-- IIIIIIIIIII -->
	<div id="info-panel-heading" class="panel-heading">ADD NEW</div>
	<!-- IIIIIIIIIII -->
	<div class="panel-body">

		<!-- New Task Form -->
		<form id="info-form" class="form-horizontal" role="form" method="POST"
			action="<?php echo e(url('/admin/JudicialOfficer')); ?>">
			<?php echo e(csrf_field()); ?>

			<input type="hidden" id="judicial_officer_id">
			<div id="officer_name-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="officer_name" class="col-md-4 control-label">Judicial Officer</label>

				<div class="col-md-6">
					<input id="officer_name" type="text"
						class="form-control info-form-control" name="officer_name"> <span
						id="officer_name-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="officer_name-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>

			<div id="guardian_name-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="guardian_name" class="col-md-4 control-label">Guardian </label>

				<div class="col-md-6">
					<input id="guardian_name" type="text"
						class="form-control info-form-control" name="guardian_name"> <span
						id="guardian_name-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="guardian_name-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>

			<div id="gurdian_relation-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="gurdian_relation" class="col-md-4 control-label">Relation</label>

				<div class="col-md-6">
					<input id="gurdian_relation" type="text"
						class="form-control info-form-control" name="gurdian_relation"> <span
						id="gurdian_relation-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="gurdian_relation-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>

			<div id="jo_code-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="jo_code" class="col-md-4 control-label">JO Code</label>

				<div class="col-md-6">
					<input id="jo_code" type="text"
						class="form-control info-form-control" name="jo_code"> <span
						id="jo_code-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="jo_code-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
			
			
			<div id="date_of_birth-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="date_of_birth" class="col-md-4 control-label">Date of Birth</label>
				<div class="col-md-6">
					<input id="date_of_birth" type="text"
						class="form-control info-form-control js_date" name="date_of_birth"> <span
						id="date_of_birth-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="date_of_birth-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
					<?php $__env->startSection('end_scripts_1'); ?>
					<script type="text/javascript">
					$(function(){
						$(".js_date").datepicker({
							format: 'DD-MMM-YYYY',
							showTodayButton:true,
							showClear:true,
						});
					});
					</script>
					<?php $__env->stopSection(); ?>
				</div>
			</div>

			<div id="date_of_joining-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="date_of_joining" class="col-md-4 control-label">Date of Joining</label>
				<div class="col-md-6">
					<input id="date_of_joining" type="text"
						class="form-control info-form-control js_date" name="date_of_joining"> <span
						id="date_of_joining-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="date_of_joining-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>

			<div id="date_of_confirmation-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="date_of_confirmation" class="col-md-4 control-label">Date of Confirmation</label>
				<div class="col-md-6">
					<input id="date_of_confirmation" type="text"
						class="form-control info-form-control js_date" name="date_of_confirmation"> <span
						id="date_of_confirmation-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="date_of_confirmation-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
			<div id="<div id="date_of_retirement-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="date_of_retirement" class="col-md-4 control-label">Date of Retirement</label>
				<div class="col-md-6">
					<input id="date_of_retirement" type="text"
						class="form-control info-form-control js_date" name="date_of_retirement"> <span
						id="date_of_retirement-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="date_of_retirement-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
			<div id="present_address-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="present_address" class="col-md-4 control-label">Present Address</label>
				<div class="form-group">
				
					<div class="col-md-6">
							<textarea class="form-control" rows="4" id="present_address"></textarea>
							<strong id="present_address-strong" class="our-error-message-strong"></strong>
							<!-- IIIIIIIIIII -->
						</span>
						</div>
				</div>
			</div>
			<div id="permanent_address-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label><input type="checkbox" value="">Same as Above</label>
				<label for="permanent_address" class="col-md-4 control-label">Permanent Address</label>
				<div class="form-group">
				
					<div class="col-md-6">
							<textarea class="form-control" rows="4" id="permanent_address"></textarea>
							<strong id="permanent_address-strong" class="our-error-message-strong"></strong>
							<!-- IIIIIIIIIII -->
						</span>
						</div>
				</div>
			</div>
			<div id="hometown-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="hometown" class="col-md-4 control-label">Hometown</label>

				<div class="col-md-6">
					<input id="hometown" type="text"
						class="form-control info-form-control" name="hometown"> <span
						id="hometown-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="hometown-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>

			<div id="district_name-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="district_name" class="col-md-4 control-label">Home District Name</label>
					<div class="col-md-6">
						<select id="district_name" class="form-control info-form-control"
									name="district_name"> 
									<option value="">Select District Name</option>
									<?php echo $__env->make('districts.district_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
						</select>
					</div>
				</div>
                        
                <div id="state_name-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
					<label for="state_name" class="col-md-4 control-label">State Name</label>

					<div class="col-md-6">
							<select id="state_name" class="form-control info-form-control"
										name="state_name"> 
										<option value="">Select State Name</option>
										<?php echo $__env->make('states.state_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
							</select>
						</div>
				</div>
                        
                        <div id="caste_name-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="caste_name" class="col-md-4 control-label">Caste</label>

				<div class="col-md-6">
					<select id="caste_name" class="form-control info-form-control"
								name="caste_name"> 
								<option value="">Select Your Caste</option>
								<?php echo $__env->make('castes.caste_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
					</select>
				</div>
			</div>
                        
             <div id="religion_name-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="religion_name" class="col-md-4 control-label">Religion</label>
				<div class="col-md-6">
					<select id="religion_name" class="form-control info-form-control"
								name="religion_name"> 
								<option value="">Select Your Religion</option>
								<?php echo $__env->make('religions.religion_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
					</select>
				</div>
			</div>
                        
            <div id="recruitment_batch_desc-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="recruitment_batch_desc" class="col-md-4 control-label">Recruitment Batch</label>

				<div class="col-md-6">
					<select id="recruitment_batch_desc" class="form-control info-form-control"
								name="recruitment_batch_desc"> 
								<option value="">Select Recruitment Batch Year</option>
								<?php echo $__env->make('recruitmentbatches.recruitmentbatch_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
					</select>
				</div>
			</div>
                        
                        <div id="aadhaar_no-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="aadhaar_no" class="col-md-4 control-label">Aadhaar No</label>

				<div class="col-md-6">
					<input id="aadhaar_no" type="text"
						class="form-control info-form-control" name="aadhaar_no"> <span
						id="aadhaar_no-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="aadhaar_no-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
                        
                        <div id="pan_no-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="pan_no" class="col-md-4 control-label">PAN</label>

				<div class="col-md-6">
					<input id="pan_no" type="text"
						class="form-control info-form-control" name="pan_no"> <span
						id="pan_no-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="pan_no-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
                        
                        <div id="pf_no-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="pf_no" class="col-md-4 control-label">PF No.</label>

				<div class="col-md-6">
					<input id="pf_no" type="text"
						class="form-control info-form-control" name="pf_no"> <span
						id="pf_no-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="pf_no-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
                        
                        <div id="blood_group-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="blood_group" class="col-md-4 control-label">Blood Group</label>

				<div class="col-md-6"><select id="blood_group" class="form-control info-form-control"
							name="blood_group"> 
							<option value="">Select your option</option>
							<option value="A+">A+</option>
							<option value="A-">A-</option>
							<option value="B+">B+</option>
							<option value="B-">B-</option>
							<option value="O+">O+</option>							
							<option value="O-">O-</option>
							<option value="AB+">AB+</option>							
							<option value="AB-">AB-</option>
				</select>
					
				</div>
			</div>
                        
                        <div id="identification_marks_1-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="identification_marks_1" class="col-md-4 control-label">Identification Marks 1</label>

				<div class="col-md-6">
					<input id="identification_marks_1" type="text"
						class="form-control info-form-control" name="identification_marks_1"> <span
						id="identification_marks_1-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="identification_marks_1-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
                        
                        <div id="identification_marks_2-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="identification_marks_1" class="col-md-4 control-label">Identification Marks 2</label>

				<div class="col-md-6">
					<input id="identification_marks_2" type="text"
						class="form-control info-form-control" name="identification_marks_2"> <span
						id="identification_marks_2-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="identification_marks_2-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
                        
                        <div id="mobile_no_1-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="mobile_no_1" class="col-md-4 control-label">Mobile No</label>

				<div class="col-md-6">
					<input id="mobile_no_1" type="text"
						class="form-control info-form-control" name="mobile_no_1"> <span
						id="mobile_no_1-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="mobile_no_1-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
                        
                        <div id="mobile_no_2-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="mobile_no_2" class="col-md-4 control-label">Mobile No 2</label>

				<div class="col-md-6">
					<input id="mobile_no_2" type="text"
						class="form-control info-form-control" name="mobile_no_2"> <span
						id="mobile_no_2-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="mobile_no_2-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
                        
                        <div id="mobile_no_3-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="mobile_no_3" class="col-md-4 control-label">Mobile No 3</label>

				<div class="col-md-6">
					<input id="mobile_no_3" type="text"
						class="form-control info-form-control" name="mobile_no_3"> <span
						id="mobile_no_3-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="mobile_no_3-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
                        
                        <div id="email_id_1-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="email_id_1" class="col-md-4 control-label">Email</label>

				<div class="col-md-6">
					<input id="email_id_1" type="text"
						class="form-control info-form-control" name="email_id_1"> <span
						id="email_id_1-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="email_id_1-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
                        
                        <div id="email_id_2-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="email_id_1" class="col-md-4 control-label">Email 2</label>

				<div class="col-md-6">
					<input id="email_id_2" type="text"
						class="form-control info-form-control" name="email_id_2"> <span
						id="email_id_2-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="email_id_2-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
                        
                        <div id="email_id_3-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="email_id_3" class="col-md-4 control-label">Email 3</label>

				<div class="col-md-6">
					<input id="email_id_3" type="text"
						class="form-control info-form-control" name="email_id_3"> <span
						id="email_id_3-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="email_id_3-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>

                        
            <div id="reporting_officer_name-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="reporting_officer_name" class="col-md-4 control-label">Reporting Officer </label>

				<div class="col-md-6"><select id="jo_reviewing" class="form-control info-form-control"
							name="jo_reviewing"> 
							<option value="">Select reviewing authority</option>
							<?php echo $__env->make('judicial_officers.judicial_officer_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                    </select>
				</div>
			</div>
                        
                        <div id="reviewing_officer_name-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="reviewing_officer_name" class="col-md-4 control-label">Reviewing Officer </label>

				<div class="col-md-6">
					<select id="jo_reporting" class="form-control info-form-control"
								name="jo_reporting"> 
								<option value="">Select reporting authority</option>
								<?php echo $__env->make('judicial_officers.judicial_officer_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
					</select>
				</div>
			</div>

			<div id="info-panel-buttons" class="form-group hide">
				<div class="col-md-6 col-md-offset-4">
					<button id="add-button" type="submit"
						class="btn btn-primary add-button info-form-button">
						<i class="fa fa-btn fa-plus-circle"></i> Add New Judicial Officer
					</button>
					<button id="save-button" type="submit"
						class="btn btn-warning save-button info-form-button">
						<i class="fa fa-btn fa-floppy-o"></i> Save
					</button>
					<button id="delete-confirm-button" type="submit"
						class="btn btn-danger delete-confirm-button info-form-button">
						<i class="fa fa-btn fa-trash-o"></i> Confirm Delete
					</button>
					<button id="close-button" type="submit"
						class="btn btn-info close-button info-form-button">
						<i class="fa fa-btn fa-times-circle"></i> Close
					</button>
				</div>
			</div>
			
			<div id="message-div" class="form-group">
				<div class="col-md-6 col-md-offset-4">
					<div id="message-success-div"
						class="alert alert-success alert-dismissible success-error-message"
						role="alert">
						<button type="button" class="close" data-hide="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<span id="message-success-span"></span>
					</div>
					<div id="message-error-div"
						class="alert alert-danger alert-dismissible success-error-message"
						role="alert">
						<button type="button" class="close" data-hide="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<span id="message-error-span"></span>
					</div>
				</div>
			</div>

		</form>
	</div>
</div>

<div id="datatable-panel" class="panel panel-default">
	<div id="datatable-panel-heading" class="panel-heading clearfix">
		<div class="panel-title pull-left">Judicial Officer Master</div>
		<div class="pull-right">
			<button id="add-new-button" type="submit" class="btn btn-primary add-new-button">
				<i class="fa fa-plus-circle"></i> Add New
			</button>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-striped notice-types-table"
				id="datatable-table" style="width: 100%;">

				<!-- Table Headings -->
				<thead>
					<tr>
						<th></th>
						<th>Officer Name</th>
						<th>Guardien Name</th>						
						<th>Relation</th>							
						<th>JO Code</th>	
						<th>Action</th>
						<th></th>
						<th></th>
					</tr>

				</thead>
				<tbody></tbody>
				<!-- Table Footer -->
				<tfoot>
					<tr>
						<th></th>
						<th>Officer Name</th>
						<th>Guardien Name</th>						
						<th>Relation</th>							
						<th>JO Code</th>							
						<th>Action</th>
						<th></th>
						<th></th>
					</tr>
				</tfoot>
			</table>
		</div>

	</div>
</div>
<div id="test-div"></div>

<?php $__env->stopSection(); ?> <?php echo $__env->make('layouts.1_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?> <?php echo $__env->yieldContent('1_column_content'); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('meta'); ?>
##parent-placeholder-cb030491157b26a570b6ee91e5b068d99c3b72f6##
<meta name="_token" content="<?php echo csrf_token(); ?>" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('end_scripts'); ?> ##parent-placeholder-36ee17f40f3980c360dd4f0dee7896f1cfc0384a##

<script type="text/javascript">
var table="";
$(function() {
	table = $('#datatable-table').DataTable({
		"processing": true,
		"serverSide": true,
		"ajax":{
			url:"<?php echo e(url('JudicialOfficer')); ?>-Datatable-Server-Side",
			dataSrc:"judicial_officers"
		},

		"columnDefs": 
			[
				{ className: "table-text", "targets": "_all" },
				{
					"targets": -3,
					"data": null,
					"searchable": false,
					"sortable":false,
					"defaultContent": '<button type="submit" class="btn btn-info view-button"><i class="fa fa-info"></i> View</button>',
				},
				{
					"targets": -2,
					"data": null,
					"searchable": false,
					"sortable":false,
					"defaultContent": '<button type="submit" class="btn btn-warning edit-button"><i class="fa fa-pencil"></i> Edit</button>',
				},
				{
					"targets": -1,
					"data": null,
					"searchable": false,
					"sortable":false,
					"defaultContent": '<button type="submit" class="btn btn-danger delete-button"><i class="fa fa-trash"></i> Delete</button>',
				}
			],
		"columns": 
			[
				{
					"data": null,
					"defaultContent": "",
					"searchable": false,
					"orderable": false,
				},
				{
					"data": "officer_name",
				},
				{
					"data": "guardian_name",
				},
				{
					"data": "gurdian_relation",
				},												
				{
					"data": "jo_code",
				},				
				{
					"data": null
				},
				{
					"data": null
				},
				{
					"data": null
				},
			],
		"order": [[ 1, 'asc' ]]
	});

	$('#add-button').click(function(e){
		e.preventDefault();
		send_ajax_and_set_errors_exceptions_success("add");
	});
	$('#close-button').click(function(e){
		e.preventDefault();
		reset_info(true);
		scrollToElement($('#datatable-panel'));
	});
	$('#save-button').click(function(e){
		e.preventDefault();
		send_ajax_and_set_errors_exceptions_success("save");
	});
	$('#delete-confirm-button').click(function(e){
		e.preventDefault();
		send_ajax_and_set_errors_exceptions_success("delete-confirm");
	});


	$('#add-new-button').click(function(){
		reset_info(true);
		scrollToElement($('#info-panel'));
	});

	table.on( 'order.dt search.dt draw.dt', function () {
		table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			cell.innerHTML = table.page()*table.page.len()+(i+1);
		});
	});
	//}).draw();

	table.on( 'draw.dt', function () {
		$('.view-button').click(function(){
			var data = table.row( $(this).parents('tr') ).data();
			
			view_data( data );
			make_form_readonly(true);
			show_button("close");
			scrollToElement($('#info-panel'));
		});
		$('.edit-button').click(function(){
			var data = table.row( $(this).parents('tr') ).data();
			view_data( data );

			
			
			
			show_button("close");
			show_button("save");
			make_active_button("save");
			scrollToElement($('#info-panel'));

			$("#file_prefix").attr("readonly","readonly");
		});
		$('.delete-button').click(function(){
			var data = table.row( $(this).parents('tr') ).data();
			view_data( data );
			make_form_readonly(true);
			show_button("close");
			show_button("delete-confirm");
			make_active_button("delete-confirm");
			scrollToElement($('#info-panel'));
		});
	});
});

$(function(){
	reset_info(false);
	scrollToElement($('#datatable-panel'));
	//$('#datatable-panel').scrollIntoView();
});
$(function(){
    $("[data-hide]").on("click", function(){
        $(this).closest("." + $(this).attr("data-hide")).hide();
    });
});
function reset_info(reset_form_forced){
	clear_form(reset_form_forced);
	show_button("add");
	$("#info-panel-heading").html("ADD NEW");
}
function view_data(data){
	clear_form(true);
	populate_form(data);
}
function clear_form(reset_form_forced){
	info_panel_heading_clear();
	make_form_readonly(false);
	if(reset_form_forced){
		info_form_reset();
	}
	errors_reset();
	info_buttons_hide();
	messages_hide();
}
function info_panel_heading_clear(){
	$("#info-panel-heading").html("");
}
function make_form_readonly(make_readonly){
	if(make_readonly){
		$('#info-form input').attr('readonly', 'readonly');
		$('#info-form textarea').attr('readonly', 'readonly');
		$('#info-form select').attr('readonly', 'readonly');
	}
	else{
		$('#info-form input').removeAttr('readonly');
		$('#info-form textarea').removeAttr('readonly');
		$('#info-form select').removeAttr('readonly');
	}
}

function info_form_reset(){
	$("#info-form").trigger("reset");
}
function errors_reset(){
	$(".our-form-group").removeClass("has-error");
	$(".our-help-block").hide();
	$(".our-error-message-strong").html("");
}
function info_buttons_hide(){
	$(".info-form-button").hide();
	$(".info-form-button").attr("disabled","disabled");
	$(".info-form-button").removeClass("active");
}

function messages_hide(){
	$(".success-error-message").hide();
	$("#message-div").hide();
}
function show_message_div(type,msg){
	$("#message-"+type+"-span").html(msg);
	$("#message-"+type+"-div").show();
	$("#message-div").show();
}
function show_error(field,msg){
	$("#"+field+"-strong").html(msg);
	$("#"+field+"-span").show();
	$("#"+field+"-group").addClass("has-error");
}
function populate_form(data){
	$("#info-panel-heading").html("Displaying record of JudicialOfficer: <strong>"+data.type+"</strong>");

	$("#judicial_officer_id").val(data.id);
	
	$("#officer_name").val(data.officer_name);

	$("#guardian_name").val(data.guardian_name);

	$("#gurdian_relation").val(data.gurdian_relation);
	
	$("#jo_code").val(data.jo_code);

	$("#date_of_birth").val(data.date_of_birth);
	
	$("#date_of_joining").val(data.date_of_joining);

	$("#date_of_confirmation").val(data.date_of_confirmation);

	$("#date_of_retirement").val(data.date_of_retirement);

	$("#present_address").val(data.present_address);

	$("#permanent_address").val(data.permanent_address);

	$("#hometown").val(data.hometown);

	$("#district_name").val(data.home_district_id);	

	$("#state_name").val(data.home_state_id);

	$("#caste_name").val(data.caste_id);

	$("#religion_name").val(data.religion_id);

	$("#recruitment_batch_desc").val(data.recruitment_batch_id);

	$("#aadhaar_no").val(data.aadhaar_no);

	$("#pan_no").val(data.pan_no);

	$("#pf_no").val(data.pf_no);

	$("#blood_group").val(data.blood_group);

	$("#identification_marks_1").val(data.identification_marks_1);
	$("#identification_marks_2").val(data.identification_marks_2);

	$("#mobile_no_1").val(data.mobile_no_1);
	$("#mobile_no_2").val(data.mobile_no_2);
	$("#mobile_no_3").val(data.mobile_no_3);

	$("#email_id_1").val(data.email_id_1);
	$("#email_id_2").val(data.email_id_2);
	$("#email_id_3").val(data.email_id_3);

	//$("#photo").val(data.photo);
	
	$("#reporting_officer_name").val(data.reporting_officer_id);
	$("#reviewing_officer_name").val(data.reviewing_officer_id);



	
}
function show_button(type){
	$("#"+type+"-button").show();
	$("#"+type+"-button").removeAttr("disabled");
	
	$("#info-panel-buttons").removeClass("hide");
	//$("#"+type+"-button").removeClass("disabled");
}
function make_active_button(type){
	$("#"+type+"-button").addClass("active");
}
function scrollToElement(ele) {
// 	alert(ele.html());
// 	$(window).scrollTop(ele.offset().top-60).scrollLeft(ele.offset().left);
    $('html, body').animate({
        scrollTop: ele.offset().top-60,
    }, 1000);
}
$(function(){
	$.ajaxSetup({
		headers: {
			'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
		}
	});
});
function send_ajax_and_set_errors_exceptions_success(type){
	var formData = {
		posting_judicial_officer: $('#posting_judicial_officer').val()
						
	};
	ajax_url="";
	operation="";
	operated="";
	request_type="POST";
	if(type=="add"){
		//request_type="POST";
		formData["_method"]="POST";
		ajax_url="<?php echo e(action('JudicialOfficerController@store')); ?>";
       

		formData["posting_judicial_officer"]=$("#posting_judicial_officer").val();

		operation="add";
		operated="added";
	}
	else if(type=="save"){
		//request_type="PUT";
		formData["_method"]="PUT";
		
		ajax_url="<?php echo e(action('JudicialOfficerController@update','')); ?>"+"/"+$("#judicial_officer_id").val();
		formData["id"]=$("#judicial_officer_id").val();

		operation="update";
		operated="updated";
	}
	else if(type=="delete-confirm"){
		formData["_method"]="DELETE";
		formData["id"]=$("#judicial_officer_id").val();

		ajax_url="<?php echo e(action('JudicialOfficerController@destroy','')); ?>"+"/"+$("#judicial_officer_id").val();
		

		operation="delete";
		operated="deleted";
	}
	$.ajax({
		type: request_type,
		url: ajax_url,
		data: formData,
		dataType: 'json',
		success: function (data, textStatus, jqXHR) {
			reset_info(true);
			msg="<strong>SUCCESS: </strong>";
			if(!(data.judicial_officer===null) && data.judicial_officer.hasOwnProperty('posting_judicial_officer')){
				
				msg+="Judicial Officer: <strong>"+data.judicial_officer.posting_judicial_officer+"</strong> successfully "+operated+".";
			}
			else{
				//delete case
				if(!(data.judicial_officer===null) && data.judicial_officer>=1){
					msg+="Judicial Officer: <strong>"+formData.posting_judicial_officer+"</strong> successfully "+operated+".";
				}
				else{
					msg+="Judicial Officer already "+operated+"!";
				}
			}
			show_message_div("success",msg);
			table.ajax.reload();

			
			scrollToElement($('#message-div'));
		},
		error: function (jqXHR, textStatus, errorThrown) {
			
			errors_reset();
			messages_hide();
			msg="<strong>Failed to "+operation+" data.</strong><br/>";
			if(jqXHR.status!=422 && jqXHR.status!=400){
				msg+="<strong>"+jqXHR.status+": "+errorThrown+"</strong>";
			}
			else{
				if(jqXHR.responseJSON.hasOwnProperty('exception')){
					msg+="Exception: <strong>"+jqXHR.responseJSON.exception_message+"</strong>";
				}
				else{
					msg+="Error(s):<strong><ul>";
					$.each(jqXHR.responseJSON.errors, function(key,value) {
						msg+="<li>"+value+"</li>";
						show_error(key,value);
						
					});
					msg+="</ul></strong>";
					
				}
			}
			show_message_div("error",msg);
			scrollToElement($('#info-panel'));
		}
	});
}
</script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\Judicial-Service\resources\views/judicial_officers/index.blade.php ENDPATH**/ ?>