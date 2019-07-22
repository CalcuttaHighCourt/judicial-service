@foreach(App\Qualification::orderBy('qualification_name', 'asc')->get() as $qualification)
	<option value="{{$qualification->id }}" @if (old('qualification') == $qualification->qualification_name) selected="selected" @endif>{{$qualification->qualification_name}}</option>
@endforeach