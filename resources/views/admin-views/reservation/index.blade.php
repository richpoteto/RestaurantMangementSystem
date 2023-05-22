@extends('layouts.admin.app')
@section('title', __('messages.reservations'))

@push('css_or_js')

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
                    {{__('messages.reservations')}} 
                </h1>
            </div>
        </div>
    </div>
    <!-- End Page Header -->

    <!-- Start Table -->
    <div class="row gx-2 gx-lg-3" style="margin-top: 24px;">
        <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
            <!-- Card -->
            <div class="card">
                <div class="card-header pb-0">
                    <h5>Ongoing Orders List
                        <span class="badge badge-warning badge-pill ml-1">
                            {{$reservations->total()}}
                        </span>
                    </h5>
                </div>
                <div class="card-body">
                    <!-- Table -->
                    <div class="table-responsive datatable-custom">
                        <table id="columnSearchDatatable"
                                class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                                data-hs-datatables-options='{
                                    "order": [],
                                    "orderCellsTop": true,
                                    "paging":false
    
                                }'>
                            <thead class="thead-light">
                                <tr>
                                    <th style="width: 10%; text-align: center;">{{__('messages.time')}}</th>
                                    <th style="width: 5%; text-align: center;">Order ID</th>
                                    <th style="width: 5%; text-align: center;">Image</th>
                                    <th style="width: 20%; text-align: center;">{{__('messages.table')}}</th>
                                    <th style="width: 30%; text-align: center;">Customer Info</th>
                                    <th style="width: 10%; text-align: center;">Payment Status</th>
                                    <th style="width: 10%; text-align: center;">{{__('messages.status')}}</th>
                                    <th style="width: 10%; text-align: center;">{{__('messages.action')}}</th>
                                </tr>
                            </thead>
    
                            <tbody id="set-rows">
                            @foreach($reservations as $key=>$reservation)
                                <tr>
                                    <td style="text-align: center;">
                                        <a href="{{route('admin.reservation.view-reservation', $reservation->id)}}" alt="view reservation">
                                            <label class="input-label">{{ $reservation->reserve_date }}
                                                <label class="input-label">
                                                    <font color="#006633"><strong>{{ $reservation->start_time }} ~ {{ $reservation->end_time }}</strong></font>
                                                </label>
                                            </label>
                                        </a> 
                                    </td>
                                    <td style="text-align: center;">
                                        <a href="{{route('admin.reservation.view-reservation', $reservation->id)}}">{{$reservation->order_id}}</a>
                                    </td>
                                    <td style="text-align: center;">
                                        <a href="{{route('admin.reservation.view-reservation', $reservation->id)}}" alt="View reservation">
                                            <img width="44px;" height="44px;" style="border-radius: 10%; object-fit: cover;"
                                                    onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                                    src="{{asset('storage/app/public/tables')}}/{{$reservation->table_image}}"></img>
                                        </a>
                                    </td>
                                    <td style="text-align: center;">
                                        <a href="{{route('admin.reservation.view-reservation', $reservation->id)}}">
                                            <label class="input-label">{{Str::limit($reservation->table_name,20,'...')}}
                                                <label class="input-label">
                                                    <font color="#CC6600" family="bold">Reserved for <strong>{{ $reservation->number_in_party }}</strong> guests</font>
                                                </label>
                                            </label>                                        
                                        </a>
                                    </td>
                                    <td style="text-align: center;">
                                        <a href="{{route('admin.reservation.view-reservation', $reservation->id)}}" alt="view reservation">
                                            <label class="input-label">{{Str::limit($reservation->customer_name,25,'...')}}
                                                <label class="input-label">
                                                    <font color="#003333">{{ $reservation->customer_phone }}</font>
                                                </label>
                                            </label> 
                                        </a>                                       
                                    </td>
                                    <td style="text-align: center;">
                                        @if($reservation->payment_status=='paid')
                                            <span class="badge badge-soft-success badge-pill"><strong>PAID</strong></span>
                                        @else
                                            <span class="badge badge-soft-danger badge-pill"><strong>Unpaid</strong></span>
                                        @endif 
                                    </td>
                                    <td style="text-align: center;">
                                        @if($reservation->reserve_status==0)
                                            <span class="badge badge-soft-warning badge-pill"><strong>PENDING</strong></span>
                                        @elseif($reservation->reserve_status==1)
                                            <span class="badge badge-soft-info badge-pill"><strong>APPROVED</strong></span>
                                        @else
                                            <span class="badge badge-soft-success badge-pill"><strong>COMPLETED</strong></span>
                                        @endif 
                                    </td>
                                    <td style="text-align: center;">
                                        <a class="btn btn-sm btn-danger"
                                            href="{{route('admin.reservation.view-reservation', $reservation->id)}}" title="{{__('messages.view')}}">
                                            <i class="tio-visible text-white"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <hr>
    
                        <div class="page-area"></div>
    
                    </div>
                    <!-- End Table -->
                </div>
                <div class="card-footer page-area">
                <!-- Pagination -->
                <div class="row justify-content-center justify-content-sm-between align-items-sm-center"> 
                    <div class="col-sm-auto">
                        <div class="d-flex justify-content-center justify-content-sm-end">
                            <!-- Pagination -->
                            {!! $reservations->links() !!}
                        </div>
                    </div>
                </div>
                <!-- End Pagination -->
            </div>
            </div>
            <!-- End Card -->
        </div>
    </div>
     <!-- End Table -->
</div>
@endsection

@push('script_2')
@endpush
