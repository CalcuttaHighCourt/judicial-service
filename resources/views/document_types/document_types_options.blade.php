@foreach(App\DocumentType::orderBy('type_name', 'asc')->get() as $document)
	<option value="{{$document->id }}" @if (old('document') == $document->type_name) selected="selected" @endif>{{$document->type_name}}</option>
@endforeach