<!-- Header -->
<div class="card-header">
    <h5 class="card-header-title">
        <i class="tio-bike"></i> {{trans('messages.top_deliveryman')}}
    </h5>
    @php($params=session('dash_params'))
    @if($params['zone_id']!='all')
        @php($zone_name=\App\Models\Zone::where('id',$params['zone_id'])->first()->name)
    @else
        @php($zone_name='All')
    @endif
    <label class="badge badge-soft-info">( {{__('messages.zone')}} : {{$zone_name}} )</label>
</div>
<!-- End Header -->

<!-- Body -->
<div class="card-body">
    <div class="row">
        @foreach($top_deliveryman as $key=>$item)
            <div class="col-md-4 col-6 mt-2" style="padding-left: 6px;padding-right: 6px">
                <div class="grid-card" style="min-height: 170px">
                    <label class="label_1">Orders : {{$item['order_count']}}</label>
                    <center class="mt-6">
                        <img style="border-radius: 50%;width: 60px;height: 60px"
                             onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                             src="{{asset('storage/app/public/delivery-man')}}/{{$item['image']??''}}">
                    </center>
                    <div class="text-center mt-2">
                        <span class=""
                                style="font-size: 10px">{{$item['f_name']??'Not exist'}}</span>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>
<!-- End Body -->
