@extends('layouts.admin.app')

@section('title','Settings')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">{{__('messages.smtp')}} {{__('messages.mail')}} {{__('messages.setup')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row pb-2">
            <div class="col-md-6 col-sm-8 card">
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-10">
                            <button class="btn btn-secondary" type="button" data-toggle="collapse"
                                    data-target="#collapseExample" aria-expanded="false"
                                    aria-controls="collapseExample">
                                <i class="tio-email-outlined"></i>
                                {{translate('test_your_email_integration')}}
                            </button>
                        </div>
                        <div class="col-2 float-right">
                            <i class="tio-telegram float-right"></i>
                        </div>
                    </div>
                    <div class="collapse" id="collapseExample">
                        <div class="card card-body">
                            <form class="" action="javascript:">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="form-group mb-2">
                                            <label for="inputPassword2"
                                                    class="sr-only">{{translate('mail')}}</label>
                                            <input type="email" id="test-email" class="form-control"
                                                    placeholder="Ex : jhon@email.com">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <button type="button" onclick="send_mail()" class="btn btn-primary mb-2 btn-block">
                                            <i class="tio-telegram"></i>
                                            {{translate('send_mail')}}
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>               
            </div>
        </div>

        <div class="row gx-2 gx-lg-3">
        @php($config=\App\Models\BusinessSetting::where(['key'=>'mail_config'])->first())
            @php($data=$config?json_decode($config['value'],true):null)
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2 card">
                <form class="card-body" action="{{env('APP_MODE')!='demo'?route('admin.business-settings.mail-config'):'javascript:'}}" method="post"
                      enctype="multipart/form-data">
                    @csrf
                        <div class="form-group mb-2 text-center">
                            <label class="control-label h3">{{translate('smtp_mail_config')}}</label>
                        </div>
                        <div class="form-group mb-2">
                            <label style="padding-left: 10px">{{translate('status')}}</label>
                        </div>
                        <div class="form-group mb-2 mt-2">
                            <input type="radio" name="status"
                                    value="1" {{isset($data['status'])&&$data['status']==1?'checked':''}}>
                            <label style="padding-left: 10px">{{translate('Active')}}</label>
                            <br>
                        </div>
                        <div class="form-group mb-2">
                            <input type="radio" name="status"
                                    value="0" {{isset($data['status'])&&$data['status']==0?'checked':''}}>
                            <label style="padding-left: 10px">{{translate('Inactive')}}</label>
                            <br>
                        </div>
                        <div class="form-group mb-2">
                            <label style="padding-left: 10px">{{__('messages.mailer')}} {{__('messages.name')}}</label><br>
                            <input type="text" placeholder="ex : Alex" class="form-control" name="name"
                                   value="{{env('APP_MODE')!='demo'?$data['name']??'':''}}" required>
                        </div>

                        <div class="form-group mb-2">
                            <label style="padding-left: 10px">{{__('messages.host')}}</label><br>
                            <input type="text" class="form-control" name="host" value="{{env('APP_MODE')!='demo'?$data['host']??'':''}}" required>
                        </div>
                        <div class="form-group mb-2">
                            <label style="padding-left: 10px">{{__('messages.driver')}}</label><br>
                            <input type="text" class="form-control" name="driver" value="{{env('APP_MODE')!='demo'?$data['driver']??'':''}}" required>
                        </div>
                        <div class="form-group mb-2">
                            <label style="padding-left: 10px">{{__('messages.port')}}</label><br>
                            <input type="text" class="form-control" name="port" value="{{env('APP_MODE')!='demo'?$data['port']??'':''}}" required>
                        </div>

                        <div class="form-group mb-2">
                            <label style="padding-left: 10px">{{__('messages.username')}}</label><br>
                            <input type="text" placeholder="ex : ex@yahoo.com" class="form-control" name="username"
                                   value="{{env('APP_MODE')!='demo'?$data['username']??'':''}}" required>
                        </div>

                        <div class="form-group mb-2">
                            <label style="padding-left: 10px">{{__('messages.email')}} {{__('messages.id')}}</label><br>
                            <input type="text" placeholder="ex : ex@yahoo.com" class="form-control" name="email"
                                   value="{{env('APP_MODE')!='demo'?$data['email_id']??'':''}}" required>
                        </div>

                        <div class="form-group mb-2">
                            <label style="padding-left: 10px">{{__('messages.encryption')}}</label><br>
                            <input type="text" placeholder="ex : tls" class="form-control" name="encryption"
                                   value="{{env('APP_MODE')!='demo'?$data['encryption']??'':''}}" required>
                        </div>

                        <div class="form-group mb-2">
                            <label style="padding-left: 10px">{{__('messages.password')}}</label><br>
                            <input type="text" class="form-control" name="password" value="{{env('APP_MODE')!='demo'?$data['password']??'':''}}" required>
                        </div>

                        <button type="{{env('APP_MODE')!='demo'?'submit':'button'}}" onclick="{{env('APP_MODE')!='demo'?'':'call_demo()'}}" class="btn btn-primary mb-2">{{__('messages.save')}}</button>
                    
                </form>
            </div>
        </div>
    </div>
@endsection

@push('script_2')
<script>
    function ValidateEmail(inputText) {
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (inputText.match(mailformat)) {
            return true;
        } else {
            return false;
        }
    }
    function send_mail() {
        if (ValidateEmail($('#test-email').val())) {
            Swal.fire({
                title: '{{translate('Are you sure?')}}?',
                text: "{{translate('a_test_mail_will_be_sent_to_your_email')}}!",
                showCancelButton: true,
                confirmButtonColor: '#377dff',
                cancelButtonColor: 'secondary',
                confirmButtonText: '{{translate('Yes')}}!'
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('admin.business-settings.mail.send')}}",
                        method: 'GET',
                        data: {
                            "email": $('#test-email').val()
                        },
                        beforeSend: function () {
                            $('#loading').show();
                        },
                        success: function (data) {
                            if (data.success === 2) {
                                toastr.error('{{translate('email_configuration_error')}} !!');
                            } else if (data.success === 1) {
                                toastr.success('{{translate('email_configured_perfectly!')}}!');
                            } else {
                                toastr.info('{{translate('email_status_is_not_active')}}!');
                            }
                        },
                        complete: function () {
                            $('#loading').hide();

                        }
                    });
                }
            })
        } else {
            toastr.error('{{translate('invalid_email_address')}} !!');
        }
    }

</script>
@endpush
