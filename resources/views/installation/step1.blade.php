@extends('layouts.blank')
@section('content')
    <div class="container">
        <div class="card mt-6">
            <div class="card-body">
                <div class="card-header">
                    <div class="row" style="width: 100%">
                        <div class="col-12">
                            <div class="mar-ver pad-btm text-center">
                                <h1 class="h3">Installation Progress Started!</h1>
                                <p>We are checking file permissions.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pt-5">
                    <div class="col-3"></div>
                    <div class="col-md-6">
                        <ul class="list-group">
                            <li class="list-group-item text-semibold">
                                Php version 7.4 +

                                @php
                                    $phpVersion = number_format((float)phpversion(), 2, '.', '');
                                @endphp
                                @if ($phpVersion >= 7.4)
                                    <i class="tio-checkmark-circle-outlined text-success pull-right"></i>
                                @else
                                    <i class="tio-flag-cross-1 text-danger pull-right"></i>
                                @endif
                            </li>
                            <li class="list-group-item text-semibold">
                                Curl Enabled

                                @if ($permission['curl_enabled'])
                                    <i class="tio-checkmark-circle-outlined text-success pull-right"></i>
                                @else
                                    <i class="tio-flag-cross-1 text-danger pull-right"></i>
                                @endif
                            </li>
                            <li class="list-group-item text-semibold">
                                <b>.env</b> File Permission

                                @if ($permission['db_file_write_perm'])
                                    <i class="tio-checkmark-circle-outlined text-success pull-right"></i>
                                @else
                                    <i class="tio-flag-cross-1 text-danger pull-right"></i>
                                @endif
                            </li>
                            <li class="list-group-item text-semibold">
                                <b>RouteServiceProvider.php</b> File Permission

                                @if ($permission['routes_file_write_perm'])
                                    <i class="tio-checkmark-circle-outlined text-success pull-right"></i>
                                @else
                                    <i class="tio-flag-cross-1 text-danger pull-right"></i>
                                @endif
                            </li>
                        </ul>

                        <p class="text-center pt-3">
                            @if ($permission['curl_enabled'] == 1 && $permission['db_file_write_perm'] == 1 && $permission['routes_file_write_perm'] == 1 && $phpVersion >= 7.20)
                                <a href="{{ route('step2') }}" class="btn btn-info">Next <i
                                        class="fa fa-forward"></i></a>
                            @endif
                        </p>
                    </div>
                    <div class="col-3"></div>
                </div>
            </div>
        </div>
    </div>
@endsection
