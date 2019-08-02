@foreach(App\District::orderBy('district_name', 'asc')->get() as $district)
	<option value="{{$district->id }}" @if (old('district') == $district->district_name) selected="selected" @endif>{{$district->district_name}}</option>
@endforeach