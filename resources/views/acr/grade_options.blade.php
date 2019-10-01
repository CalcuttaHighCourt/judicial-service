@foreach(App\GradeDetail::orderBy('grade_name', 'asc')->get() as $grade)
	<option value="{{$grade->id }}" @if (old('grade') == $grade->grade_name) selected="selected" @endif>{{$grade->grade_name}}</option>
@endforeach