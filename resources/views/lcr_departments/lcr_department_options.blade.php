@foreach(App\LcrDepartment::orderBy('lcr_department_name', 'asc')->get() as $lcr_dept)
	<option value="{{$lcr_dept->id }}" @if (old('lcr_dept') == $lcr_dept->lcr_department_name) selected="selected" @endif>{{$lcr_dept->lcr_department_name}}</option>
@endforeach