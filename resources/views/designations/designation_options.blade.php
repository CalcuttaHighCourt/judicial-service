@foreach(App\Designation::orderBy('designation_name', 'asc')->get() as $designations)
    <option value="{{$designations->id }}" @if (old('designations') == $designations->designation_name) selected="selected" @endif>{{$designations->designation_name}}</option>
@endforeach