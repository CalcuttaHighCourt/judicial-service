@foreach(App\Subdivision::orderBy('subdivision_name', 'asc')->get() as $subdivision)
	<option data-zone="{{$subdivision->zone_id}}" value="{{$subdivision->subdivision_name}}">{{$subdivision->subdivision_name}}</option>
@endforeach

@foreach(App\District::orderBy('district_name', 'asc')->get() as $district)
	<option data-zone="{{$district->zone_id}}" value="{{$district->district_name}}">{{$district->district_name}}</option>
@endforeach