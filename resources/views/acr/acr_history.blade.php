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
            <div class="row">
				{{ csrf_field() }}
				<input type="hidden" id="grade-id">
				<div id="jo_name-group" class="form-group our-form-group">
					<!-- IIIIIIIIIII -->
					<label for="jo_name" class="col-sm-3 col-sm-offset-1 control-label">Judicial Officer Name</label>
                   
					<div class="col-sm-3">
                        <div id="judicial_officer-group" class="form-group our-form-group">
                        <!-- IIIIIIIIIII -->
							<select id="judicial_officer" class="form-control select2 info-form-control judicial_officer"
									name="judicial_officer"> 
									<option value="">Select Judicial Officer</option>
									@include('judicial_officers.judicial_officer_options')
                            </select>
                        </div>
                    </div>
                </div>
            </div>
          

               <div class="form-group required row">
                    <!-- IIIIIIIIIII -->
                     <div class="row">
                            <label for="year" class="col-sm-3 col-sm-offset-1 control-label">Year of Assessment</label>
                            <label for="grade" class="col-sm-3 col-sm-offset-1 control-label">Grade</label>
                    </div>
                    <div id="year_of_assessment-group" class="form-group our-form-group div_add_more ">
                        <div class="col-sm-3  col-sm-offset-1">
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
                        <div class="col-sm-3 col-sm-offset-1 form-group our-form-group" id="grades-group">
                        
                            <select id="grade_id" class="form-control info-form-control grades" name="grades"> 
                                    <option value="">Select ACR Grade</option>
                                    @include('acr.grade_options')
                            </select>
                        </div>
            
                        <div class="col-sm-1">
                            <button id="add-new-button" type="button" class="fa fa-plus-circle btn btn-primary add-new-button">
                               Add New
                            </button>
                        <br><br>
                        </div>
                        
                    </div>
                   
                    <div class="col-sm-1 col-sm-offset-4">
                        <button id="submit" type="button" class="btn btn-success submit">
                            Submit
                        </button>
                    </div>

                    <div class="col-sm-1 col-sm-offset-1">
                        <button id="reset" type="button" class="btn btn-danger reset">
                            Reset
                        </button>
                    </div>
                 
                </div>
           
           

			
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

                 div_clone.clone().insertAfter(".div_add_more:last");   
               
                $(".add-new-button:last").attr({
                                        class:"btn btn-danger remove fa fa-minus-circle", 
										id:""});
                $(".remove").text("Remove");
               
                $(".year_of_assessment:last").val('');
                $(".date").datepicker({
                    format: 'yyyy',
                    showTodayButton:true,
                    showClear:true,
                    viewMode: "years", 
                    minViewMode: "years"
                }); // Date picker re-initialization
			});  

            
        /*If multiple grades and year of assessment one wants to enter and want to remove one :: STARTS*/
            $(document).on("click",".remove", function(){
                $(this).closest(".div_add_more").remove();
            });     
		
        $(document).on("click","#submit", function(){


            var grades = new Array();
            var year_of_assessment = new Array();

            var judicial_officer=$("#judicial_officer").val();
            var jo_code=$("#judicial_officer option:selected").data('jo_code');    

            grades=[];

            $(".grades").each(function(){
                grades.push($(this).val());
            })

            year_of_assessment=[];
            $(".year_of_assessment").each(function(){
            year_of_assessment.push($(this).val());
            })

            $.ajax({

                type: "POST",
                url:"acr_history/store",
                data: {
                    _token: $('meta[name="csrf-token"]').attr('content'),
                    judicial_officer,
                    grades,
                    year_of_assessment,
                    jo_code
                },
                success:function(response){
                    swal("ACR Has Been Submitted","","success");
                    setTimeout(function(){
                            window.location.reload(true);
                    },2000);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if(jqXHR.status!=422 && jqXHR.status!=400){
                        swal("Server Error",errorThrown,"error");
                    }
                    else{
                        msg = "";
                        $.each(jqXHR.responseJSON.errors, function(key,value) {
                            msg+=value+"\n";						
                        });
                        swal("Invalid Input",msg,"error");
                    }
                }
            });
        });
        $(document).on("click","#reset", function(){
            $(".grades").val(" ");
            $(".judicial_officer").val(" ");
            $(".year_of_assessment").val(" ");
        
        });

    });

</script>

@endsection

@section('body_attributes') @parent class="" @endsection
