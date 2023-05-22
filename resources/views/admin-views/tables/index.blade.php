@extends('layouts.admin.app')

@section('title', 'Add New Table')

@push('css_or_js')
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                    <li class="breadcrumb-item"><a href="{{route('admin.tables.list')}}">{{__('messages.tables')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page">{{__('messages.add')}} {{__('messages.table')}}</li>
                </ol>
            </nav>
        </div>
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-filter-list"></i> Add Table</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->

        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="{{ route('admin.tables.add-table') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    @php($language=\App\Models\BusinessSetting::where('key','language')->first())
                    @php($language = $language->value ?? null)
                    @php($default_lang = 'en')
                    @if($language)
                        @php($default_lang = json_decode($language)[0])
                        <ul class="nav nav-tabs mb-4">
                            @foreach(json_decode($language) as $lang)
                                <li class="nav-item">
                                    <a class="nav-link lang_link {{$lang == $default_lang? 'active':''}}" href="#" id="{{$lang}}-link">{{\App\CentralLogics\Helpers::get_language_name($lang).'('.strtoupper($lang).')'}}</a>
                                </li>
                            @endforeach
                        </ul>
                    @endif
                    <div class="row">
                        <div class="col-md-6 col-12">
                            @if ($language)
                                @foreach(json_decode($language) as $lang)
                                    <div class="form-group {{$lang != $default_lang ? 'd-none':''}} lang_form" id="{{$lang}}-form">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.table')}} {{__('messages.name')}} ({{strtoupper($lang)}})</label>
                                        <input type="text" name="table_name" class="form-control" placeholder="{{__('messages.new')}} {{__('messages.table')}}" 
                                            maxlength="191" {{$lang == $default_lang? 'required':''}} oninvalid="document.getElementById('en-link').click()">
                                    </div>
                                    <input type="hidden" name="lang[]" value="{{$lang}}">
                                @endforeach
                            @else
                                <div class="row">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.table')}} {{__('messages.name')}}</label>
                                        <input type="text" name="table_name" class="form-control" placeholder="{{__('messages.new')}} {{__('messages.table')}}" 
                                            value="{{old('table_name')}}" required maxlength="191">
                                    </div>
                                </div>
                                <input type="hidden" name="lang[]" value="{{$lang}}">
                            @endif

                            <div class="form-group">
                                <label class="input-label"
                                    for="exampleFormControlSelect1">Select Venue<span
                                        class="input-label-secondary"></span></label>
                                <select name="venue_id" id="choice_venue" class="form-control js-select2-custom">
                                    @foreach (\App\Models\Restaurant::orderBy('name')->get() as $venue)
                                        <option value="{{ $venue['id'] }}">{{ $venue['name'] }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <div class="row" style="margin-left: 12px;">
                                    <label class="input-label" for="exampleFormControlInput1">{{__('messages.table')}} {{__('messages.capacity')}}</label>
                                    <small style="color: red">* ( Enter numeric value)</small>
                                </div> 
                                <input type="number" name="capacity" class="form-control" placeholder="{{__('messages.capacity')}}" 
                                    value="{{old('capacity')}}" required maxlength="191">
                            </div>

                            <div class="form-group">
                                <div class="row" style="margin-left: 12px;">
                                    <label class="input-label" for="exampleFormControlInput1">{{__('messages.floor')}} {{__('messages.number')}}</label>
                                    <small style="color: red">* ( Enter numeric value)</small>
                                </div>                                
                                <input type="number" name="floor_number" class="form-control" placeholder="{{__('messages.floor')}} {{__('messages.number')}}" 
                                    value="{{old('floor_number')}}" required maxlength="191">
                            </div>
                        </div>

                        <div class="col-md-6 col-12">
                            <div class="form-group" style="margin-bottom:0%; padding-top: 12px;">
                                <center>
                                    <img style="width: 224px; height: 224px; object-fit: cover; border: 1px solid; border-radius: 10px;" id="tableImageViewer"
                                        @if(isset($table))
                                        src="{{asset('storage/app/public/tables')}}/{{$table['image']}}"
                                        @else
                                        src="{{asset('public/assets/admin/img/900x400/img1.jpg')}}"
                                        @endif
                                        alt="image"/>
                                </center>
                            </div>
                            
                            <div class="form-group" style="padding-top: 12px;">
                                <label>{{__('messages.image')}}</label>
                                <small style="color: red">* ( {{__('messages.ratio')}} 1:1)</small>
                                <div class="custom-file">
                                    <input type="file" name="image" id="tableImageLoader" class="custom-file-input"
                                        accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" required>
                                    <label class="custom-file-label" for="customFileEg1">{{__('messages.choose')}} {{__('messages.file')}}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group pt-2" style="margin-top: 24px;">
                        <button type="submit" class="btn btn-primary">{{isset($table)?__('messages.update'):__('messages.add')}}</button>
                    </div>
                    
                </form>
            </div>
        </div>

    </div>

@endsection

@push('script_2')
    <script>
        
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#tableImageViewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#tableImageLoader").change(function () {
            readURL(this);
        });
        
    </script>
@endpush
