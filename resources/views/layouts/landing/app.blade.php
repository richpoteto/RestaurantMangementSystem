@php($background_Change = \App\Models\BusinessSetting::where(['key' => 'backgroundChange'])->first())
@php($background_Change = isset($background_Change->value) ? json_decode($background_Change->value, true) : null)
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="">
    @php($logo = \App\Models\BusinessSetting::where(['key' => 'icon'])->first()->value ?? '')
    <link rel="icon" type="image/x-icon" href="{{ asset('storage/app/public/business/' . $logo ?? '') }}">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;800&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.theme.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.transitions.css">
    <link rel="stylesheet" href="{{ asset('public/assets/admin') }}/css/toastr.css">
    <link rel="stylesheet" href="{{ asset('public/assets/landing') }}/css/style.css" />
    <link rel="stylesheet" href="{{ asset('public/assets/landing') }}/css/responsive.css" />
    <title>@yield('title')</title>
    <style>
        html,
        body {
            background-color: {{ isset($background_Change['landing-page-bg']) ? $background_Change['landing-page-bg'] : '#ffffff' }};
        }

        .dropdown-menu.show,
        .top-nav-bg {
            background-color: {{ isset($background_Change['header-bg']) ? $background_Change['header-bg'] : '#ef7822'  }};
        }

        .footer-bg {
            background-color: {{ isset($background_Change['footer-bg']) ? $background_Change['footer-bg'] : '#333e4f' }};
        }
        .owl-theme .owl-controls .owl-buttons,
        .owl-theme .owl-controls .owl-buttons div {
            color: #000000;
            background: none;
        }
        .form-group {
            margin-bottom: 1rem;
        }
    </style>
    @stack('css_or_js')
</head>

