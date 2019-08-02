<!-- views/notice_types/index.blade.php -->
@extends('layouts.app')


@section('title', 'Notice Types') @section('page_heading') Notice Types
@endsection @section('center_main_content')
<!-- Bootstrap Boilerplate... -->

<div class="panel-body">
	<!-- Display Validation Errors -->
	include('common.errors')

	<!-- New Task Form -->
	<form action="{{ action('Notice\NoticeTypeController@store') }}" method="POST" class="form-horizontal">
		{!! csrf_field() !!}

		<!-- Task Name -->
		<div class="form-group">
			<label for="notice_type" class="col-sm-3 control-label">Notice Type</label>

			<div class="col-sm-6">
				<input type="text" name="name" id="task-name" class="form-control">
			</div>
		</div>

		<!-- Add Task Button -->
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-6">
				<button type="submit" class="btn btn-default">
					<i class="fa fa-plus"></i> Add Notice Type
				</button>
			</div>
		</div>
		
<!-- 		<input id="notice_type_id" name="id" value="3"/> -->
		<input id="notice_type" name="notice_type" value="Recruitment1"/>
		<input id="description" name="description" value="abc"/>
		<input id="path" name="path" value="notices/aa"/>
		<input id="created_by" name="created_by" value="admin1"/>
	</form>
	@section('end_scripts_2')
		<meta name="_token" content="{!! csrf_token() !!}" />
		<script type="text/javascript">
		$.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
            }
        });
		var formData = {
				notice_type: $('#notice_type').val(),
	            description: $('#description').val(),
	            path: $('#path').val(),
	            created_by: $('#created_by').val(),
	        };
		$(function() {
// 		$.ajax({

//             type: "POST",
//             url: "{{ action('Notice\NoticeTypeController@store') }}",
//             data: formData,
//             dataType: 'json',
//             success: function (data) {
//                 alert(data);
//                 /*console.log(data);

//                 var task = '<tr id="task' + data.id + '"><td>' + data.id + '</td><td>' + data.task + '</td><td>' + data.description + '</td><td>' + data.created_at + '</td>';
//                 task += '<td><button class="btn btn-warning btn-xs btn-detail open-modal" value="' + data.id + '">Edit</button>';
//                 task += '<button class="btn btn-danger btn-xs btn-delete delete-task" value="' + data.id + '">Delete</button></td></tr>';

//                 if (state == "add"){ //if user added a new record
//                     $('#tasks-list').append(task);
//                 }else{ //if user updated an existing record

//                     $("#task" + task_id).replaceWith( task );
//                 }

//                 $('#frmTasks').trigger("reset");

//                 $('#myModal').modal('hide')*/
//             },
//             error: function (data) {
//                 console.log('Error:', data);
//             }
//         });


// 			var formData2 = {
// 					notice_type: $('#notice_type').val(),
// 	            	description: $('#description').val(),
// 	            	path: $('#path').val(),
// 	            	created_by: $('#created_by').val(),
// 	        };
// 			$.ajax({

// 	            type: "PUT",
// 	            url: "{{ action('Notice\NoticeTypeController@update','3') }}",
// 	            data: formData2,
// 	            dataType: 'json',
// 	            success: function (data) {
// 	                alert(data);
// 	            },
// 	            error: function (data) {
// 	                console.log('Error:', data);
// 	            }
// 	        });


			$.ajax({

	            type: "DELETE",
	            url: "{{ action('Notice\NoticeTypeController@destroy','3') }}",
	            //data: formData2,
	            dataType: 'json',
	            success: function (data) {
	                alert(data);
	            },
	            error: function (data) {
	                console.log('Error:', data);
	            }
	        });
	        
		});
		</script>
	@endsection
	
	@foreach($errors->all() as $error)
		{{print_r($error)}}
	@endforeach
</div>


<!-- TODO: Current Tasks -->
@if (count($notice_types) > 0)
<div class="panel panel-default">
	<div class="panel-heading">Notice Type Master</div>

	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-striped task-table" id="table1">

				<!-- Table Headings -->
				<thead>
					<th>ID</th>
					<th>Notice Type</th>
					<th>Description</th>
					<th>Path</th>
<!-- 					<th colspan="3">Action</th> -->
					<th>Action</th><th>Action</th><th>Action</th>
				</thead>

				<!-- Table Body -->
				<tbody>
					@foreach ($notice_types as $notice_type)
					<tr>
						<td class="table-text">
							<div>{{ $notice_type->id }}</div>
						</td>
						<td class="table-text">
							<div>{{ $notice_type->notice_type }}</div>
						</td>
						<td class="table-text">
							<div>{{ $notice_type->description }}</div>
						</td>
						<td class="table-text">
							<div class="text-muted">{{ $notice_type->path }}</div>
						</td>


						<!-- Info Button -->
						<td><a href="{{url('Notice-Type')." /".$notice_type->id }}">
								<button type="submit" class="btn btn-info">
									<i class="fa fa-info"></i> View
								</button>
						</a></td>
						<!-- Edit Button -->
						<td><a href="{{url('Notice-Type')." /".$notice_type->id }}">
								<button type="submit" class="btn btn-warning">
									<i class="fa fa-pencil"></i> Edit
								</button>
						</a></td>
						<!-- Delete Button -->
						<td>
							<form action="{{ url('task/'.$notice_type->id) }}" method="POST">
								{!! csrf_field() !!} {!! method_field('DELETE') !!}

								<button type="submit" class="btn btn-danger">
									<i class="fa fa-trash"></i> Delete
								</button>
							</form>
						</td>
					</tr>
					@endforeach
				</tbody>
				<tfoot>
					<th>ID</th>
					<th>Notice Type</th>
					<th>Description</th>
					<th>Path</th>
