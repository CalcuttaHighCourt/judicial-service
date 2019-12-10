@extends('layouts.app') 
@section('content')
<!-- Main content -->

<div class="panel custom-panel">
    
        <div id="info-panel" class="panel panel-danger">
            <!-- IIIIIIIIIII -->
            <div id="info-panel-heading" class="panel-heading">ALERTS</div>
            <!-- IIIIIIIIIII -->
            <div class="panel-body">

                <!-- Lower Court Request Form -->
                <span><strong>Notification:</strong> There are some LCR request received<br><br>
                

            @foreach($data['hc_records'] as $hc_record)

     
                @foreach($hc_record['lcr_case_details'] as $lc)

                
                    <span id="lower" style="background-color:#ffffff;color:#C11111;"><strong>{{($lc['lower_case_type']['type_name'])}}/{{($lc['lower_case_no'])}}/{{($lc['lower_case_year'])}}</strong></span>

                @endforeach
                &nbsp;
                is required by Hon’ble High Court in the Case No: <a href="{{url('lcr_compliance/'.$hc_record['id'])}}">{{($hc_record['case_type']['type_name'])}}/{{$hc_record['hc_case_no']}}/{{$hc_record['hc_case_year']}}</a>
                within <span id="deadline" style="background-color:#ffffff;color:#C11111;"><strong>{{$hc_record['deadline']}}</strong></span>
                <br>
                <hr>

            @endforeach 
            <hr>
            </span>
              

                <!--loader starts-->
                <div class="col-md-offset-5 col-md-3" id="wait" style="display:none;">
                    <img src='images/loader.gif'width="25%" height="10%" />
                    <br>Loading..
                </div>

            </div>
            <hr>

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

    $(document).ready(function () {

        /*LOADER*/

        $(document).ajaxStart(function () {
            $("#wait").css("display", "block");
        });
        $(document).ajaxComplete(function () {
            $("#wait").css("display", "none");
        });

        /*LOADER*/

      

    });


</script>
@endsection

