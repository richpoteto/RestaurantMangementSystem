@extends('layouts.admin.app')

@section('title', translate('messages.customer_settings'))

@push('css_or_js')
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">{{ translate('messages.customer_settings') }}</h1>
                </div>
            </div>
        </div>

        <!-- End Page Header -->
        <div class="card gx-2 gx-lg-3">
            <div class="card-body">
                <form action="{{ route('admin.customer.update-settings') }}" method="post" enctype="multipart/form-data"
                    id="update-settings">
                    @csrf
                    <div class="row pb-4">
                        <div class="col-sm-4 col-12">
                            <div class="form-group">
                                <label
                                    class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control"
                                    for="customer_wallet">
                                    <span class="pr-2">{{ translate('messages.customer_wallet') }} :</span>
                                    <input type="checkbox" class="toggle-switch-input"
                                        onclick="section_visibility('customer_wallet')" name="customer_wallet"
                                        id="customer_wallet" value="1" data-section="wallet-section"
                                        {{ isset($data['wallet_status']) && $data['wallet_status'] == 1 ? 'checked' : '' }}>
                                    <span class="toggle-switch-label text">
                                        <span class="toggle-switch-indicator"></span>
                                    </span>
                                </label>
                            </div>
                        </div>

                        <div class="col-sm-4 col-12">
                            <div class="form-group">
                                <label
                                    class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control"
                                    for="customer_loyalty_point">
                                    <span class="pr-2">{{ translate('messages.customer_loyalty_point') }}:</span>
                                    <input type="checkbox" class="toggle-switch-input"
                                        onclick="section_visibility('customer_loyalty_point')" name="customer_loyalty_point"
                                        id="customer_loyalty_point" data-section="loyalty-point-section" value="1"
                                        {{ isset($data['loyalty_point_status']) && $data['loyalty_point_status'] == 1 ? 'checked' : '' }}>
                                    <span class="toggle-switch-label text">
                                        <span class="toggle-switch-indicator"></span>
                                    </span>
                                </label>
                            </div>
                        </div>
                        <div class="col-sm-4 col-12">
                            <div class="form-group">
                                <label
                                    class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control">
                                    <span
                                        class="pr-2">{{ translate('messages.c_referrer_earning') }}:</span>
                                    <input type="checkbox" class="toggle-switch-input"
                                        onclick="section_visibility('ref_earning_status')"
                                        name="ref_earning_status" id="ref_earning_status"
                                        data-section="referrer-earning" value="1"
                                        {{ isset($data['ref_earning_status']) && $data['ref_earning_status'] == 1 ? 'checked' : '' }}>
                                    <span class="toggle-switch-label text">
                                        <span class="toggle-switch-indicator"></span>
                                    </span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <small class="nav-subtitle text-secondary border-bottom wallet-section">{{ translate('messages.wallet') }}
                        {{ translate('messages.settings') }}</small>
                    <div class="row pt-2 pb-4 wallet-section">
                        <div class="col-sm-12 col-12">
                            <div class="form-group">
                                <label
                                    class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control"
                                    for="refund_to_wallet">
                                    <span class="pr-2">{{ translate('messages.refund_to_wallet') }}<span
                                            class="input-label-secondary"
                                            title="{{ translate('messages.refund_to_wallet_hint') }}"><img
                                                src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                                alt="{{ translate('messages.show_hide_food_menu') }}"></span> :</span>
                                    <input type="checkbox" class="toggle-switch-input" name="refund_to_wallet"
                                        id="refund_to_wallet" value="1"
                                        {{ isset($data['wallet_add_refund']) && $data['wallet_add_refund'] == 1 ? 'checked' : '' }}>
                                    <span class="toggle-switch-label text">
                                        <span class="toggle-switch-indicator"></span>
                                    </span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <small
                        class="nav-subtitle text-secondary border-bottom loyalty-point-section">{{ translate('messages.customer_loyalty_point') }}
                        {{ translate('messages.settings') }}</small>
                    <div class="row pt-2 loyalty-point-section">
                        <div class="col-sm-6 col-12">
                            <div class="form-group">
                                <label class="input-label"
                                    for="loyalty_point_exchange_rate">{{ translate('messages.point_to_currency_exchange_rate', ['currency' => \App\CentralLogics\Helpers::currency_code()]) }}</label>
                                <input type="number" class="form-control" name="loyalty_point_exchange_rate"
                                    value="{{ $data['loyalty_point_exchange_rate'] ?? '0' }}">
                            </div>
                        </div>
                        <div class="col-sm-6 col-12">
                            <div class="form-group">
                                <label class="input-label"
                                    for="intem_purchase_point">{{ translate('messages.item_purchase_point') }}
                                    <small style="color: red"><span class="input-label-secondary"
                                            title="{{ translate('messages.item_purchase_point_hint') }}"><img
                                                src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                                alt="{{ translate('messages.item_purchase_point_hint') }}"></span> *</small>
                                </label>
                                <input type="number" class="form-control" name="item_purchase_point" step=".01"
                                    value="{{ $data['loyalty_point_item_purchase_point'] ?? '0' }}">
                            </div>
                        </div>
                        <div class="col-sm-6 col-12">
                            <div class="form-group">
                                <label class="input-label"
                                    for="intem_purchase_point">{{ translate('messages.minimum_point_to_transfer') }}</label>
                                <input type="number" class="form-control" name="minimun_transfer_point" min="0"
                                    value="{{ $data['loyalty_point_minimum_point'] ?? '0' }}">
                            </div>
                        </div>
                    </div>
                    <!-- Referrer section -->
                    <small
                        class="nav-subtitle text-secondary border-bottom referrer-earning">{{ translate('customer_referrer') }}
                        {{ translate('settings') }}</small>
                    <div class="row pt-2 referrer-earning">
                        <div class="col-sm-6 col-12">
                            <div class="form-group">
                                <label class="input-label"
                                    for="referrer_earning_exchange_rate">{{ translate('messages.referrer_to_currency', ['currency' => \App\CentralLogics\Helpers::currency_code()]) }}</label>
                                    <input type="number step=0.01" class="form-control" name="ref_earning_exchange_rate"
                                    value="{{ $data['ref_earning_exchange_rate'] ?? '0' }}">
                            </div>
                        </div>
                    </div>
                    <button type="submit" id="submit" class="btn btn-primary">{{ translate('messages.submit') }}</button>
                </form>
            </div>
            <!-- End Table -->
        </div>
    </div>
