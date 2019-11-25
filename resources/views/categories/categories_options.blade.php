@foreach(App\Category::orderBy('category_name', 'asc')->get() as $category)
	<option value="{{$category->id }}" @if (old('category') == $category->category_name) selected="selected" @endif>{{$category->category_name}}</option>
@endforeach