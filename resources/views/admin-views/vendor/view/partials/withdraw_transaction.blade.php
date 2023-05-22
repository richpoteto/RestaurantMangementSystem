<div>
    <h3 class="qcont px-3 pt-4">{{ __('messages.withdraw')}} {{ __('messages.transactions')}}</h3>

    <div class="table-responsive">
        <table id="datatable"
            class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
            style="width: 100%">
            <thead class="thead-light">
                <tr>
                    <th>{{__('messages.sl#')}}</th>
                    <th>{{__('messages.created_at')}}</th>
                    <th>{{__('messages.amount')}}</th>
                    <th>{{__('messages.status')}}</th>
                    <th>{{__('messages.action')}}</th>
                </tr>
            </thead>
            <tbody>
            @php($withdraw_transaction = \App\Models\WithdrawRequest::where('vendor_id', $restaurant->vendor->id)->paginate(25))
            @foreach($withdraw_transaction as $k=>$wt)
                <tr>
                    <td scope="row">{{$k+$withdraw_transaction->firstItem()}}</td>
                    <td>{{date('Y-m-d '.config('timeformat'), strtotime($wt->created_at))}}</td>
                    <td>{{$wt->amount}}</td>
                    <td>
                        @if($wt->approved==0)
                            <label class="badge badge-primary">Pending</label>
                        @elseif($wt->approved==1)
                            <label class="badge badge-success">Approved</label>
                        @else
                            <label class="badge badge-danger">Denied</label>
                        @endif
                    </td>
                    <td>
                        <a href="{{route('admin.vendor.withdraw_view',[$wt['id'],$restaurant->vendor['id']])}}"
                            class="btn btn-white btn-sm"><i class="tio-visible"></i>
                        </a>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
</div>
</div>
<div class="card-footer">
    {!!$withdraw_transaction->links()!!}
</div>