@extends('layouts.admin.app')

@section('title','Cuisine List')

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
                    <li class="breadcrumb-item" aria-current="page">{{__('messages.cuisines')}}</li>
                </ol>
            </nav>
        </div>
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">
                        <i class="tio-filter-list"></i> 
                        {{__('messages.cuisines')}} 
                    </h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        @csrf
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                
            </div>
        </div>
        
        <!--Card -->
        <div class="card mt-2">
             <!--Header -->
            <div class="card-header pb-0">
                <h5>{{__('messages.cuisines')}} {{__('messages.list')}} <span class="badge badge-soft-dark ml-2" id="itemCount">{{$cuisines->total()}}</span>
                </h5>
            </div>
             <!--End Header -->

            <!--Table -->
            <div class="card-body">
                 <div class="table-responsive datatable-custom">
                    <table id="columnSearchDatatable" class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                           data-hs-datatables-options='{
                                "isResponsive": false,
                                "isShowPaging": false,
                                "paging":false,
                           }'>
                        <thead class="thead-light">
                            <tr>
                                <th style="width: 5%;">{{__('messages.#')}}</th>
                                <th class="text-center" style="width: 5%;">{{__('messages.image')}}</th>
                                <th class="text-center" style="width: 30%;">{{__('messages.name')}}</th>
                                <th style="width: 10%">{{ __('messages.priority') }}</th>
                                <th style="width: 40%;">{{__('messages.feature')}}</th>
                                <th style="width: 10%">Action</th>
                            </tr>
                        </thead>

                        <tbody id="set-rows">
                        @foreach($cuisines as $key=>$cuisine)
                            <tr>
                                <td>{{ $key }}</td>
                                <td>
                                    <div class="text-center" style="height: 60px; width: 60px; overflow-x: hidden;overflow-y: hidden">
                                        <img width="60" style="border-radius: 50%; height:100%; object-fit: cover;"
                                             onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                             src="{{asset('storage/app/public/cuisine')}}/{{$cuisine['image']}}">
                                    </div>
                                </td>
                                <td>
                                    <div class="text-center">
                                        <span class="d-block font-size-sm text-body"> {{Str::limit($cuisine->name,20,'...')}} </span>
                                    </div>
                                </td>
                                <td>
                                    <form action="{{route('admin.cuisine.change-priority',$cuisine->id)}}">
                                        <select name="priority" id="priority" onchange="this.form.submit()"> 
                                            <option value="0" {{$cuisine->priority == 0?'selected':''}}>Normal</option>
                                            <option value="1" {{$cuisine->priority == 1?'selected':''}}>Priority</option>
                                        </select>
                                    </form>
                                </td>
                                <td>
                                    <div class="row text-center">
                                        <label class="toggle-switch toggle-switch-sm col-sm-auto" for="stocksCheckbox{{$cuisine['id']}}featured">
                                            <input type="checkbox"
                                                onclick="feature_change_alert('{{route('admin.cuisine.featured',[$cuisine,$cuisine->c_featured==0?1:0])}}')" 
                                                class="toggle-switch-input" id="stocksCheckbox{{$cuisine['id']}}featured" {{$cuisine['c_featured'] == 1?'checked':''}}>
                                                {{__('messages.feature')}}&nbsp;&nbsp;&nbsp;
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                </span>
                                        </label>
                                        <label class="toggle-switch toggle-switch-sm col-sm-auto ml-2" for="stocksCheckbox{{$cuisine['id']}}trending" >
                                            <input type="checkbox"
                                                onclick="feature_change_alert('{{route('admin.cuisine.trending',[$cuisine['id'],$cuisine->c_trending==0?1:0])}}')" 
                                                class="toggle-switch-input trending-toggle" id="stocksCheckbox{{$cuisine['id']}}trending" {{$cuisine['c_trending'] == 1 ? 'checked':''}}>
                                                {{__('messages.trending')}}&nbsp;
                                            <span class="toggle-switch-label trending-toggle-label">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </div>
                                </td>
                                <td>
                                    <a class="btn btn-sm btn-white"
                                        href="{{route('admin.cuisine.edit',[$cuisine['id']])}}" title="{{__('messages.edit')}} {{__('messages.cuisine')}}"><i class="tio-edit"></i>
                                    </a>
                                    <a class="btn btn-sm btn-danger" href="javascript:"
                                    onclick="form_alert('cuisine-{{$cuisine['id']}}','Want to delete this cuisine')" title="{{__('messages.delete')}} {{__('messages.cuisine')}}"><i class="tio-delete-outlined"></i>
                                    </a>
                                    <form action="{{route('admin.cuisine.delete',[$cuisine['id']])}}" method="post" id="cuisine-{{$cuisine['id']}}">
                                        @csrf @method('delete')
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
             </div>
            <!--End Table -->
            <div class="card-footer page-area">
                <!-- Pagination -->
                <div class="row justify-content-center justify-content-sm-between align-items-sm-center"> 
                    <div class="col-sm-auto">
                        <div class="d-flex justify-content-center justify-content-sm-end">
                            <!-- Pagination -->
                            {!! $cuisines->links() !!}
                        </div>
                    </div>
                </div>
                <!-- End Pagination -->
            </div>
        </div>
         <!--End Card -->
    </div>
@endsection

@push('script_2')
    <script>
        function feature_change_alert(url) {
            location.href=url;
        }
    </script>
@endpush
