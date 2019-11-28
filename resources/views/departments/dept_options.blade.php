@foreach(App\Department::orderBy('dept_name', 'asc')->get() as $dept)
		<option value="{{$dept->id }}" @if (old('dept') == $dept->dept_name) selected="selected" @endif>{{$dept->dept_name}}</option>
@endforeach