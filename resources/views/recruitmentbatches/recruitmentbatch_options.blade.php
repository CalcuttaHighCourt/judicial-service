@foreach(App\RecruitmentBatch::orderBy('recruitment_batch_desc', 'asc')->get() as $recruitment)
	<option value="{{$recruitment->id }}" @if (old('recruitment') == $recruitment->recruitment_batch_desc) selected="selected" @endif>{{$recruitment->recruitment_batch_desc}}</option>
@endforeach