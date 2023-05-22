@extends('layouts.admin.app')

@section('title', 'Add Reservation')

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
                <li class="breadcrumb-item" aria-current="page"><a href="{{route('admin.reservation.ongoing')}}">{{__('messages.reservations')}}</a></li>
                <li class="breadcrumb-item" aria-current="page">Add Guest Information</li>
            </ol>
        </nav>
    </div>
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col-sm mb-2 mb-sm-0">
                <h1 class="page-header-title">
                    <i class="tio-filter-list"></i> 
                    Add Guest Information
                </h1>
            </div>
        </div>
    </div>
    <!-- End Page Header -->

    <!-- Start Main Area -->
    <div class="row gx-2 gx-lg-3">
        <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
            <div id="guest_form" class="form-container">
                <form action="{{ route('admin.reservation.add-guest') }}" method="post"
                    class="js-validate" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="form-group col-md-4 col-4">
                            <label class="input-label" for="exampleFormControlInput1">Guest Name</label>
                            <input type="text" name="customer_name" class="form-control" placeholder="Guest Name" value="{{old('customer_name')}}" required maxlength="191">                            
                        </div>
                        <div class="form-group col-md-4 col-4">
                            <label class="input-label" for="exampleFormControlInput1">Email</label>
                            <input type="text" name="customer_email" class="form-control" placeholder="{{__('messages.email')}}" value="{{old('customer_email')}}" required maxlength="191">
                        </div>
                        <div class="form-group col-md-4 col-4">
                            <label class="input-label" for="exampleFormControlInput1">Phone Number</label>
                            <input type="text" name="customer_phone" class="form-control" placeholder="{{__('messages.phone')}}" value="{{old('customer_phone')}}" required maxlength="191">
                        </div>
                    </div>
                    <div class="col-mf-6 col-6" style="margin-top: 12px; margin-bottom: 12px;">
                        <div class="form-group" id="tableData"></div>
                    </div>
                    <div class="row" style="margin-top: 24px;">
                        <div class="col-md-6 col-6">
                            <div class="form-group" style="margin-top: 12px;">
                                <label class="input-label" for="exampleFormControlInput1">Special Notes</label>
                                <textarea type="text" name="special_notes" class="form-control ckeditor" required></textarea>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="reservation_id" value="{{$reservation_id}}" />
                    <div class="form-group pt-2 float-right" style="padding-top: 12px; margin-top: 12px; margin-right: 24px;">
                        <button type="submit" class="btn btn-primary">Next</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End Main Area -->
</div>
@endsection

@push('script_2')
@endpush
