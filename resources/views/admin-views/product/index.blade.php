@extends('layouts.admin.app')

@section('title', 'Add new product')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="{{ asset('public/assets/admin/css/tags-input.min.css') }}" rel="stylesheet">
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page">{{__('messages.products')}}</li>
                </ol>
            </nav>
        </div>
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-filter-list"></i> {{ __('messages.add') }}
                        {{ __('messages.new') }} {{ __('messages.product') }}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="javascript:" method="post" id="product_form" enctype="multipart/form-data">
                    @csrf
                    @php($language = \App\Models\BusinessSetting::where('key', 'language')->first())
                    @php($language = $language->value ?? null)
                    @php($default_lang = 'bn')
                    @if ($language)
                        @php($default_lang = json_decode($language)[0])
                        <ul class="nav nav-tabs mb-4">
                            @foreach (json_decode($language) as $lang)
                                <li class="nav-item">
                                    <a class="nav-link lang_link {{ $lang == $default_lang ? 'active' : '' }}" href="#"
                                        id="{{ $lang }}-link">{{ \App\CentralLogics\Helpers::get_language_name($lang) . '(' . strtoupper($lang) . ')' }}</a>
                                </li>
                            @endforeach
                        </ul>
                        @foreach (json_decode($language) as $lang)
                            <div class="col-md-6 col-6 {{ $lang != $default_lang ? 'd-none' : '' }} lang_form"
                                id="{{ $lang }}-form">
                                <div class="form-group">
                                    <label class="input-label" for="{{ $lang }}_name">{{ __('messages.name') }}
                                        ({{ strtoupper($lang) }})</label>
                                    <input type="text" name="name[]" id="{{ $lang }}_name" class="form-control"
                                        placeholder="{{ __('messages.new_product') }}"
                                        {{ $lang == $default_lang ? 'required' : '' }}
                                        oninvalid="document.getElementById('en-link').click()">
                                </div>
                                <input type="hidden" name="lang[]" value="{{ $lang }}">
                                <div class="form-group pt-4">
                                    <label class="input-label" for="exampleFormControlInput1">{{ __('messages.short') }}
                                        {{ __('messages.description') }} ({{ strtoupper($lang) }})</label>
                                    <textarea type="text" name="description[]" class="form-control ckeditor"></textarea>
                                </div>
                            </div>
                        @endforeach
                    @else
                        <div class="col-md-6 col-6" id="{{ $default_lang }}-form">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{ __('messages.name') }}
                                    (EN)</label>
                                <input type="text" name="name[]" class="form-control"
                                    placeholder="{{ __('messages.new_product') }}" required>
                            </div>
                            <input type="hidden" name="lang[]" value="en">
                            <div class="form-group pt-4">
                                <label class="input-label" for="exampleFormControlInput1">{{ __('messages.short') }}
                                    {{ __('messages.description') }}</label>
                                <textarea type="text" name="description[]" class="form-control ckeditor"></textarea>
                            </div>
                        </div>
                    @endif
                    
                    <div class="row">
                        <div class="col-md-6 col-6">
                            <div class="form-group">
                                <label class="input-label"
                                    for="exampleFormControlSelect1">{{ __('messages.restaurant') }}<span
                                        class="input-label-secondary"></span></label>
                                <select name="restaurant_id"
                                    data-placeholder="{{ __('messages.select') }} {{ __('messages.restaurant') }}"
                                    class="js-data-example-ajax form-control"
                                    onchange="getRestaurantData('{{ url('/') }}/admin/vendor/get-addons?data[]=0&restaurant_id=',this.value,'add_on')"
                                    oninvalid="this.setCustomValidity('{{ __('messages.please_select_restaurant') }}')">
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label"
                                    for="exampleFormControlSelect1">{{ __('messages.variation') }}<span
                                        class="input-label-secondary"></span></label>
                                <select name="attribute_id" id="choice_attributes" class="form-control js-select2-custom">
                                    @foreach (\App\Models\Attribute::orderBy('name')->get() as $attribute)
                                        <option value="{{ $attribute['id'] }}">{{ $attribute['name'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.item_type')}}</label>
                                <select name="veg" class="form-control js-select2-custom">
                                    <option value="0">{{__('messages.non_veg')}}</option>
                                    <option value="1">{{__('messages.veg')}}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row" style="padding-top: 12px;">
                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label"
                                    for="exampleFormControlInput1">{{ __('messages.price') }}</label>
                                <input type="number" min="0" max="999999999999.99" step="0.01" value="1" name="price"
                                    class="form-control" placeholder="Ex : 100" required>
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label"
                                    for="exampleFormControlInput1">{{ __('messages.discount') }}</label>
                                <input type="number" min="0" max="9999999999999999999999" value="0" name="discount"
                                    class="form-control" placeholder="Ex : 100">
                            </div>
                        </div>
                        <div class="col-md-3 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{ __('messages.discount') }}
                                    {{ __('messages.type') }}</label>
                                <select name="discount_type" class="form-control js-select2-custom">
                                    <option value="percent">{{ __('messages.percent') }}</option>
                                    <option value="amount">{{ __('messages.amount') }}</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- <div class="row" style="padding-top: 12px;">
                        <div class="col-md-4 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">{{ __('messages.category') }}
                                    <span class="input-label-secondary">*</span></label>
                                <select name="category_id" class="form-control js-select2-custom" required>
                                    <option value="">---{{ __('messages.select') }}---</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category['id'] }}">{{ $category['name'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">{{ __('messages.sub_category') }}
                                    <span class="input-label-secondary" title="{{ __('messages.category_required_warning') }}">
                                        <img src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                            alt="{{ __('messages.category_required_warning') }}">
                                    </span>
                                </label>
                                <select name="sub_category_id" id="sub_category_id" class="form-control js-select2-custom" required>
                                    <option value="">---{{ __('messages.select') }}---</option>
                                    @foreach ($sub_categories as $sub_category)
                                        <option value="{{ $sub_category['id'] }}">{{ $sub_category['name'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-md-4 col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">Sub Sub Category
                                    <span class="input-label-secondary">
                                        <img src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                            alt="{{ __('messages.sub_category_required_warning') }}">                                            
                                    </span>
                                </label>
                                <select name="sub_sub_category_id" id="sub_sub_category_id"
                                        class="form-control js-select2-custom" required>
                                    <option value="">---{{ __('messages.select') }}---</option>
                                    @foreach ($subsub_categories as $subsub_category)
                                        <option value="{{ $subsub_category['id'] }}">{{ $subsub_category['name'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div> 
                    </div> -->

                    <div class="row" style="padding-top: 12px;">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="input-label"
                                    for="exampleFormControlSelect1">{{ __('messages.addon') }}<span
                                        class="input-label-secondary"
                                        title="{{ __('messages.restaurant_required_warning') }}"><img
                                            src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                            alt="{{ __('messages.restaurant_required_warning') }}"></span></label>
                                <select name="addon_ids[]" class="form-control js-select2-custom" multiple="multiple"
                                    id="add_on">

                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="padding-top: 12px;">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{ __('messages.available') }}
                                    {{ __('messages.time') }} {{ __('messages.starts') }}</label>
                                <input type="time" name="available_time_starts" class="form-control"
                                    id="available_time_starts" placeholder="Ex : 10:30 am" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{ __('messages.available') }}
                                    {{ __('messages.time') }} {{ __('messages.ends') }}</label>
                                <input type="time" name="available_time_ends" class="form-control"
                                    id="available_time_ends" placeholder="5:45 pm" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group" style="padding-top: 12px;">
                        <label>{{ __('messages.product') }} {{ __('messages.image') }}</label><small style="color: red"> (
                            {{ __('messages.ratio') }} 1:1 )</small>
                        <div class="custom-file">
                            <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                            <label class="custom-file-label" for="customFileEg1">{{ __('messages.choose') }}
                                {{ __('messages.file') }}</label>
                        </div>

                        <center style="display: none" id="image-viewer-section" class="pt-2">
                            <img style="height: 200px;border: 1px solid; border-radius: 10px;" id="viewer"
                                src="{{ asset('public/assets/admin/img/400x400/img2.jpg') }}" alt="banner image" />
                        </center>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary">{{ __('messages.submit') }}</button>
                </form>
            </div>
        </div>
    </div>

@endsection


@push('script_2')
    <script>
        function getRestaurantData(route, restaurant_id, id) {
            $.get({
                url: route + restaurant_id,
                dataType: 'json',
                success: function(data) {
                    $('#' + id).empty().append(data.options);
                },
            });
        }

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#viewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileEg1").change(function() {
            readURL(this);
            $('#image-viewer-section').show(1000);
        });
    </script>

    <script>
        $(document).on('ready', function() {
            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function() {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
        });
        $('.js-data-example-ajax').select2({
            ajax: {
                url: '{{ url('/') }}/admin/vendor/get-restaurants',
                data: function(params) {
                    return {
                        q: params.term, // search term
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
    </script>


    <script src="{{ asset('public/assets/admin') }}/js/tags-input.min.js"></script>

    <script>
        $('#product_form').on('submit', function(e) {
            e.preventDefault();
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{ route('admin.product.store') }}',
                data: $('#product_form').serialize(),
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function() {
                    $('#loading').show();
                },
                success: function(data) {
                    $('#loading').hide();
                    if (data.errors) {
                        for (var i = 0; i < data.errors.length; i++) {
                            toastr.error(data.errors[i].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    } else {
                        toastr.success('{{ __('messages.product_added_successfully') }}', {
                            CloseButton: true,
                            ProgressBar: true
                        });
                        setTimeout(function() {
                            location.href =
                                '{{ \Request::server('HTTP_REFERER') ?? route('admin.product.list') }}';
                        }, 2000);
                    }
                }
            });
        });
    </script>
    <script>
        $(".lang_link").click(function(e) {
            e.preventDefault();
            $(".lang_link").removeClass('active');
            $(".lang_form").addClass('d-none');
            $(this).addClass('active');

            let form_id = this.id;
            let lang = form_id.substring(0, form_id.length - 5);
            console.log(lang);
            $("#" + lang + "-form").removeClass('d-none');
            if (lang == '{{ $default_lang }}') {
                $("#from_part_2").removeClass('d-none');
            } else {
                $("#from_part_2").addClass('d-none');
            }
        })
    </script>
@endpush
