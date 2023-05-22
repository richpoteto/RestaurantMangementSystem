@foreach($zones as $key=>$zone)
    <tr>
        <td>{{$key+1}}</td>
        <td>{{$zone->id}}</td>
        <td>
        <span class="d-block font-size-sm text-body">
            {{$zone['name']}}
        </span>
        </td>
        <td>{{$zone->restaurants_count}}</td>
        <td>{{$zone->deliverymen_count}}</td>
        <td>
            <label class="toggle-switch toggle-switch-sm" for="stocksCheckbox{{$zone->id}}">
                <input type="checkbox" onclick="status_form_alert('status-{{$zone['id']}}','Want to change status for this zone ?', event)" class="toggle-switch-input" id="stocksCheckbox{{$zone->id}}" {{$zone->status?'checked':''}}>
                <span class="toggle-switch-label">
                    <span class="toggle-switch-indicator"></span>
                </span>
            </label>
            <form action="{{route('admin.zone.status',[$zone['id'],$zone->status?0:1])}}" method="get" id="status-{{$zone['id']}}">
            </form>
        </td>
        <td>
            <a class="btn btn-sm btn-white"
                href="{{route('admin.zone.edit',[$zone['id']])}}" title="{{__('messages.edit')}} {{__('messages.zone')}}"><i class="tio-edit"></i>
            </a>
            {{--<a class="btn btn-sm btn-white" href="javascript:"
            onclick="form_alert('zone-{{$zone['id']}}','Want to delete this zone ?')" title="{{__('messages.delete')}} {{__('messages.zone')}}"><i class="tio-delete-outlined"></i>
            </a>
            <form action="{{route('admin.zone.delete',[$zone['id']])}}" method="post" id="zone-{{$zone['id']}}">
                @csrf @method('delete')
            </form>--}}
        </td>
    </tr>
@endforeach