@foreach($delivery_men as $key=>$dm)
    <tr>
        <td>{{$key+1}}</td>
        <td>
            <a class="media align-items-center" href="{{route('vendor.delivery-man.preview',[$dm['id']])}}">
                <img class="avatar avatar-lg mr-3" onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                        src="{{asset('storage/app/public/delivery-man')}}/{{$dm['image']}}" alt="{{$dm['f_name']}} {{$dm['l_name']}}">
                <div class="media-body">
                    <h5 class="text-hover-primary mb-0">{{$dm['f_name'].' '.$dm['l_name']}}</h5>
                </div>
            </a>
        </td>
        <td>
            @if($dm->active)
            <label class="badge badge-soft-primary">{{__('messages.online')}}</label>
            @else
            <label class="badge badge-soft-danger">{{__('messages.offline')}}</label>
            @endif
        </td>
        <td>
            <a class="deco-none" href="tel:{{$dm['phone']}}">{{$dm['phone']}}</a>
        </td>
        <td>
            <a class="btn btn-sm btn-white" href="{{route('vendor.delivery-man.edit',[$dm['id']])}}" title="{{__('messages.edit')}}"><i class="tio-edit"></i>
            </a>
            <a class="btn btn-sm btn-white text-danger" href="javascript:" onclick="form_alert('delivery-man-{{$dm['id']}}','Want to remove this deliveryman ?')" title="{{__('messages.delete')}}"><i class="tio-delete-outlined"></i>
            </a>
            <form action="{{route('vendor.delivery-man.delete',[$dm['id']])}}" method="post" id="delivery-man-{{$dm['id']}}">
                @csrf @method('delete')
            </form>
        </td>
    </tr>
@endforeach