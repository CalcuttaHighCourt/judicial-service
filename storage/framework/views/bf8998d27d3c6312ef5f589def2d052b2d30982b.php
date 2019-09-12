 <?php $__env->startSection('title', 'Designations'); ?>
<?php $__env->startSection('page_heading'); ?> Designations <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
<!-- Bootstrap Boilerplate... -->
<div class="col-sm-12">

	<div id="info-panel" class="panel panel-default">
		<!-- IIIIIIIIIII -->
		<div id="info-panel-heading" class="panel-heading">ADD NEW</div>
		<!-- IIIIIIIIIII -->
		<div class="panel-body">

			<!-- New Task Form -->
			<form id="info-form" class="form-horizontal" role="form" method="POST"
				action="<?php echo e(url('/admin/Designation')); ?>">
				<?php echo e(csrf_field()); ?>

				<input type="hidden" id="designation_id">
				<div id="designation-group" class="form-group our-form-group">
					<!-- IIIIIIIIIII -->
					<label for="designation" class="col-md-4 control-label">Designation</label>

					<div class="col-md-6">
						<input id="designation_name" type="text"
							class="form-control info-form-control" name="designation_name"> <span
							id="designation-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
							<strong id="designation-strong" class="our-error-message-strong"></strong>
							<!-- IIIIIIIIIII -->
						</span>
					</div>
				</div>
				

				<div id="info-panel-buttons" class="form-group hide">
					<div class="col-md-6 col-md-offset-4">
						<button id="add-button" type="submit"
							class="btn btn-primary add-button info-form-button">
							<i class="fa fa-btn fa-plus-circle"></i> Add New Designation
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
			<div class="panel-title pull-left">Designation Master</div>
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
							<th>Designation</th>
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
							<th>Designation</th>
							<th>Action</th>
							<th></th>
							<th></th>
						</tr>
					</tfoot>
				</table>
			</div>

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
			url:"<?php echo e(url('Designation')); ?>-Datatable-Server-Side",
			dataSrc:"designations"
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
					"data": "designation_name",
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
	$("#info-panel-heading").html("Displaying record of Designation: <strong>"+data.type+"</strong>");

	$("#designation_id").val(data.id);
	
	$("#designation_name").val(data.designation_name);
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
		designation_name: $('#designation_name').val()
						
	};
	ajax_url="";
	operation="";
	operated="";
	request_type="POST";
	if(type=="add"){
		//request_type="POST";
		formData["_method"]="POST";
		ajax_url="<?php echo e(action('DesignationController@store')); ?>";      
		operation="add";
		operated="added";
	}
	else if(type=="save"){
		//request_type="PUT";
		formData["_method"]="PUT";
		formData["id"]=$("#designation_id").val();		
		ajax_url="<?php echo e(action('DesignationController@update','')); ?>"+"/"+$("#designation_id").val();
		operation="update";
		operated="updated";
	}
	else if(type=="delete-confirm"){
		formData["_method"]="DELETE";
		formData["id"]=$("#designation_id").val();
		ajax_url="<?php echo e(action('DesignationController@destroy','')); ?>"+"/"+$("#designation_id").val();	
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
			if(!(data.designation===null) && data.designation.hasOwnProperty('designation_name')){
				
				msg+="Designation: <strong>"+data.designation.designation_name+"</strong> successfully "+operated+".";
			}
			else{
				//delete case
				if(!(data.designation===null) && data.designation>=1){
					msg+="Designation: <strong>"+formData.designation+"</strong> successfully "+operated+".";
				}
				else{
					msg+="Designation already "+operated+"!";
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/designations/index.blade.php ENDPATH**/ ?>