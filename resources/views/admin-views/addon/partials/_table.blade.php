@foreach($addons as $key=>$addon)
    <tr>
        <td>{{$key+ 1}}</td>
        <td>
        <span class="d-block font-size-sm text-body">
            {{Str::limit($addon['name'],20,'...')}}
        </span>
        </td>
        <td>{{\App\CentralLogics\Helpers::format_currency($addon['price'])}}</td>
        <td>{{Str::limit($addon->restaurant?$addon->restaurant->name:__('messages.restaurant').' '.__('messages.deleted'),20,'...')}}</td>
        <td>    
            <label class="toggle-switch toggle-switch-sm" for="stausCheckbox{{$addon->id}}">
            <input type="checkbox" onclick="location.href='{{route('admin.addon.status',[$addon['id'],$addon->status?0:1])}}'"class="toggle-switch-input" id="stausCheckbox{{$addon->id}}" {{$addon->status?'checked':''}}>
                <span class="toggle-switch-label">
                    <span class="toggle-switch-indicator"></span>
                </span>
            </label>
        </td>
        <td>
            <a class="btn btn-sm btn-white"
                href="{{route('admin.addon.edit',[$addon['id']])}}" title="{{__('messages.edit')}} {{__('messages.addon')}}"><i class="tio-edit"></i></a>
            <a class="btn btn-sm btn-white"     href="javascript:"
                onclick="form_alert('addon-{{$addon['id']}}','Want to delete this addon ?')" title="{{__('messages.delete')}} {{__('messages.addon')}}"><i class="tio-delete-outlined"></i></a>
            <form action="{{route('admin.addon.delete',[$addon['id']])}}"
                        method="post" id="addon-{{$addon['id']}}">
                @csrf @method('delete')
            </form>
        </td>
    </tr>
@endforeach