<body>
   {{-- {{ dd($background_Change) }} --}}
    @php($landing_page_text = \App\Models\BusinessSetting::where(['key' => 'landing_page_text'])->first())
    @php($landing_page_text = isset($landing_page_text->value) ? json_decode($landing_page_text->value, true) : null)
    @php($landing_page_links = \App\Models\BusinessSetting::where(['key' => 'landing_page_links'])->first())
    @php($landing_page_links = isset($landing_page_links->value) ? json_decode($landing_page_links->value, true) : null)
    <!---------- Top Navbar--------->
    <nav class="navbar navbar-expand-lg navbar-light top-nav-bg">
        <div class="container">
            <a class="navbar-brand" href="{{url('/')}}">
                @php($logo = \App\CentralLogics\Helpers::get_settings('logo'))
                <img class="img-fluid w-100 logo"
                    onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'"
                    src="{{ asset('storage/app/public/business/' . $logo) }}" alt="StackFood">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link text-bolder active-nav"
                            href="{{ route('home') }}">{{ __('messages.home') }}<span
                                class="sr-only">(current)</span></a>
                    </li>
                    @if ($landing_page_links['web_app_url_status'])
                    <li class="nav-item">
                        <a class="nav-link"
                            href="{{ $landing_page_links['web_app_url'] }}">{{ __('messages.browse_web') }}</a>
                    </li>
                    @endif
                    <li class="nav-item">
                        <a class="nav-link"
                            href="{{ route('terms-and-conditions') }}">{{ __('messages.terms_and_condition') }}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('about-us') }}">{{ __('messages.about_us') }}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                            href="{{ route('contact-us') }}">{{ __('messages.contact_us') }}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                            href="{{ route('privacy-policy') }}">{{ __('messages.privacy_policy') }}</a>
                    </li>
                    @if ($toggle_dm_registration || $toggle_restaurant_registration)
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                {{ __('messages.join_us') }}
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                                @if ($toggle_restaurant_registration)
                                    <li>
                                        <a class="dropdown-item" href="{{ route('restaurant.create') }}">
                                            {{ __('messages.restaurant_registration') }}
                                        </a>
                                    </li>
                                    @if ($toggle_dm_registration)
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                    @endif
                                @endif
                                @if ($toggle_dm_registration)
                                    <li><a class="dropdown-item"
                                            href="{{ route('deliveryman.create') }}">{{ __('messages.deliveryman_registration') }}</a>
                                    </li>
                                @endif
                            </ul>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
    </nav>
    @yield('content')
    <!-- FOOTER -->
    <footer class="w-100 pb-4 text-white rounded-left footer-bg">
        <div class="container">
            <div class="row footer-row">
                <div class="@if ($landing_page_links['app_url_android_status'] == null && $landing_page_links['app_url_ios_status'] == null) col-md-4
                @else
                    col-md-3 @endif">
                    <a class="navbar-brand" href="#">
                        @php($logo = \App\CentralLogics\Helpers::get_settings('logo'))
                        <img style="max-width: 200px; max-height: 60px;" class="img-fluid"
                            onerror="this.src='{{ asset('public/assets/admin/img/160x160/img2.jpg') }}'"
                            src="{{ asset('storage/app/public/business/' . $logo) }}" alt="Image">
                    </a>
                    <p class="paragraph">
                        {{ isset($landing_page_text) ? $landing_page_text['footer_article'] : '' }}
                    </p>
                </div>
                <div
                    class="@if ($landing_page_links['app_url_android_status'] == null && $landing_page_links['app_url_ios_status'] == null) col-md-4
            @else
                col-md-3 @endif footer-col">


                    <h5 class="text-white mb-3">{{ __('messages.quick_links') }}</h5>
                    <ul class="list-unstyled text-muted">
                        <li>
                            <a href="{{ route('about-us') }}">{{ __('messages.about_us') }}</a>
                        </li>
                        <li>
                            <a href="{{ route('contact-us') }}">{{ __('messages.contact_us') }}</a>
                        </li>
                        <li>
                            <a href="{{ route('privacy-policy') }}">{{ __('messages.privacy_policy') }}</a>
                        </li>

                        <li>
                            <a
                                href="{{ route('terms-and-conditions') }}">{{ __('messages.terms_and_condition') }}</a>
                        </li>
                    </ul>
                </div>
                @if ($landing_page_links['app_url_android_status'] !== null || $landing_page_links['app_url_ios_status'] !== null)
                    <div class="col-md-3 footer-col">
                        <h5 class="text-white mb-3">{{ __('messages.download_our_apps') }}</h5>
                        <div class="footer-mobile-app">
                            @if ($landing_page_links['app_url_android_status'])
                                <a href="{{ $landing_page_links['app_url_android'] }}">
                                    <img class="img-fluid mr w-100"
                                        src="{{ asset('public/assets/landing') }}/image/playstore.png"
                                        alt="Play store" />
                                </a>
                            @endif
                            @if ($landing_page_links['app_url_ios_status'])
                                <a href="{{ $landing_page_links['app_url_ios'] }}">
                                    <img class="img-fluid mr w-100"
                                        src="{{ asset('public/assets/landing') }}/image/apple_store.png"
                                        alt="iOS App">
                                </a>
                            @endif
                        </div>
                    </div>
                @endif
                <div class="@if ($landing_page_links['app_url_android_status'] == null && $landing_page_links['app_url_ios_status'] == null) col-md-4
                @else
                    col-md-3 @endif footer-col">
                    <h5 class="text-white mb-2">{{ __('messages.contact_us') }}</h5>
                    <ul class="list-unstyled">
                        <li>
                            <a href="#"><i
                                    class="fa-solid fa-location-dot fa-1x"></i>&nbsp;&nbsp;{{ \App\CentralLogics\Helpers::get_settings('address') }}</a>
                        </li>
                        <li>
                            <a class="site-email"
                                href="mailto:{{ \App\CentralLogics\Helpers::get_settings('email_address') }}"><i
                                    class="fa-solid fa-envelope fa-1x"></i>&nbsp;&nbsp;{{ \App\CentralLogics\Helpers::get_settings('email_address') }}</a>
                        </li>
                        <li>
                            <a href="tel:{{ \App\CentralLogics\Helpers::get_settings('phone') }}"><i
                                    class="fa-solid fa-phone fa-1x"></i>&nbsp;&nbsp;
                                {{ \App\CentralLogics\Helpers::get_settings('phone') }}
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="d-flex justify-content-lg-between mt-4 small-footer flex-none-sm">
                <div class="social-icon">
                    @php($social_media = \App\Models\SocialMedia::where('status', 1)->get())
                    @if (isset($social_media))
                        @foreach ($social_media as $social)
                            <a class="social-btn" target="_blank" href="{{ $social->link }}"
                                style="color: white!important;">
                                <i class="fa-brands fa-{{ $social->name }} fa-2x" aria-hidden="true"></i>
                            </a>
                        @endforeach
                    @endif
                </div>
                <!-- Right -->
                <!-- Left -->
                <div class="d-lg-block">
                    <span class="copyright">
                        &copy; {{ \App\CentralLogics\Helpers::get_settings('footer_text') }}
                        by {{ \App\CentralLogics\Helpers::get_settings('business_name') }}</span>
                </div>
                <!-- Left -->
            </div>
        </div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js">
    </script>
    <script src="{{ asset('public/assets/admin') }}/js/toastr.js"></script>
    {!! Toastr::message() !!}
    <script>
        $(".owl-carousel").owlCarousel({
            items: 2,
            itemsDesktop: [1000, 2],
            itemsDesktopSmall: [979, 2],
            itemsTablet: [767, 1],
            pagination: false,
            dots: false,
            autoPlay: true,
            smartSpeed: 800,
            navigation: true,
            navigationText: [
                '<i class="fa-solid fa-left-long fa-3x"></i>&nbsp;&nbsp;',
                '&nbsp;&nbsp;<i class="fa-solid fa-right-long fa-3x"></i>'
            ]
        });
    </script>
    @stack('script_2')
</body>
</html>
