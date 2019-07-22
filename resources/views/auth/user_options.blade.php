@foreach(App\User::all() as $user)
	<option value="{{$user->id }}" @if (Auth::user()->userid == $user->userid) selected="selected" @endif>{{$user->userid}}</option>
@endforeach