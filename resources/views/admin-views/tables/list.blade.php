@extends('layouts.admin.app')

@section('title','Tables List')

@push('css_or_js')
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page">{{__('messages.tables')}}</li>
                </ol>
            </nav>
        </div>
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">
                        <i class="tio-filter-list"></i> 
                        {{__('messages.tables')}} 
                    </h1>
                </div>
                <div class="col-sm-auto" style="min-width: 306px;">
                    <select name="venue_id" class="form-control js-select2-custom" onchange="set_venue_filter('{{route('admin.tables.get-tables')}}',this.value)">
                        <option value="all">All Venues</option>
                        @foreach(\App\Models\Restaurant::orderBy('name')->get() as $v)
                            <option value="{{$v['id']}}" {{isset($venueid) && $venueid == $v['id']?'selected':''}}>{{$v['name']}}</option>
                        @endforeach
                    </select>
                </div>
            </div>            
        </div>
        <!-- End Page Header -->
        
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="card mt-2">
                    <div class="card-header pb-0">
                        <h5>{{__('messages.tables')}} {{__('messages.list')}}<span class="badge badge-soft-dark ml-2" id="itemCount">{{$tables->total()}}</span></h5>
                    </div>
                    <div class="card-body">
                        <!--Table -->
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
                                    <th style="width: 5%;">{{__('messages.#')}}</th>
                                    <th style="width: 10%;">{{__('messages.image')}}</th>
                                    <th style="width: 15%;">{{__('messages.table')}} {{__('messages.name')}}</th>
                                    <th style="width: 15%;">{{__('messages.venue')}} {{__('messages.name')}}</th>
                                    <th style="width: 15%;">{{__('messages.floor')}}</th>
                                    <th style="width: 15%;">{{__('messages.capacity')}}</th>
                                    <th style="width: 10%;">{{__('messages.reserved')}}</th>
                                    <th style="width: 5%">Status</th>
                                    <th style="width: 10%">Action</th>
                                </tr>
                                </thead>
        
                                <tbody id="set-rows">
                                @foreach($tables as $key=>$table)
                                    <tr>
                                        <td>{{$key+1}}</td>
                                        <td>
                                            <div style="height: 60px; width: 60px; overflow-x: hidden;overflow-y: hidden">
                                                <img width="60px;" height="height: 60px;" style="border-radius: 50%; height:100%; object-fit: cover;"
                                                        onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                                        src="{{asset('storage/app/public/tables')}}/{{$table['image']}}">
                                            </div>
                                        </td>
                                        <td>
                                            <span class="d-block font-size-sm text-body"> {{Str::limit($table->table_name,20,'...')}} </span>
                                        </td>
                                        <td>
                                            <span class="d-block font-size-sm text-body"> {{Str::limit($table->venue->name,20,'...')}} </span>
                                        </td>
                                        <td>
                                            <span class="d-block font-size-sm text-body"> {{Str::limit($table->floor_number,20,'...')}} </span>
                                        </td>
                                        <td>
                                            <span class="d-block font-size-sm text-body"> {{Str::limit($table->capacity,20,'...')}} </span>
                                        </td>
                                        <td>
                                            <span class="badge badge-soft-info badge-pill ml-1">{{ $table->reserved_status==0?'IDLE':'RESERVED' }}</span>
                                        </td>
                                        <td>
                                            <label class="toggle-switch toggle-switch-sm" for="stocksCheckbox{{$table->id}}">
                                            <input type="checkbox" 
                                                onclick="location.href='{{route('admin.cuisine.status',[$table['id'],$table->status?0:1])}}'" 
                                                class="toggle-switch-input" id="stocksCheckbox{{$table->id}}" 
                                                {{$table->status?'checked':''}}>
                                                <span class="toggle-switch-label">
                                                    <span class="toggle-switch-indicator"></span>
                                                </span>
                                            </label>
                                        </td>
                                        <td>
                                            <a class="btn btn-sm btn-white"
                                                    href="{{route('admin.tables.edit',[$table['id']])}}" title="{{__('messages.edit')}} {{__('messages.table')}}"><i class="tio-edit"></i>
                                            </a>
                                            <a class="btn btn-sm btn-danger" href="javascript:"
                                            onclick="form_alert('tables-{{$table['id']}}','Want to delete this table')" title="{{__('messages.delete')}} {{__('messages.table')}}">
                                                <i class="tio-delete-outlined"></i>
                                            </a>
                                            <form action="{{route('admin.tables.delete',[$table['id']])}}" method="post" id="tables-{{$table['id']}}">
                                                @csrf @method('delete')
                                            </form>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                        <!--End Table -->
                    </div>
                    <div class="card-footer page-area">
                    <!-- Pagination -->
                    <div class="row justify-content-center justify-content-sm-between align-items-sm-center"> 
                        <div class="col-sm-auto">
                            <div class="d-flex justify-content-center justify-content-sm-end">
                                <!-- Pagination -->
                                {!! $tables->links() !!}
                            </div>
                        </div>
                    </div>
                    <!-- End Pagination -->
                </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('script_2')
    <script>

        function set_venue_filter(url, id) {
            var nurl = new URL(url);
            nurl.searchParams.set('venue_id', id);
            location.href = nurl;
        }
    </script>
@endpush
