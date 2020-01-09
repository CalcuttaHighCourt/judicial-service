@extends('layouts.app') 
@section('content')
<style>
   .select2-results__option{
   color:#d43c3c;
   }
</style>

<!-- Bootstrap Boilerplate... -->
<div id="info-panel" class="panel panel-default">
<!-- IIIIIIIIIII -->
<div id="info-panel-heading" class="panel-heading"><h2>Station Preference Details</h2></div>
<!-- IIIIIIIIIII -->
<div class="panel-body">
<br><br>
<!-- New Task Form -->

<div class="form-group required row">
    <div class="form-group required row">
        
    </div>
      <div id="view_details" class="panel-body">
         <div class="row place_of_posting" id="place_of_posting" style="display:none;">
            <span class="col-sm-5 col-sm-offset-4"><strong>Current Place of Posting:</strong>&nbsp;&nbsp;<span id="current_place_of_posting" style="color:red"></span></span>
         </div>
         <div class="table-responsive">
            <div style="overflow-x:auto;">
                <table class="table table-bordered table-striped" id="details_for_posting_preference" style="width: 100%;white-space: nowrap;">
                    <thead>
                        <tr>
                            <th></th>
                            <th>SL NO</th>
                            <th>JO NAME</th>
                            <th>JO CODE</th>
                            <th>POSTED AS</th>
                            <th>STATION PREFERENCE</th>
                            <th>JO REMARKS</th>
                            <th>OTHER INFO</th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                    </tbody>
                </table>
            </div>
         </div>
      </div>
   </div>

<!--loader starts-->
<div class="col-sm-offset-5 col-md-3" id="wait" style="display:none;">
   <img src='images/loader.gif'width="25%" height="10%" />
   <br>Loading..
</div>
<!--loader ends-->

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="{{asset('js/jquery/jquery.min.js')}}"></script>


<meta name="_token" content="{!! csrf_token() !!}" />

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
  
    $.ajax({
        
    })
                        
     
   /*Cloning of Year and Grades */
   
         
         
   });
</script>
@endsection
