@foreach($products as $key=>$product)
    <tr>
        <td>{{$key+1}}</td>
        <td>
            <a class="media align-items-center" href="{{route('admin.product.view',[$product['id']])}}">
                <img class="avatar avatar-lg mr-3" src="{{asset('storage/app/public/product')}}/{{$product['image']}}" 
                        onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'" alt="{{$product->name}} image">
                <div class="media-body">
                    <h5 class="text-hover-primary mb-0">{{Str::limit($product['name'],20,'...')}}</h5>
                </div>
            </a>
        </td>
        <td>
        {{Str::limit($product->category,20,'...')}}
        </td>
        <td>
        {{Str::limit($product->restaurant->name,20,'...')}}
        </td>
        <td>{{\App\CentralLogics\Helpers::format_currency($product['price'])}}</td>
        <td>
            <label class="toggle-switch toggle-switch-sm" for="stocksCheckbox{{$product->id}}">
                <input type="checkbox" onclick="location.href='{{route('admin.product.status',[$product['id'],$product->status?0:1])}}'"class="toggle-switch-input" id="stocksCheckbox{{$product->id}}" {{$product->status?'checked':''}}>
                <span class="toggle-switch-label">
                    <span class="toggle-switch-indicator"></span>
                </span>
            </label>
        </td>
        <td>
            <a class="btn btn-sm btn-white"
                href="{{route('admin.product.edit',[$product['id']])}}" title="{{__('messages.edit')}} {{__('messages.product')}}"><i class="tio-edit"></i>
            </a>
            <a class="btn btn-sm btn-white" href="javascript:"
                onclick="form_alert('product-{{$product['id']}}','Want to delete this item ?')" title="{{__('messages.delete')}} {{__('messages.product')}}"><i class="tio-delete-outlined"></i>
            </a>
            <form action="{{route('admin.product.delete',[$product['id']])}}"
                    method="post" id="product-{{$product['id']}}">
                @csrf @method('delete')
            </form>
        </td>
    </tr>
@endforeach
