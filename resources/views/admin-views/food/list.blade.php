@extends('layouts.admin.app')

@section('title', 'Food List')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        .trending-toggle:checked + .trending-toggle-label{
            background-color: #ffba72;
        }
        /* .isNew-toggle:checked + .isNew-toggle-label{
            background-color: #20b2aa;
        }
        .isNearby-toggle:checked + .isNearby-toggle-label{
            background-color: #ff4500;	
        } */
    </style>
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page">{{__('messages.foods')}}</li>
                </ol>
            </nav>
        </div>
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-filter-list"></i> {{ __('messages.food') }} {{ __('messages.list') }}<span
                            class="badge badge-soft-dark ml-2" id="foodCount"></span></h1>
                </div>
                @if ($toggle_veg_non_veg)
                    <!-- Veg/NonVeg filter -->
                    <div class="col-sm-auto mb-1 mb-sm-0">
                        <select name="category_id" onchange="set_filter('{{ url()->full() }}',this.value, 'type')"
                            data-placeholder="{{ __('messages.all') }}" class="form-control">
                            <option value="all" {{ $type == 'all' ? 'selected' : '' }}>{{ __('messages.all') }}</option>
                            <option value="veg" {{ $type == 'veg' ? 'selected' : '' }}>{{ __('messages.veg') }}</option>
                            <option value="non_veg" {{ $type == 'non_veg' ? 'selected' : '' }}>{{ __('messages.non_veg') }}
                            </option>
                        </select>
                    </div>
                    <!-- End Veg/NonVeg filter -->
                @endif
                <div class="col-sm-auto" style="min-width: 306px;">
                    <select name="restaurant_id" id="restaurant"
                        onchange="set_restaurant_filter('{{ url()->full() }}',this.value)"
                        data-placeholder="{{ __('messages.select') }} {{ __('messages.restaurant') }}"
                        class="js-data-example-ajax form-control"
                        onchange="getRestaurantData('{{ url('/') }}/admin/vendor/get-addons?data[]=0&restaurant_id=',this.value,'add_on')"
                        required title="Select Restaurant"
                        oninvalid="this.setCustomValidity('{{ __('messages.please_select_restaurant') }}')">
                        @if ($restaurant)
                            <option value="{{ $restaurant->id }}" selected>{{ $restaurant->name }}</option>
                        @else
                            <option value="all" selected>{{ __('messages.all_restaurants') }}</option>
                        @endif
                    </select>
                </div>
            </div>

        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <!-- Card -->
                <div class="card mt-2">
                    <!-- Header -->
                    <div class="card-header p-1">
                        <div class="row justify-content-between align-items-center flex-grow-1">
                            <div class="col-md-4 mb-3 mb-md-0">
                                <h5 style="margin-left:12px;">{{__('messages.food')}} {{__('messages.list')}}<span class="badge badge-soft-dark ml-2" id="itemCount">{{$foods->total()}}</span></h5>
                            </div>
                            @csrf
                            <div class="col-auto">
                                <!-- Unfold -->
                                <div class="hs-unfold mr-2" style="width: 306px;">
                                    <select name="category_id" id="category"
                                        onchange="set_filter('{{ url()->full() }}',this.value, 'category_id')"
                                        data-placeholder="{{ __('messages.select_category') }}"
                                        class="js-data-example-ajax form-control">
                                        @if ($category)
                                            <option value="{{ $category->id }}" selected>{{ $category->name }}
                                                ({{ $category->position == 0 ? __('messages.main') : __('messages.sub') }})
                                            </option>
                                        @else
                                            <option value="all" selected>{{ __('messages.all_categories') }}</option>
                                        @endif
                                    </select>
                                </div>
                                <!-- End Unfold -->

                                <!-- Unfold -->
                                <div class="hs-unfold">
                                    <a class="js-hs-unfold-invoker btn btn-white" href="javascript:;"
                                        data-hs-unfold-options='{
                                            "target": "#showHideDropdown",
                                            "type": "css-animation"
                                            }'>
                                        <i class="tio-table mr-1"></i> {{ __('messages.columns') }} <span
                                            class="badge badge-soft-dark rounded-circle ml-1">7</span>
                                    </a>

                                    <div id="showHideDropdown"
                                        class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right dropdown-card"
                                        style="width: 15rem;">
                                        <div class="card card-sm">
                                            <div class="card-body">
                                                {{--<div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">#</span>
                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_index">
                                                        <input type="checkbox" class="toggle-switch-input"
                                                            id="toggleColumn_index" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>--}}
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{ __('messages.name') }}</span>
                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_name">
                                                        <input type="checkbox" class="toggle-switch-input"
                                                            id="toggleColumn_name" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{ __('messages.category') }}</span>

                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_type">
                                                        <input type="checkbox" class="toggle-switch-input"
                                                            id="toggleColumn_type" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>

                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{ __('messages.restaurant') }}</span>

                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_vendor">
                                                        <input type="checkbox" class="toggle-switch-input"
                                                            id="toggleColumn_vendor" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>


                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{ __('messages.status') }}</span>

                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_status">
                                                        <input type="checkbox" class="toggle-switch-input"
                                                            id="toggleColumn_status" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{ __('messages.price') }}</span>

                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_price">
                                                        <input type="checkbox" class="toggle-switch-input"
                                                            id="toggleColumn_price" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center mb-3">
                                                    <span class="mr-2">{{ __('messages.action') }}</span>

                                                    <!-- Checkbox Switch -->
                                                    <label class="toggle-switch toggle-switch-sm" for="toggleColumn_action">
                                                        <input type="checkbox" class="toggle-switch-input"
                                                            id="toggleColumn_action" checked>
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <!-- End Checkbox Switch -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Unfold -->
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
                                        "isResponsive": false,
                                        "isShowPaging": false,
                                        "paging":false,
                                    }'>
                                <thead class="thead-light">
                                    <tr>
                                        <th style="width: 5%">{{ __('messages.image') }}</th>
                                        <th style="width: 10%">{{ __('messages.name') }}</th>
                                        <th style="width: 10%">{{ __('messages.category') }}</th>
                                        <th style="width: 10%">{{ __('messages.restaurant') }}</th>
                                        <th style="width: 5%">{{ __('messages.price') }}</th>
                                        <th style="width: 5%">{{ __('messages.priority') }}</th>
                                        <th style="width: 50%;">{{__('messages.feature')}}</th>
                                        <th style="width: 5%">{{ __('messages.action') }}</th>
                                    </tr>
                                </thead>
    
                                <tbody id="set-rows">
                                    @foreach ($foods as $key => $food)
                                        <tr>
                                            <td>
                                                <a class="media align-items-center" href="{{ route('admin.food.view', [$food['id']]) }}"><img style="width: 44px; height: 44px; border-radius: 50%;" src="{{ asset('storage/app/public/product') }}/{{ $food['image'] }}" onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'" alt="{{ $food->name }} image"></img>
                                                </a>
                                            </td>
                                            <td>
                                                <a class="media align-items-center" href="{{ route('admin.food.view', [$food['id']]) }}"><h5 class="text-hover-primary mb-0">{{ Str::limit($food['name'], 35, '...') }}</h5></a>
                                            </td>
                                            <td>
                                                {{ Str::limit($food->category, 20, '...') }}
                                            </td>
                                            <td>
                                                {{ Str::limit($food->restaurant ? $food->restaurant->name : __('messages.Restaurant deleted!'), 20, '...') }}
                                            </td>
                                            <td>
                                                {{ \App\CentralLogics\Helpers::format_currency($food['price']) }}
                                            </td>
                                            <td>
                                                <form action="{{route('admin.food.change-priority',$food->id)}}">
                                                    <select name="priority" id="priority" onchange="this.form.submit()"> 
                                                        <option value="0" {{$food->priority == 0?'selected':''}}>Normal</option>
                                                        <option value="1" {{$food->priority == 1?'selected':''}}>Priority</option>
                                                    </select>
                                                </form>
                                            </td>
                                            <td>
                                                <div class="row text-center">
                                                    <label class="toggle-switch toggle-switch-sm col-sm-auto" for="stocksCheckbox{{$food['id']}}f_featured">
                                                        <input type="checkbox"
                                                            onclick="feature_change_alert('{{route('admin.food.featured',[$food,$food['f_featured']==0?1:0])}}')" 
                                                            class="toggle-switch-input" id="stocksCheckbox{{$food['id']}}f_featured" {{$food['f_featured'] == 1?'checked':''}}>
                                                            {{__('messages.feature')}}&nbsp;&nbsp;&nbsp;
                                                            <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                    <label class="toggle-switch toggle-switch-sm col-sm-auto" for="stocksCheckbox{{$food['id']}}f_trending" >
                                                        <input type="checkbox"
                                                            onclick="feature_change_alert('{{route('admin.food.trending',[$food['id'],$food['f_trending']==0?1:0])}}')" 
                                                            class="toggle-switch-input trending-toggle" id="stocksCheckbox{{$food['id']}}f_trending" {{$food['f_trending'] == 1 ? 'checked':''}}>
                                                            {{__('messages.trending')}}&nbsp;
                                                        <span class="toggle-switch-label trending-toggle-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                    </label>
                                                </div>
                                            </td>
                                            <td>
                                                <a class="btn btn-sm btn-white"
                                                    href="{{ route('admin.food.edit', [$food['id']]) }}"
                                                    title="{{ __('messages.edit') }} {{ __('messages.food') }}"><i
                                                        class="tio-edit"></i>
                                                </a>
                                                <a class="btn btn-sm btn-danger" href="javascript:"
                                                    onclick="form_alert('food-{{ $food['id'] }}','{{ __('messages.Want_to_delete_this_item') }}')"
                                                    title="{{ __('messages.delete') }} {{ __('messages.food') }}"><i
                                                        class="tio-delete-outlined"></i>
                                                </a>
                                                <form action="{{ route('admin.food.delete', [$food['id']]) }}" method="post"
                                                    id="food-{{ $food['id'] }}">
                                                    @csrf @method('delete')
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <hr>
                            <div class="page-area">
                                <table>
                                    <tfoot class="border-top">
                                        {!! $foods->withQueryString()->links() !!}
                                    </tfoot>
                                </table>
                            </div>
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
            </div>
        </div>
    </div>

