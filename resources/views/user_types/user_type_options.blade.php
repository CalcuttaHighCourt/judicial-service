@foreach(App\UserType::orderBy('type_name', 'asc')->get() as $user_type)
	<option value="{{$user_type->id }}" @if (old('user_type') == $user_type->type_name) selected="selected" @endif>{{$user_type->type_name}}</option>
@endforeach