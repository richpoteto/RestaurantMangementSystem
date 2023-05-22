@extends('layouts.admin.app')

@section('title','Currency')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">Add Currency</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="{{route('admin.business-settings.currency-add')}}" method="post"
                      enctype="multipart/form-data">
                    @csrf

                    <div class="form-group mb-2">
                        <label style="padding-left: 10px">Country Name</label><br>
                        <input type="text" placeholder="ex : Bangladesh" class="form-control" name="country">
                    </div>

                    <div class="form-group mb-2">
                        <label style="padding-left: 10px">Code</label><br>
                        <input type="text" placeholder="ex : USD" class="form-control" name="currency_code">
                    </div>

                    <div class="form-group mb-2">
                        <label style="padding-left: 10px">Symbol</label><br>
                        <input type="text" placeholder="ex : $" class="form-control" name="symbol">
                    </div>

                    <div class="form-group mb-2">
                        <label style="padding-left: 10px">Exchange Rate ( 1 USD ) with USD</label><br>
                        <input type="number" placeholder="ex : 1" class="form-control" name="exchange_rate">
                    </div>

                    <button type="submit" class="btn btn-primary mb-2">Save</button>

                </form>
            </div>

            <hr>
            <div class="table-responsive datatable-custom">
                <table id="columnSearchDatatable"
                       class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                       data-hs-datatables-options='{
                                 "order": [],
                                 "orderCellsTop": true
                               }'>
                    <thead class="thead-light">
                    <tr>
                        <th>#sl</th>
                        <th style="width: 30%">Country</th>
                        <th style="width: 25%">Code</th>
                        <th>Symbol</th>
                        <th>Ex. Rate</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>
                            <input type="text" id="column1_search" class="form-control form-control-sm"
                                   placeholder="Search country">
                        </th>
                        <th>
                            {{--<input type="text" id="column2_search" class="form-control form-control-sm"
                                   placeholder="Search positions">--}}
                        </th>
                        <th></th>
                        <th>
                            {{--<input type="text" id="column4_search" class="form-control form-control-sm"
                                   placeholder="Search countries">--}}
                        </th>
                        <th></th>
                    </tr>
                    </thead>

                    <tbody>
                    @foreach(\App\Models\Currency::latest()->get() as $key=>$currency)
                        <tr>
                            <td>{{$key+1}}</td>
                            <td>
                                <span class="d-block font-size-sm text-body">
                                    {{$currency['country']}}
                                </span>
                            </td>
                            <td>
                                {{$currency['currency_code']}}
                            </td>
                            <td>
                                {{$currency['currency_symbol']}}
                            </td>
                            <td>
                                {{$currency['exchange_rate']}}
                            </td>
                            <td>
                                <!-- Dropdown -->
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button"
                                            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                        <i class="tio-settings"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        @if($currency['currency_code']!='USD')
                                            <a class="dropdown-item"
                                               href="{{route('admin.business-settings.currency-update',[$currency['id']])}}">Edit</a>
                                            <a class="dropdown-item" href="javascript:"
                                               onclick="$('#currency-{{$currency['id']}}').submit()">Delete</a>
                                            <form
                                                action="{{route('admin.business-settings.currency-delete',[$currency['id']])}}"
                                                method="post" id="currency-{{$currency['id']}}">
                                                @csrf @method('delete')
                                            </form>
                                        @else
                                            <a class="dropdown-item" href="javascript:">
                                                Default
                                            </a>
                                        @endif
                                    </div>
                                </div>
                                <!-- End Dropdown -->
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('script_2')
    <script>
        $(document).on('ready', function () {
            // INITIALIZATION OF DATATABLES
            // =======================================================
            var datatable = $.HSCore.components.HSDatatables.init($('#columnSearchDatatable'));

            $('#column1_search').on('keyup', function () {
                datatable
                    .columns(1)
                    .search(this.value)
                    .draw();
            });


            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
    </script>
@endpush