@endsection

@push('script_2')
    <script>
        function feature_change_alert(url) {
            location.href=url;
        }
        $(document).on('ready', function() {
            // INITIALIZATION OF DATATABLES
            // =======================================================
            var datatable = $.HSCore.components.HSDatatables.init($('#datatable'), {
                select: {
                    style: 'multi',
                    classMap: {
                        checkAll: '#datatableCheckAll',
                        counter: '#datatableCounter',
                        counterInfo: '#datatableCounterInfo'
                    }
                },
                language: {
                    zeroRecords: '<div class="text-center p-4">' +
                        '<img class="mb-3" src="{{ asset('public/assets/admin/svg/illustrations/sorry.svg') }}" alt="Image Description" style="width: 7rem;">' +
                        '<p class="mb-0">No data to show</p>' +
                        '</div>'
                }
            });

            $('#datatableSearch').on('mouseup', function(e) {
                var $input = $(this),
                    oldValue = $input.val();

                if (oldValue == "") return;

                setTimeout(function() {
                    var newValue = $input.val();

                    if (newValue == "") {
                        // Gotcha
                        datatable.search('').draw();
                    }
                }, 1);
            });

            $('#toggleColumn_index').change(function(e) {
                datatable.columns(0).visible(e.target.checked)
            })
            $('#toggleColumn_name').change(function(e) {
                datatable.columns(1).visible(e.target.checked)
            })

            $('#toggleColumn_type').change(function(e) {
                datatable.columns(2).visible(e.target.checked)
            })

            $('#toggleColumn_vendor').change(function(e) {
                datatable.columns(3).visible(e.target.checked)
            })

            $('#toggleColumn_status').change(function(e) {
                datatable.columns(5).visible(e.target.checked)
            })
            $('#toggleColumn_price').change(function(e) {
                datatable.columns(4).visible(e.target.checked)
            })
            $('#toggleColumn_action').change(function(e) {
                datatable.columns(6).visible(e.target.checked)
            })

            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function() {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });

        $('#restaurant').select2({
            ajax: {
                url: '{{ url('/') }}/admin/vendor/get-restaurants',
                data: function(params) {
                    return {
                        q: params.term, // search term
                        all: true,
                        page: params.page
                    };
                },
                processResults: function(data) {
                    return {
                        results: data
                    };
                },
                __port: function(params, success, failure) {
                    var $request = $.ajax(params);

                    $request.then(success);
                    $request.fail(failure);

                    return $request;
                }
            }
        });

        $('#category').select2({
            ajax: {
                url: '{{ route('admin.category.get-all') }}',
                data: function(params) {
                    return {
                        q: params.term, // search term
                        all: true,
                        page: params.page
                    };
                },
                processResults: function(data) {
                    return {
                        results: data
                    };
                },
                __port: function(params, success, failure) {
                    var $request = $.ajax(params);

                    $request.then(success);
                    $request.fail(failure);

                    return $request;
                }
            }
        });

        $('#search-form').on('submit', function(e) {
            e.preventDefault();
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{ route('admin.food.search') }}',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function() {
                    $('#loading').show();
                },
                success: function(data) {
                    $('#set-rows').html(data.view);
                    $('.page-area').hide();
                    $('#foodCount').html(data.count);
                },
                complete: function() {
                    $('#loading').hide();
                },
            });
        });
    </script>
@endpush
