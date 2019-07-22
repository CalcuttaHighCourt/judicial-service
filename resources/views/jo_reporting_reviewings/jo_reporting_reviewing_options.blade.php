@foreach(App\Caste::orderBy('caste', 'asc')->get() as $caste)
	<option value="{{$caste->id }}" @if (old('caste') == $caste->caste) selected="selected" @endif>{{$caste->caste}}</option>
@endforeach