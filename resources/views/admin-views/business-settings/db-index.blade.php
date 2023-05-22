@extends('layouts.admin.app')

@section('title', translate('DB_clean'))

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">{{ translate('Clean database') }}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="alert alert-danger mx-2" role="alert">
                    {{ translate('This_page_contains_sensitive_information.Make_sure_before_changing.') }}
                </div>
                <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                    <form action="{{ route('admin.business-settings.clean-db') }}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            @foreach ($tables as $key => $table)
                                <div class="col-md-3">
                                    <div class="form-group form-check">
                                        <input type="checkbox" name="tables[]" value="{{ $table }}"
                                            class="form-check-input" id="{{ $table }}">
                                        <label class="form-check-label text-dark"
                                            style="{{ Session::get('direction') === 'rtl' ? 'margin-right: 1.25rem;' : '' }};"
                                            for="business_section_{{ $key }}">{{ Str::limit($table, 20) }}</label>
                                        <span class="badge-pill badge-secondary mx-2">{{ $rows[$key] }}</span>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <button type="{{ env('APP_MODE') != 'demo' ? 'submit' : 'button' }}"
                            onclick="{{ env('APP_MODE') != 'demo' ? '' : 'call_demo()' }}"
                            class="btn btn-primary mb-2 float-right" id="submitForm">{{ translate('Clear') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script_2')
<script>
    var restaurant_dependent = ['restaurants','restaurant_schedule', 'discounts'];
    var order_dependent = ['order_delivery_histories','d_m_reviews', 'delivery_histories', 'track_deliverymen', 'order_details', 'reviews'];
    var zone_dependent = ['restaurants','vendors', 'orders'];
    $(document).ready(function () {
        $('.form-check-input').on('change', function(event){
            if($(this).is(':checked')){
                if(event.target.id == 'zones' || event.target.id == 'restaurants' || event.target.id == 'vendors') {
                    checked_restaurants(true);
                }

                if(event.target.id == 'zones' || event.target.id == 'orders') {
                    checked_orders(true);
                }                
            } else {
                if(restaurant_dependent.includes(event.target.id)) {
                    if(check_restaurant() || check_zone()){
                        $(this).prop('checked', true);
                    }
                } else if(order_dependent.includes(event.target.id)) {
                    if(check_orders() || check_zone()){
                        $(this).prop('checked', true);
                    }
                } else if(zone_dependent.includes(event.target.id)) {
                    if(check_zone()){
                        $(this).prop('checked', true);
                    }
                } 
            }

        });

        $("#purchase_code_div").click(function () {
            var type = $('#purchase_code').get(0).type;
            if (type === 'password') {
                $('#purchase_code').get(0).type = 'text';
            } else if (type === 'text') {
                $('#purchase_code').get(0).type = 'password';
            }
        });
    })

    function checked_restaurants(status) {
        restaurant_dependent.forEach(function(value){
            $('#'+value).prop('checked', status);
        });
        $('#vendors').prop('checked', status);
        
    }

    function checked_orders(status) {
        order_dependent.forEach(function(value){
            $('#'+value).prop('checked', status);
        });
        $('#orders').prop('checked', status);
    }



    function check_zone() {
        if($('#zones').is(':checked')) {
            toastr.warning("{{translate('messages.table_unchecked_warning',['table'=>'zones'])}}");
            return true;
        }
        return false;
    }

    function check_orders() {
        if($('#orders').is(':checked')) {
            toastr.warning("{{translate('messages.table_unchecked_warning',['table'=>'orders'])}}");
            return true;
        }
        return false;
    }

    function check_restaurant() {
        if($('#restaurants').is(':checked') || $('#vendors').is(':checked')) {
            toastr.warning("{{translate('messages.table_unchecked_warning',['table'=>'restaurants/vendors'])}}");
            return true;
        }
        return false;
    }
    </script>
    <script>
        $("form").on('submit', function(e) {
            e.preventDefault();
            Swal.fire({
                title: '{{ translate('Are you sure?') }}',
                text: "{{ translate('Sensitive_data! Make_sure_before_changing.') }}",
                type: 'warning',
                showCancelButton: true,
                cancelButtonColor: 'default',
                confirmButtonColor: '#FC6A57',
                cancelButtonText: 'No',
                confirmButtonText: 'Yes',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    this.submit();
                } else {
                    e.preventDefault();
                    toastr.success("{{ translate('Cancelled') }}");
                    location.reload();
                }
            })
        });
    </script>
@endpush
