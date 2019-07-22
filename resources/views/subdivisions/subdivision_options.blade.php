@foreach(App\Subdivision::orderBy('subdivision_name', 'asc')->get() as $subdivision)
	<option value="{{$subdivision->id }}" @if (old('subdivision') == $subdivision->subdivision_name) selected="selected" @endif>{{$subdivision->subdivision_name}}</option>
@endforeach