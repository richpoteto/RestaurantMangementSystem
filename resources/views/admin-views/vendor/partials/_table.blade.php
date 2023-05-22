@foreach($restaurants as $key=>$dm)
    <tr>
        <td>{{$key+1}}</td>
        <td>
            <div style="height: 60px; width: 60px; overflow-x: hidden;overflow-y: hidden">
                <a href="{{route('admin.vendor.view', $dm->id)}}" alt="view restaurant">
                <img width="60" style="border-radius: 50%; height:100%;"
                        onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                        src="{{asset('storage/app/public/restaurant')}}/{{$dm['logo']}}"></a>
            </div>
        </td>
        <td>
            <a href="{{route('admin.vendor.view', $dm->id)}}" alt="view restaurant">
                <span class="d-block font-size-sm text-body">
                    {{Str::limit($dm->name,25,'...')}}<br>
                    {{__('messages.id')}}:{{$dm->id}}
                </span>
            </a>
        </td>
        <td>
            <span class="d-block font-size-sm text-body">
                {{$dm->vendor->f_name.' '.$dm->vendor->l_name}}
            </span>
        </td>
        <td>
            {{$dm->zone?$dm->zone->name:__('messages.zone').' '.__('messages.deleted')}}
            {{--<span class="d-block font-size-sm">{{$banner['image']}}</span>--}}
        </td>
        <td>
            {{$dm['phone']}}
        </td>
        <td>
            <label class="toggle-switch toggle-switch-sm" for="stocksCheckbox{{$dm->id}}">
                <input type="checkbox" onclick="status_change_alert('{{route('admin.vendor.status',[$dm->id,$dm->status?0:1])}}', '{{__('messages.you_want_to_change_this_restaurant_status')}}', event)" class="toggle-switch-input" id="stocksCheckbox{{$dm->id}}" {{$dm->status?'checked':''}}>
                <span class="toggle-switch-label">
                    <span class="toggle-switch-indicator"></span>
                </span>
            </label>
        </td>
        <td>
            <a class="btn btn-sm btn-white"
                href="{{route('admin.vendor.view',[$dm['id']])}}" title="{{__('messages.view')}} {{__('messages.restaurant')}}"><i class="tio-visible text-success"></i>
            </a>
            <a class="btn btn-sm btn-white"
                href="{{route('admin.vendor.edit',[$dm['id']])}}" title="{{__('messages.edit')}} {{__('messages.restaurant')}}"><i class="tio-edit text-primary"></i>
            </a>
            {{--<a class="btn btn-sm btn-white" href="javascript:"
            onclick="form_alert('vendor-{{$dm['id']}}','Want to remove this information ?')" title="{{__('messages.delete')}} {{__('messages.restaurant')}}"><i class="tio-delete-outlined text-danger"></i>
            </a>
            <form action="{{route('admin.vendor.delete',[$dm['id']])}}" method="post" id="vendor-{{$dm['id']}}">
                @csrf @method('delete')
            </form>--}}
        </td>
    </tr>
@endforeach