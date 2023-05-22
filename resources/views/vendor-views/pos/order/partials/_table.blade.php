@foreach ($orders as $key => $order)
    <tr class="status-{{ $order['order_status'] }} class-all">
        <td class="">
            {{ $key + 1 }}
        </td>
        <td class="table-column-pl-0">
            <a href="{{ route('vendor.order.details', ['id' => $order['id']]) }}">{{ $order['id'] }}</a>
        </td>
        <td>{{ date('d M Y', strtotime($order['created_at'])) }}</td>
        <td>
            @if ($order->customer)
                <label class="badge badge-dark">{{ $order->customer['f_name'] . ' ' . $order->customer['l_name'] }}</label>
            @else
                <label class="badge badge-success">{{ __('messages.walk_in_customer') }}</label>
            @endif
        </td>
        <td>
            @if ($order->payment_status == 'paid')
                <span class="badge badge-soft-success">
                    <span class="legend-indicator bg-success"></span>{{ __('messages.paid') }}
                </span>
            @else
                <span class="badge badge-soft-danger">
                    <span class="legend-indicator bg-danger"></span>{{ __('messages.unpaid') }}
                </span>
            @endif
        </td>
        <td>{{ \App\CentralLogics\Helpers::format_currency($order['order_amount']) }}</td>
        <td class="text-capitalize">
            @if ($order['order_status'] == 'pending')
                <span class="badge badge-soft-info ml-2 ml-sm-3">
                    <span class="legend-indicator bg-info"></span>{{ __('messages.pending') }}
                </span>
            @elseif($order['order_status'] == 'confirmed')
                <span class="badge badge-soft-info ml-2 ml-sm-3">
                    <span class="legend-indicator bg-info"></span>{{ __('messages.confirmed') }}
                </span>
            @elseif($order['order_status'] == 'processing')
                <span class="badge badge-soft-warning ml-2 ml-sm-3">
                    <span class="legend-indicator bg-warning"></span>{{ __('messages.processing') }}
                </span>
            @elseif($order['order_status'] == 'out_for_delivery')
                <span class="badge badge-soft-warning ml-2 ml-sm-3">
                    <span class="legend-indicator bg-warning"></span>{{ __('messages.out_for_delivery') }}
                </span>
            @elseif($order['order_status'] == 'delivered')
                <span class="badge badge-soft-success ml-2 ml-sm-3">
                    <span class="legend-indicator bg-success"></span>{{ __('messages.delivered') }}
                </span>
            @else
                <span class="badge badge-soft-danger ml-2 ml-sm-3">
                    <span class="legend-indicator bg-danger"></span>{{ str_replace('_', ' ', $order['order_status']) }}
                </span>
            @endif
        </td>
        <td>
            <a class="btn btn-sm btn-white" href="{{ route('vendor.order.details', ['id' => $order['id']]) }}"><i
                    class="tio-visible"></i> {{ __('messages.view') }}</a>
            <a class="btn btn-sm btn-white" target="_blank"
                href="{{ route('vendor.order.generate-invoice', [$order['id']]) }}"><i class="tio-download"></i>
                {{ __('messages.invoice') }}</a>
        </td>
    </tr>
@endforeach