<!-- 					<th colspan="3">Action</th> -->
					<th>Action</th><th>Action</th><th>Action</th>
				</tfoot>
			</table>
		</div>
		
		<hr />	
		<div class="table-responsive">
	<table class="table table-striped task-table" id="table2">

		<!-- Table Headings -->
		<thead>
			<th>ID</th>
			<th>Notice Type</th>
			<th>Description</th>
			<th>Path</th>
<!-- 			<th colspan="3">Action</th> -->
		</thead>
		<tbody></tbody>
		<!-- Table Footer -->
		<tfoot>
			<th>ID</th>
			<th>Notice Type</th>
			<th>Description</th>
			<th>Path</th>
<!-- 			<th colspan="3">Action</th> -->
		</tfoot>
	</table>
	</div>
	</div>

	
	
	@endif @endsection @include('layouts.1_column_content')


	@section('main_container') @yield('1_column_content') @endsection

	@section('end_scripts') @parent


	<div id="testdiv"></div>
	<script type="text/javascript">
		var row_formats=[
		         		"<td class=\"table-text\"><div>[id]</div></td>",
					    "<td class=\"table-text\"><div>[description]</div></td>",
					    "<td class=\"table-text\"><div>{{ $notice_type->description }}</div></td>",
					    "<td class=\"table-text\"><div>{{ $notice_type->description }}</div></td>"
					    ];
	    /*
		function drawTable2(var json_data,var columns_formats){
			
		}*/


		/*$.ajax({
		    url: '/echo/json/',
		    type: "post",
		    dataType: "json",
		    data: {
		        json: JSON.stringify([
		            {
		            id: 1,
		            firstName: "Peter",
		            lastName: "Jhons"},
		        {
		            id: 2,
		            firstName: "David",
		            lastName: "Bowie"}
		        ]),
		        delay: 3
		    },
		    success: function(data, textStatus, jqXHR) {
		        // since we are using jQuery, you don't need to parse response
		        drawTable(data);
		    }
		});*/
		$(function() {
			  // Handler for .ready() called.
			  
			//data="ready";
			data="";
			<?php echo "data=".json_encode($notice_types) ?>;  
			//drawTable(data);
			 $('#table1').DataTable();
			 $('#table2').DataTable({
				 "ajax":{
					 	url:"{{url('admin/Notice-Type')}}",
					 	dataSrc:"notice_types"
				 	},
			     "columns": [
			            { "data": "id" },
			            { "data": "notice_type" },
			            { "data": "description" },
			            //{ "data": "path" },
			            { data: null, render: function ( data, type, row ) {
			                // Combine the first and last names into a single table field
			                return "<a href=\""+data.path+"\">"+data.path+"</a>";
			            } },
// 			            { "data": "<a href=\""+"path"+"\"/>" }
			        ],
			        "columnDefs": [
			                       {
			                           // The `data` parameter refers to the data for the cell (defined by the
			                           // `data` option, which defaults to the column being worked with, in
			                           // this case `data: 0`.
			                           "render": function ( data, type, row ) {
			                               return data +' ('+ row['path']+')'+type;
			                           },
			                           "targets": 0
			                       },
// 			                       { "visible": false,  "targets": [ 3 ] }
			                   ]
			     
			 });
			});
		

function drawTable(data) {
	var rows ="";
	for (var i = 0; i < data.length; i++) {
		//alert(drawRow(data[i]).html());
		//alert(drawRow(data[i]).outerHTML);
		//alert(drawRow(data[i]));
	    rows+=(drawRow(data[i]));
    }
    alert(rows);
}

function drawRow(rowData) {
	//$("#testdiv").html(rowData);
	/*
	$.each(rowData, function(key, value) {
    	console.log(key, value);
    	//alert(key+" "+value);
	});*/
	//alert(rowData.id);
    //var row = $("<tr />");
    var row="<tr>";
    //$("#personDataTable").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it

	/*for(var i = 0; i < rowData.length; i++){
		alert(i);
	}*/
    
//     row.append($("<td class=\"table-text\"><div>" + rowData.notice_type + "</div></td>"));
// 	row.append($("<td class=\"table-text\"><div>" + rowData.description + "</div></td>"));
// 	row.append($("<td class=\"table-text\"><div>" + rowData.path + "</div></td>"));

	row+=("<td class=\"table-text\"><div>" + rowData.notice_type + "</div></td>");
	row+=("<td class=\"table-text\"><div>" + rowData.description + "</div></td>");
	row+=("<td class=\"table-text\"><div>" + rowData.path + "</div></td>");

	row+="</tr>";
    //row.append($("<td>" + rowData.firstName + "</td>"));
    //row.append($("<td>" + rowData.lastName + "</td>"));
    return row;
}
</script>

	@endsection