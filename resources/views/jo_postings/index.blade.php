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

                
                <div id="info-panel-buttons" class="form-group">
                    <div class="col-md-6 col-md-offset-4">
                        <button id="search" type="button"
                            class="btn btn-primary add-button info-form-button">
                            <i class="fa fa-btn fa-plus-circle"></i> Search
                        </button>
                    </div>
                </div>
                <div class="table-responsive" style="display:none;" id="jo_details" name="jo_details">
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                        <th>Officer Code</th>
                        <th>Designation</th>
                        <th>District</th>
                        <th>Zone</th>
                        <th>From</th>
                        <th>Duration</th>
                        </tr>
                    </thead>
                    <tbody>          
                    </tbody>
                </table>
            </form>
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
      $(document).ready(function(){
           /*LOADER*/

            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

         /*LOADER*/
            
        //Addition of Ps_Details starts
        
            $(document).on("click", "#search",function(){

                var jo_code = $("#officer_name").val();

            //    $("#jo_details").show();
                
                $.ajax({

                    type:"POST",
                    url:"jo_posting/search",
                    data:{
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        jo_code:jo_code                      
                },
                success:function(response)
                {
                    //console.log(response);
                   
                    $("#jo_details").show();

                   // $("#officer_name").val('');
                    var details="";
                    details+=      '<tr>'+
                                        '<td>'+response[0].jo_code+'</td>'+
                                        '<td>'+response[0].designation_name+'</td>'+
                                        '<td>'+response[0].district_name+'</td>'+
                                        '<td>'+response[0].zone_name+'</td>'+
                                        '<td>'+response[0].from_date+'</td>'+
                                        '<td>'+response[0].duration+'</td>'+
                                    '</tr>';

                                //console.log(details);
                    $('table tbody').html(details);
                },
                error:function(response) {  

                $("#jo_details").show();

                // $("#officer_name").val('');
                var details="";
                details+=      '<tr>'+
                                    '<td  colspan="4" style="text-align:center">No Record Found</td>'+
                                '</tr>';

             //console.log(details);
            $('table tbody').html(details);
                                                
                }                
                });

                            });
            });


</script>
@endsection


