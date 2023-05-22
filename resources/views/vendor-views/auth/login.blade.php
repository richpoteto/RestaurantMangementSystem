<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Title -->
    <title>{{__('messages.restaurant')}} | {{__('messages.login')}}</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&amp;display=swap" rel="stylesheet">
    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="{{asset('public/assets/admin')}}/css/vendor.min.css">
    <link rel="stylesheet" href="{{asset('public/assets/admin')}}/vendor/icon-set/style.css">
    <!-- CSS Front Template -->
    <link rel="stylesheet" href="{{asset('public/assets/admin')}}/css/theme.minc619.css?v=1.0">
    <link rel="stylesheet" href="{{asset('public/assets/admin')}}/css/toastr.css">
</head>

<body>
<!-- ========== MAIN CONTENT ========== -->
<main id="content" role="main" class="main">
    <div class="position-fixed top-0 right-0 left-0 bg-img-hero"
         style="height: 100%; background-image: url({{asset('public/assets/admin')}}/svg/components/login-background.png);">
    </div>
    @php($systemlogo=\App\Models\BusinessSetting::where(['key'=>'logo'])->first()->value)
    <!-- Content -->
    <div class="container py-5 py-sm-7">
        <a class="d-flex justify-content-center mb-5" href="javascript:">
            <img class="z-index-2"
            onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'"
                         src="{{asset('storage/app/public/business/'.$systemlogo)}}"
                  alt="Image Description" style="max-height: 100px;max-width: 300px">
        </a>

        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <!-- Card -->
                <div class="card card-lg mb-5">
                    <div class="card-body">
                        <div class="text-center">
                            <div class="mb-5">
                                <h1 class="display-4">{{__('messages.restaurant')}} {{__('messages.sign_in')}}</h1>
                                <p>{{__('messages.want_to_login_your_admin_account')}}
                                    <a href="{{route('admin.auth.login')}}">
                                        {{__('messages.admin_login')}}
                                    </a>
                                </p>
                            </div>
                        </div>
                        <!-- Form -->
                        <form class="login_form" action="{{route('vendor.auth.login')}}" method="post" id="vendor_login_form" style="display: none;">
                            @csrf
                            <!-- Form Group -->
                            <div class="text-center">
                                <div class="m-2">
                                    <span class="divider text-muted m-4">{{__('messages.restaurant_owner_login_form')}}</span>
                                </div>
                            </div>
                            <div class="js-form-message form-group">
                                <label class="input-label" for="signinSrEmail">{{__('messages.your_email')}}</label>

                                <input type="email" class="form-control form-control-lg" name="email" id="signinSrEmail"
                                       tabindex="1" placeholder="email@address.com" aria-label="email@address.com"
                                       required data-msg="Please enter a valid email address.">
                            </div>
                            <!-- End Form Group -->

                            <!-- Form Group -->
                            <div class="js-form-message form-group">
                                <label class="input-label" for="signupSrPassword" tabindex="0">
                                    <span class="d-flex justify-content-between align-items-center">
                                      {{__('messages.password')}}
                                    </span>
                                </label>

                                <div class="input-group input-group-merge">
                                    <input type="password" class="js-toggle-password form-control form-control-lg"
                                           name="password" id="signupSrPassword" placeholder="5+ characters required"
                                           aria-label="8+ characters required" required
                                           data-msg="{{__('messages.invalid_password_warning')}}"
                                           data-hs-toggle-password-options='{
                                                     "target": "#changePassTarget",
                                            "defaultClass": "tio-hidden-outlined",
                                            "showClass": "tio-visible-outlined",
                                            "classChangeTarget": "#changePassIcon"
                                            }'>
                                    <div id="changePassTarget" class="input-group-append">
                                        <a class="input-group-text" href="javascript:">
                                            <i id="changePassIcon" class="tio-visible-outlined"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Form Group -->

                            <!-- Checkbox -->
                            <div class="form-group">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="termsCheckbox"
                                           name="remember">
                                    <label class="custom-control-label text-muted" for="termsCheckbox">
                                        {{__('messages.remember_me')}}
                                    </label>
                                </div>
                            </div>
                            <!-- End Checkbox -->

                            {{-- recaptcha --}}
                            @php($recaptcha = \App\CentralLogics\Helpers::get_business_settings('recaptcha'))
                            @if(isset($recaptcha) && $recaptcha['status'] == 1)
                                <div id="recaptcha_element" style="width: 100%;" data-type="image"></div>
                                <br/>
                            @else
                                <div class="row p-2">
                                    <div class="col-6 pr-0">
                                        <input type="text" class="form-control form-control-lg" name="custome_recaptcha"
                                               id="custome_recaptcha" required placeholder="{{\__('Enter recaptcha value')}}" style="border: none" autocomplete="off" value="{{env('APP_DEBUG')?session('six_captcha'):''}}">
                                    </div>
                                    <div class="col-6" style="background-color: #FFFFFF; border-radius: 5px;">
                                        <img src="<?php echo $custome_recaptcha->inline(); ?>" style="width: 100%; border-radius: 4px;"/>
                                    </div>
                                </div>
                            @endif
                            
                            <button type="submit" class="btn btn-lg btn-block btn-primary">Sign in</button>
                            <div class="text-center">
                                <span class="divider text-muted m-4">OR</span>
                            </div>
                        </form>
                        <!-- End Form -->
                        <!-- Form -->
                        <form class="login_form" action="{{route('vendor.auth.employee.login')}}" method="post" id="employee_login_form" style="display: none;">
                            @csrf
                            <div class="text-center">
                                <div class="m-2">
                                    <span class="divider text-muted m-4">{{{__('messages.restaurant_employee_login_form')}}}</span>
                                </div>
                            </div>
                            <!-- Form Group -->
                            <div class="js-form-message form-group">
                                <label class="input-label" for="signinSrEmail">{{__('messages.your_email')}}</label>

                                <input type="email" class="form-control form-control-lg" name="email"
                                       tabindex="1" placeholder="email@address.com" aria-label="email@address.com"
                                       required data-msg="Please enter a valid email address.">
                            </div>
                            <!-- End Form Group -->

                            <!-- Form Group -->
                            <div class="js-form-message form-group">
                                <label class="input-label" for="" tabindex="0">
                                    <span class="d-flex justify-content-between align-items-center">
                                      {{__('messages.password')}}
                                    </span>
                                </label>

                                <div class="input-group input-group-merge">
                                    <input type="password" class="js-toggle-password form-control form-control-lg"
                                           name="password"  placeholder="{{__('messages.password_length_placeholder', ['length'=>'8+'])}}"
                                           aria-label="8+ characters required" required
                                           data-msg="{{__('messages.invalid_password_warning')}}"
                                           data-hs-toggle-password-options='{
                                                     "target": "#changePassTarget2",
                                            "defaultClass": "tio-hidden-outlined",
                                            "showClass": "tio-visible-outlined",
                                            "classChangeTarget": "#changePassIcon"
                                            }'>
                                    <div id="changePassTarget2" class="input-group-append">
                                        <a class="input-group-text" href="javascript:">
                                            <i id="changePassIcon" class="tio-visible-outlined"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Form Group -->

                            <!-- Checkbox -->
                            <div class="form-group">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="employeeCheckbox"
                                           name="remember">
                                    <label class="custom-control-label text-muted" for="employeeCheckbox">
                                        {{__('messages.remember_me')}}
                                    </label>
                                </div>
                            </div>
                            <!-- End Checkbox -->

                            {{-- recaptcha --}}
                            @php($recaptcha = \App\CentralLogics\Helpers::get_business_settings('recaptcha'))
                            @if(isset($recaptcha) && $recaptcha['status'] == 1)
                                <div id="recaptcha_element2" style="width: 100%;" data-type="image"></div>
                                <br/>
                            @else
                                <div class="row p-2">
                                    <div class="col-6 pr-0">
                                        <input type="text" class="form-control form-control-lg" name="custome_recaptcha"
                                               id="custome_recaptcha2" required placeholder="{{\__('Enter recaptcha value')}}" style="border: none" autocomplete="off" value="{{env('APP_DEBUG')?session('six_captcha'):''}}">
                                    </div>
                                    <div class="col-6" style="background-color: #FFFFFF; border-radius: 5px;">
                                        <img src="<?php echo $custome_recaptcha->inline(); ?>" style="width: 100%; border-radius: 4px;"/>
                                    </div>
                                </div>
                            @endif

                            <button type="submit" class="btn btn-lg btn-block btn-primary">{{__('messages.sine_in')}}</button>

                            <div class="text-center">
                                <span class="divider text-muted m-4">OR</span>
                            </div>
                        </form>
                        <!-- End Form -->
                        <div class="text-center">
                            <button class="btn btn-lg btn-block btn-white mb-4" type="button" id="owner_sign_in">
                                <span class="d-flex justify-content-center align-items-center">
                                    {{__('messages.sign_in_as_owner')}}
                                </span>
                            </button>
                            <span class="divider text-muted mb-4 signIn">OR</span>
                            <button class="btn btn-lg btn-block btn-white mb-4" type="button" id="employee_sign_in">
                                <span class="d-flex justify-content-center align-items-center">
                                    {{__('messages.sign_in_as_employee')}}
                                </span>
                            </button>

                        </div>
                    </div>

                    @if(env('APP_MODE')=='demo')
                        <div class="card-footer">
                            <div class="row">
                                <div class="col-10">
                                    <span class="badge badge-soft-info">Restaurant Owner login credential.</span><br>
                                    <span>Email : test.restaurant@gmail.com</span><br>
                                    <span>Password : 12345678</span>
                                </div>
                                <div class="col-2">
                                    <button class="btn btn-primary" onclick="copy_cred()"><i class="tio-copy"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
                <!-- End Card -->
            </div>
        </div>
    </div>
    <!-- End Content -->
