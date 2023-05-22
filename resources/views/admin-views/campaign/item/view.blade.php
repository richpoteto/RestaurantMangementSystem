@extends('layouts.admin.app')

@section('title','Item Campaign Preview')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row">
                <div class="col-6">
                    <h1 class="page-header-title text-break">{{$campaign['title']}}</h1>
                </div>
                <div class="col-6">
                    <a href="{{route('admin.campaign.edit',['item',$campaign['id']])}}" class="btn btn-primary float-right">
                        <i class="tio-edit"></i> {{__('messages.edit')}}
                    </a>
                </div>
            </div>
        </div>
        <!-- End Page Header -->

        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
            <!-- Body -->
            <div class="card-body">
                <div class="row align-items-md-center gx-md-5">
                    <div class="col-sm-4 mb-3 mb-md-0">
                        <div class="d-flex align-items-center">
                            <img class="avatar avatar-xxl avatar-4by3 mr-4"
                                 src="{{asset('storage/app/public/campaign')}}/{{$campaign['image']}}"
                                 onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'"
                                 alt="Image Description">
                            {{--<!-- <div class="d-block">
                                <h4 class="display-2 text-dark mb-0">{{count($campaign->rating)>0?number_format($campaign->rating[0]->average, 2, '.', ' '):0}}</h4>
                                <p> {{__('messages.of')}} {{$campaign->reviews->count()}} {{__('messages.reviews')}}
                                    <span class="badge badge-soft-dark badge-pill ml-1"></span>
                                </p>
                            </div> -->--}}
                        </div>
                    </div>

                    {{--<div class="col-md">
                        <ul class="list-unstyled list-unstyled-py-2 mb-0">

                        @php($total=$campaign->reviews->count())
                        <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                @php($five=\App\CentralLogics\Helpers::rating_count($campaign['id'],5))
                                <span
                                    class="mr-3">5 star</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: {{$total==0?0:($five/$total)*100}}%;"
                                         aria-valuenow="{{$total==0?0:($five/$total)*100}}"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3">{{$five}}</span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                @php($four=\App\CentralLogics\Helpers::rating_count($campaign['id'],4))
                                <span class="mr-3">4 star</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: {{$total==0?0:($four/$total)*100}}%;"
                                         aria-valuenow="{{$total==0?0:($four/$total)*100}}"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3">{{$four}}</span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                @php($three=\App\CentralLogics\Helpers::rating_count($campaign['id'],3))
                                <span class="mr-3">3 star</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: {{$total==0?0:($three/$total)*100}}%;"
                                         aria-valuenow="{{$total==0?0:($three/$total)*100}}"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3">{{$three}}</span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                @php($two=\App\CentralLogics\Helpers::rating_count($campaign['id'],2))
                                <span class="mr-3">2 star</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: {{$total==0?0:($two/$total)*100}}%;"
                                         aria-valuenow="{{$total==0?0:($two/$total)*100}}"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3">{{$two}}</span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                @php($one=\App\CentralLogics\Helpers::rating_count($campaign['id'],1))
                                <span class="mr-3">1 star</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: {{$total==0?0:($one/$total)*100}}%;"
                                         aria-valuenow="{{$total==0?0:($one/$total)*100}}"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3">{{$one}}</span>
                            </li>
                            <!-- End Review Ratings -->
                        </ul>
                    </div>--}}
                    <div class="col-sm-5">
                        <small class="card-subtitle border-bottom">{{__('messages.campaign')}} {{__('messages.info')}}</small>
                        <small class="text-dark">
                            {{__('messages.campaign')}} {{__('messages.starts')}} {{__('messages.from')}} : {{$campaign->start_date->format('Y-M-d')}}
                        </small><br>
                        <small class="text-dark">
                            {{__('messages.campaign')}} {{__('messages.ends')}} {{__('messages.at')}} : {{$campaign->end_date->format('Y-M-d')}}
                        </small><br>
                        <small class="text-dark">
                            {{__('messages.available')}} {{__('messages.time')}} {{__('messages.starts')}} : {{$campaign->start_time->format(config('timeformat'))}}
                        </small><br>
                        <small class="text-dark">
                            {{__('messages.available')}} {{__('messages.time')}} {{__('messages.ends')}} : {{$campaign->end_time->format(config('timeformat'))}}
                        </small>
                    </div>
                    <div class="col-sm-3 border-left text-center">
                        <span class="mb-1">Restaurant info</span>
                        @if($campaign->restaurant)
                        <a href="{{route('admin.vendor.view', $campaign->restaurant_id)}}" title="{{$campaign->restaurant['name']}}">
                            <img
                                class="avatar-img avatar-circle" style="width: 75px;margin:auto;"
                                onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                src="{{asset('storage/app/public/restaurant/'.$campaign->restaurant->logo)}}"
                                alt="Image Description">
                            <label class="input-label">{{$campaign->restaurant['name']}}</label>
                        </a>
                        @else
                        <span class="badge-info">{{__('messages.restaurant')}} {{__('messages.deleted')}}</span>
                        @endif
                    </div>
                    <div class="col-12 pt-2">
                        <div class="card">
                            <div class="card-body">
                                <small class="card-subtitle border-bottom">{{__('messages.item')}} {{__('messages.info')}}</small>
                                <div class="row">
                                    <div class="col-4 pt-2">
                                        <small class="text-dark">{{__('messages.price')}} : {{\App\CentralLogics\Helpers::format_currency($campaign['price'])}}
                                        </small class="text-dark"><br>
                                        <small class="text-dark">{{__('messages.tax')}} :
                                            {{\App\CentralLogics\Helpers::format_currency(\App\CentralLogics\Helpers::tax_calculate($campaign,$campaign['price']))}}
                                        </small class="text-dark"><br>
                                        <small class="text-dark">{{__('messages.discount')}} :
                                            {{\App\CentralLogics\Helpers::format_currency(\App\CentralLogics\Helpers::discount_calculate($campaign,$campaign['price']))}}
                                        </small class="text-dark"><br>
                                        
                                        <small class="card-subtitle border-bottom mt-2"> {{__('messages.variations')}} </small><br>
                                        @foreach(json_decode($campaign['variations'],true) as $variation)
                                            <small class="text-capitalize">
                                            {{$variation['type']}} : {{\App\CentralLogics\Helpers::format_currency($variation['price'])}}
                                            </small><br>
                                        @endforeach
                                        <small class="card-subtitle border-bottom mt-2"> Addons </small><br>
                                        @foreach(\App\Models\AddOn::whereIn('id',json_decode($campaign['add_ons'],true))->get() as $addon)
                                            <small class="text-capitalize">
                                            {{$addon['name']}} : {{\App\CentralLogics\Helpers::format_currency($addon['price'])}}
                                            </small><br>
                                        @endforeach
                                    </div>
                                    <div class="col-8 pt-2 border-left">
                                        <h4>{{__('messages.short')}} {{__('messages.description')}} : </h4>
                                        <p>{{$campaign['description']}}</p>
                                    </div> 
                                </div>
                                
                            </div>
                        </div> 
                    </div>
                    
                </div>
            </div>
            <!-- End Body -->
        </div>
        <!-- End Card -->
        @php($orders = $campaign->orderdetails()->paginate(config('default_pagination')))
        <!-- Card -->
        <div class="card">
            <div class="table-responsive datatable-custom">
                <table id="datatable"
                       class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                       style="width: 100%"
                       data-hs-datatables-options='{
                     "columnDefs": [{
                        "targets": [0],
                        "orderable": false
                      }],
                     "order": [],
                     "info": {
                       "totalQty": "#datatableWithPaginationInfoTotalQty"
                     },
                     "search": "#datatableSearch",
                     "entries": "#datatableEntries",
                     "pageLength": 25,
                     "isResponsive": false,
                     "isShowPaging": false,
                     "pagination": "datatablePagination"
                   }'>
                    <thead class="thead-light">
                    <tr>
                        <th class="">
                            {{__('messages.#')}}
                        </th>
                        <th class="table-column-pl-0">{{__('messages.order')}}</th>
                        <th>{{__('messages.date')}}</th>
                        <th>{{__('messages.customer')}}</th>
                        <th>{{__('messages.vendor')}}</th>
                        <th>{{__('messages.payment')}} {{__('messages.status')}}</th>
                        <th>{{__('messages.total')}}</th>
                        <th>{{__('messages.order')}} {{__('messages.status')}}</th>
                    </tr>
                    </thead>

                    <tbody id="set-rows">
                    @foreach($orders as $key=>$order)

                        <tr class="status-{{$order['order_status']}} class-all">
                            <td class="">
                                {{$key+1}}
                            </td>
                            <td class="table-column-pl-0">
                                <a href="{{route('admin.order.details',['id'=>$order['order_id']])}}">{{$order->order['id']}}</a>
                            </td>
                            <td>{{date('d M Y',strtotime($order->order['created_at']))}}</td>
                            <td>
                                @if($order->order->customer)
                                    <a class="text-body text-capitalize"
                                       href="{{route('admin.customer.view',[$order->order['user_id']])}}">{{$order->order->customer['f_name'].' '.$order->order->customer['l_name']}}</a>
                                @else
                                    <label class="badge badge-danger">{{__('messages.invalid')}} {{__('messages.customer')}} {{__('messages.data')}}</label>
                                @endif
                            </td>
                            <td>
                                <label class="badge badge-soft-primary">{{Str::limit($order->order->restaurant?$order->order->restaurant->name:__('messages.Restaurant deleted!'),20,'...')}}</label>
                            </td>
                            <td>
                                @if($order->order->payment_status=='paid')
                                    <span class="badge badge-soft-success">
                                      <span class="legend-indicator bg-success"></span>{{__('messages.paid')}}
                                    </span>
                                @else
                                    <span class="badge badge-soft-danger">
                                      <span class="legend-indicator bg-danger"></span>{{__('messages.unpaid')}}
                                    </span>
                                @endif
                            </td>
                            <td>{{\App\CentralLogics\Helpers::format_currency($order->order['order_amount'])}}</td>
                            <td class="text-capitalize">
                                @if($order->order['order_status']=='pending')
                                    <span class="badge badge-soft-info ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-info"></span>{{__('messages.pending')}}
                                    </span>
                                @elseif($order->order['order_status']=='confirmed')
                                    <span class="badge badge-soft-info ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-info"></span>{{__('messages.confirmed')}}
                                    </span>
                                @elseif($order->order['order_status']=='processing')
                                    <span class="badge badge-soft-warning ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-warning"></span>{{__('messages.processing')}}
                                    </span>
                                @elseif($order->order['order_status']=='out_for_delivery')
                                    <span class="badge badge-soft-warning ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-warning"></span>{{__('messages.out_for_delivery')}}
                                    </span>
                                @elseif($order->order['order_status']=='delivered')
                                    <span class="badge badge-soft-success ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-success"></span>{{__('messages.delivered')}}
                                    </span>
                                @else
                                    <span class="badge badge-soft-danger ml-2 ml-sm-3">
                                      <span class="legend-indicator bg-danger"></span>{{str_replace('_',' ',$order->order['order_status'])}}
                                    </span>
                                @endif
                            </td>
                        </tr>

                    @endforeach
                    </tbody>
                </table>
            </div>
            <!-- Footer -->
            <div class="card-footer">
                <!-- Pagination -->
                <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
                    <div class="col-12">
                        {!! $orders->links() !!}
                    </div>
                </div>
                <!-- End Pagination -->
            </div>
            <!-- End Footer -->
        </div>
        <!-- End Card -->
    </div>
@endsection

@push('script_2')

@endpush
