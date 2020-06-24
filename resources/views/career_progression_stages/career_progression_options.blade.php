@foreach(App\CareerProgressionStage::get() as $stage)
    <option value="{{$stage->id}}" @if (old('stage') == $stage->stage_name) selected="selected" @endif>{{$stage->stage_name}}</option>
@endforeach