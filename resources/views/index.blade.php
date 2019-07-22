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
	<!--<div class="text-center"><a href="{{url('/page/Oath-Taking-Ceremony-01052018')}}">Oath taking ceremony of the Hon'ble Chief Justice Jyotirmay Bhattacharya held on 1<sup>st</sup> May, 2018</a></div>-->
	<div class="text-center"><a href="{{url('/page/Oath-Taking-Ceremony-30102018')}}">Oath taking ceremony of the Hon'ble Chief Justice Debasish Kar Gupta held on 30<sup>th</sup> Oct, 2018</a></div>
	<br/>
	<div class="col-sm-10 col-sm-offset-1 ">
	@include('layouts.carousel')
</div>
	
</div>


<div class="col-sm-12 col-sm-offset-0">
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
