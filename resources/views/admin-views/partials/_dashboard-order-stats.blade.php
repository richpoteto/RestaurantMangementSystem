<div class="col-12">
    @php($params=session('dash_params'))
    @if($params['zone_id']!='all')
        @php($zone_name=\App\Models\Zone::where('id',$params['zone_id'])->first()->name)
    @else
        @php($zone_name='All')
    @endif
    <label class="badge badge-soft-info">( {{__('messages.zone')}} : {{$zone_name}} )</label>
</div>

<div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
    <!-- Card -->
    <a class="card card-hover-shadow h-100" href="{{route('admin.dispatch.list',['searching_for_deliverymen'])}}"
       style="background: #54436B">
        <div class="card-body">
            <h6 class="card-subtitle"
                style="color: white!important;">{{__('order_texts.searching_for_delivery_man')}}</h6>
            <div class="row align-items-center gx-2 mb-1">
                <div class="col-6">
                                        <span class="card-title h2" style="color: white!important;">
                                            {{$data['searching_for_dm']}}
                                        </span>
                </div>
                <div class="col-6 mt-2">
                    <i class="tio-man" style="font-size: 30px;color: white"></i>
                    <i class="tio-search"
                       style="font-size: 22px;margin-left:-10px;color: white"></i>
                </div>
            </div>
            <!-- End Row -->
        </div>
    </a>
    <!-- End Card -->
</div>

<div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
    <!-- Card -->
    <a class="card card-hover-shadow h-100" href="{{route('admin.order.list',['accepted'])}}"
       style="background: #402218">
        <div class="card-body">
            <h6 class="card-subtitle"
                style="color: white!important;">{{__('order_texts.accepted_by_delivery_man')}}</h6>

            <div class="row align-items-center gx-2 mb-1">
                <div class="col-6">
                        <span class="card-title h2" style="color: white!important;">
                            {{$data['accepted_by_dm']}}
                        </span>
                </div>

                <div class="col-6 mt-2">
                    <i class="tio-man" style="font-size: 30px;color: white"></i>
                    <i class="tio-checkmark-circle-outlined"
                       style="font-size: 22px;margin-left:-10px;color: white"></i>
                </div>
            </div>
            <!-- End Row -->
        </div>
    </a>
    <!-- End Card -->
</div>

<div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
    <!-- Card -->
    <a class="card card-hover-shadow h-100" href="{{route('admin.order.list',['processing'])}}"
       style="background: #57837B">
        <div class="card-body">
            <h6 class="card-subtitle"
                style="color: white!important;">{{__('order_texts.preparing_in_restaurants')}}</h6>

            <div class="row align-items-center gx-2 mb-1">
                <div class="col-6">
                        <span class="card-title h2" style="color: white!important;">
                            {{$data['preparing_in_rs']}}
                        </span>
                </div>

                <div class="col-6 mt-2">
                    <i class="tio-man" style="font-size: 30px;color: white"></i>
                    <i class="tio-restaurant"
                       style="font-size: 22px;margin-left:-10px;color: white"></i>
                </div>
            </div>
            <!-- End Row -->
        </div>
    </a>
    <!-- End Card -->
</div>

<div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
    <a class="card card-hover-shadow h-100" href="{{route('admin.order.list',['food_on_the_way'])}}"
       style="background: #334257">
        <div class="card-body">
            <h6 class="card-subtitle"
                style="color: white!important;">{{__('order_texts.picked_up')}}</h6>

            <div class="row align-items-center gx-2 mb-1">
                <div class="col-6">
                    <span class="card-title h2" style="color: white!important;">
                        {{$data['picked_up']}}
                    </span>
                </div>

                <div class="col-6 mt-2">
                    <i class="tio-bike" style="font-size: 30px;color: white"></i>
                    <i class="tio-gift"
                       style="font-size: 22px;margin-left:-6px;color: white"></i>
                </div>
            </div>
        </div>
    </a>
</div>

<!--<div class="col-12">-->
<!--    <div class="card card-body" style="background: #FEF7DC!important;">-->
<!--        <div class="row gx-lg-4">-->
<!--            <div class="col-sm-6 col-lg-3">-->
<!--                <div class="media" style="cursor: pointer"-->
<!--                     onclick="location.href='{{route('admin.order.list',['delivered'])}}'">-->
<!--                    <div class="media-body">-->
<!--                        <h6 class="card-subtitle">{{__('messages.delivered')}}</h6>-->
<!--                        <span class="card-title h3">-->
<!--                                             {{$data['delivered']}}-->
<!--                                            </span>-->
<!--                    </div>-->
<!--                    <span class="icon icon-sm icon-soft-secondary icon-circle ml-3">-->
<!--                                          <i class="tio-checkmark-circle-outlined"></i>-->
<!--                                        </span>-->
<!--                </div>-->
<!--                <div class="d-lg-none">-->
<!--                    <hr>-->
<!--                </div>-->
<!--            </div>-->

<!--            <div class="col-sm-6 col-lg-3 column-divider-sm">-->
<!--                <div class="media" style="cursor: pointer"-->
<!--                     onclick="location.href='{{route('admin.order.list',['canceled'])}}'">-->
<!--                    <div class="media-body">-->
<!--                        <h6 class="card-subtitle">{{__('messages.canceled')}}</h6>-->
<!--                        <span-->
<!--                            class="card-title h3">{{$data['canceled']}}</span>-->
<!--                    </div>-->
<!--                    <span class="icon icon-sm icon-soft-secondary icon-circle ml-3">-->
<!--                                          <i class="tio-remove-from-trash"></i>-->
<!--                                        </span>-->
<!--                </div>-->
<!--                <div class="d-lg-none">-->
<!--                    <hr>-->
<!--                </div>-->
<!--            </div>-->

<!--            <div class="col-sm-6 col-lg-3 column-divider-lg">-->
<!--                <div class="media" style="cursor: pointer"-->
<!--                     onclick="location.href='{{route('admin.order.list',['failed'])}}'">-->
<!--                    <div class="media-body">-->
<!--                        <h6 class="card-subtitle">{{__('messages.payment')}} {{__('messages.failed')}}</h6>-->
<!--                        <span-->
<!--                            class="card-title h3">{{$data['refund_requested']}}</span>-->
<!--                    </div>-->
<!--                    <span class="icon icon-sm icon-soft-secondary icon-circle ml-3">-->
<!--                                          <i class="tio-hand-wave"></i>-->
<!--                                        </span>-->
<!--                </div>-->
<!--                <div class="d-lg-none">-->
<!--                    <hr>-->
<!--                </div>-->
<!--            </div>-->

<!--            <div class="col-sm-6 col-lg-3 column-divider-sm">-->
<!--                <div class="media" style="cursor: pointer"-->
<!--                     onclick="location.href='{{route('admin.order.list',['refunded'])}}'">-->
<!--                    <div class="media-body">-->
<!--                        <h6 class="card-subtitle">{{__('messages.refunded')}}</h6>-->
<!--                        <span-->
<!--                            class="card-title h3">{{$data['refunded']}}</span>-->
<!--                    </div>-->
<!--                    <span class="icon icon-sm icon-soft-secondary icon-circle ml-3">-->
<!--                                          <i class="tio-history"></i>-->
<!--                                        </span>-->
<!--                </div>-->
<!--                <div class="d-lg-none">-->
<!--                    <hr>-->
<!--                </div>-->
<!--            </div>-->
<!--        </div>-->
<!--    </div>-->
<!--</div>-->
