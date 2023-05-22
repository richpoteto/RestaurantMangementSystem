@extends('layouts.admin.app')

@section('title','Chefs List')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        .trending-toggle:checked + .trending-toggle-label{
            background-color: #ffba72;
        }
        .isNew-toggle:checked + .isNew-toggle-label{
            background-color: #20b2aa;
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
                    <li class="breadcrumb-item" aria-current="page">Chefs</li>
                </ol>
            </nav>
        </div>
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-filter-list"></i> Chefs <span class="badge badge-soft-dark ml-2" id="itemCount"></span></h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header pb-1 pt-1" >
                        <h5>Chefs List<span class="badge badge-soft-dark ml-2" id="itemCount">{{$chefs->total()}}</span></h5>
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
                                        <th style="width: 10%;">{{__('messages.name')}}</th>
                                        <th style="width: 15%;">{{__('messages.restaurant')}}</th>
                                        <th style="width: 12%;">{{__('messages.feature')}}</th>                                        
                                        <th style="width: 12%;">{{__('messages.trending')}}</th>
                                        <th style="width: 12%;">{{__('messages.new')}}</th>
                                        <th style="width: 10%;">{{__('messages.type')}}</th>
                                        <th style="width: 14%;">{{__('Category')}}</th>
                                        <th style="width: 10%">{{ __('messages.priority') }}</th>
                                        <!--<th style="width: 15%;">{{__('messages.business')}}</th>-->
                                    </tr>
                                </thead>
    
                                <tbody id="set-rows">
                                @csrf
                                @foreach($chefs as $key=>$chef)
                                    <tr>
                                        <td>
                                            <img width="44px;" height="44px;" style="border-radius: 50%; object-fit: cover;" 
                                                onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'" 
                                                src="{{asset('storage/app/public/vendor')}}/{{$chef['image']}}">
                                        </td>
                                        <td>
                                            <font color="#006633" style="bold">{{Str::limit($chef->f_name,10,'...')}}&nbsp;{{Str::limit($chef->l_name,10,'...')}}</font>
                                        </td>
                                        <td>
                                            {{Str::limit($chef->restaurant->name,30,'...')}}
                                        </td>
                                        <td>
                                            <div class="row text-center">
                                                <label class="toggle-switch toggle-switch-sm col-sm-auto" for="stocksCheckbox{{$chef['id']}}featured">
                                                    <input type="checkbox"
                                                        onclick="status_change_alert('{{route('admin.vendor.chef-featured',[$chef,$chef->v_featured==0?1:0])}}', 'Do you want to change this feature?', event)" 
                                                        class="toggle-switch-input" id="stocksCheckbox{{$chef['id']}}featured" {{$chef['v_featured'] == 1?'checked':''}}>
                                                        {{__('messages.feature')}}&nbsp;&nbsp;&nbsp;
                                                        <span class="toggle-switch-label">
                                                            <span class="toggle-switch-indicator"></span>
                                                        </span>
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="row text-center">
                                                <label class="toggle-switch toggle-switch-sm col-sm-auto" for="stocksCheckbox{{$chef['id']}}trending" >
                                                    <input type="checkbox"
                                                        onclick="status_change_alert('{{route('admin.vendor.chef-trending',[$chef['id'],$chef->v_trending==0?1:0])}}', 'Do you want to change this feature?', event)" 
                                                        class="toggle-switch-input trending-toggle" id="stocksCheckbox{{$chef['id']}}trending" {{$chef['v_trending'] == 1 ? 'checked':''}}>
                                                        {{__('messages.trending')}}&nbsp;
                                                    <span class="toggle-switch-label trending-toggle-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>                                               
                                            </div>
                                        </td>
                                        <td>
                                            <div class="row text-center">
                                                <label class="toggle-switch toggle-switch-sm col-sm-auto" for="stocksCheckbox{{$chef['id']}}isNew" >
                                                    <input type="checkbox"
                                                        onclick="status_change_alert('{{route('admin.vendor.chef-isNew',[$chef['id'],$chef->v_isNew==0?1:0])}}', 'Do you want to change this feature?', event)" 
                                                        class="toggle-switch-input isNew-toggle" id="stocksCheckbox{{$chef['id']}}isNew" {{$chef['v_isNew'] == 1 ? 'checked':''}}>
                                                        New&nbsp;
                                                    <span class="toggle-switch-label isNew-toggle-label">
                                                        <span class="toggle-switch-indicator"></span>
                                                    </span>
                                                </label>                                               
                                            </div>
                                        </td>
                                        <td>
                                            <form action="{{route('admin.vendor.change-chef-type',$chef->id)}}">
                                                <select name="vendor_type" id="vendor_type" onchange="this.form.submit()"> 
                                                    <option value="0" {{$chef->vendor_type == 0?'selected':''}}>Normal</option>
                                                    <option value="1" {{$chef->vendor_type == 1?'selected':''}}>Cook</option>
                                                    <option value="2" {{$chef->vendor_type == 2?'selected':''}}>Celeb</option>
                                                </select>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="{{route('admin.vendor.change-celeb-category',$chef->id)}}">
                                                <select name="celeb_category" id="celeb_category" onchange="this.form.submit()"> 
                                                    <option value="0" {{$chef->celeb_category == 0?'selected':''}}>Movie Star</option>
                                                    <option value="1" {{$chef->celeb_category == 1?'selected':''}}>Musician</option>
                                                    <option value="2" {{$chef->celeb_category == 2?'selected':''}}>Influencer</option>
                                                    <option value="3" {{$chef->celeb_category == 3?'selected':''}}>Celebrity Chef</option>
                                                </select>
                                            </form>
                                        </td>
                                        <td>
                                            <form action="{{route('admin.vendor.change-chef-priority',$chef->id)}}">
                                                <select name="priority" id="priority" onchange="this.form.submit()"> 
                                                    <option value="0" {{$chef->priority == 0?'selected':''}}>Normal</option>
                                                    <option value="1" {{$chef->priority == 1?'selected':''}}>Medium</option>
                                                    <option value="2" {{$chef->priority == 2?'selected':''}}>High</option>
                                                </select>
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                        <!-- End Table -->
                    </div>
                    <div class="card-footer page-area">
                        <!-- Pagination -->
                        <div class="row justify-content-center justify-content-sm-between align-items-sm-center"> 
                            <div class="col-sm-auto">
                                <div class="d-flex justify-content-center justify-content-sm-end">
                                    <!-- Pagination -->
                                    {!! $chefs->links() !!}
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


            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
    </script>
@endpush
