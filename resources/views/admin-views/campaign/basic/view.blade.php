@extends('layouts.admin.app')

@section('title','Campaign view')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row">
                <div class="col-6">
                    <h1 class="page-header-title text-break">{{$campaign->title}}</h1>
                </div>
                <div class="col-6">
                    {{--<a href="{{url()->previous()}}" class="btn btn-primary float-right">
                        <i class="tio-back-ui"></i> {{__('messages.back')}}
                    </a>--}}
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
            <!-- Body -->
            <div class="card-body">
                <div class="row align-items-md-center gx-md-5">
                    <div class="col-md-auto mb-3 mb-md-0">
                        <div class="d-flex align-items-center">
                            <img class="avatar avatar-xxl avatar-4by3 mr-4"
                                 src="{{asset('storage/app/public/campaign')}}/{{$campaign->image}}"
                                 onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'"
                                 alt="Image Description">
                            <div class="d-block">
                                
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-md">
                        <h4>{{__('messages.short')}} {{__('messages.description')}} : </h4>
                        <p>{{$campaign->description}}</p>
                    </div>

                </div>
            </div>
            <!-- End Body -->
        </div>
        <!-- End Card -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <!-- Card -->
                <div class="card">
                    <!-- Table -->
                    <div class="table-responsive datatable-custom">
                        <table id="columnSearchDatatable"
                               class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                               data-hs-datatables-options='{
                                 "order": [],
                                 "orderCellsTop": true
                               }'>
                            <thead class="thead-light">
                            <tr>
                                <th>{{__('messages.#')}}</th>
                                <th style="width: 15%">{{__('messages.logo')}}</th>
                                <th style="width: 20%">{{__('messages.restaurant')}}</th>
                                <th style="width: 25%">{{__('messages.owner')}}</th>
                                <th>{{__('messages.email')}}</th>
                                <th>{{__('messages.phone')}}</th>
                                <th>{{__('messages.action')}}</th>
                            </tr>
                            <tr>
                                <th colspan="3">
                                    <form action="{{route('admin.campaign.addrestaurant',$campaign->id)}}" id="restaurant-add-form" method="POST">
                                        @csrf
                                        <!-- Search -->
                                        <div class="row">
                                            <div class="input-group-prepend col-md-7">   
                                            @php($allrestaurants=App\Models\Restaurant::all())
                                                <select name="restaurant_id" id="restaurant_id" class="form-control">
                                                    @forelse($allrestaurants as $restaurant)
                                                    @if(!in_array($restaurant->id, $restaurant_ids))
                                                    <option value="{{$restaurant->id}}" >{{$restaurant->name}}</option>
                                                    @endif
                                                    @empty
                                                    <option value="">No data found</option>
                                                    @endforelse
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary col-md-5">{{__('messages.add')}} {{__('messages.restaurant')}}</button>

                                        </div>
                                        <!-- End Search -->
                                    </form>
                                </th>
                                <th></th>
                                <th colspan="3">
                                    <form action="javascript:" id="search-form">
                                        <!-- Search -->
                                        <div class="input-group input-group-merge input-group-flush">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <i class="tio-search"></i>
                                                </div>
                                            </div>
                                            <input id="datatableSearch_" type="search" name="search" class="form-control"
                                                   placeholder="{{__('messages.search')}}" aria-label="Search" required>
                                            <button type="submit" class="btn btn-primary">{{__('messages.search')}}</button>

                                        </div>
                                        <!-- End Search -->
                                    </form>
                                </th>
                            </tr>
                            </thead>

                            <tbody id="set-rows">
                            @foreach($restaurants as $key=>$dm)
                                <tr>
                                    <td>{{$key+1}}</td>
                                    <td>
                                        <div style="height: 60px; width: 60px; overflow-x: hidden;overflow-y: hidden">
                                            <img width="60" style="border-radius: 50%"
                                                 onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                                 src="{{asset('storage/app/public/restaurant')}}/{{$dm['logo']}}">
                                        </div>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-body">
                                            {{$dm->name}}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="d-block font-size-sm text-body">
                                            {{$dm->vendor->f_name.' '.$dm->vendor->l_name}}
                                        </span>
                                    </td>
                                    <td>
                                        {{$dm->email}}
                                        {{--<span class="d-block font-size-sm">{{$campaign['image']}}</span>--}}
                                    </td>
                                    <td>
                                        {{$dm['phone']}}
                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-white text-danger" href="javascript:"
                                            onclick="form_alert('campaign-{{$dm['id']}}','Want to remove this restaurant ?')" title="{{__('messages.delete')}} {{__('messages.campaign')}}"><i class="tio-delete-outlined"></i>
                                        </a>
                                        
                                        <form action="{{route('admin.campaign.remove-restaurant',[$campaign->id, $dm['id']])}}"
                                                      method="GET" id="campaign-{{$dm['id']}}">
                                            @csrf
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <hr>

                        <div class="page-area">
                            <table>
                                <tfoot>
                                {!! $restaurants->links() !!}
                                </tfoot>
                            </table>
                        </div>

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
                    .columns(1)
                    .search(this.value)
                    .draw();
            });

            $('#column2_search').on('keyup', function () {
                datatable
                    .columns(2)
                    .search(this.value)
                    .draw();
            });

            $('#column3_search').on('keyup', function () {
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

        $('#search-form').on('submit', function () {
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('admin.vendor.search')}}',
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
