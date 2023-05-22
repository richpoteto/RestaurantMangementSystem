<table id="columnSearchDatatable"
        class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
        data-hs-datatables-options='{
        "order": [],
        "orderCellsTop": true,
        
        "entries": "#datatableEntries",
        "isResponsive": false,
        "isShowPaging": false,
        "pagination": "datatablePagination"
        }'>
    <thead class="thead-light">
    <tr>
        <th>{{__('messages.#')}}</th>
        <th>{{__('messages.title')}}</th>
        <th>{{__('messages.code')}}</th>
        <th>{{__('messages.min')}} {{__('messages.purchase')}}</th>
        <th>{{__('messages.max')}} {{__('messages.discount')}}</th>
        <th>{{__('messages.discount')}}</th>
        <th>{{__('messages.discount')}} {{__('messages.type')}}</th>
        <th>{{__('messages.start')}} {{__('messages.date')}}</th>
        <th>{{__('messages.expire')}} {{__('messages.date')}}</th>
        <th>{{__('messages.status')}}</th>
        <th>{{__('messages.action')}}</th>
    </tr>
    </thead>

    <tbody id="set-rows">
    @foreach($coupons as $key=>$coupon)
        <tr>
            <td>{{$key+1}}</td>
            <td>
            <span class="d-block font-size-sm text-body">
                {{Str::limit($coupon['title'],15,'...')}}
            </span>
            </td>
            <td>{{$coupon['code']}}</td>
            <td>{{\App\CentralLogics\Helpers::format_currency($coupon['min_purchase'])}}</td>
            <td>{{\App\CentralLogics\Helpers::format_currency($coupon['max_discount'])}}</td>
            <td>{{$coupon['discount']}}</td>
            <td>{{$coupon['discount_type']}}</td>
            <td>{{$coupon['start_date']}}</td>
            <td>{{$coupon['expire_date']}}</td>
            <td>
                <label class="toggle-switch toggle-switch-sm" for="couponCheckbox{{$coupon->id}}">
                    <input type="checkbox" onclick="location.href='{{route('admin.coupon.status',[$coupon['id'],$coupon->status?0:1])}}'" class="toggle-switch-input" id="couponCheckbox{{$coupon->id}}" {{$coupon->status?'checked':''}}>
                    <span class="toggle-switch-label">
                        <span class="toggle-switch-indicator"></span>
                    </span>
                </label>
            </td>
            <td>
                <a class="btn btn-sm btn-white" href="{{route('admin.coupon.update',[$coupon['id']])}}"title="{{__('messages.edit')}} {{__('messages.coupon')}}"><i class="tio-edit"></i>
                </a>
                <a class="btn btn-sm btn-white" href="javascript:" onclick="form_alert('coupon-{{$coupon['id']}}','Want to delete this coupon ?')" title="{{__('messages.delete')}} {{__('messages.coupon')}}"><i class="tio-delete-outlined"></i>
                </a>
                <form action="{{route('admin.coupon.delete',[$coupon['id']])}}"
                            method="post" id="coupon-{{$coupon['id']}}">
                        @csrf @method('delete')
                </form>
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
<hr>
<table>
    <tfoot>
    
    </tfoot>
</table>