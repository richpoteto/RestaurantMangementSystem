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
                <li class="breadcrumb-item" aria-current="page">{{__('messages.add')}} {{__('messages.reservation')}}</li>
            </ol>
        </nav>
    </div>
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col-sm mb-2 mb-sm-0">
                <h1 class="page-header-title">
                    <i class="tio-filter-list"></i> 
                    {{ __('messages.add') }} {{ __('messages.reservation') }}
                </h1>
            </div>
        </div>
    </div>
    <!-- End Page Header -->

    <!-- Start Main Area -->
    <div class="row gx-2 gx-lg-3">
        <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
            <div id="reservation_form" class="form-container">
                <form action="{{ route('admin.reservation.add-reservation') }}" method="post"
                    class="js-validate" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="form-group col-md-6 col-12">
                            <label class="input-label" for="exampleFormControlSelect1">
                                Select Venue
                                <span class="input-label-secondary"></span>
                            </label>
                            <select name="venue_id" class="js-data-example-ajax form-control"
                                onchange="getTableArrayData('{{ url('/') }}/admin/reservation/get-tables?venueid='+this.value,'tables_selector')"
                                title="Select Vennue" required oninvalid="this.setCustomValidity('{{ __('messages.please_select_venue') }}')">
                                <option value="0">-- Select --</option>
                                @foreach ($restaurants as $restaurant)
                                    <option value="{{ $restaurant['id'] }}">{{ $restaurant['name'] }}</option>                                   
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6 col-12">
                            <div class="form-group" id="venueData"></div>
                        </div>
                        <div class="form-group col-md-6 col-12">
                            <div class="form-group" id="venueData1"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6 col-12">
                            <label class="input-label" for="exampleFormControlSelect1">
                                Select Table
                                <span class="input-label-secondary"></span>
                            </label>
                            <select class="js-select2-custom form-control" name="table_id" id="tables_selector"
                                onchange="getTableData('{{ url('/') }}/admin/reservation/get-table-info?table_id='+this.value)"
                                title="Select Table">
                            </select>
                            <div style="margin-top: 12px; margin-bottom: 12px;">
                                <div class="form-group" id="tableData"></div>
                            </div>
                        </div>
                        <div class="form-group col-md-6 col-12">
                            <div class="row" style="margin-left: 12px;">
                                <label class="input-label" for="exampleFormControlInput1">Number in Party</label>
                                <small style="color: red">* ( Enter numeric value)</small>
                            </div> 
                            <input type="number" name="number_in_party" class="form-control" placeholder="{{__('messages.number')}}" 
                                value="{{old('number_in_party')}}" required maxlength="5">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-mf-4 col-4">
                            <div class="row" style="margin-left: 12px;">
                                <label class="input-label" for="exampleFormControlInput1">Reservation Date</label>
                            </div> 
                            <input type="date" name="reserve_date" id="reserve_date" class="form-control" required value=""> 
                        </div>
                        <div class="col-mf-4 col-4">
                            <div class="row" style="margin-left: 12px;">
                                <label class="input-label" for="exampleFormControlInput1">Start Time</label>
                            </div> 
                            <input type="time" name="start_time" id="start_time" class="form-control" required value=""> 
                        </div>
                        <div class="col-mf-4 col-4">
                            <div class="row" style="margin-left: 12px;">
                                <label class="input-label" for="exampleFormControlInput1">End Time</label>
                            </div> 
                            <input type="time" name="end_time" id="end_time" class="form-control" required value=""> 
                        </div>
                    </div>
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
<script>
    $( document ).ready(function() {
        $('#venueData').empty();
        $('#venueData1').empty();
        $('#tableData').empty();
        $('#tables_selector').empty();
    });

    function getTableArrayData(route, id) {
        $.get({
            url: route,
            dataType: 'json',
            success: function(data) {
                $('#venueData').empty().append(data.venueData);
                $('#venueData1').empty().append(data.venueData1);
                $('#tableData').empty();
                $('#tables_selector').empty().append(data.options);
            },
        });
    }

    function getTableData(route) {
        $.get({
            url: route,
            dataType: 'json',
            success: function(data) {
                $('#tableData').empty().append(data.tableData);
            },
        });
    }
</script>
@endpush
