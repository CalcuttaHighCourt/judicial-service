@foreach(App\JudicialOfficer::orderBy('officer_name', 'asc')->get() as $judicial_officer)
	<option value="{{$judicial_officer->id }}" data-jo_code="{{$judicial_officer->jo_code}}" @if (old('judicial_officer') == $judicial_officer->officer_name) selected="selected" @endif>{{$judicial_officer->officer_name}}</option>
@endforeach