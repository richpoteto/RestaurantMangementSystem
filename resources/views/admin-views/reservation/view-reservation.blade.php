@extends('layouts.admin.app')

@section('title', __('messages.reservations'))

@push('css_or_js')
    <style>
        .item-box {
            height: 250px;
            width: 150px;
            padding: 3px;
        }

        .header-item {
            width: 10rem;
        }

    </style>
@endpush

@section('content')

    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="{{route('admin.reservation.ongoing')}}">{{__('messages.reservations')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page">{{__('messages.view')}} {{__('messages.info')}}</li>
                </ol>
            </nav>
        </div>
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">
                        <i class="tio-filter-list"></i> 
                        {{ __('messages.reservation') }} {{ __('messages.info') }}
                    </h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->

        <!-- Main Page -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <small class="nav-subtitle border-bottom text-secondary">{{ __('messages.reserve') }} {{ __('messages.info') }}</small>
                <br>
                <div class="row">
                    <div class="col-md-4 col-4"  style="width: 180px; height: 180px;">
                        <img style="width: 180px; height: 180px; border: 1px solid; border-radius: 10px; object-fit:cover;"
                            onerror="this.src='{{ asset('public/assets/admin/img/900x400/img1.jpg') }}'"
                            src="{{ asset('storage/app/public/tables/' . $reservation->table_image) }}"
                            alt="Product thumbnail" />                        
                    </div>
                    <div class="col-md-4 col-4">
                        <small class="nav-subtitle border-bottom text-secondary">{{ __('messages.table') }} {{ __('messages.name') }}</small>
                        <div class="row">
                            <label class="input-label" style="margin-left: 14px;">{{ $reservation->table_name }}</label>
                            @if($reservation->reserve_status==0)
                                <span class="badge badge-soft-info badge-pill ml-1">PENDING</span>
                            @elseif($reservation->reserve_status==1)
                                <span class="badge badge-soft-info badge-pill ml-1">APPROVED</span>
                            @else
                                <span class="badge badge-soft-info badge-pill ml-1">COMPLETED</span>
                            @endif                            
                        </div>
                        <font color="#ffba72" style="bold">Reserved for {{Str::limit($reservation->number_in_party,20,'...')}} guests</font>
                        <br>
                        <div class="row">
                            <i class="tio-calendar text-primary" style="margin-top: 4px; margin-left: 14px; margin-right: 5px;"></i>
                            <label class="input-label">{{ $reservation->reserve_date }}&nbsp;{{ $reservation->start_time }}&nbsp;~&nbsp;{{ $reservation->end_time }}</label>
                        </div>
                        <br>
                        <small class="nav-subtitle border-bottom text-secondary">{{ __('messages.venue') }} {{ __('messages.info') }}</small>
                        <label class="input-label">{{ $reservation->venue_name }}</label>
                        <div class="row">
                            <i class="tio-home text-primary" style="margin-top: 4px; margin-left: 14px; margin-right: 5px;"></i>
                            <label class="input-label">{{ $reservation->venue_address }}</label>
                        </div>
                    </div>
                    <div class="col-md-4 col-4">
                        <small class="nav-subtitle border-bottom text-secondary">{{ __('messages.chef') }} {{ __('messages.info') }}</small>
                        <label class="input-label">{{ $reservation->chef_name }}</label>
                        <div class="row">
                            <i class="tio-call text-primary" style="margin-top: 4px; margin-left: 14px; margin-right: 5px;"></i>
                            <label class="input-label">{{ $reservation->chef_phone }}</label>
                        </div>                        
                    </div>
                </div>                
            </div>
        </div>
        <!-- End Main Page -->

        <!-- Start Food Order -->
        <div>
            <br>
            <small class="nav-subtitle text-secondary border-bottom">{{ __('messages.order') }} {{ __('messages.info') }}</small>
            <br>

            <!-- Start Order Info -->
            <div class="row" style="margin-left: 12px;">
                <div class="col-md-4 col-4">
                    <div class="row">
                        <span>{{ __('messages.order') }} {{ __('messages.number') }}: </span>
                        <label class="input-label" style="margin-left: 54px;"><font color="#CC3300" style="bold">{{ $order->id }}</font></label>              
                    </div>
                    <div class="row">
                        <span>{{ __('messages.total') }} {{ __('messages.order') }} {{ __('messages.amount') }}: </span>
                        <label class="input-label" style="margin-left: 20px;">$ {{ $order->order_amount }}</label>             
                    </div>
                    <div class="row">
                        <span>{{ __('messages.placed') }} {{ __('messages.on') }}: </span>
                        <label class="input-label" style="margin-left: 88px;">{{ $reservation->updated_at }}</label>             
                    </div>
                </div>
                <div class="col-md-4 col-4">
                    <small class="nav-subtitle border-bottom text-secondary">{{ __('messages.special') }} {{ __('messages.management') }} {{ __('messages.instructions') }}:</small>
                    <label class="input-label" style="margin-left: 4px;">{{ $order->order_note }}</label>                    
                </div>
                <div class="col-md-4 col-4">
                    <small class="nav-subtitle border-bottom text-secondary">{{ __('messages.customer') }} {{ __('messages.info') }}</small>
                    <label class="input-label">{{ $reservation->customer_name }}</label>
                    <div class="row">
                        <i class="tio-email text-primary" style="margin-top: 4px; margin-left: 14px; margin-right: 5px;"></i>
                        <label class="input-label">{{ $reservation->customer_email }}</label>
                    </div>                                           
                </div>
            </div> 
            <!-- End Order Info -->
            
            <br>
            <small class="nav-subtitle text-secondary border-bottom">Order Details</small>
            <br>
            
            <!-- Body -->
            <div class="card-body">
                <?php
                    $total_addon_price = 0;
                    $product_price = 0;
                    
                    $details = $order->details;
                    if ($editing) {
                        $details = session('order_cart');
                    } else {
                        foreach ($details as $key => $item) {
                            $details[$key]->status = true;
                        }
                    }
                ?>
                    @foreach ($details as $key => $detail)
                        @if(isset($detail->food_id) && $detail->status)
                            <?php
                            if (!$editing) {
                                $detail->food = json_decode($detail->food_details, true);
                            }
                            ?>
    
                            <!-- Media -->
                            <div class="media">
                                @if ($editing)
                                    <div class="avatar avatar-xl mr-3 cursor-pointer"
                                        onclick="quick_view_cart_item({{ $key }})"
                                        title="{{ __('messages.click_to_edit_this_item') }}">
                                        <span class="avatar-status avatar-lg-status avatar-status-dark"><i
                                                class="tio-edit"></i></span>
                                        <img class="img-fluid"
                                            src="{{ asset('storage/app/public/product') }}/{{ $detail->food['image'] }}"
                                            onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'"
                                            alt="Image Description">
                                    </div>
                                @else
                                    <a class="avatar avatar-xl mr-3"
                                        href="{{ route('admin.food.view', $detail->food['id']) }}">
                                        <img class="img-fluid"
                                            src="{{ asset('storage/app/public/product') }}/{{ $detail->food['image'] }}"
                                            onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'"
                                            alt="Image Description">
                                    </a>
                                @endif
                                <div class="media-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3 mb-md-0">
                                            <strong> {{ Str::limit($detail->food['name'], 20, '...') }}</strong><br>
    
                                            @if (count(json_decode($detail['variation'], true)) > 0)
                                                <strong><u>{{ __('messages.variation') }} : </u></strong>
                                                @foreach (json_decode($detail['variation'], true)[0] as $key1 => $variation)
                                                    <div class="font-size-sm text-body">
                                                        <span>{{ $key1 }} : </span>
                                                        <span
                                                            class="font-weight-bold">{{ Str::limit($variation, 15, '...') }}</span>
                                                    </div>
                                                @endforeach
                                            @endif
    
                                            @foreach (json_decode($detail['add_ons'], true) as $key2 => $addon)
                                                @if ($key2 == 0)
                                                    <strong><u>{{ __('messages.addons') }} : </u></strong>
                                                @endif
                                                <div class="font-size-sm text-body">
                                                    <span>{{ Str::limit($addon['name'], 20, '...') }} : </span>
                                                    <span class="font-weight-bold">
                                                        {{ $addon['quantity'] }} x
                                                        {{ \App\CentralLogics\Helpers::format_currency($addon['price']) }}
                                                    </span>
                                                </div>
                                                @php($total_addon_price += $addon['price'] * $addon['quantity'])
                                            @endforeach
                                        </div>
    
                                        <div class="col col-md-2 align-self-center">
                                            <h6>{{ \App\CentralLogics\Helpers::format_currency($detail['price']) }}
                                            </h6>
                                        </div>
                                        <div class="col col-md-1 align-self-center">
                                            <h5>{{ $detail['quantity'] }}</h5>
                                        </div>
    
                                        <div class="col col-md-3 align-self-center text-right">
                                            @php($amount = $detail['price'] * $detail['quantity'])
                                            <h5>{{ \App\CentralLogics\Helpers::format_currency($amount) }}</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @php($product_price += $amount)
                            <!-- End Media -->
                            <hr>
                        @elseif(isset($detail->item_campaign_id) && $detail->status)
                            <?php
                            if (!$editing) {
                                $detail->campaign = json_decode($detail->food_details, true);
                            }
                            ?>
                            <!-- Media -->
                            <div class="media">
                                @if ($editing)
                                    <div class="avatar avatar-xl mr-3  cursor-pointer"
                                        onclick="quick_view_cart_item({{ $key }})"
                                        title="{{ __('messages.click_to_edit_this_item') }}">
                                        <span class="avatar-status avatar-lg-status avatar-status-dark"><i
                                                class="tio-edit"></i></span>
                                        <img class="img-fluid"
                                            src="{{ asset('storage/app/public/campaign') }}/{{ $detail->campaign['image'] }}"
                                            onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'"
                                            alt="Image Description">
                                    </div>
                                @else
                                    <a class="avatar avatar-xl mr-3"
                                        href="{{ route('admin.campaign.view', ['item', $detail->campaign['id']]) }}">
                                        <img class="img-fluid"
                                            src="{{ asset('storage/app/public/campaign') }}/{{ $detail->campaign['image'] }}"
                                            onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'"
                                            alt="Image Description">
                                    </a>
                                @endif
    
    
                                <div class="media-body">
                                    <div class="row">
                                        <div class="col-md-6 mb-3 mb-md-0">
                                            <strong>
                                                {{ Str::limit($detail->campaign['name'], 20, '...') }}</strong><br>
    
                                            @if (count(json_decode($detail['variation'], true)) > 0)
                                                <strong><u>{{ __('messages.variation') }} : </u></strong>
                                                @foreach (json_decode($detail['variation'], true)[0] as $key1 => $variation)
                                                    <div class="font-size-sm text-body">
                                                        <span>{{ $key1 }} : </span>
                                                        <span
                                                            class="font-weight-bold">{{ Str::limit($variation, 20, '...') }}</span>
                                                    </div>
                                                @endforeach
                                            @endif
    
                                            @foreach (json_decode($detail['add_ons'], true) as $key2 => $addon)
                                                @if ($key2 == 0)
                                                    <strong><u>{{ __('messages.addons') }} : </u></strong>
                                                @endif
                                                <div class="font-size-sm text-body">
                                                    <span>{{ Str::limit($addon['name'], 20, '...') }} : </span>
                                                    <span class="font-weight-bold">
                                                        {{ $addon['quantity'] }} x
                                                        {{ \App\CentralLogics\Helpers::format_currency($addon['price']) }}
                                                    </span>
                                                </div>
                                                @php($total_addon_price += $addon['price'] * $addon['quantity'])
                                            @endforeach
                                        </div>
    
                                        <div class="col col-md-2 align-self-center">
                                            <h6>{{ \App\CentralLogics\Helpers::format_currency($detail['price']) }}
                                            </h6>
                                        </div>
                                        <div class="col col-md-1 align-self-center">
                                            <h5>{{ $detail['quantity'] }}</h5>
                                        </div>
    
                                        <div class="col col-md-3 align-self-center text-right">
                                            @php($amount = $detail['price'] * $detail['quantity'])
                                            <h5>{{ \App\CentralLogics\Helpers::format_currency($amount) }}</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @php($product_price += $amount)
                            <!-- End Media -->
                            <hr>
                        @endif
                    @endforeach
    
                <?php
                    $service_charge = $order->restaurant->service_charge;
                    $server_tip = $order->restaurant->server_tip;
                    $promo = $order->restaurant->promo;
                    $tax = $order->restaurant->tax;
                    
                    $total_price = $product_price + $total_addon_price + $service_charge + $server_tip + $promo;
                    
                    $total_tax_amount = $tax > 0 ? ($total_price * $tax) / 100 : 0;
                    $total_tax_amount = round($total_tax_amount, 2);
                    $total_price += $total_tax_amount;
                ?>

                <div class="row justify-content-md-end mb-3">
                    <div class="col-md-9 col-lg-8">
                        <dl class="row text-sm-right">
                            <dt class="col-sm-6 text-capitalize">{{ __('messages.items') }}&nbsp;{{ __('messages.price') }}:</dt>
                            <dd class="col-sm-6">
                                {{ \App\CentralLogics\Helpers::format_currency($product_price) }}</dd>
                            <dt class="col-sm-6">{{ __('messages.addon') }}
                                {{ __('messages.cost') }}:
                            </dt>
                            <dd class="col-sm-6">
                                {{ \App\CentralLogics\Helpers::format_currency($total_addon_price) }}
                                <hr>
                            </dd>
                            <dt class="col-sm-6">{{ __('messages.subtotal') }}:</dt>
                            <dd class="col-sm-6">
                                {{ \App\CentralLogics\Helpers::format_currency($product_price + $total_addon_price) }}
                            </dd>
                            
                            <dt class="col-sm-6">Service Charge:</dt>
                            <dd class="col-sm-6">
                                + {{ \App\CentralLogics\Helpers::format_currency($service_charge) }}</dd>
                                <dt class="col-sm-6">Server_tip:</dt>
                            <dd class="col-sm-6">
                                + {{ \App\CentralLogics\Helpers::format_currency($server_tip) }}</dd>
                                <dt class="col-sm-6">Promo:</dt>
                            <dd class="col-sm-6">
                                + {{ \App\CentralLogics\Helpers::format_currency($promo) }}</dd>
                            <dt class="col-sm-6">{{ __('messages.vat/tax') }}:&nbsp;({{ $tax }}%)</dt>
                            <dd class="col-sm-6">
                                + {{ \App\CentralLogics\Helpers::format_currency($total_tax_amount) }}
                                <hr>
                            </dd>
                            <dt class="col-sm-6">{{ __('messages.total') }}:</dt>
                            <dd class="col-sm-6">
                                {{ \App\CentralLogics\Helpers::format_currency($total_price) }}
                            </dd>
                        </dl>
                        <!-- End Row -->
                    </div>
                    @if($editing)
                        <div class="offset-sm-8 col-sm-4 d-flex justify-content-between">
                            <button class="btn btn-sm btn-danger" type="button"
                                onclick="cancle_editing_order()">{{ __('messages.cancel') }}</button>
                            <button class="btn btn-sm btn-primary" type="button"
                                onclick="update_order()">{{ __('messages.submit') }}</button>
                        </div>
                    @endif
                    
                    @if($reservation->reserve_status==0 || $reservation->reserve_status==1)
                        <div class="offset-sm-8 col-sm-4 d-flex justify-content-end mt-6">
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#myModal" data-lat='21.03' data-lng='105.85'>
                                {{ $reservation->reserve_status==0?'Approve Order':'Complete Order' }}
                            </button>
                        </div>
                    @endif
                </div>
                <!-- End Row -->
            </div>
            <!-- End Body -->
            
            <br>
        </div>
        <!-- End Food Order -->
    </div>

@endsection

@push('script_2')
@endpush
