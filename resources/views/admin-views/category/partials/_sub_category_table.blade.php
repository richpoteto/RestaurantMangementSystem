@foreach($categories as $key=>$category)
    <tr>
        <td>{{$key+1}}</td>
        <td>{{$category->id}}</td>
        <td>
            <span class="d-block font-size-sm text-body">
                {{Str::limit($category->parent['name'],20, '...')}}
            </span>
        </td>
        <td>
            <span class="d-block font-size-sm text-body">
                {{Str::limit($category->name, 20,'...')}}
            </span>
        </td>
        <td>
            <label class="toggle-switch toggle-switch-sm" for="stocksCheckbox{{$category->id}}">
            <input type="checkbox" onclick="location.href='{{route('admin.category.status',[$category['id'],$category->status?0:1])}}'"class="toggle-switch-input" id="stocksCheckbox{{$category->id}}" {{$category->status?'checked':''}}>
                <span class="toggle-switch-label">
                    <span class="toggle-switch-indicator"></span>
                </span>
            </label>
        </td>
        <td style="width:max-content;">
            <form action="{{route('admin.category.priority',$category->id)}}">
            <select name="priority" id="priority" onchange="this.form.submit()"> 
                <option value="0" {{$category->priority == 0?'selected':''}}>{{__('messages.normal')}}</option>
                <option value="1" {{$category->priority == 1?'selected':''}}>{{__('messages.medium')}}</option>
                <option value="2" {{$category->priority == 2?'selected':''}}>{{__('messages.high')}}</option>
            </select>
            </form>
        </td>
        <td>
            <a class="btn btn-sm btn-white"
                href="{{route('admin.category.edit',[$category['id']])}}" title="{{__('messages.edit')}} {{__('messages.category')}}"><i class="tio-edit"></i>
            </a>
            <a class="btn btn-sm btn-white" href="javascript:"
            onclick="form_alert('category-{{$category['id']}}','Want to delete this category')" title="{{__('messages.delete')}} {{__('messages.category')}}"><i class="tio-delete-outlined"></i>
            </a>
            <form action="{{route('admin.category.delete',[$category['id']])}}" method="post" id="category-{{$category['id']}}">
                @csrf @method('delete')
            </form>
        </td>
    </tr>
@endforeach
