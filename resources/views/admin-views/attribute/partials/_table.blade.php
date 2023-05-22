@foreach($attributes as $key=>$attribute)
    <tr>
        <td>{{$key+1}}</td>
        <td>
        <span class="d-block font-size-sm text-body">
            {{Str::limit($attribute['name'],25,'...')}}
        </span>
        </td>
        <td>
            <a class="btn btn-sm btn-white" href="{{route('admin.attribute.edit',[$attribute['id']])}}" title="{{__('messages.edit')}}"><i class="tio-edit"></i>
            </a>
            <a class="btn btn-sm btn-white" href="javascript:" onclick="form_alert('attribute-{{$attribute['id']}}','Want to delete this attribute ?')" title="{{__('messages.delete')}}"><i class="tio-delete-outlined"></i>
            </a>
            <form action="{{route('admin.attribute.delete',[$attribute['id']])}}"
                    method="post" id="attribute-{{$attribute['id']}}">
                @csrf @method('delete')
            </form>
        </td>
    </tr>
@endforeach