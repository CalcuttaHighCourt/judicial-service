{{--
<!-- views/states/index.blade.php -->
--}}
@extends('layouts.app') @section('title', 'States')
@section('page_heading') States @endsection
@section('center_main_content')
<!-- Bootstrap Boilerplate... -->
<div id="info-panel" class="panel panel-default">
	<!-- IIIIIIIIIII -->
	<div id="info-panel-heading" class="panel-heading">ADD NEW</div>
	<!-- IIIIIIIIIII -->
	<div class="panel-body">

		<!-- New Task Form -->
		<form id="info-form" class="form-horizontal" role="form" method="POST"
			action="{{ url('/admin/State') }}">
			{{ csrf_field() }}
			<input type="hidden" id="state-id">
			<div id="state_name-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
				<label for="state_name" class="col-md-4 control-label">State</label>

				<div class="col-md-6">
					<input id="state_name" type="text"
						class="form-control info-form-control" name="state_name"> <span
						id="state_name-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
						<strong id="state_name-strong" class="our-error-message-strong"></strong>
						<!-- IIIIIIIIIII -->
					</span>
				</div>
			</div>
			

			<div id="info-panel-buttons" class="form-group hide">
				<div class="col-md-6 col-md-offset-4">
					<button id="add-button" type="submit"
						class="btn btn-primary add-button info-form-button">
						<i class="fa fa-btn fa-plus-circle"></i> Add State
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
		<div class="panel-title pull-left">State Master</div>
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
						<th>State Name</th>
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
						<th>State Name</th>
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

@endsection @include('layouts.1_column_content')


@section('main_container') @yield('1_column_content') @endsection

@section('meta')
@parent
<meta name="_token" content="{!! csrf_token() !!}" />
@endsection

@section('end_scripts') @parent

<script type="text/javascript">
var table="";
$(function() {
	table = $('#datatable-table').DataTable({
		"processing": true,
		"serverSide": true,
		"ajax":{
			url:"{{url('State')}}-Datatable-Server-Side",
			dataSrc:"states"
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
					"data": "state_name",
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
	$("#info-panel-heading").html("Displaying record of State: <strong>"+data.type+"</strong>");

	$("#state-id").val(data.id);
	
	$("#state_name").val(data.state_name);
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
			state_name: $('#state_name').val()			
	};
	ajax_url="";
	operation="";
	operated="";
	request_type="POST";
	if(type=="add"){
		//request_type="POST";
		formData["_method"]="POST";
		ajax_url="{{ action('StateController@store') }}";


		operation="add";
		operated="added";
	}
	else if(type=="save"){
		//request_type="PUT";
		formData["_method"]="PUT";
		
		ajax_url="{{ action('StateController@update','') }}"+"/"+$("#state-id").val();
		formData["id"]=$("#state-id").val();

		operation="update";
		operated="updated";
	}
	else if(type=="delete-confirm"){
		//request_type="DELETE";
		formData["_method"]="DELETE";
		
		ajax_url="{{ action('StateController@destroy','') }}"+"/"+$("#state-id").val();
		formData["id"]=$("#state-id").val();

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
			if(!(data.state===null) && data.state.hasOwnProperty('state_name')){
				//add and updattypeeDelete=> !(data.state===null)
				msg+="State: <strong>"+data.state.state_name+"</strong> successfully "+operated+".";
			}
			else{
				//delete case
				if(!(data.state===null) && data.state>=1){
					msg+="State: <strong>"+formData.state_name+"</strong> successfully "+operated+".";
				}
				else{
					msg+="State already "+operated+"!";
				}
			}
			show_message_div("success",msg);
			table.ajax.reload();

			
			
			//setTimeout(function(){ scrollToElement($('#datatable-panel')); }, 200);
			scrollToElement($('#message-div'));
		},
		error: function (jqXHR, textStatus, errorThrown) {
			//alert(JSON.stringify(jqXHR)+" : " + textStatus+" : "+errorThrown);
			//alert(jqXHR.status);
			errors_reset();
			messages_hide();
			msg="<strong>Failed to "+operation+" data.</strong><br/>";
			if(jqXHR.status!=422 && jqXHR.status!=400){
				msg+="<strong>"+jqXHR.status+": "+errorThrown+"</strong>";
				//show_message_div("error",msg);
			}
			else{
				if(jqXHR.responseJSON.hasOwnProperty('exception')){
					msg+="Exception: <strong>"+jqXHR.responseJSON.exception_message+"</strong>";
					//show_message_div("error",msg);
				}
				else{
					msg+="Error(s):<strong><ul>";
					$.each(jqXHR.responseJSON.errors, function(key,value) {
						msg+="<li>"+value+"</li>";
						show_error(key,value);
						//return (this != "four"); // will stop running to skip "five"
					});
					msg+="</ul></strong>";
					
				}
			}
			show_message_div("error",msg);
			scrollToElement($('#info-panel'));
		}
	});
}
function update_notices_menu_section(){
	$.ajax({
		type: "GET",
		url: "{{ url('/State-Menu') }}",
		success: function (data, textStatus, jqXHR) {
			$("#notifications-menu-dropdown").html(data);
		}
	});
}
</script>
@endsection

@section('body_attributes') @parent class="" @endsection
