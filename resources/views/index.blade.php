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
	<div class="col-sm-12 col-sm-offset-0 ">
	@include('layouts.carousel')
	</div>
</div>


<div class="col-sm-12">
	<?php
	$notice_type_file_prefix='All';
	$limit=10;
	?>
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
