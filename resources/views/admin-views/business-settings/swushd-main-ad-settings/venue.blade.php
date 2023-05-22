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
                    <a class="nav-link active"
                        href="{{ route('admin.business-settings.swushd-main-ad-settings', 'venue') }}"
                        aria-disabled="true">{{ __('messages.swushd_venue') }}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"
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
            <form action="{{ route('admin.business-settings.swushd-main-ad-settings', 'venue') }}" method="POST" enctype="multipart/form-data">
                @php($venue = \App\Models\BusinessSetting::where(['key' => 'venue'])->first())
                @php($venue = isset($venue->value) ? json_decode($venue->value, true) : null)
                @csrf
                <script>console.log(<?= json_encode($venue); ?>);</script>
                <div class="form-group">
                    <label for="venue_title">{{ __('messages.venue_title') }}</label>
                    <input type="text" id="venue_title" name="venue_title" class="form-control" placeholder="SWUSHD Elite Venues">
                </div>
                <div class="form-group">
                    <label for="venue_description">{{ __('messages.venue_description') }}</label>          
                    <input type="text" id="venue_description" name="venue_description" class="form-control" 
                        placeholder="Venues to enjoy SWUSHD 'Eat Whatever You Want Service'">
                </div>
                
                <div class="form-group">
                    <label class="input-label">{{ __('messages.venue_ad_img') }}<small style="color: red">* (
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
                            <th scope="col">{{ __('messages.venue_title') }}</th>
                            <th scope="col">{{ __('messages.venue_description') }}</th>
                            <th scope="col">{{ __('messages.action') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if ($venue)
                            @foreach ($venue as $key => $venue_item)
                                <tr>
                                    <th scope="row">{{ $key + 1 }}</th>
                                    <td>
                                        <div class="media align-items-center">
                                            <img class="avatar avatar-lg mr-3"
                                                src="{{ asset('public/assets/landing/image') }}/{{ $venue_item['img'] }}"
                                                onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'"
                                                alt="{{ $venue_item['venue_title'] }}">
                                        </div>
                                    </td>
                                    <td>{{ $venue_item['venue_title'] }}</td>

                                    <td>{{ Str::limit($venue_item['venue_description'], 100) }}</td>
                                    <td>
                                        <a class="btn btn-sm btn-white" href="javascript:"
                                            onclick="form_alert('venue-{{ $key }}','{{ __('messages.Want_to_delete_this_item') }}')"
                                            title="{{ __('messages.delete') }}"><i class="tio-delete-outlined"></i>
                                        </a>
                                        <form
                                            action="{{ route('admin.business-settings.swushd-main-ad-settings-delete', ['tab' => 'venue', 'key' => $key]) }}"
                                            method="post" id="venue-{{ $key }}">
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

