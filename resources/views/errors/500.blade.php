<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>{{__('messages.error')}} 500 | {{\App\Models\BusinessSetting::where(['key'=>'business_name'])->first()->value??'Stack Food'}}</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&amp;display=swap" rel="stylesheet">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="{{asset('public/assets/admin')}}/css/vendor.min.css">
    <link rel="stylesheet" href="{{asset('public/assets/admin')}}/vendor/icon-set/style.css">

    <!-- CSS Front Template -->
    <link rel="stylesheet" href="{{asset('public/assets/admin')}}/css/theme.minc619.css?v=1.0">
</head>

<body>

<!-- Content -->
<div class="container">
    <div class="footer-height-offset d-flex justify-content-center align-items-center flex-column">
        <div class="row align-items-sm-center w-100">
            <div class="col-sm-6">
                <div class="text-center text-sm-right mr-sm-4 mb-5 mb-sm-0">
                    <img class="w-60 w-sm-100 mx-auto" src="{{asset('public/assets/admin')}}/svg/illustrations/think.svg" alt="Image Description" style="max-width: 15rem;">
                </div>
            </div>

            <div class="col-sm-6 col-md-4 text-center text-sm-left">
                <h1 class="display-1 mb-0">500</h1>
                <p class="lead">{{__('messages.500_warning_message')}}</p>
                <a class="btn btn-primary" href="{{url()->current()}}">{{__('messages.reload_page')}}</a>
            </div>
        </div>
        <!-- End Row -->
    </div>
</div>
<!-- End Content -->

<!-- Footer -->
<div class="footer text-center">
    <ul class="list-inline list-separator">
        <li class="list-inline-item">
            <a class="list-separator-link" target="_blank" href="https://6amtech.com/">{{\App\Models\BusinessSetting::where(['key'=>'business_name'])->first()->value??'Stack Food'}} {{__('messages.support')}}</a>
        </li>
    </ul>
</div>
<!-- End Footer -->


<!-- JS Front -->
<script src="{{asset('public/assets/admin')}}/js/theme.min.js"></script>
</body>

</html>
