@foreach(App\Court::join('subdivisions','courts.subdivision_id','=','subdivisions.id')->orderBy('court_name', 'asc')->get() as $court)
    <option value="{{$court->id }}" data-zone_id="{{$court->zone_id}}" @if (old('court') == $court->court_name) selected="selected" @endif>{{$court->court_name}}</option>
@endforeach