</main>
<!-- ========== END MAIN CONTENT ========== -->


<!-- JS Implementing Plugins -->
<script src="{{asset('public/assets/admin')}}/js/vendor.min.js"></script>

<!-- JS Front -->
<script src="{{asset('public/assets/admin')}}/js/theme.min.js"></script>
<script src="{{asset('public/assets/admin')}}/js/toastr.js"></script>
{!! Toastr::message() !!}

@if ($errors->any())
    <script>
        @foreach($errors->all() as $error)
        toastr.error('{{$error}}', Error, {
            CloseButton: true,
            ProgressBar: true
        });
        @endforeach
    </script>
@endif

<!-- JS Plugins Init. -->
<script>
    $(document).on('ready', function () {
        // INITIALIZATION OF SHOW PASSWORD
        // =======================================================
        $('.js-toggle-password').each(function () {
            new HSTogglePassword(this).init()
        });

        // INITIALIZATION OF FORM VALIDATION
        // =======================================================
        $('.js-validate').each(function () {
            $.HSCore.components.HSValidation.init($(this));
        });
        // $('#employee_login_form').hide();
        // $('#vendor_login_form').hide();
    });
    $('#owner_sign_in').on('click', function(){
        $('.signIn').hide();
        $('#employee_login_form').hide();
        $(this).hide();
        $('#employee_sign_in').show();
        $('#vendor_login_form').show();
    });
    $('#employee_sign_in').on('click', function(){
        $('.signIn').hide();
        $('#employee_login_form').show();
        $(this).hide();
        $('#owner_sign_in').show();
        $('#vendor_login_form').hide();
    });
