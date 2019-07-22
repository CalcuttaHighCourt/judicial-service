@foreach(App\CourtComplex::orderBy('court_complex_name', 'asc')->get() as $court_complex)
	<option value="{{$court_complex->id }}" @if (old('court_complex') == $court_complex->court_complex_name) selected="selected" @endif>{{$court_complex->court_complex_name}}</option>
@endforeach