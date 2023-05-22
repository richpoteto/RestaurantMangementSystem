@extends('layouts.admin.app')

@section('title','Payment Setup')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header-->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">Payment Gateway Setup</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row" style="padding-bottom: 20px">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body" style="padding: 20px">
                        <h5 class="text-center">Payment Method</h5>
                        @php($config=\App\CentralLogics\Helpers::get_business_settings('cash_on_delivery'))
                        <form action="{{route('admin.business-settings.payment-method-update',['cash_on_delivery'])}}"
                              method="post">
                            @csrf
                            @if(isset($config))
                                <div class="form-group mb-2">
                                    <label class="control-label">Cash on delivery</label>
                                </div>
                                <div class="form-group mb-2 mt-2">
                                    <input type="radio" name="status" value="1" {{$config['status']==1?'checked':''}}>
                                    <label style="padding-left: 10px">Active</label>
                                    <br>
                                </div>
                                <div class="form-group mb-2">
                                    <input type="radio" name="status" value="0" {{$config['status']==0?'checked':''}}>
                                    <label
                                        style="padding-left: 10px">Inactive</label>
                                    <br>
                                </div>
                                <button type="button" onclick="call_admin()" class="btn btn-primary mb-2">Save</button>
                            @else
                                <button type="submit" class="btn btn-primary mb-2">Configure</button>
                            @endif
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body" style="padding: 20px">
                        <h5 class="text-center">Payment Method</h5>
                        @php($config=\App\CentralLogics\Helpers::get_business_settings('digital_payment'))
                        <form action="{{route('admin.business-settings.payment-method-update',['digital_payment'])}}"
                              method="post">
                            @csrf
                            @if(isset($config))
                                <div class="form-group mb-2">
                                    <label class="control-label">Digital Payment</label>
                                </div>
                                <div class="form-group mb-2 mt-2">
                                    <input type="radio" name="status" value="1" {{$config['status']==1?'checked':''}}>
                                    <label style="padding-left: 10px">Active</label>
                                    <br>
                                </div>
                                <div class="form-group mb-2">
                                    <input type="radio" name="status" value="0" {{$config['status']==0?'checked':''}}>
                                    <label
                                        style="padding-left: 10px">Inactive</label>
                                    <br>
                                </div>
                                <button type="button" onclick="call_admin()" class="btn btn-primary mb-2">Save</button>
                            @else
                                <button type="submit" class="btn btn-primary mb-2">Configure</button>
                            @endif
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="padding-bottom: 20px">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body" style="padding: 20px">
                        <h5 class="text-center">SSLCOMMERZ</h5>
                        @php($config=\App\CentralLogics\Helpers::get_business_settings('ssl_commerz_payment'))
                        <form
                            action="{{route('admin.business-settings.payment-method-update',['ssl_commerz_payment'])}}"
                            method="post">
                            @csrf
                            @if(isset($config))
                                <div class="form-group mb-2">
                                    <label class="control-label">SSL commerz payment</label>
                                </div>
                                <div class="form-group mb-2 mt-2">
                                    <input type="radio" name="status" value="1" {{$config['status']==1?'checked':''}}>
                                    <label style="padding-left: 10px">Active</label>
                                    <br>
                                </div>
                                <div class="form-group mb-2">
                                    <input type="radio" name="status" value="0" {{$config['status']==0?'checked':''}}>
                                    <label
                                        style="padding-left: 10px">Inactive</label>
                                    <br>
                                </div>
                                <div class="form-group mb-2">
                                    <label style="padding-left: 10px">Store ID </label><br>
                                    <input type="text" class="form-control" name="store_id">
                                </div>
                                <div class="form-group mb-2">
                                    <label style="padding-left: 10px">Store Password</label><br>
                                    <input type="text" class="form-control" name="store_password">
                                </div>
                                <button type="button" onclick="call_admin()" class="btn btn-primary mb-2">Save</button>
                            @else
                                <button type="submit" class="btn btn-primary mb-2">Configure</button>
                            @endif
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body" style="padding: 20px">
                        <h5 class="text-center">Razor Pay</h5>
                        @php($config=\App\CentralLogics\Helpers::get_business_settings('razor_pay'))
                        <form action="{{route('admin.business-settings.payment-method-update',['razor_pay'])}}"
                              method="post">
                            @csrf
                            @if(isset($config))
                                <div class="form-group mb-2">
                                    <label class="control-label">Razor Pay</label>
                                </div>
                                <div class="form-group mb-2 mt-2">
                                    <input type="radio" name="status" value="1" {{$config['status']==1?'checked':''}}>
                                    <label style="padding-left: 10px">Active</label>
                                    <br>
                                </div>
                                <div class="form-group mb-2">
                                    <input type="radio" name="status" value="0" {{$config['status']==0?'checked':''}}>
                                    <label
                                        style="padding-left: 10px">Inactive</label>
                                    <br>
                                </div>
                                <div class="form-group mb-2">
                                    <label style="padding-left: 10px">Razor Key</label><br>
                                    <input type="text" class="form-control" name="razor_key">
                                </div>
                                <div class="form-group mb-2">
                                    <label style="padding-left: 10px">Razor Secret</label><br>
                                    <input type="text" class="form-control" name="razor_secret">
                                </div>
                                <button type="button" onclick="call_admin()" class="btn btn-primary mb-2">Save</button>
                            @else
                                <button type="submit" class="btn btn-primary mb-2">Configure</button>
                            @endif
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body" style="padding: 20px">
                        <h5 class="text-center">Paypal</h5>
                        @php($config=\App\CentralLogics\Helpers::get_business_settings('paypal'))
                        <form action="{{route('admin.business-settings.payment-method-update',['paypal'])}}"
                              method="post">
                            @csrf
                            @if(isset($config))
                                <div class="form-group mb-2">
                                    <label class="control-label">Paypal</label>
                                </div>
                                <div class="form-group mb-2 mt-2">
                                    <input type="radio" name="status" value="1" {{$config['status']==1?'checked':''}}>
                                    <label style="padding-left: 10px">Active</label>
                                    <br>
                                </div>
                                <div class="form-group mb-2">
                                    <input type="radio" name="status" value="0" {{$config['status']==0?'checked':''}}>
                                    <label style="padding-left: 10px">Inactive</label>
                                    <br>
                                </div>
                                <div class="form-group mb-2">
                                    <label style="padding-left: 10px">Paypal client id</label><br>
                                    <input type="text" class="form-control" name="paypal_client_id">
                                </div>
                                <div class="form-group mb-2">
                                    <label style="padding-left: 10px">Paypal secret </label><br>
                                    <input type="text" class="form-control" name="paypal_secret">
                                </div>
                                <button type="button" onclick="call_admin()" class="btn btn-primary mb-2">Save</button>
                            @else
                                <button type="submit" class="btn btn-primary mb-2">Configure</button>
                            @endif
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6 pt-4">
                <div class="card">
                    <div class="card-body" style="padding: 20px">
                        <h5 class="text-center">Stripe</h5>
                        @php($config=\App\CentralLogics\Helpers::get_business_settings('stripe'))
                        <form action="{{route('admin.business-settings.payment-method-update',['stripe'])}}"
                              method="post">
                            @csrf
                            @if(isset($config))
                                <div class="form-group mb-2">
                                    <label class="control-label">stripe</label>
                                </div>
                                <div class="form-group mb-2 mt-2">
                                    <input type="radio" name="status" value="1" {{$config['status']==1?'checked':''}}>
                                    <label style="padding-left: 10px">Active</label>
                                    <br>
                                </div>
                                <div class="form-group mb-2">
                                    <input type="radio" name="status" value="0" {{$config['status']==0?'checked':''}}>
                                    <label style="padding-left: 10px">Inactive </label>
                                    <br>
                                </div>
                                <div class="form-group mb-2">
                                    <label style="padding-left: 10px">Published Key</label><br>
                                    <input type="text" class="form-control" name="published_key">
                                </div>

                                <div class="form-group mb-2">
                                    <label style="padding-left: 10px">API key</label><br>
                                    <input type="text" class="form-control" name="api_key">
                                </div>
                                <button type="button" onclick="call_admin()" class="btn btn-primary mb-2">Save</button>
                            @else
                                <button type="submit" class="btn btn-primary mb-2">Configure</button>
                            @endif
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script_2')
    <script>
        function call_admin(){
            toastr.info('Update option is disabled for demo!', {
                CloseButton: true,
                ProgressBar: true
            });
        }
    </script>
@endpush
