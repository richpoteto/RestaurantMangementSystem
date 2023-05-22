@extends('layouts.admin.app')

@section('title',__('messages.swushd_main_ad_settings'))

@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{asset('public/assets/admin/css/croppie.css')}}" rel="stylesheet">
    <style>
        .flex-item{
            padding: 10px;
            flex: 20%;
        }

        /* Responsive layout - makes a one column-layout instead of a two-column layout */
        @media (max-width: 768px) {
            .flex-item{
                flex: 50%;
            }
        }

        @media (max-width: 480px) {
            .flex-item{
                flex: 100%;
            }
        }
    </style>
@endpush

@section('content')
<div class="content container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('messages.dashboard') }}</a></li>
            <li class="breadcrumb-item" aria-current="page">{{__('messages.mobile_ads')}}</li>
            <li class="breadcrumb-item" aria-current="page">{{ __('messages.swushd_main_ad_settings') }}</li>
        </ol>
    </nav>
    <!-- Page Header -->
    <div class="page-header">
        <h1 class="page-header-title">{{ __('messages.swushd_main_ad_settings') }}</h1>
        <!-- Nav Scroller -->
        <div class="js-nav-scroller hs-nav-scroller-horizontal">
            <!-- Nav -->
            <ul class="nav nav-tabs page-header-tabs">
                <li class="nav-item">
                    <a class="nav-link"
                        href="{{ route('admin.business-settings.swushd-main-ad-settings', 'index') }}">{{ __('messages.lodging') }}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"
                        href="{{ route('admin.business-settings.swushd-main-ad-settings', 'restaurant') }}"
                        aria-disabled="true">{{ __('messages.swushd_restaurant') }}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"
                        href="{{ route('admin.business-settings.swushd-main-ad-settings', 'venue') }}"
                        aria-disabled="true">{{ __('messages.swushd_venue') }}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active"
                        href="{{ route('admin.business-settings.swushd-main-ad-settings', 'elite_venue') }}"
                        aria-disabled="true">{{ __('messages.swushd_elite_venue') }}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"
                        href="{{ route('admin.business-settings.swushd-main-ad-settings', 'venue_rental') }}"
                        aria-disabled="true">{{ __('messages.swushd_venue_rental') }}</a>
                </li>                
            </ul>
            <!-- End Nav -->
        </div>
        <!-- End Nav Scroller -->
    </div>
    <!-- End Page Header -->
    <!-- Page Heading -->
    <div class="card my-2">
        <div class="card-body">
            <form action="{{ route('admin.business-settings.swushd-main-ad-settings', 'elite_venue') }}" method="POST" enctype="multipart/form-data">
                @php($elite_venue = \App\Models\BusinessSetting::where(['key' => 'elite_venue'])->first())
                @php($elite_venue = isset($elite_venue->value) ? json_decode($elite_venue->value, true) : null)
                @csrf
                
                <div class="form-group">
                    <label for="elite_venue_title">{{ __('messages.elite_venue_title') }}</label>
                    <input type="text" id="elite_venue_title" name="elite_venue_title" class="form-control" placeholder="Premium Venues">
                </div>
                <div class="form-group">
                    <label for="elite_venue_description">{{ __('messages.elite_venue_description') }}</label>          
                    <input type="text" id="elite_venue_description" name="elite_venue_description" class="form-control"
                        placeholder="'Must Visit' Venues that provide our 'Eat Whatever You Want Service' in standout & five-star settings.">
                </div>
                
                <div class="form-group">
                    <label class="input-label">{{ __('messages.elite_venue_ad_img') }}<small style="color: red">* (
                            {{ __('messages.size') }}: 200 X 335 px )</small></label>
                    <div class="custom-file">
                        <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" required>
                        <label class="custom-file-label" for="customFileEg1">{{ __('messages.choose') }}
                            {{ __('messages.file') }}</label>
                    </div>
                    <center style="display: none" id="image-viewer-section" class="pt-2">
                        <img style="height: 200px;border: 1px solid; border-radius: 10px;" id="viewer"
                            src="{{ asset('public/assets/admin/img/400x400/img2.jpg') }}" alt="Image" />
                    </center>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-success" value="{{ __('messages.submit') }}">
                </div>
            </form>
            <div class="col-12">
                <table class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">{{ __('messages.image') }}</th>
                            <th scope="col">{{ __('messages.elite_venue_title') }}</th>
                            <th scope="col">{{ __('messages.elite_venue_description') }}</th>
                            <th scope="col">{{ __('messages.action') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if ($elite_venue)
                            @foreach ($elite_venue as $key => $elite_venue_item)
                                <tr>
                                    <th scope="row">{{ $key + 1 }}</th>
                                    <td>
                                        <div class="media align-items-center">
                                            <img class="avatar avatar-lg mr-3"
                                                src="{{ asset('public/assets/landing/image') }}/{{ $elite_venue_item['img'] }}"
                                                onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'"
                                                alt="{{ $elite_venue_item['elite_venue_title'] }}">
                                        </div>
                                    </td>
                                    <td>{{ $elite_venue_item['elite_venue_title'] }}</td>

                                    <td>{{ Str::limit($elite_venue_item['elite_venue_description'], 100) }}</td>
                                    <td>
                                        <a class="btn btn-sm btn-white" href="javascript:"
                                            onclick="form_alert('elite_venue-{{ $key }}','{{ __('messages.Want_to_delete_this_item') }}')"
                                            title="{{ __('messages.delete') }}"><i class="tio-delete-outlined"></i>
                                        </a>
                                        <form
                                            action="{{ route('admin.business-settings.swushd-main-ad-settings-delete', ['tab' => 'elite_venue', 'key' => $key]) }}"
                                            method="post" id="elite_venue-{{ $key }}">
                                            @csrf
                                            @method('delete')
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
@push('script_2')
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
            $('#image-viewer-section').show(1000);
        });
        $(document).on('ready', function() {});
    </script>
@endpush

