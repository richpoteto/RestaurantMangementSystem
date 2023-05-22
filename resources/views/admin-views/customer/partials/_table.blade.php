@foreach($customers as $key=>$customer)
    <tr class="">
        <td class="">
            {{$key+1}}
        </td>
        <td class="table-column-pl-0">
            <a href="{{route('admin.customer.view',[$customer['id']])}}">
                {{$customer['f_name']." ".$customer['l_name']}}
            </a>
        </td>
        <td>
            {{$customer['email']}}
        </td>
        <td>
            {{$customer['phone']}}
        </td>
        <td>
            <label class="badge badge-soft-info">
                {{$customer->order_count}}
            </label>
        </td>
        <td>
            <div class="dropdown">
                <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                        id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                    <i class="tio-settings"></i>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="{{route('admin.customer.view',[$customer['id']])}}">
                        <i class="tio-visible"></i> {{__('messages.view')}}
                    </a>
                    {{--<a class="dropdown-item" target="" href="">
                        <i class="tio-download"></i> Suspend
                    </a>--}}
                </div>
            </div>
        </td>
    </tr>
@endforeach