@endsection
@push('script_2')
    <script>
        $(document).on('ready', function() {
            @if (isset($data['wallet_status']) && $data['wallet_status'] != 1)
                $('.wallet-section').hide();
            @endif
            @if (isset($data['loyalty_point_status']) && $data['loyalty_point_status'] != 1)
                $('.loyalty-point-section').hide();
            @endif
            @if (isset($data['ref_earning_status']) && $data['ref_earning_status'] != 1)
                $('.referrer-earning').hide();
            @endif

            // INITIALIZATION OF DATATABLES
            // =======================================================
            var datatable = $.HSCore.components.HSDatatables.init($('#columnSearchDatatable'));
            $('#column1_search').on('keyup', function() {
                datatable
                    .columns(1)
                    .search(this.value)
                    .draw();
            });


            $('#column3_search').on('change', function() {
                datatable
                    .columns(2)
                    .search(this.value)
                    .draw();
            });
        });
    </script>

    <script>
        function section_visibility(id) {
            console.log($('#' + id).data('section'));
            if ($('#' + id).is(':checked')) {
                console.log('checked');
                $('.' + $('#' + id).data('section')).show();
            } else {
                console.log('unchecked');
                $('.' + $('#' + id).data('section')).hide();
            }
        }
        $('#add_fund').on('submit', function(e) {

            e.preventDefault();
            var formData = new FormData(this);

            Swal.fire({
                title: '{{ translate('messages.are_you_sure') }}',
                text: '{{ translate('messages.you_want_to_add_fund') }}' + $('#amount').val() +
                    ' {{ \App\CentralLogics\Helpers::currency_code() . ' ' . translate('messages.to') }} ' + $(
                        '#customer option:selected').text() + '{{ translate('messages.to_wallet') }}',
                type: 'info',
                showCancelButton: true,
                cancelButtonColor: 'default',
                confirmButtonColor: 'primary',
                cancelButtonText: '{{ translate('messages.no') }}',
                confirmButtonText: '{{ translate('messages.send') }}',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });
                    $.post({
                        url: '{{ route('admin.customer.wallet.add-fund') }}',
                        data: formData,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function(data) {
                            if (data.errors) {
                                for (var i = 0; i < data.errors.length; i++) {
                                    toastr.error(data.errors[i].message, {
                                        CloseButton: true,
                                        ProgressBar: true
                                    });
                                }
                            } else {
                                toastr.success(
                                    '{{ translate('messages.fund_added_successfully') }}', {
                                        CloseButton: true,
                                        ProgressBar: true
                                    });
                            }
                        }
                    });
                }
            })
        })
    </script>
@endpush
