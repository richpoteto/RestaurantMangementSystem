@extends('layouts.vendor.app')

@section('title',__('messages.profile_settings'))

@push('css_or_js')

@endpush

@section('content')
<!-- Content -->
<div class="content container-fluid">
    <!-- Page Header -->
    <div class="page-header">
        <div class="row align-items-end">
            <div class="col-sm mb-2 mb-sm-0">
                <h1 class="page-header-title">{{__('messages.settings')}}</h1>
            </div>

            <div class="col-sm-auto">
                <a class="btn btn-primary" href="{{route('vendor.dashboard')}}">
                    <i class="tio-home mr-1"></i> {{__('messages.dashboard')}}
                </a>
            </div>
        </div>
        <!-- End Row -->
    </div>
    <!-- End Page Header -->

    <div class="row">
        <div class="col-lg-3">
            <!-- Navbar -->
            <div class="navbar-vertical navbar-expand-lg mb-3 mb-lg-5">
                <!-- Navbar Toggle -->
                <button type="button" class="navbar-toggler btn btn-block btn-white mb-3" aria-label="Toggle navigation" aria-expanded="false" aria-controls="navbarVerticalNavMenu" data-toggle="collapse" data-target="#navbarVerticalNavMenu">
                    <span class="d-flex justify-content-between align-items-center">
                        <span class="h5 mb-0">{{__('messages.nav_menu')}}</span>

                        <span class="navbar-toggle-default">
                            <i class="tio-menu-hamburger"></i>
                        </span>

                        <span class="navbar-toggle-toggled">
                            <i class="tio-clear"></i>
                        </span>
                    </span>
                </button>
                <!-- End Navbar Toggle -->

                <div id="navbarVerticalNavMenu" class="collapse navbar-collapse">
                    <!-- Navbar Nav -->
                    <ul id="navbarSettings" class="js-sticky-block js-scrollspy navbar-nav navbar-nav-lg nav-tabs card card-navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active text-dark" href="javascript:" id="generalSection">
                                <i class="tio-user-outlined nav-icon"></i> {{__('messages.basic_information')}}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="javascript:" id="passwordSection">
                                <i class="tio-lock-outlined nav-icon"></i> {{__('messages.password')}}
                            </a>
                        </li>
                    </ul>
                    <!-- End Navbar Nav -->
                </div>
            </div>
            <!-- End Navbar -->
        </div>

        <div class="col-lg-9">
            <form action="{{env('APP_MODE')!='demo'?route('vendor.profile.update'):'javascript:'}}" method="post" enctype="multipart/form-data" id="vendor-settings-form">
                @csrf
                <!-- Card -->
                <div class="card mb-3 mb-lg-5" id="generalDiv">
                    <!-- Profile Cover -->
                    <div class="profile-cover">
                        <div class="profile-cover-img-wrapper"></div>
                    </div>
                    <!-- End Profile Cover -->

                    <!-- Avatar -->
                    <label class="avatar avatar-xxl avatar-circle avatar-border-lg avatar-uploader profile-cover-avatar" for="avatarUploader">
                        <img id="viewer" onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'" class="avatar-img" src="{{asset('storage/app/public/vendor')}}/{{auth('vendor')->check()?auth('vendor')->user()->image:auth('vendor_employee')->user()->image}}" alt="Image">

                        <input type="file" name="image" class="js-file-attach avatar-uploader-input" id="customFileEg1" accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                        <label class="avatar-uploader-trigger" for="customFileEg1">
                            <i class="tio-edit avatar-uploader-icon shadow-soft"></i>
                        </label>
                    </label>
                    <!-- End Avatar -->
                </div>
                <!-- End Card -->

                <!-- Card -->
                <div class="card mb-3 mb-lg-5">
                    <div class="card-header">
                        <h2 class="card-title h4"><i class="tio-info"></i> {{__('messages.basic_information')}}</h2>
                    </div>

                    <!-- Body -->
                    <div class="card-body">
                        <!-- Form -->
                        <!-- Form Group -->
                        <div class="row form-group">
                            <label for="firstNameLabel" class="col-sm-3 col-form-label input-label">{{__('messages.full_name')}} <i class="tio-help-outlined text-body ml-1" data-toggle="tooltip" data-placement="top" title="Display name"></i></label>

                            <div class="col-sm-9">
                                <div class="input-group input-group-sm-down-break">
                                    <input type="text" class="form-control" name="f_name" id="firstNameLabel" placeholder="{{__('messages.your_first_name')}}" aria-label="{{__('messages.your_first_name')}}" value="{{auth('vendor')->check()?auth('vendor')->user()->f_name:auth('vendor_employee')->user()->f_name}}">
                                    <input type="text" class="form-control" name="l_name" id="lastNameLabel" placeholder="{{__('messages.your_last_name')}}" aria-label="{{__('messages.your_last_name')}}" value="{{auth('vendor')->check()?auth('vendor')->user()->l_name:auth('vendor_employee')->user()->l_name}}">
                                </div>
                            </div>
                        </div>
                        <!-- End Form Group -->

                        <!-- Form Group -->
                        <div class="row form-group">
                            <label for="phoneLabel" class="col-sm-3 col-form-label input-label">{{__('messages.phone')}} <span class="input-label-secondary">({{__('messages.optional')}})</span></label>

                            <div class="col-sm-9">
                                <input type="text" class="js-masked-input form-control" name="phone" id="phoneLabel" placeholder="+x(xxx)xxx-xx-xx" aria-label="+(xxx)xx-xxx-xxxxx" value="{{auth('vendor')->check()?auth('vendor')->user()->phone:auth('vendor_employee')->user()->phone}}" data-hs-mask-options='{
                                           "template": "+(880)00-000-00000"
                                         }'>
                            </div>
                        </div>
                        <!-- End Form Group -->

                        <div class="row form-group">
                            <label for="newEmailLabel" class="col-sm-3 col-form-label input-label">{{__('messages.email')}}</label>

                            <div class="col-sm-9">
                                <input type="email" class="form-control" name="email" id="newEmailLabel" value="{{auth('vendor')->check()?auth('vendor')->user()->email:auth('vendor_employee')->user()->email}}" placeholder="{{__('messages.enter_new_email_address')}}" aria-label="{{__('messages.enter_new_email_address')}}">
                            </div>
                        </div>
                        <!-- Modify -->
                        <!-- Form Group -->
                        <div class="row form-group">
                            <label for="profileLabel" class="col-sm-3 col-form-label input-label">{{__('messages.profile')}} <span class="input-label-secondary">({{__('messages.optional')}})</span></label>

                            <div class="col-sm-9">
                                <input type="text" class="js-masked-input form-control" name="profile" id="profileLabel" placeholder="Type your profile" aria-label="Type your profile" value="{{auth('vendor')->check()?auth('vendor')->user()->profile:''}}" data-hs-mask-options='{
                                           "template": ""
                                         }'
                                         
                                         >
                            </div>
                        </div>
                        <!-- End Form Group -->

                        <!-- Form Group -->
                        <div class="row form-group">
                            <label for="cookingLabel" class="col-sm-3 col-form-label input-label">{{__('messages.cooling_philosopy')}} <span class="input-label-secondary">({{__('messages.optional')}})</span></label>

                            <div class="col-sm-9">
                                <input type="text" class="js-masked-input form-control" name="cooking_philosophy" id="cookingLabel" placeholder="Type your cooking philosophy" aria-label="Type your cooking philosophy"  data-hs-mask-options='{
                                           "template": ""
                                         }'
                                         value="{{auth('vendor')->check()?auth('vendor')->user()->cooking_philosophy:''}}"
                                         >
                            </div>
                        </div>
                        <!-- End Form Group -->

                        <!-- Form Group -->
                        <div class="row form-group">
                            <label for="schoolName" class="col-sm-3 col-form-label input-label">{{ __('messages.school_name') }}<span class="input-label-secondary">({{__('messages.optional')}})</span></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="school_name" id="schoolName" placeholder="Type schoole name" aria-label="Type schoole name" value="{{auth('vendor')->check()?auth('vendor')->user()->school_name:''}}">
                            </div>
                        </div>
                        <div class="row form-group">
                            <label for="certificate" class="col-sm-3 col-form-label input-label">{{ __('messages.certificate') }}<span class="input-label-secondary">({{__('messages.optional')}})</span></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="certificate" id="certificate" placeholder="Type your certificate" aria-label="{{ __('messages.certificate') }}" value="{{auth('vendor')->check()?auth('vendor')->user()->certificate:''}}">
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-sm-3 col-form-label input-label">{{ __('messages.start_end_year') }}<span class="input-label-secondary">({{__('messages.optional')}})</span></div>
                            <div class="col-sm-9">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="start_year" id="startYear" placeholder="Start Year" aria-label="Start Year" value="{{auth('vendor')->check()?auth('vendor')->user()->start_year:''}}">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="end_year" id="endYear" placeholder="Ending Year" aria-label="Ending Year" value="{{auth('vendor')->check()?auth('vendor')->user()->end_year:''}}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Form Group -->
                        <!-- Form Group -->
                        <div class="row form-group">
                            <label for="skillsLabel" class="col-sm-3 col-form-label input-label">{{ __('messages.skills') }} <span class="input-label-secondary">{{ __('messages.optional') }}</span></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="skillsLabel" placeholder="Type your skills here" aria-label="Type your skills here">
                                <div id="skillsTags"></div>
                                <input type="hidden" name="skills" id="skillsInput">
                            </div>
                        </div>

                        <!-- End Form Group -->

                        <!-- Form Group -->
                        <div class="row form-group">
                            <label for="achievementLabel" class="col-sm-3 col-form-label input-label">{{ __('messages.achievements') }} <span class="input-label-secondary">{{ __('messages.optional') }}</span></label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="achievementLabel" placeholder="Type your achievements here" aria-label="Type your achievements here">
                                <div id="achievementTags"></div>
                                <input type="hidden" name="achievements" id="achievementsInput">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="videoLabel" class="col-sm-3 col-form-label input-label">{{ __('messages.intro_video') }} <span class="input-label-secondary">{{ __('messages.optional') }}</span></label>
                            <input type="file" class="form-control-file" name="video" id="videoLabel">
                        </div>
                        <!-- End Form Group -->

                        <!-- Modify -->

                        <div class="d-flex justify-content-end">
                            <button type="button" onclick="@if(env('APP_MODE')!='demo') form_alert('vendor-settings-form','{{__('messages.you_want_to_update_user_info')}}') @else call_demo() @endif" class="btn btn-primary">{{__('messages.save_changes')}}</button>
                        </div>

                        <!-- End Form -->
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </form>

            <!-- Card -->
            <div id="passwordDiv" class="card mb-3 mb-lg-5">
                <div class="card-header">
                    <h4 class="card-title">{{__('messages.change_your_password')}}</h4>
                </div>

                <!-- Body -->
                <div class="card-body">
                    <!-- Form -->
                    <form id="changePasswordForm" action="{{env('APP_MODE')!='demo'?route('vendor.profile.settings-password'):'javascript:'}}" method="post" enctype="multipart/form-data">
                        @csrf

                        <!-- Form Group -->
                        <div class="row form-group">
                            <label for="newPassword" class="col-sm-3 col-form-label input-label">{{__('messages.new_password')}}</label>

                            <div class="col-sm-9">
                                <input type="password" class="js-pwstrength form-control" name="password" id="newPassword" placeholder="{{__('messages.enter_new_password')}}" aria-label="{{__('messages.enter_new_password')}}" data-hs-pwstrength-options='{
                                           "ui": {
                                             "container": "#changePasswordForm",
                                             "viewports": {
                                               "progress": "#passwordStrengthProgress",
                                               "verdict": "#passwordStrengthVerdict"
                                             }
                                           }
                                         }' required>

                                <p id="passwordStrengthVerdict" class="form-text mb-2"></p>

                                <div id="passwordStrengthProgress"></div>
                            </div>
                        </div>
                        <!-- End Form Group -->

                        <!-- Form Group -->
                        <div class="row form-group">
                            <label for="confirmNewPasswordLabel" class="col-sm-3 col-form-label input-label">{{__('messages.confirm_password')}}</label>

                            <div class="col-sm-9">
                                <div class="mb-3">
                                    <input type="password" class="form-control" name="confirm_password" id="confirmNewPasswordLabel" placeholder="{{__('messages.confirm_new_password')}}" aria-label="{{__('messages.confirm_new_password')}}" required>
                                </div>
                            </div>
                        </div>
                        <!-- End Form Group -->

                        <div class="d-flex justify-content-end">
                            <button type="button" onclick="@if(env('APP_MODE')!='demo') form_alert('changePasswordForm', '{{__('messages.want_to_update_password')}}') @else call_demo() @endif" class="btn btn-primary">{{__('messages.save_changes')}}</button>
                        </div>
                    </form>
                    <!-- End Form -->
                </div>
                <!-- End Body -->
            </div>
            <!-- End Card -->

            <!-- Sticky Block End Point -->
            <div id="stickyBlockEndPoint"></div>
        </div>
    </div>
    <!-- End Row -->
