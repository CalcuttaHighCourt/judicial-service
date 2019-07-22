{{--@foreach(App\NoticeType::all() as $notice_type)

<!-- 	<li><a href="notice.php/{{$notice_type->type}}">{{$notice_type->type}}</a></li> -->
--}}
<?php
try{
?>

@foreach(App\NoticeType::orderBy('type', 'asc')->get() as $notice_type)
	<li><a href="{{route('show_notices',[$notice_type->file_prefix])}}">{{$notice_type->type}}</a></li>
@endforeach
<?php 
}catch (\Exception $e){
    echo config('our_globals.db_error_message_large');
    return;
}
?>
<li><a href="{{route('show_notices',['All'])}}">All Notices</a></li>