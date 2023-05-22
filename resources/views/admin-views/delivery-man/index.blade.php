@extends('layouts.admin.app')

@section('title', 'Add new delivery-man')

@push('css_or_js')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/css/intlTelInput.css"
        integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .iti {
            width: 100%;
        }

        .form-container {
            padding: 20px;
            box-shadow: 4px 4px 10px rgb(65 83 179 / 15%);
            border-radius: 8px;
            border: 2px solid #b3bac3;
        }

        .submitBtn {
            float: right;
            background: #EF7822;
            text-transform: uppercase;
            padding: 14px 35px;
            box-shadow: 3px 3px 8px rgb(65 83 179 / 15%);
            border-radius: 4px;
            margin-right: 10px;
            margin-top: 0px !important;
            margin-bottom: 0px;
        }

        .btn-primary:hover {
            background-color: #EF7833;
            border-color: #EF7833;
        }

        .btn-primary {
            background-color: #EF7822;
            border-color: #EF7822;
        }

        .hr {
            margin-top: 1rem;
            margin-bottom: 3rem;
            border: 0;
            border-top: 0.0625rem solid transparent;
        }

        .form-title {
            font-size: 20px;
            color: #EF7822;
            font-weight: bold;
        }

    </style>
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title text-center">
                        {{ __('messages.add') }}
                        {{ __('messages.new') }} {{ __('messages.deliveryman') }}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="form-container">
                    <p class="form-title">{{ __('messages.deliveryman') }}
                        {{ __('messages.info') }}</p>
                    <form action="{{ route('admin.delivery-man.store') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ __('messages.first') }}
                                        {{ __('messages.name') }}</label>
                                    <input type="text" name="f_name" class="form-control"
                                        placeholder="{{ __('messages.first') }} {{ __('messages.name') }}" required>
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ __('messages.last') }}
                                        {{ __('messages.name') }}</label>
                                    <input type="text" name="l_name" class="form-control"
                                        placeholder="{{ __('messages.last') }} {{ __('messages.name') }}" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-4 col-12">
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ __('messages.email') }}</label>
                                    <input type="email" name="email" class="form-control"
                                        placeholder="Ex : ex@example.com" required>
                                </div>
                            </div>

                            <div class="col-sm-4 col-12">
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ __('messages.deliveryman') }}
                                        {{ __('messages.type') }}</label>
                                    <select name="earning" class="form-control">
                                        <option value="1">{{ __('messages.freelancer') }}</option>
                                        <option value="0">{{ __('messages.salary_based') }}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-4 col-12">
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ __('messages.zone') }}</label>
                                    <select name="zone_id" class="form-control" required
                                        data-placeholder="{{ __('messages.select') }} {{ __('messages.zone') }}">
                                        <option value="" readonly="true" hidden="true">{{ __('messages.select') }}
                                            {{ __('messages.zone') }}</option>
                                        @foreach (\App\Models\Zone::all() as $zone)
                                            @if (isset(auth('admin')->user()->zone_id))
                                                @if (auth('admin')->user()->zone_id == $zone->id)
                                                    <option value="{{ $zone->id }}" selected>{{ $zone->name }}
                                                    </option>
                                                @endif
                                            @else
                                                <option value="{{ $zone->id }}">{{ $zone->name }}</option>
                                            @endif
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ __('messages.identity') }}
                                        {{ __('messages.type') }}</label>
                                    <select name="identity_type" class="form-control">
                                        <option value="passport">{{ __('messages.passport') }}</option>
                                        <option value="driving_license">{{ __('messages.driving') }}
                                            {{ __('messages.license') }}</option>
                                        <option value="nid">{{ __('messages.nid') }}</option>
                                        <option value="restaurant_id">{{ __('messages.restaurant') }}
                                            {{ __('messages.id') }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ __('messages.identity') }}
                                        {{ __('messages.number') }}</label>
                                    <input type="text" name="identity_number" class="form-control"
                                        placeholder="Ex : DH-23434-LS" required>
                                </div>
                            </div>
                            <div class="col-md-12 col-12">
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ __('messages.identity') }}
                                        {{ __('messages.image') }}</label>
                                    <div>
                                        <div class="row" id="coba"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <p class="form-title text-capitalize">{{ __('messages.login') }}
                            {{ __('messages.info') }}</p>

                        <br>
                        <div class="row">
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label class="input-label" for="phone">{{ __('messages.phone') }}</label>
                                    <div class="input-group">
                                        <input type="tel" name="tel" id="phone" placeholder="Ex : 017********"
                                            class="form-control" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-12">
                                <div class="form-group">
                                    <label class="input-label"
                                        for="exampleFormControlInput1">{{ __('messages.password') }}</label>
                                    <input type="text" name="password" class="form-control" placeholder="Ex : password"
                                        required>
                                </div>
                            </div>
                        </div>
                        <div class="row d-flex justify-content-center">
                            <div class="col-4">
                                <div class="form-group">
                                    <center class="pt-4">
                                        <img style="height: 200px;border: 1px solid; border-radius: 10px;" id="viewer"
                                            src="{{ asset('public/assets/admin/img/400x400/img2.jpg') }}"
                                            alt="delivery-man image" />
                                    </center>
                                    <label>{{ __('messages.deliveryman') }} {{ __('messages.image') }}</label><small
                                        style="color: red">* ( {{ __('messages.ratio') }} 1:1 )</small>
                                    <div class="custom-file">
                                        <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" required>
                                        <label class="custom-file-label" for="customFileEg1">{{ __('messages.choose') }}
                                            {{ __('messages.file') }}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary submitBtn">{{ __('messages.submit') }}</button>
                        <hr class="hr">
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('script_2')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/intlTelInput.min.js"
        integrity="sha512-QMUqEPmhXq1f3DnAVdXvu40C8nbTgxvBGvNruP6RFacy3zWKbNTmx7rdQVVM2gkd2auCWhlPYtcW2tHwzso4SA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/intlTelInput-jquery.min.js"
        integrity="sha512-hkmipUFWbNGcKnR0nayU95TV/6YhJ7J9YUAkx4WLoIgrVr7w1NYz28YkdNFMtPyPeX1FrQzbfs3gl+y94uZpSw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/utils.min.js"
             integrity="sha512-lv6g7RcY/5b9GMtFgw1qpTrznYu1U4Fm2z5PfDTG1puaaA+6F+aunX+GlMotukUFkxhDrvli/AgjAu128n2sXw=="
             crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
    <link rel="shortcut icon" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/img/flags.png"
        type="image/x-icon">
    <link rel="shortcut icon" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/img/flags@2x.png"
        type="image/x-icon">
    <script>
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
        });
        @php($country = \App\Models\BusinessSetting::where('key', 'country')->first())
        var phone = $("#phone").intlTelInput({
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/8.4.6/js/utils.js",
            autoHideDialCode: true,
            autoPlaceholder: "ON",
            dropdownContainer: document.body,
            formatOnDisplay: true,
            hiddenInput: "phone",
            initialCountry: "{{ $country ? $country->value : auto }}",
            placeholderNumberType: "MOBILE",
            separateDialCode: true
        });
        // $("#phone").on('change', function(){
        //     $(this).val(phone.getNumber());
        // })
    </script>

    <script src="{{ asset('public/assets/admin/js/spartan-multi-image-picker.js') }}"></script>
    <script type="text/javascript">
        $(function() {
            $("#coba").spartanMultiImagePicker({
                fieldName: 'identity_image[]',
                maxCount: 5,
                rowHeight: '120px',
                groupClassName: 'col-lg-2 col-md-4 col-sm-4 col-6',
                maxFileSize: '',
                placeholderImage: {
                    image: '{{ asset('public/assets/admin/img/400x400/img2.jpg') }}',
                    width: '100%'
                },
                dropFileLabel: "Drop Here",
                onAddRow: function(index, file) {

                },
                onRenderedPreview: function(index) {

                },
                onRemoveRow: function(index) {

                },
                onExtensionErr: function(index, file) {
                    toastr.error('{{ __('messages.please_only_input_png_or_jpg_type_file') }}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                },
                onSizeErr: function(index, file) {
                    toastr.error('{{ __('messages.file_size_too_big') }}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        });
    </script>
@endpush
