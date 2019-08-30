@foreach(App\Religion::orderBy('religion_name', 'asc')->get() as $religion)
	<option value="{{$religion->id }}" @if (old('religion') == $religion->religion_name) selected="selected" @endif>{{$religion->religion_name}}</option>
@endforeach

