@foreach(App\NoticeType::orderBy('type', 'asc')->get() as $notice_type)
	<option value="{{$notice_type->id }}" @if (old('notice_type') == $notice_type->type) selected="selected" @endif>{{$notice_type->type}}</option>
@endforeach