@extends('layouts.admin.app')

@section('title',__('messages.hottest_lounges_ad_settings'))

@push('css_or_js')

@endpush

@section('content')

    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="page-header">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                        <li class="breadcrumb-item" aria-current="page">{{__('messages.mobile_ads')}}</li>
                        <li class="breadcrumb-item" aria-current="page">{{__('messages.hottest_lounges_ad_settings')}}</li>
                    </ol>
                </nav>
            </div>
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-filter-list"></i> {{__('messages.hottest_lounges_ad_settings')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="card">
                    <div class="card-body">
                        <form action="{{route('admin.business-settings.hottest-lounges.store')}}" method="post" id="hottest_form">
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.title')}}</label>
                                        <input type="text" name="title" class="form-control" placeholder="New York Hottest Lounges" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.lounge_name')}}</label>
                                        <input type="text" name="lounge_name" class="form-control" placeholder="Home House" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{ __('messages.short') }}
                                            {{ __('messages.description') }}</label>
                                        <textarea type="text" name="description" class="form-control ckeditor" required></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{ __('messages.tips') }}
                                            {{ __('messages.text') }}</label>
                                        <textarea type="text" name="tips_text" class="form-control ckeditor" required></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select Image</label>
                                        <small style="color: red">* ( {{__('messages.ratio')}} 3:1 )</small>
                                        <div class="custom-file">
                                            <input type="file" name="lounge_image" id="customFileEg1" class="custom-file-input"
                                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" required>
                                            <label class="custom-file-label" for="customFileEg1">{{__('messages.choose')}} {{__('messages.file')}}</label>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-bottom:0%;">
                                        <center>
                                            <img style="width: 80%;border: 1px solid; border-radius: 10px;" id="viewer"
                                                src="{{asset('public/assets/admin/img/900x400/img1.jpg')}}" alt="campaign image"/>
                                        </center>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">{{__('messages.submit')}}</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="card">
                    <div class="card-header">                        
                        <h5>Hottest Lounge List<span class="badge badge-soft-dark ml-2" id="itemCount">{{$hottest_lounges->count()}}</span></h5>
                    </div>
                </div>

                <!-- Table -->
                <div class="table-responsive datatable-custom">
                    
                    <table id="columnSearchDatatable"
                            class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                            data-hs-datatables-options='{
                            "order": [],
                            "orderCellsTop": true,
                            "search": "#datatableSearch",
                            "entries": "#datatableEntries",
                            "isResponsive": false,
                            "isShowPaging": false,
                            "paging": false,
                            }'>
                        <thead class="thead-light">
                            <tr>
                                <th>{{__('messages.#')}}</th>
                                <th>{{__('messages.image')}}</th>
                                <th>{{__('messages.title')}}</th>
                                <th>{{__('messages.lounge')}}&nbsp;{{__('messages.name')}}</th>
                                <th>{{__('messages.description')}}</th>
                                <th>{{__('messages.tips')}}&nbsp;{{__('messages.text')}}</th>
                                <th>{{__('messages.status')}}</th>
                                <th>{{__('messages.action')}}</th>
                            </tr>
                        </thead>
                        
                        <tbody id="set-rows">
                            @foreach($hottest_lounges as $key=>$hottestLounge)                                                                
                                <tr>
                                    <td>{{$key+1}}</td>                                    
                                    <td>
                                        <span class="media align-items-center">
                                            <img class="avatar avatar-lg mr-3" src="{{asset('storage/app/public/restaurant')}}/{{$hottestLounge['lounge_image']}}" 
                                                 onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'" alt="{{$hottestLounge->title}} image">
                                        </span>
                                    </td>
                                    <td>
                                        <span class="media align-items-center">
                                            <div class="media-body">
                                                <h5 class="text-hover-primary mb-0">{{Str::limit($hottestLounge['title'], 25, '...')}}</h5>
                                            </div>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="media align-items-center">
                                            <div class="media-body">
                                                <h5 class="text-hover-primary mb-0">{{Str::limit($hottestLounge['lounge_name'], 25, '...')}}</h5>
                                            </div>
                                        </span>
                                    </td>
                                    <td>{{Str::limit($hottestLounge['description'], 25, '...')}}</td>
                                    <td>{{Str::limit($hottestLounge['tips_text'], 25, '...')}}</td>
                                    <td>
                                        <label class="toggle-switch toggle-switch-sm" for="statusCheckbox{{$hottestLounge->id}}">
                                            <input type="checkbox" onclick="location.href='{{route('admin.business-settings.hottest-lounges.status',[$hottestLounge['id'],$hottestLounge->status?0:1])}}'" 
                                                class="toggle-switch-input" id="statusCheckbox{{$hottestLounge->id}}" {{$hottestLounge->status?'checked':''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                            </span>
                                        </label>
                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-white" href="{{route('admin.business-settings.hottest-lounges.edit',[$hottestLounge->id])}}" 
                                            title="Edit Hottest Lounge Advertisement"><i class="tio-edit"></i>
                                        </a>
                                        <a class="btn btn-sm btn-white" href="javascript:" 
                                            onclick="form_alert('hottest-{{$hottestLounge['id']}}','Want to delete this Hottest Lounge Advertisement?')" 
                                            title="Delete Hottest Lounge Advertisement"><i class="tio-delete-outlined"></i>
                                        </a>
                                        <form action="{{route('admin.business-settings.hottest-lounges.delete',[$hottestLounge['id']])}}"
                                            method="post" id="hottest-{{$hottestLounge['id']}}">
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
                            <tfoot>
                                {!! $hottest_lounges->links() !!}
                            </tfoot>
                        </table>
                    </div>                        
                </div>                
            </div>
            <!-- End Table -->                     
        </div>
    </div>

@endsection

@push('script_2')
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#viewer').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileEg1").change(function () {
            readURL(this);
        });
    </script>
    <script>        
        
        $('#hottest_form').on('submit', function (e) {
                e.preventDefault();
                var formData = new FormData(this);
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                console.log(this);
                
                $.post({
                    url: '{{route('admin.business-settings.hottest-lounges.store')}}',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        console.log(formData);
                        if (data.errors) {
                            for (var i = 0; i < data.errors.length; i++) {
                                toastr.error(data.errors[i].message, {
                                    CloseButton: true,
                                    ProgressBar: true
                                });
                            }
                        } else {
                            toastr.success('Hottest Lounge Advertisement uploaded successfully!', {
                                CloseButton: true,
                                ProgressBar: true
                            });
                            setTimeout(function () {
                                location.href = '{{route('admin.business-settings.hottest-lounges.add-new')}}';
                            }, 2000);
                        }
                    }
                });                
            });
    </script>
@endpush

