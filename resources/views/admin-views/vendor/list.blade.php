@extends('layouts.admin.app')

@section('title','Vendor List')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        .trending-toggle:checked + .trending-toggle-label{
            background-color: #ffba72;	
        }
        .isNew-toggle:checked + .isNew-toggle-label{
            background-color: #20b2aa;
        }
        .isNearby-toggle:checked + .isNearby-toggle-label{
            background-color: #ff4500;	
        }
    </style>
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page">{{__('messages.kitchens')}}</li>
                </ol>
            </nav>
        </div>
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-filter-list"></i> {{__('messages.kitchens')}} <span class="badge badge-soft-dark ml-2" id="itemCount"></span></h1>
                </div>
                @if ($toggle_veg_non_veg)
                    <!-- Veg/NonVeg filter -->
                    <div class="col-sm-auto mb-1 mb-sm-0">
                        <select name="category_id" onchange="set_filter('{{url()->full()}}',this.value, 'type')" data-placeholder="{{__('messages.all')}}" class="form-control">
                            <option value="all" {{$type=='all'?'selected':''}}>{{__('messages.all')}}</option>
                            <option value="veg" {{$type=='veg'?'selected':''}}>{{__('messages.veg')}}</option>
                            <option value="non_veg" {{$type=='non_veg'?'selected':''}}>{{__('messages.non_veg')}}</option>
                        </select>
                    </div>
                    <!-- End Veg/NonVeg filter -->
                @endif
                @if(!isset(auth('admin')->user()->zone_id))
                <div class="col-sm-auto" style="min-width: 306px;">
                    <select name="zone_id" class="form-control js-select2-custom"
                            onchange="set_zone_filter('{{route('admin.vendor.list')}}',this.value)">
                        <option value="all">All Zones</option>
                        @foreach(\App\Models\Zone::orderBy('name')->get() as $z)
                            <option
                                value="{{$z['id']}}" {{isset($zone) && $zone->id == $z['id']?'selected':''}}>
                                {{$z['name']}}
                            </option>
                        @endforeach
                    </select>
                </div>
                @endif
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header pb-1 pt-1" >
                        <h5>{{__('messages.kitchens')}} {{__('messages.list')}}<span class="badge badge-soft-dark ml-2" id="itemCount">{{$restaurants->total()}}</span></h5>
                        <form action="javascript:" id="search-form" >
                                        <!-- Search -->
                            @csrf
                            <div class="input-group input-group-merge input-group-flush">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="tio-search"></i>
                                    </div>
                                </div>
                                <input id="datatableSearch_" type="search" name="search" class="form-control"
                                        placeholder="{{__('messages.search')}}" aria-label="{{__('messages.search')}}" required>
                                <button type="submit" class="btn btn-light">{{__('messages.search')}}</button>

                            </div>
                            <!-- End Search -->
                        </form>
                    </div>
                    <!-- End Header -->

                    <div class="card-body">
                        <!-- Table -->
                        <div class="table-responsive datatable-custom">
                            <table id="columnSearchDatatable"
                                   class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                                   data-hs-datatables-options='{
                                        "isResponsive": false,
                                        "isShowPaging": false,
                                        "paging":false,
                                   }'>
                                <thead class="thead-light">
                                    <tr>
                                        <th style="width: 5%;">{{__('messages.image')}}</th>
                                        <th style="width: 10%;">{{__('messages.kitchen')}}</th>
                                        <th style="width: 10%;">{{__('messages.kitchen_type')}}</th>
                                        <th style="width: 10%;">{{__('messages.venue_type')}}</th>
                                        <th style="width: 5%;">{{__('messages.class')}}</th>
                                        <th style="width: 10%;">Classification</th>
                                        <th style="width: 8%;">{{__('messages.feature')}}</th>
                                        <th style="width: 8%;">{{__('messages.trending')}}</th>
                                        <th style="width: 8%;">{{__('messages.new')}}</th>
                                        <th style="width: 8%;">{{__('messages.nearby')}}</th>
                                        <th style="width: 5%">{{ __('messages.priority') }}</th>
                                        <th style="width: 5%;">{{__('messages.action')}}</th>
                                    </tr>
                                </thead>
    
                                <tbody id="set-rows">
                                @foreach($restaurants as $key=>$restaurant)
                                    <tr>
                                        <td>
                                            <a href="{{route('admin.vendor.view', $restaurant->id)}}" alt="">
                                                <img width="44px;" height="44px;" style="border-radius: 50%; object-fit: cover;" 
                                                    onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'" 
                                                    src="{{asset('storage/app/public/restaurant')}}/{{$restaurant['logo']}}">
                                            </a>
                                        </td>
                                        <td>
                                            <a href="{{route('admin.vendor.view', $restaurant->id)}}" alt="view restaurant">
                                                <font color="#006633" style="bold">{{Str::limit($restaurant->name,15,'...')}}</font></a>
                                        </td>
                                        <td>
                                            <span class="d-block font-size-sm text-body">
                                                {{Str::limit($restaurant->kitchen_type,15,'...')}}
                                            </span>
                                        </td>
                                        <td>
                                            <form action="{{route('admin.vendor.change-type',$restaurant->id)}}">
                                                <select name="venue_type" id="venue_type" onchange="this.form.submit()">
                                                    @foreach ($selectList as $item)
                                                        <option value="{{$loop->index}}" {{$restaurant->venue_type == $loop->index?'selected':''}}>
                                                            {{$item[0]}}
                                                        </option>
                                                    @endforeach                                                   
                                                </select>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="{{route('admin.vendor.kitchen-class',$restaurant->id)}}">
                                                <select name="kitchen_class" id="kitchen_class" onchange="this.form.submit()"> 
                                                    <option value="0" {{$restaurant->kitchen_class == 0?'selected':''}}>Standard</option>
                                                    <option value="1" {{$restaurant->kitchen_class == 1?'selected':''}}>Premium</option>
                                                    <option value="2" {{$restaurant->kitchen_class == 2?'selected':''}}>Elite</option>
                                                </select>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="{{route('admin.vendor.venue-class',$restaurant->id)}}">
                                                <select name="venue_class" id="venue_class" onchange="this.form.submit()">
                                                    @for ($i = 1; $i <= 9; $i++)
                                                        <option value="{{$i-1}}" {{$restaurant->venue_class == $i - 1?'selected':''}}>
                                                            {{$selectList[$restaurant->venue_type][$i]}}
                                                        </option>
                                                    @endfor                                                    
                                                </select>
                                            </form>
                                        </td>
                                        <td>                                                
                                            <div class="row text-center">                                                
                                                <label class="toggle-switch toggle-switch-sm col-sm-auto" for="stocksCheckbox{{$restaurant->id}}featured">
                                                    <input type="checkbox"
                                                        onclick="status_change_alert('{{route('admin.vendor.featured',[$restaurant,$restaurant->featured==0?1:0])}}', '{{__('messages.you_want_to_change_this_restaurant_status')}}', event)" 
                                                        class="toggle-switch-input" id="stocksCheckbox{{$restaurant->id}}featured" {{$restaurant->featured == 1?'checked':''}}>
                                                        {{__('messages.feature')}}&nbsp;
                                                        <span class="toggle-switch-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>                                                                                         
                                            </div>
                                        </td>
                                        <td>                                                
                                            <div class="row text-center">                                           
                                                <label class="toggle-switch toggle-switch-sm col-sm-auto" for="stocksCheckbox{{$restaurant->id}}trending" >
                                                    <input type="checkbox"
                                                        onclick="status_change_alert('{{route('admin.vendor.trending',[$restaurant->id,$restaurant->trending==0?1:0])}}', '{{__('messages.you_want_to_change_this_restaurant_status')}}', event)" 
                                                          class="toggle-switch-input trending-toggle" id="stocksCheckbox{{$restaurant->id}}trending" {{$restaurant->trending == 1 ? 'checked':''}}>
                                                        {{__('messages.trending')}}&nbsp;
                                                    <span class="toggle-switch-label trending-toggle-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>                                                                                            
                                            </div>
                                        </td>
                                        <td>                                                
                                            <div class="row text-center">                                              
                                                <label class="toggle-switch toggle-switch-sm col-sm-auto" for="stocksCheckbox{{$restaurant->id}}isNew" >
                                                    <input type="checkbox"
                                                        onclick="status_change_alert('{{route('admin.vendor.isNew',[$restaurant->id,$restaurant->isNew==0?1:0])}}', '{{__('messages.you_want_to_change_this_restaurant_status')}}', event)" 
                                                        class="toggle-switch-input isNew-toggle" id="stocksCheckbox{{$restaurant->id}}isNew" {{$restaurant->isNew == 1 ? 'checked':''}}>
                                                        New&nbsp;
                                                    <span class="toggle-switch-label isNew-toggle-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>                                                                                        
                                            </div>
                                        </td>
                                        <td>                                                
                                            <div class="row text-center">                                               
                                                <label class="toggle-switch toggle-switch-sm col-sm-auto" for="stocksCheckbox{{$restaurant->id}}isNearby" >
                                                    <input type="checkbox"
                                                        onclick="status_change_alert('{{route('admin.vendor.isNearby',[$restaurant->id,$restaurant->isNearby==0?1:0])}}', '{{__('messages.you_want_to_change_this_restaurant_status')}}', event)" 
                                                        class="toggle-switch-input isNearby-toggle" id="stocksCheckbox{{$restaurant->id}}isNearby" {{$restaurant->isNearby == 1 ? 'checked':''}}>
                                                        Nearby&nbsp;
                                                    <span class="toggle-switch-label isNearby-toggle-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>                                               
                                            </div>
                                        </td>
                                        <td>
                                            <form action="{{route('admin.vendor.change-priority',$restaurant->id)}}">
                                                <select name="priority" id="priority" onchange="this.form.submit()"> 
                                                    <option value="0" {{$restaurant->priority == 0?'selected':''}}>Normal</option>
                                                    <option value="1" {{$restaurant->priority == 1?'selected':''}}>Medium</option>
                                                    <option value="2" {{$restaurant->priority == 2?'selected':''}}>High</option>
                                                </select>
                                            </form>
                                        </td>
                                        <td>
                                            <a class="btn btn-sm btn-danger" style="margin-left: 12px;" 
                                                href="{{route('admin.vendor.edit',[$restaurant['id']])}}" title="{{__('messages.edit')}} {{__('messages.restaurant')}}"><i class="tio-edit"></i>
                                                </a>
                                                {{--<a class="btn btn-sm btn-white" href="javascript:"
                                                onclick="form_alert('vendor-{{$restaurant['id']}}','Want to remove this information ?')" title="{{__('messages.delete')}} {{__('messages.restaurant')}}"><i class="tio-delete-outlined text-danger"></i>
                                                </a>
                                                <form action="{{route('admin.vendor.delete',[$restaurant['id']])}}" method="post" id="vendor-{{$restaurant['id']}}">
                                                    @csrf @method('delete')
                                                </form>--}}
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
                    <div class="card-footer page-area">
                        <!-- Pagination -->
                        <div class="row justify-content-center justify-content-sm-between align-items-sm-center"> 
                            <div class="col-sm-auto">
                                <div class="d-flex justify-content-center justify-content-sm-end">
                                    <!-- Pagination -->
                                    {!! $restaurants->links() !!}
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

        function status_change_alert(url, message, e) {
            e.preventDefault();
            location.href=url
        }
        
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
                    $('#itemCount').html(data.total);
                    $('.page-area').hide();
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        });
    </script>
@endpush
