<!-- Header -->
<div class="card-header">
    <h5 class="card-header-title">
        <i class="tio-users-switch"></i> {{trans('messages.top_customers')}}
    </h5>
    @php($params=session('dash_params'))
    @if($params['zone_id']!='all')
        @php($zone_name=\App\Models\Zone::where('id',$params['zone_id'])->first()->name)
    @else
        @php($zone_name='All')
    @endif
    <label class="badge badge-soft-info">( Zone : {{$zone_name}} )</label>
</div>
<!-- End Header -->

<!-- Body -->
<div class="card-body">
    <div class="row">
        @foreach($top_customer as $key=>$item)
            <div class="col-6 col-md-4 mt-2"
                 onclick="location.href='{{route('admin.customer.view',[$item['user_id']])}}'"
                 style="padding-left: 6px;padding-right: 6px;cursor: pointer">
                <div class="grid-card" style="min-height: 170px">
                    <label class="label_1">Orders : {{$item['count']}}</label>
                    <center class="mt-6">
                        <img style="border-radius: 50%;width: 60px;height: 60px"
                             onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                             src="{{asset('storage/app/public/profile/'.$item->customer->image??'')}}">
                    </center>
                    <div class="text-center mt-2">
                                            <span class=""
                                                  style="font-size: 10px">{{$item->customer['f_name']??'Not exist'}}</span>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>
<!-- End Body -->
