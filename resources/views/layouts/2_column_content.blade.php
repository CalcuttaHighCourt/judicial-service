@section('2_column_content')
<div class="row">
	<div class="col-lg-9 col-lg-offset-0">@yield('left_main_content')</div>
	<div class="col-lg-3 col-lg-offset-0">@yield('right_sidebar_content')</div>
</div>
@endsection