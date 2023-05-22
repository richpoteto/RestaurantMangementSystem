@extends('layouts.admin.app')
@section('title', __('messages.reservations'))

@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{asset('public/assets/admin/css/croppie.css')}}" rel="stylesheet">
@endpush

@section('content')
<div class="content container-fluid">
    <!-- Page Header -->
    <div class="page-header">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                <li class="breadcrumb-item" aria-current="page">{{__('messages.reservations')}}</li>
            </ol>
        </nav>
    </div>
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col-sm mb-2 mb-sm-0">
                <h1 class="page-header-title">
                    <i class="tio-filter-list"></i> 
                    Choose Foods
                </h1>
            </div>
        </div>
    </div>
    <!-- End Page Header -->
    
    <!-- Main Page -->
    <div class="row gx-2 gx-lg-3">
        <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
            <form action="{{ route('admin.reservation.check-out') }}" method="post"
                class="js-validate" enctype="multipart/form-data">
                @csrf
                <!-- Card -->
                <div class="card mt-2">
                    <!-- Header -->
                    <div class="card-header p-1">
                        <div class="row justify-content-between align-items-center flex-grow-1">
                            <div class="col-md-4 mb-3 mb-md-0" style="margin-top: 8px;">
                                <h5 style="margin-left:12px;">Sub Total: ${{ \App\CentralLogics\Helpers::get_subtotal($orderId) }}
                                    <span class="badge badge-soft-dark ml-2" id="itemCount"></span>
                                </h5>
                            </div>
                        </div>
                        <!-- End Row -->
                    </div>
                    <!-- End Header -->

                    <div class="card-body">
                        <!-- Table -->
                        <div class="table-responsive datatable-custom" id="table-div">
                            <table id="datatable"
                                class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                                data-hs-datatables-options='{
                                        "columnDefs": [{
                                            "targets": [],
                                            "width": "5%",
                                            "orderable": false
                                        }],
                                        "order": [],
                                        "info": {
                                        "totalQty": "#datatableWithPaginationInfoTotalQty"
                                        },
    
                                        "entries": "#datatableEntries",
    
                                        "isResponsive": false,
                                        "isShowPaging": false,
                                        "paging":false
                                    }'>
                                <thead class="thead-light">
                                    <tr>
                                        <th style="width: 5%">{{ __('messages.image') }}</th>
                                        <th style="width: 20%">{{ __('messages.name') }}</th>
                                        <th style="width: 10%">Price/Unit</th>
                                        <th style="width: 20%;">{{ __('messages.action') }}</th>
                                        <th style="width: 5%">Sub Total</th>
                                        <th style="width: 40%">{{ __('messages.addons') }}</th>
                                    </tr>
                                </thead>
    
                                <tbody id="set-rows">
                                    @foreach ($foods as $key=>$food)
                                        <tr>
                                            <td>
                                                <div class="align-items-center">
                                                    <img style="width: 44px; height: 44px; border-radius: 50%;" 
                                                        src="{{ asset('storage/app/public/product') }}/{{ $foods[$key]->image }}" 
                                                        onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'" alt="{{ $foods[$key]->name }} image">
                                                    </img>
                                                </div>                                               
                                            </td>
                                            <td>
                                                <div class="align-items-center">
                                                    <a class="media align-items-center" target="_blank"
                                                        href="{{ route('admin.reservation.food-view', [$foods[$key]->food_id]) }}">
                                                        <h5 class="text-hover-primary mb-0">{{ $foods[$key]->name }}</h5>
                                                    </a>
                                                </div>                                                
                                            </td>
                                            <td>
                                                <div class="align-items-center">
                                                    ${{ $foods[$key]->price }}
                                                </div>                                                
                                            </td>
                                            <td>
                                                <div class="row align-items-center">
                                                    <a class="btn btn-sm btn-danger px-0 pb-0" 
                                                        href="{{ route('admin.reservation.dec-amount', ['reservation_id'=>$reservation_id, 'order_id'=>$orderId, 'food_id'=>$foods[$key]->food_id]) }}" 
                                                        title="Add amount" style="width: 24px; height: 24px; padding-top: 2px;">
                                                        <i class="tio-remove"></i>
                                                    </a>
                                                    <label class="input-label m-2 text-center" for="exampleFormControlInput1" style="width:24px;">
                                                        {{ $foods[$key]->amount }}
                                                    </label>                                                    
                                                    <a class="btn btn-sm btn-danger px-0 pb-0" 
                                                        href="{{ route('admin.reservation.inc-amount', ['reservation_id'=>$reservation_id, 'order_id'=>$orderId, 'food_id'=>$foods[$key]->food_id]) }}" 
                                                        title="Add amount" style="width: 24px; height: 24px; padding-top: 2px;">
                                                        <i class="tio-add"></i>
                                                    </a>
                                                </div>                                                
                                            </td>
                                            <td>
                                                <div class="align-items-center">
                                                    ${{ $foods[$key]->price * $foods[$key]->amount }}
                                                </div>                                                
                                            </td>
                                            <td>
                                                @foreach ($foods[$key]->addons as $key1 => $addon)  
                                                    <div class="d-flex">                                                        
                                                        {{ $addon->name }}
                                                        <label class="input-label mr-3 ml-3" for="exampleFormControlInput1">
                                                            ${{ $addon->price }}
                                                        </label>
                                                        <a class="btn btn-sm btn-danger px-0 pb-0 ml-2" 
                                                            href="{{ route('admin.reservation.dec-addon', ['reservation_id'=>$reservation_id, 'order_id'=>$orderId, 'food_id'=>$foods[$key]->food_id, 'addon_id'=>$addon->addon_id]) }}" 
                                                            title="Add amount" style="width: 24px; height: 24px; padding-top: 2px;">
                                                            <i class="tio-remove"></i>
                                                        </a>
                                                        <label class="input-label text-center mr-2 ml-2" for="exampleFormControlInput1" style="width: 24px;">
                                                            {{ $addon->amount }}
                                                        </label>
                                                        <a class="btn btn-sm btn-danger px-0 pb-0" 
                                                            href="{{ route('admin.reservation.inc-addon', ['reservation_id'=>$reservation_id, 'order_id'=>$orderId, 'food_id'=>$foods[$key]->food_id, 'addon_id'=>$addon->addon_id]) }}" 
                                                            title="Add amount" style="width: 24px; height: 24px; padding-top: 2px;">
                                                            <i class="tio-add"></i>
                                                        </a>
                                                        <label class="input-label text-center ml-6 mr-2" for="exampleFormControlInput1" style="width: 24px;">
                                                            ${{ $addon->price * $addon->amount }}
                                                        </label>
                                                    </div>                                            
                                                @endforeach
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <!-- End Table -->
                    </div>
                </div>
                <!-- End Card -->
                <input type="hidden" name="reservation_id" value="{{$reservation_id}}" />
                <input type="hidden" name="order_id" value="{{$orderId}}" />
            
                <!-- Start Amount Calculation -->
                <div class="row" style="margin-left: 12px; margin-top: 24px;">
                    <div class="col-md-4 col-4">
                        <div class="row">
                            <span>Subtotal: </span>
                            <label class="input-label" style="margin-left: 54px;">&nbsp;${{ \App\CentralLogics\Helpers::get_subtotal($orderId) }}</label>
                        </div>
                        <div class="row">
                            <span>Tax: </span>
                            <label class="input-label" style="margin-left: 89px;">${{ $foodOrder->tax }}</label>
                        </div>
                        <div class="row">
                            <span>Service Charge: </span>
                            <label class="input-label" style="margin-left: 12px;">&nbsp;${{ $foodOrder->service_charge }}</label>
                        </div>
                        <div class="row">
                            <span>Service Tip: </span>
                            <label class="input-label" style="margin-left: 39px;">&nbsp;${{ $foodOrder->service_tip==1?$foodOrder->service_tip_amount : '0' }}</label>
                        </div>
                        <div class="row">
                            <span>Promo({{ $foodOrder->promo }}%): </span>
                            <label class="input-label" style="margin-left: 36px;">&nbsp;${{ $foodOrder->service_charge }}</label>
                        </div>
                        <div class="row">
                            <span>Total: </span>
                            <label class="input-label" style="margin-left: 75px;">                            
                                <font color="#993300">
                                    <b>&nbsp;${{  \App\CentralLogics\Helpers::get_total_price($orderId) }}</b>
                                </font>
                            </label>
                        </div>
                    </div>
                </div> 
                <!-- End Amount Calculation -->
                
                <div class="form-group pt-2" style="padding-top: 12px; margin-top: 12px; margin-right: 24px;">
                    <button type="submit" class="btn btn-primary">Check Out</button>
                </div>
            </form> 
        </div>
    </div>
    <!-- End Main Page -->
</div>
@endsection

@push('script_2')
@endpush
