@section('end_scripts')
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="{{asset('js/jquery.min.js')}}"></script>
<script src="{{asset('js/bootstrap.min.js')}}"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="{{asset('js/ie10_support/ie10-viewport-bug-workaround.js')}}"></script>

<script src="{{asset('js/datatable/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('js/datatable/dataTables.bootstrap.min.js')}}"></script>
 <!-- Date Picker -->    
 <script src="{{asset('js/bootstrap-datepicker.js')}}"></script>
<!-- <script src="{{asset('js/datepicker/bootstrap-datepicker.min.js')}}"></script> -->

<script src="{{asset('js/moment/moment.min.js')}}"></script>


<script src="{{asset('js/fileinput/fileinput.min.js')}}"></script>
<script src="{{asset('js/Sweet Alert/sweetalert.min.js')}}"></script>
<!-- Select-2 -->
<script src="{{asset('js/select2.min.js')}}"></script>

<!-- Editor -->
<script src="{{asset('js/Sweet Alert/bootstrap3-wysihtml5.all.min.js')}}"></script>

<script>
function myHtmlEncode(value){
	//create a in-memory div, set it's inner text(which jQuery automatically encodes)
	//then grab the encoded contents back out.  The div never exists on the page.
	return $('<div/>').text(value).html();
}

function myHtmlDecode(value){
	return $('<div/>').html(value).text();
}
</script>

{{-- These section will be useful when we need to specify a js call at
end but for easy accessibility near to the element. --}}

@section('end_scripts_1') @show @section('end_scripts_2') @show
@section('end_scripts_3') @show @section('end_scripts_4') @show
@section('end_scripts_5') @show @section('end_scripts_6') @show

@section('end_scripts_7') @show @section('end_scripts_8') @show
@section('end_scripts_9') @show @section('end_scripts_10') @show

@endsection
