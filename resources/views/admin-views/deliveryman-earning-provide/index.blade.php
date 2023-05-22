@extends('layouts.admin.app')

@section('title',__('messages.deliverymen_earning_provide'))

@push('css_or_js')

@endpush

@section('content')
<div class="content container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
            <li class="breadcrumb-item" aria-current="page">{{__('messages.deliverymen_earning_provide')}}  </li>
        </ol>
    </nav>

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-2">
        <!-- <h4 class=" mb-0 text-black-50">{{__('messages.account_transaction')}}</h4> -->
    </div>
    <div class="card">
        <div class="card-header">
            <h4 class="text-capitalize">{{__('messages.provide')}} {{__('messages.deliverymen')}} {{__('messages.earning')}}</h4>
        </div>
        <div class="card-body">
            <form action="{{route('admin.provide-deliveryman-earnings.store')}}" method='post' id="add_transaction">
                @csrf
                <div class="row">
                    <div class="col-sm-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="deliveryman">{{__('messages.deliveryman')}}<span class="input-label-secondary"></span></label>
                            <select id="deliveryman" name="deliveryman_id" data-placeholder="{{__('messages.select')}} {{__('messages.deliveryman')}}" onchange="getAccountData('{{url('/')}}/admin/delivery-man/get-account-data/',this.value,'deliveryman')" class="form-control" title="Select deliveryman">
                                                    
                            </select>
                        </div>
                    </div>  
                    <div class="col-sm-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="amount">{{__('messages.amount')}}<span class="input-label-secondary" id="account_info"></span></label>
                            <input class="form-control" type="number" min="1" step="0.01" name="amount" id="amount" max="999999999999.99">
                        </div>
                    </div> 
                </div>

                <div class="row">
                    <div class="col-sm-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="method">{{__('messages.method')}}<span class="input-label-secondary"></span></label>
                            <input class="form-control" type="text" name="method" id="method" required maxlength="191">
                        </div>  
                    </div>
                    <div class="col-sm-6 col-12">
                        <div class="form-group">
                            <label class="input-label" for="ref">{{__('messages.reference')}}<span class="input-label-secondary"></span></label>
                            <input  class="form-control" type="text" name="ref" id="ref" maxlength="191">
                        </div>
                    </div> 
                </div>
                <div class="form-group">
                    <input class="btn btn-primary" type="submit" value="{{__('messages.save')}}" >
                </div>
            </form>
        </div>
    </div>
    <div class="row" style="margin-top: 20px">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="text-capitalize">{{ __('messages.deliverymen_earning_provide')}} {{ __('messages.table')}}</h5>
                </div>
                <div class="card-body" style="padding: 0">
                    <div class="table-responsive">
                        <table id="datatable"
                            class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                            style="width: 100%">
                            <thead class="thead-light">
                                <tr>
                                    <th>{{__('messages.sl#')}}</th>
                                    <th>{{__('messages.name')}}</th>
                                    <th>{{__('messages.received_at')}}</th>
                                    <th>{{__('messages.amount')}}</th>
                                    <th>{{__('messages.method')}}</th>
                                    <th>{{__('messages.reference')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach($provide_dm_earning as $k=>$at)
                                <tr>
                                    <td scope="row">{{$k+$provide_dm_earning->firstItem()}}</td>
                                    <td>@if($at->delivery_man)<a href="{{route('admin.delivery-man.preview', $at->delivery_man_id)}}">{{$at->delivery_man->f_name.' '.$at->delivery_man->l_name}}</a> @else <label class="text-capitalize text-danger">{{__('messages.deliveryman')}} {{__('messages.deleted')}}</label> @endif </td>
                                    <td>{{$at->created_at->format('Y-m-d '.config('timeformat'))}}</td>
                                    <td>{{$at['amount']}}</td>
                                    <td>{{$at['method']}}</td>
                                    <td>{{$at['ref']}}</td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer">
                    {{$provide_dm_earning->links()}}
                </div>
            </div>
        </div>
     </div>
</div>
@endsection

@push('script_2')
<script>
    $(document).on('ready', function () {
        // INITIALIZATION OF SELECT2
        // =======================================================
        $('.js-select2-custom').each(function () {
            var select2 = $.HSCore.components.HSSelect2.init($(this));
        });

        $('#type').on('change', function() {
            if($('#type').val() == 'restaurant')
            {
                $('#restaurant').removeAttr("disabled");
                $('#deliveryman').val("").trigger( "change" );
                $('#deliveryman').attr("disabled","true");
            }
            else if($('#type').val() == 'deliveryman')
            {
                $('#deliveryman').removeAttr("disabled");
                $('#restaurant').val("").trigger( "change" );
                $('#restaurant').attr("disabled","true");
            }
        });
    });

    $('#deliveryman').select2({
        ajax: {
            url: '{{url('/')}}/admin/delivery-man/get-deliverymen',
            data: function (params) {
                return {
                    q: params.term, // search term
                    earning: true,
                    page: params.page
                };
            },
            processResults: function (data) {
                return {
                results: data
                };
            },
            __port: function (params, success, failure) {
                var $request = $.ajax(params);

                $request.then(success);
                $request.fail(failure);

                return $request;
            }
        }
    });

    function getAccountData(route, data_id, type)
    {
        $.get({
                url: route+data_id,
                dataType: 'json',
                success: function (data) {
                    $('#account_info').html('({{__('messages.cash_in_hand')}}: '+data.cash_in_hand+' {{__('messages.earning_balance')}}: '+data.earning_balance+')');
                },
            });
    }
</script>
<script>
    $('#add_transaction').on('submit', function (e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.post({
            url: '{{route('admin.provide-deliveryman-earnings.store')}}',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.errors) {
                    for (var i = 0; i < data.errors.length; i++) {
                        toastr.error(data.errors[i].message, {
                            CloseButton: true,
                            ProgressBar: true
                        });
                    }
                } else {
                    toastr.success('{{__('messages.transaction_saved')}}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                    setTimeout(function () {
                        location.href = '{{route('admin.provide-deliveryman-earnings.index')}}';
                    }, 2000);
                }
            }
        });
    });
</script>
@endpush