</script>

{{-- recaptcha scripts start --}}
@if(isset($recaptcha) && $recaptcha['status'] == 1)
    <script type="text/javascript">
        var onloadCallback = function () {
            grecaptcha.render('recaptcha_element', {
                'sitekey': '{{ \App\CentralLogics\Helpers::get_business_settings('recaptcha')['site_key'] }}'
            });
        };

        var onloadCallback2 = function () {
            grecaptcha.render('recaptcha_element2', {
                'sitekey': '{{ \App\CentralLogics\Helpers::get_business_settings('recaptcha')['site_key'] }}'
            });
        };

    </script>
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback2&render=explicit" async defer></script>
    <script>
        $("#vendor_login_form").on('submit',function(e) {
            var response = grecaptcha.getResponse(0);

            if (response.length === 0) {
                e.preventDefault();
                toastr.error("{{__('messages.Please check the recaptcha')}}");
            }
        });

        $("#employee_login_form").on('submit',function(e) {
            var response = grecaptcha.getResponse(1);

            if (response.length === 0) {
                e.preventDefault();
                toastr.error("{{__('messages.Please check the recaptcha')}}");
            }
        });
    </script>
@endif
{{-- recaptcha scripts end --}}


@if(env('APP_MODE')=='demo')
    <script>
        function copy_cred() {
            $('#signinSrEmail').val('test.restaurant@gmail.com');
            $('#signupSrPassword').val('12345678');
            toastr.success('Copied successfully!', 'Success!', {
                CloseButton: true,
                ProgressBar: true
            });
        }
    </script>
@endif
<!-- IE Support -->
<script>
    if (/MSIE \d|Trident.*rv:/.test(navigator.userAgent)) document.write('<script src="{{asset('public/assets/admin')}}/vendor/babel-polyfill/polyfill.min.js"><\/script>');
</script>
</body>
</html>
