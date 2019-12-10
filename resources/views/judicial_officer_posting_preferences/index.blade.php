@extends('layouts.app') 
@section('content')
<!-- Main content -->
<div id="info-panel" class="panel panel-default">
	<!-- IIIIIIIIIII -->
	<div id="info-panel-heading" class="panel-heading">ADD NEW</div>
	<!-- IIIIIIIIIII -->
	<div class="panel-body">

		<!-- New Task Form -->
		<form id="info-form" class="form-horizontal" role="form" method="POST"
			action="{{ url('/admin/JudicialOfficerPostingPreference') }}">
			{{ csrf_field() }}
			<input type="hidden" id="JudicialOfficerPostingPreference-id">
			<div id="officer_name-group" class="form-group row our-form-group">
                <label for="officer_name" class="col-md-4 control-label">Officer Name</label>
                <div class="col-md-6">
                    <select id="officer_name" class="form-control info-form-control"
                            name="officer_name"><option value="">Select an option</option>
							 @include('judicial_officers.judicial_officer_options')
                    </select>
                </div>
            </div>
			
			<div id="Zone_name-group" class="form-group row our-form-group">
                <label for="Zone_name" class="col-md-4 control-label">Zone</label>
                <div class="col-md-6">
                    <select id="Zone_name" class="form-control info-form-control"
                            name="Zone_name"><option value="">Select an option</option>
							 @include('zones.zone_options')
                    </select>
                </div>
            </div>
			<div id="Notice_number-group" class="form-group row our-form-group">
                <label for="Notice_number" class="col-md-4 control-label">Notice Number</label>
				<div class="col-md-6">
					<input id="Notice_number" type="text"
						class="form-control info-form-control" name="Notice_number"> <span
						id="Notice_number-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="Notice_number-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
            </div>
			<div id="Notice_date-group" class="form-group row our-form-group">
                <label for="Notice_date" class="col-md-4 control-label">Notice Date</label>
				<div class="col-md-6">
					<div class="input-group date ">
						<input id="Notice_date" type="text" class="form-control info-form-control datepicker" style="width:150px"  name="Notice_date">
							
					</div>
				</div>
            </div>

			<div id="info-panel-buttons" class="form-group hide">
				<div class="col-md-6 col-md-offset-4">
					<button id="add-button" type="submit"
						class="btn btn-primary add-button info-form-button">
						<i class="fa fa-btn fa-plus-circle"></i> Add Judicial Officer Posting Preference
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
			{{--@foreach($errors->all() as $error) {{$error}}@endforeach--}}
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
		<div class="panel-title pull-left">Judicial Officer Posting Preference Master</div>
		
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
						<th>Judicial Officer Name</th>
						<th>Zone Name</th>
						<th>Notice Number</th>
						<th>Notice Date</th>
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
						<th>Judicial Officer Name</th>
						<th>Zone Name</th>
						<th>Notice Number</th>
						<th>Notice Date</th>
						<th>Action</th>
						<th></th>
						<th></th>
					</tr>
				</tfoot>
			</table>
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

<script type="text/javascript">
var table="";
$(function() {
	$(".datepicker").datepicker({
                endDate:'0',
                format: 'dd-mm-yyyy'
         }); 

	table = $('#datatable-table').DataTable({
		"processing": true,
		"serverSide": true,
		"ajax":{
			url:"{{url('JudicialOfficerPostingPreference')}}-Datatable-Server-Side",
			dataSrc:"judicial_officer_posting_preferences"
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
					"data": "zone_name",
				},
				{
                    "data": "notice_no",
                 },
				 {
                    "data": "notice_date",
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
	//$(".info-form-button").addClass("disabled");
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
	$("#info-panel-heading").html("Displaying record of Judicial Officer Posting Preference: <strong>"+data.officer_name+"</strong>");

	$("#JudicialOfficerPostingPreference-id").val(data.id);

	$("#officer_name").val(data.judicial_officer_id);
		
	$("#Zone_name").val(data.zone_id);

	$("#Notice_number").val(data.notice_no);

	$("#Notice_date").val(data.notice_date);
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
		'judicial_officer_id': $('#officer_name').val(),
		'zone_id': $('#Zone_name').val(),
		'notice_no': $('#Notice_number').val(),
		'notice_date':$('#Notice_date').val(),

		
						
	};
	ajax_url="";
	operation="";
	operated="";
	request_type="POST";
	if(type=="add"){
		//request_type="POST";
		formData["_method"]="POST";
		ajax_url="{{ action('JudicialOfficerPostingPreferenceController@store') }}";       

		//formData["JudicialOfficerPostingPreference_name"]=$("#JudicialOfficerPostingPreference_name").val();

		operation="add";
		operated="added";
	}
	else if(type=="save"){
		//request_type="PUT";
		formData["_method"]="PUT";
		
		ajax_url="{{ action('JudicialOfficerPostingPreferenceController@update','') }}"+"/"+$("#JudicialOfficerPostingPreference-id").val();
		//formData["id"]=$("#JudicialOfficerPostingPreference-id").val();

		operation="update";
		operated="updated";
	}
	else if(type=="delete-confirm"){
		//request_type="DELETE";
		formData["_method"]="DELETE";
		formData["id"]=$("#officer_name").val();

		ajax_url="{{ action('JudicialOfficerPostingPreferenceController@destroy','') }}"+"/"+$("#JudicialOfficerPostingPreference-id").val();
		

		operation="delete";
		operated="deleted";
	}
	$.ajax({
		type: request_type,
		url: ajax_url,
		data: formData,
		dataType: 'json',
		success: function (data, textStatus, jqXHR) {
			//console.log(jqXHR);
			
			msg="<strong>SUCCESS: </strong>";
			if(!(data.judicial_officer_posting_preference===null)){
				
				msg+="Judicial Officer Posting Preference of: <strong>"+$("#officer_name option:selected").text()+"</strong> successfully "+operated+".";
				
			}
			else{
				//delete case
				if(!(data.judicial_officer_posting_preference===null) && data.judicial_officer_posting_preference>=1){
					msg+="Judicial Officer Posting Preference: <strong>"+$("#officer_name option:selected").text()+"</strong> successfully "+operated+".";
				}
				else{
					msg+="Judicial Officer Posting Preference already "+operated+"!";
				}
			}
			reset_info(true);
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
@endsection