</div>
<!-- End Content -->
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
    });
</script>

<script>
    $("#generalSection").click(function() {
        $("#passwordSection").removeClass("active");
        $("#generalSection").addClass("active");
        $('html, body').animate({
            scrollTop: $("#generalDiv").offset().top
        }, 2000);
    });

    $("#passwordSection").click(function() {
        $("#generalSection").removeClass("active");
        $("#passwordSection").addClass("active");
        $('html, body').animate({
            scrollTop: $("#passwordDiv").offset().top
        }, 2000);
    });
</script>

<script>
    $(document).ready(function() {
        var skills = {!! json_encode(auth('vendor')->check() ? json_decode(auth('vendor')->user()->skills) : []) !!};
        skills.forEach(function(skill) {
            $('#skillsTags').append('<span class="badge badge-pill badge-primary mx-1">' + skill + '</span>');
        });
        $('#skillsLabel').keypress(function(event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if (keycode == '13') { //enter key 
                event.preventDefault();
                var val = $(this).val().trim();
                if (val !== '' && !skills.includes(val)) {
                    skills.push(val);
                    $('#skillsTags').append('<span class="badge badge-pill badge-primary mx-1">' + val + '</span>');
                    $('#skillsInput').val(skills.join(','));
                }
                $(this).val('');
            }
        });
    });
</script>

<script>
    var achievements = [];
    var achievements = {!! json_encode(auth('vendor')->check() ? json_decode(auth('vendor')->user()->achievements) : []) !!};
    achievements.forEach(function(achievement) {
            $('#achievementTags').append('<span class="badge badge-pill badge-primary mx-1">' + achievement + '</span>');
        });
    $('#achievementLabel').keypress(function(event) {
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '13') { //enter key 
            event.preventDefault();
            var achievement = $('#achievementLabel').val();
            $('#achievementTags').append('<span class="badge badge-pill badge-primary mx-1">' + achievement + '</span>');
            achievements.push(achievement);
            $('#achievementsInput').val(achievements.join(','));
            $('#achievementLabel').val('');
        }
    });
</script>
@endpush