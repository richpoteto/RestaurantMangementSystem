@extends('layouts.vendor.app')

@section('title','Campaign List')

@push('css_or_js')

@endpush

@section('content')
@php($restaurant_id = \App\CentralLogics\Helpers::get_restaurant_id())
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-filter-list"></i> {{__('messages.campaign')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <!-- Card -->
                <div class="card">
                    <div class="card-header p-1">
                        <h4>{{__('messages.campaign')}} {{__('messages.list')}}<span class="badge badge-soft-dark ml-2" id="itemCount">{{$campaigns->total()}}</span></h4>
                        <form action="javascript:" id="search-form">
                            @csrf
                            <!-- Search -->
                            <div class="input-group input-group-merge input-group-flush">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="tio-search"></i>
                                    </div>
                                </div>
                                <input id="datatableSearch_" type="search" name="search" class="form-control" placeholder="{{__('messages.search')}}" aria-label="{{__('messages.search')}}">
                                <button type="submit" class="btn btn-light">{{__('messages.search')}}</button>
                            </div>
                            <!-- End Search -->
                        </form>
                    </div>
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
                                <th>{{__('messages.#')}}</th>
                                <th style="width: 30%">{{__('messages.title')}}</th>
                                <th style="width: 25%">{{__('messages.image')}}</th>
                                <th>{{__('messages.status')}}</th>
                            </tr>
                            <!-- <tr>
                                <th>
                                    
                                </th>
                                <th>
                                    <input type="text" id="column1_search" class="form-control form-control-sm"
                                           placeholder="Search...">
                                </th>
                                <th>
                                </th>
                                <th>
                                <select id="column3_search" class="js-select2-custom"
                                            data-hs-select2-options='{
                                              "minimumResultsForSearch": "Infinity",
                                              "customClass": "custom-select custom-select-sm text-capitalize"
                                            }'>
                                        <option value="">{{__('messages.any')}}</option>
                                        <option value="Joined">Joined</option>
                                    </select>
                                </th>
                            </tr> -->
                            </thead>

                            <tbody id="set-rows">
                            @foreach($campaigns as $key=>$campaign)
                                <tr>
                                    <td>{{$key+$campaigns->firstItem()}}</td>
                                    <td>
                                        <span class="d-block font-size-sm text-body">
                                            {{Str::limit($campaign['title'],25,'...')}}
                                        </span>
                                    </td>
                                    <td>
                                        <div style="overflow-x: hidden;overflow-y: hidden;">
                                            <img src="{{asset('storage/app/public/campaign')}}/{{$campaign['image']}}" style="width: 100%; max-height:75px; margin-top:auto; margin-bottom:auto;"
                                                 onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'">
                                        </div>
                                    </td>
                                    <td>
                                    <?php
                                        $restaurant_ids = [];
                                        foreach($campaign->restaurants as $restaurant)
                                        {
                                            $restaurant_ids[] = $restaurant->id;
                                        }
                                    ?>
                                        @if(in_array($restaurant_id,$restaurant_ids))
                                        <!-- <button type="button" onclick="location.href='{{route('vendor.campaign.remove-restaurant',[$campaign['id'],$restaurant_id])}}'" title="You are already joined. Click to out from the campaign." class="btn btn-outline-danger">Out</button> -->
                                        <button type="button" onclick="form_alert('campaign-{{$campaign['id']}}','{{__('messages.alert_restaurant_out_from_campaign')}}')" title="You are already joined. Click to out from the campaign." class="btn btn-outline-danger">Out</button>
                                        <form action="{{route('vendor.campaign.remove-restaurant',[$campaign['id'],$restaurant_id])}}"
                                                method="GET" id="campaign-{{$campaign['id']}}">
                                            @csrf 
                                        </form>
                                        @else
                                        <button type="button" class="btn btn-outline-primary" onclick="form_alert('campaign-{{$campaign['id']}}','{{__('messages.alert_restaurant_join_campaign')}}')" title="Click to join the campaign">Join</button>
                                        <form action="{{route('vendor.campaign.addrestaurant',[$campaign['id'],$restaurant_id])}}"
                                                method="GET" id="campaign-{{$campaign['id']}}">
                                            @csrf 
                                        </form>
                                        @endif
                                        
                                        
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <hr>
                        <table class="page-area">
                            <tfoot>
                            {!! $campaigns->links() !!}
                            </tfoot>
                        </table>
                    </div>
                    <!-- End Table -->
                </div>
                <!-- End Card -->
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
                    .search(this.value)
                    .draw();
            });

            $('#column2_search').on('keyup', function () {
                datatable
                    .columns(2)
                    .search(this.value)
                    .draw();
            });

            $('#column3_search').on('change', function () {
                datatable
                    .columns(3)
                    .search(this.value)
                    .draw();
            });

            $('#column4_search').on('keyup', function () {
                datatable
                    .columns(4)
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
    <script>
        $('#search-form').on('submit', function (e) {
            e.preventDefault();
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('vendor.campaign.search')}}',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    $('#loading').show();
                },
                success: function (data) {
                    $('#set-rows').html(data.view);
                    $('.page-area').hide();
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        });
    </script>
@endpush
