<?php
use App\Http\Controllers\PageController;
?>
@extends('layouts.app')
{{--@include('services.display_board.display_board_block')--}}
<?php
	$calendar_display="month";
?>



@section('title', 'Home')

@section('page_heading')
	Home Page
@endsection



@section('left_main_content')





<div class="panel custom-panel">
	<div class="col-sm-12">
		<div id="info-panel" class="panel panel-deafult">
			<!-- IIIIIIIIIII -->
			<div id="info-panel-heading" class="panel-heading"><br>LOWER COURT RECORD</div>
			<!-- IIIIIIIIIII -->
			
			<hr>
			<div class="panel-body">
				<span>As Per the requirement from the High Court Case Number:CRM / 10/ 2019 the following records to be complied within 05/12/2019.
					<br>The Case Numbers are as follows : </span>
						<div class="col-sm-offset-1 col-sm-11">
						<br>
							TS / 1/ 2019 &nbsp; <label><input type="checkbox" value="1"> Available with me</label><br><br>
							TS/ 5/ 2018	 &nbsp; <label><input type="checkbox" value="2"> Available with me</label><br><br>
							TA / 50 / 2019 &nbsp; <label><input type="checkbox" value="3"> Available with me</label><br><br>
							<div class="float-left">
								<strong>Actions to be taken:</strong><br><br>
								<button id="forward" type="button" class="btn btn-warning forward">
									Forward
								</button>
								<button id="comply" type="button" class="btn btn-success comply">
									Comply
								</button>
								<button id="seek_info" type="button" class="btn btn-info seek_info">
									Seek Information
								</button>
							</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="col-sm-12">
					<label for="court_name" class="col-md-2 control-label">Court Name</label>
					<div class="col-md-3">
						<select id="court_name" class="form-control info-form-control"
							name="court_name"> 
							<option value="">Select Court Name</option>
							@include('courts.court_options')
						</select>
					</div>
					<div class="col-sm-3">
						<button id="forward" type="button" class="btn btn-success forward">
							 Submit
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	


@endsection
 
@section('right_sidebar_content')
	
	
@endsection
@include('layouts.2_column_content')


@section('main_container')
	@yield('2_column_content')
@endsection

@section('body_attributes')
@endsection

<script type="text/javascript">

 	$(document).ready(function(){

		 /*LOADER*/

            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

         /*LOADER*/
});


</script>

