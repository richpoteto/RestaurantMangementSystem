@foreach($banners as $key=>$banner)
    <tr>
        <td>{{$key+1}}</td>
        <td>
            <span class="media align-items-center">
                <img class="avatar avatar-lg mr-3" src="{{asset('storage/app/public/banner')}}/{{$banner['image']}}" 
                        onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'" alt="{{$banner->name}} image">
                <div class="media-body">
                    <h5 class="text-hover-primary mb-0">{{Str::limit($banner['title'], 25, '...')}}</h5>
                </div>
            </span>
        <span class="d-block font-size-sm text-body">
            
        </span>
        </td>
        <td>{{__('messages.'.$banner['type'])}}</td>
        <td>
            <label class="toggle-switch toggle-switch-sm" for="statusCheckbox{{$banner->id}}">
                <input type="checkbox" onclick="location.href='{{route('admin.banner.status',[$banner['id'],$banner->status?0:1])}}'" class="toggle-switch-input" id="statusCheckbox{{$banner->id}}" {{$banner->status?'checked':''}}>
                <span class="toggle-switch-label">
                    <span class="toggle-switch-indicator"></span>
                </span>
            </label>
        </td>
        <td>
            <a class="btn btn-sm btn-white" href="{{route('admin.banner.edit',[$banner['id']])}}"title="{{__('messages.edit')}} {{__('messages.banner')}}"><i class="tio-edit"></i>
            </a>
            <a class="btn btn-sm btn-white" href="javascript:" onclick="form_alert('banner-{{$banner['id']}}','Want to delete this banner ?')" title="{{__('messages.delete')}} {{__('messages.banner')}}"><i class="tio-delete-outlined"></i>
            </a>
            <form action="{{route('admin.banner.delete',[$banner['id']])}}"
                        method="post" id="banner-{{$banner['id']}}">
                    @csrf @method('delete')
            </form>
        </td>
    </tr>
@endforeach