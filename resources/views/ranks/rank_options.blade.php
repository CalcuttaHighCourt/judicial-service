@foreach(App\Rank::orderBy('id', 'asc')->get() as $rank)
	<option value="{{$rank->id }}">{{$rank->rank_name}}</option>
@endforeach