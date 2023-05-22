@extends('layouts.admin.app')

@section('title', __('messages.reservations'))

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')

    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="{{route('admin.reservation.ongoing')}}">{{__('messages.reservations')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page">Choose Foods</li>
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
                <div id="food_order_form" class="form-container">
                    <form action="{{ route('admin.reservation.add-food-order') }}" method="post"
                        class="js-validate" enctype="multipart/form-data">
                        @csrf
                        <!-- Card -->
                        <div class="card mt-2">
                            <!-- Header -->
                            <div class="card-header p-1">
                                <div class="row justify-content-between align-items-center flex-grow-1">
                                    <div class="col-md-4 mb-3 mb-md-0" style="margin-top: 8px;">
                                        <h5 style="margin-left:12px;">{{__('messages.food')}} {{__('messages.list')}}
                                            <span class="badge badge-soft-dark ml-2" id="itemCount">{{$foods->total()}}</span>
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
                                                <th style="width: 10%">{{ __('messages.image') }}</th>
                                                <th style="width: 20%">{{ __('messages.name') }}</th>
                                                <th style="width: 20%">{{ __('messages.category') }}</th>
                                                <th style="width: 20%">{{ __('messages.price') }}</th>
                                                <th style="width: 10%">{{ __('messages.action') }}</th>
                                            </tr>
                                        </thead>
            
                                        <tbody id="set-rows">
                                            @foreach ($foods as $key => $food)
                                                <tr>
                                                    <td>
                                                        <img style="width: 44px; height: 44px; border-radius: 50%;" 
                                                            src="{{ asset('storage/app/public/product') }}/{{ $food['image'] }}" 
                                                            onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'" alt="{{ $food->name }} image">
                                                        </img>
                                                    </td>
                                                    <td>
                                                        <a class="media align-items-center" target="_blank"
                                                            href="{{ route('admin.reservation.food-view', [$food['id']]) }}">
                                                            <h5 class="text-hover-primary mb-0">{{ Str::limit($food['name'], 35, '...') }}</h5>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        {{ Str::limit($food->category, 20, '...') }}
                                                    </td>
                                                   <td>
                                                        {{ \App\CentralLogics\Helpers::format_currency($food['price']) }}
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-sm {{ \App\CentralLogics\Helpers::check_cart($food['id'], $reservation_id)==-1?'btn-white':'btn-danger' }}" 
                                                            href="{{ route('admin.reservation.add-food-cart', ['food_id'=>$food->id,'reservation_id'=>$reservation_id]) }}" 
                                                            title="{{ __('messages.add') }} {{ __('messages.cart') }}">
                                                            <i class="tio-shopping-cart"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End Table -->
                            </div>
                            <div class="card-footer page-area">
                                <!-- Pagination -->
                                <div class="row justify-content-center justify-content-sm-between align-items-sm-center"> 
                                    <div class="col-sm-auto">
                                        <div class="d-flex justify-content-center justify-content-sm-end">
                                            <!-- Pagination -->
                                            {!! $foods->links() !!}
                                        </div>
                                    </div>
                                </div>
                                <!-- End Pagination -->
                            </div>
                        </div>
                        <!-- End Card -->
                        <div class="form-group col-md-6 col-6" style="margin-top: 12px;">
                            <label class="input-label" for="exampleFormControlInput1">Special Instructions</label>
                            <textarea type="text" name="special_instruction" class="form-control ckeditor" value=''></textarea>
                        </div>
                        <input type="hidden" name="reservation_id" value="{{$reservation_id}}" />
                        <div class="form-group pt-2" style="padding-top: 12px; margin-top: 12px; margin-right: 24px;">
                            <button type="submit" class="btn btn-primary">Next</button>
                        </div>
                    </form>
                </div>      
            </div>
        </div>
        <!-- End Main Page -->
    </div>

@endsection

@push('script_2')
@endpush
