<!-- Header -->
<div class="card-header">
    <h5 class="card-header-title">
        <i class="tio-medal"></i> {{trans('messages.top_restaurants')}}
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
        <div class="col-12">
            <table class="table">
                <tbody>
                @foreach($top_restaurants as $key=>$item)
                    <tr onclick="location.href='{{route('admin.vendor.view', $item->id)}}'"
                        style="cursor: pointer">
                        <td scope="row">
                            <img height="35" style="border-radius: 5px"
                                 onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                 src="{{asset('storage/app/public/restaurant')}}/{{$item['logo']}}">
                            <span class="ml-2">
                                    {{Str::limit($item->name??__('messages.Restaurant deleted!'), 20, '...')}}
                            </span>
                        </td>
                        <td>
                            <span style="font-size: 18px">
                                {{$item['order_count']}} <i style="color: #0d95e8" class="tio-shopping-cart"></i>
                            </span>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- End Body -->
