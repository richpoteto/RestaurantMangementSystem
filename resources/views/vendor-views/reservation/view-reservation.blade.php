@extends('layouts.vendor.app')

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
                    <li class="breadcrumb-item"><a href="{{route('vendor.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="{{route('vendor.reservation.ongoing')}}">{{__('messages.reservations')}}</a></li>
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
                        <label class="input-label" style="margin-left: 20px;">$ {{ $reservation->price }}</label>             
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
                    <small class="nav-subtitle border-bottom text-secondary">Order Status</small>
                    <label class="input-label"></label>
                        @if($reservation->reserve_status==0)
                            <span class="badge badge-soft-info badge-pill ml-1">PENDING</span>
                        @elseif($reservation->reserve_status==1)
                            <span class="badge badge-soft-info badge-pill ml-1">APPROVED & PREPARING</span>
                        @elseif($reservation->reserve_status==2)
                            <span class="badge badge-soft-info badge-pill ml-1">READY FOR SERVE</span>
                        @elseif($reservation->reserve_status==3)
                            <span class="badge badge-soft-info badge-pill ml-1">COMPLETED</span>
                        @endif
                    <div style="margin-top: 24px;">
                        <small class="nav-subtitle border-bottom text-secondary">Payment Status</small>
                        <label class="input-label"></label>
                            @if($reservation->payment_status=='paid')
                                <span class="badge badge-soft-success">
                                    <span class="legend-indicator bg-success"></span>{{__('messages.paid')}}
                                </span>
                            @else
                                <span class="badge badge-soft-danger">
                                    <span class="legend-indicator bg-danger"></span>{{__('messages.unpaid')}}
                                </span>
                            @endif
                    </div>                                           
                </div>
            </div> 
            <!-- End Order Info -->
            
            <br>
            <small class="nav-subtitle text-secondary border-bottom">Order Details</small>
            <br>
            
            <!-- Body -->
            <div class="card-body">
                <div class="row justify-content-md-end mb-3">
                    <div class="col-md-9 col-lg-8">
                        <?php
                            $product_price = 0;
                            $total_addon_price = 0;
                            
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
                                        <div class="media-body">
                                            <div class="row">
                                                <div class="col-md-3 mb-3 mb-md-0 col-12">
                                                    <img class="img-fluid"
                                                        src="{{ asset('storage/app/public/product') }}/{{ $detail->food['image'] }}"
                                                        onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'"
                                                        alt="Image Description" style="width: 72px; height: 72px; object-fit: cover; border-radius: 10%;">
                                                </div>
                                                <div class="col-md-3 mb-3 mb-md-0 col-12">
                                                    <strong> {{ Str::limit($detail->food['name'], 20, '...') }}</strong><br>
                                                    <div class="col col-md-2 align-self-center">
                                                        <h6>${{ $detail['price'] }}&nbsp;x&nbsp;{{ $detail['quantity'] }}</h6>
                                                    </div>
            
                                                    @if (count(json_decode($detail['variation'], true)) > 0)
                                                        <strong><u>{{ __('messages.variation') }} : </u></strong>
                                                        @foreach (json_decode($detail['variation'], true)[0] as $key1 => $variation)
                                                            <div class="font-size-sm text-body">
                                                                <span>{{ $key1 }} : </span>
                                                                <span class="font-weight-bold">{{ Str::limit($variation, 15, '...') }}</span>
                                                            </div>
                                                        @endforeach
                                                    @endif
                                                </div>
                                                <div class="col-md-3 text-left col-12">
                                                    @php($addon_price = 0)
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
                                                        @php($addon_price += $addon['price'] * $addon['quantity'])
                                                        @php($total_addon_price += $addon['price'] * $addon['quantity'])
                                                    @endforeach
                                                    @php($amount = $detail['price'] * $detail['quantity'])
                                                </div>
                                                <div class="col-md-3 text-right col-12">
                                                    <h5>${{ round($amount + $addon_price, 2) }}</h5>
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
                            $service_charge = $order->service_charge;
                            $server_tip = $order->server_tip_amount;
                            $promo = $order->promo;
                            $tax = $order->tax;
                            
                            $sub_total = $product_price + $total_addon_price;
                            
                            $tax_amount = $tax > 0 ? ($sub_total * $tax) / 100 : 0;
                            $total_tax_amount = number_format($tax_amount, 2, '.', '');
                            
                            $promo_amount = $promo > 0 ? ($sub_total * $promo) / 100 : 0;
                            $total_promo_amount = number_format($promo_amount, 2, '.', '');
                            
                            $service_charge_amount = $service_charge > 0 ? ($sub_total * $service_charge) / 100 : 0;
                            $total_service_charge_amount = number_format($service_charge_amount, 2, '.', '');
                            
                            $service_tip_amount = 0;
                            if($order->server_tip_method == 1){
                                $service_tip_amount = $server_tip > 0 ? ($sub_total * $server_tip) / 100 : 0;
                            }else if($order->server_tip_method == 2){
                                $service_tip_amount = $server_tip > 0 ? $server_tip : 0;
                            }
                            $total_service_tip_amount = number_format($service_tip_amount, 2, '.', '');
                            
                            $total_price = $sub_total + $total_tax_amount + $total_promo_amount + $total_service_charge_amount + $total_service_tip_amount;
                        ?>
                        <dl class="row text-sm-right">
                            <dt class="col-sm-6 text-capitalize">{{ __('messages.items') }}&nbsp;{{ __('messages.price') }}:</dt>
                            <dd class="col-sm-6">
                                ${{ $product_price }}</dd>
                            <dt class="col-sm-6">{{ __('messages.addon') }}
                                {{ __('messages.cost') }}:
                            </dt>
                            <dd class="col-sm-6">
                                ${{ $total_addon_price }}
                                <hr>
                            </dd>
                            <dt class="col-sm-6">{{ __('messages.subtotal') }}:</dt>
                            <dd class="col-sm-6">
                                ${{ $sub_total }}
                            </dd>
                            
                            <dt class="col-sm-6">Service Charge&nbsp;({{$service_charge}}%):</dt>
                            <dd class="col-sm-6">
                                + ${{ $total_service_charge_amount }}</dd>
                                <dt class="col-sm-6">Server Tip&nbsp;({{$server_tip}}%):</dt>
                            <dd class="col-sm-6">
                                + ${{ $total_service_tip_amount }}</dd>
                                <dt class="col-sm-6">Promo&nbsp;({{$promo}}%):</dt>
                            <dd class="col-sm-6">
                                + ${{ $total_promo_amount }}</dd>
                            <dt class="col-sm-6">{{ __('messages.vat/tax') }}&nbsp;({{ $tax }}%):</dt>
                            <dd class="col-sm-6">
                                + ${{ $total_tax_amount }}
                                <hr>
                            </dd>
                            <dt class="col-sm-6">{{ __('messages.total') }}:</dt>
                            <dd class="col-sm-6">
                                ${{ $total_price }}
                            </dd>
                        </dl>
                        <!-- End Row -->
                    </div>
                    <div class="col-lg-4">
                        <!-- Card -->
                        <div class="card">
                            <!-- Header -->
                            <div class="card-header">
                                <h4 class="card-header-title">{{ __('messages.customer') }}</h4>
                            </div>
                            <!-- End Header -->
        
                            <!-- Body -->
                            
                                <div class="card-body">
                                    @if ($order->customer)    
                                        <div class="media align-items-center" href="javascript:">
                                            <div class="avatar avatar-circle mr-3">
                                                <img class="avatar-img" style="width: 75px"
                                                    onerror="this.src='{{ asset('public/assets/admin/img/160x160/img1.jpg') }}'"
                                                    src="{{ asset('storage/app/public/profile/' . $order->customer->image) }}"
                                                    alt="Image Description">
                                            </div>
                                            <div class="media-body">
                                                <span
                                                    class="text-body text-hover-primary">{{ $order->customer['f_name'] . ' ' . $order->customer['l_name'] }}</span>
                                            </div>
                                            <div class="media-body text-right">
                                                {{-- <i class="tio-chevron-right text-body"></i> --}}
                                            </div>
                                        </div>
        
                                        <hr>
        
                                        <div class="media align-items-center" href="javascript:">
                                            <div class="icon icon-soft-info icon-circle mr-3">
                                                <i class="tio-shopping-basket-outlined"></i>
                                            </div>
                                            <div class="media-body">
                                                <span class="text-body text-hover-primary">{{ $order->customer->orders_count }}
                                                    orders</span>
                                            </div>
                                            <div class="media-body text-right">
                                                {{-- <i class="tio-chevron-right text-body"></i> --}}
                                            </div>
                                        </div>
        
                                        <hr>
        
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h5>{{ __('messages.contact') }} {{ __('messages.info') }}</h5>
                                        </div>
        
                                        <ul class="list-unstyled list-unstyled-py-2">
                                            <li>
                                                <i class="tio-email mr-2 mt-2 text-primary"></i>
                                                {{ $order->customer['email'] }}
                                            </li>
                                            <li>
                                                <a class="deco-none" href="tel:{{ $order->customer['phone'] }}">
                                                    <i class="tio-call mr-2 text-primary"></i>
                                                    {{ $order->customer['phone'] }}
                                                </a>
                                            </li>
                                        </ul>
                                    @else
                                    {{translate('messages.customer_not_found')}}
                                    @endif
                                </div>
        
                            <!-- End Body -->
                        </div>
                        <!-- End Card -->
                    </div>
                    
                    @if($reservation->reserve_status==0)
                        <div class="offset-sm-8 col-sm-4 d-flex justify-content-end mt-6">
                            <button type="button" class="btn btn-primary"
                                onclick="accept_order({{$reservation->id}})">
                                {{ 'Accept Order' }}
                            </button>
                        </div>
                        
                    @elseif($reservation->reserve_status==1)
                        <div class="offset-sm-8 col-sm-4 d-flex justify-content-end mt-6">
                            <button type="button" class="btn btn-primary"
                                onclick="ready_order({{$reservation->id}})">
                                {{ 'Ready for Serve' }}
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
    <script>

        function accept_order(id) {
            $.get({
                url: '{{ route('vendor.reservation.accept-order') }}',
                dataType: 'json',
                data: {
                    reservation_id: id,
                },
                beforeSend: function() {
                    $('#loading').show();
                },
                success: function(data) {
                    console.log("success...")
                    $('#loading').hide();
                    if (data.error) {
                        Swal.fire("Failed to Accep!", data.error, "error");
                    }else{
                        toastr.success(data.success, {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setTimeout(function () {
                            location.reload();
                            return false;
                        }, 1000);
                        
                    }
                },
                complete: function() {
                    
                },
            });
        }

        function ready_order(id) {
            $.get({
                url: '{{ route('vendor.reservation.ready-order') }}',
                dataType: 'json',
                data: {
                    reservation_id: id,
                },
                beforeSend: function() {
                    $('#loading').show();
                },
                success: function(data) {
                    console.log("success...")
                    $('#loading').hide();
                    if (data.success) {
                        toastr.success(data.success, {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setTimeout(function () {
                            location.reload();
                            return false;
                        }, 1000);
                    }
                },
                complete: function() {
                    
                },
            });
        }
        
    </script>
@endpush
