@foreach(App\State::orderBy('state_name', 'asc')->get() as $state)
	<option value="{{$state->id }}" @if (old('state') == $state->state_name) selected="selected" @endif>{{$state->state_name}}</option>
@endforeach