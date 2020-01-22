@foreach(App\Rank::orderBy('id', 'asc')->get() as $rank)
	<option data-rank_order="{{$rank->rank_order}}" value="{{$rank->id }}">{{$rank->rank_name}}</option>
@endforeach