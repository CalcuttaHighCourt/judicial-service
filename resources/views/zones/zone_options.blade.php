@foreach(App\Zone::orderBy('zone_name', 'asc')->get() as $zone)
		<option value="{{$zone->id }}" @if (old('zone') == $zone->zone_name) selected="selected" @endif>{{$zone->zone_name}}</option>
@endforeach