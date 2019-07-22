@foreach(App\Caste::orderBy('caste_name', 'asc')->get() as $caste)
	<option value="{{$caste->id }}" @if (old('caste') == $caste->caste_name) selected="selected" @endif>{{$caste->caste_name}}</option>
@endforeach