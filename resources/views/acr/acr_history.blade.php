{{--
<!-- views/grades/index.blade.php -->
--}}
@extends('layouts.app') @section('title', 'ACRHistory')
@section('page_heading') ACRHistory @endsection
@section('center_main_content')
<style>
.select2-results__option{
    color:#d43c3c;
}
</style>
<div class="col-sm-12">
	<!-- Bootstrap Boilerplate... -->
	<div id="info-panel" class="panel panel-default">
		<!-- IIIIIIIIIII -->
		<div id="info-panel-heading" class="panel-heading">ADD ACR HISTORY</div>
		<!-- IIIIIIIIIII -->
		<div class="panel-body">
		<br><br>

			<!-- New Task Form -->
		
				{{ csrf_field() }}
				<input type="hidden" id="grade-id">
				<div id="jo_name-group" class="form-group our-form-group">
					<!-- IIIIIIIIIII -->
					<label for="jo_name" class="col-sm-3 col-sm-offset-1 control-label">Judicial Officer Name</label>
                    <label for="year" class="col-sm-3 control-label">Year of Assessment</label>
                    <label for="grade" class="col-sm-3 control-label">Grade</label>
					<div class="col-sm-3 col-sm-offset-1">
                    <div id="recruitment_batch_desc-group" class="form-group our-form-group">
					<!-- IIIIIIIIIII -->
							<select id="recruitment_batch_desc" class="form-control select2 info-form-control"
									name="recruitment_batch_desc"> 
									<option value="">Select Judicial Officer</option>
									@include('judicial_officers.judicial_officer_options')
						</select>
					</div>
				</div>
					</div>
                    

               <div class="div_add_more form-group required row">
                                    
                        <div id="year_of_assessment-group" class="form-group our-form-group">
                        <!-- IIIIIIIIIII -->
                        
                        <div class="col-sm-3">
                            <input id="year_of_assessment" type="text"
                                class="form-control info-form-control year_of_assessment date" name="year_of_assessment"> <span
                                id="year_of_assessment-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
                                <strong id="year_of_assessment-strong" class="our-error-message-strong"></strong>
                                <!-- IIIIIIIIIII -->
                            </span>
                            @section('end_scripts_1')
                            <script type="text/javascript">
                            $(function(){
                                $(".date").datepicker({
                                    format: 'yyyy',
                                    showTodayButton:true,
                                    showClear:true,
                                    viewMode: "years", 
                                    minViewMode: "years"
                                });
                            
                            });
                            </script>
                            @endsection
                        </div>
                    </div>
                    <div class="col-sm-3 form-group our-form-group" id="grades-group">
                        
                        <select id="grade_id" class="form-control info-form-control" name="grades"> 
                                <option value="">Select ACR Grade</option>
                                @include('acr.grade_options')
                        </select>
                    </div>
                
          
               
			<div class="col-sm-1">
				<button id="add-new-button" type="submit" class="btn btn-primary add-new-button">
					<i class="fa fa-plus-circle"></i> Add New
				</button>
            </div>
        </div>

            <br><br>
           

			
				{{--@foreach($errors->all() as $error) {{$error}}@endforeach--}}
				<div id="info-panel-buttons" class="form-group hide">
                    <div class="col-md-6 col-md-offset-4">
                        <button id="add-button" type="submit"
                                class="btn btn-primary add-button info-form-button">
                            <i class="fa fa-btn fa-plus-circle"></i> Add Grade
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
			</form>
		</div>
	</div>

	

<!--loader starts-->

<div class="col-md-offset-5 col-md-3" id="wait" style="display:none;">
    <img src='images/loader.gif'width="25%" height="10%" />
      <br>Loading..
</div>
   
<!--loader ends-->

<div id="test-div"></div>

@endsection @include('layouts.1_column_content')


@section('main_container') @yield('1_column_content') @endsection

@section('meta')
@parent
<meta name="_token" content="{!! csrf_token() !!}" />
@endsection

@section('end_scripts') @parent

<!--  -->

<script>
		$(document).ready(function() {

		/*LOADER*/

			$(document).ajaxStart(function() {
                    $("#wait").css("display", "block");
                });
                $(document).ajaxComplete(function() {
                    $("#wait").css("display", "none");
                });

            /*LOADER*/

            /* select2 initialisation */

            $(".select2").select2(); 
				
			$(document).on("click","#add-button",function(){
				var jo_name= $("#jo_name").val();
            });

            /*Cloning of Year and Grades */

            var div_clone = $(".div_add_more:first").clone();

            $(document).on("click","#add-new-button", function(){
                    
                $(".div_add_more:first").clone().insertAfter(".div_add_more:last");
                // $(".seizure_add_more:last").attr({src:"images/details_close.png",
                // 									class:"remove_add_more_seizure", 
                // 									alt:"remove",
                // 									id:""});
                $(".year_of_assessment:last").val('');
                $(".date").datepicker({
                    endDate:'0',
                    format: 'yyyy',
                    viewMode: "years", 
                    minViewMode: "years"
                }); // Date picker re-initialization
			
		    });         
		});

</script>

@endsection

@section('body_attributes') @parent class="" @endsection
