@extends('layouts.app') 
@section('content')
<!-- Main content -->


<meta name="_token" content="{!! csrf_token() !!}" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="{{asset('js/jquery/jquery.min.js')}}"></script>

<script>
    $(document).ready(function() {     

    });

</script>
@endsection