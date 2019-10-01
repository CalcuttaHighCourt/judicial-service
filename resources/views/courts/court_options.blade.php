@foreach(App\Court::orderBy('court_name', 'asc')->get() as $court)
    <option value="{{$court->id }}" data-court_complex_id="{{$court->court_complex_id}}" @if (old('court') == $court->court_name) selected="selected" @endif>{{$court->court_name}}</option>
@endforeach