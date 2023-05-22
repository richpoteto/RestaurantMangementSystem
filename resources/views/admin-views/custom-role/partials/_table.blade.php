@foreach($rl as $k=>$r)
    <tr>
        <td scope="row">{{$k+1}}</td>
        <td>{{$r['name']}}</td>
        <td class="text-capitalize">
            @if($r['modules']!=null)
                @foreach((array)json_decode($r['modules']) as $key=>$m)
                    {{str_replace('_',' ',$m)}},
                @endforeach
            @endif
        </td>
        <td>{{date('d-M-y',strtotime($r['created_at']))}}</td>
        {{--<td>
            {{$r->status?'Active':'Inactive'}}
        </td>--}}
        <td>
            <a class="btn btn-sm btn-white"
                href="{{route('admin.custom-role.edit',[$r['id']])}}" title="{{__('messages.edit')}} {{__('messages.role')}}"><i class="tio-edit"></i>
            </a>
            <a class="btn btn-sm btn-danger" href="javascript:"
                onclick="form_alert('role-{{$r['id']}}','{{__('messages.Want_to_delete_this_role')}}')" title="{{__('messages.delete')}} {{__('messages.role')}}"><i class="tio-delete-outlined"></i>
            </a>
            <form action="{{route('admin.custom-role.delete',[$r['id']])}}"
                    method="post" id="role-{{$r['id']}}">
                @csrf @method('delete')
            </form>
        </td>
    </tr>
@endforeach