@extends('layouts.admin.app')

@section('title', __('messages.social_login'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">{{__('messages.social_login')}}</li>
            </ol>
        </nav>
        <div class="row" style="padding-bottom: 20px">
            @if (isset($socialLoginServices))
            @foreach ($socialLoginServices as $socialLoginService)
                    <div class="col-md-6 mt-4">
                        <div class="card">
                            <div class="card-body text-{{Session::get('direction') === "rtl" ? 'right' : 'left'}}" style="padding: 20px">
                                <div class="flex-between">
                                    <h4 class="text-center">{{__('messages.'.$socialLoginService['login_medium'])}}</h4>
                                    <div class="btn btn-dark p-2" data-toggle="modal" data-target="#{{$socialLoginService['login_medium']}}-modal" style="cursor: pointer">
                                        <i class="tio-info-outined"></i> {{__('messages.credentials_setup')}}
                                    </div>
                                </div>
                                <form
                                    action="{{route('admin.social-login.update',[$socialLoginService['login_medium']])}}"
                                    method="post">
                                    @csrf
                                    <div class="form-group mb-2 mt-5">
                                        <input type="radio" name="status"
                                               value="1" {{$socialLoginService['status']==1?'checked':''}}>
                                        <label style="padding-{{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 10px">{{__('messages.active')}}</label>
                                        <br>
                                    </div>
                                    <div class="form-group mb-2">
                                        <input type="radio" name="status"
                                               value="0" {{$socialLoginService['status']==0?'checked':''}}>
                                        <label style="padding-{{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 10px">{{__('messages.inactive')}}</label>
                                        <br>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label style="padding-{{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 10px">{{__('messages.callback_uri')}}</label>
                                        <span class="btn btn-secondary btn-sm m-2" onclick="copyToClipboard('#id_{{$socialLoginService['login_medium']}}')"><i class="tio-copy"></i> {{__('messages.copy_uri')}}</span>
                                        <br>
                                        <span class="form-control" id="id_{{$socialLoginService['login_medium']}}" style="height: unset">{{ url('/') }}/customer/auth/login/{{$socialLoginService['login_medium']}}/callback</span>
                                    </div>
                                    <div class="form-group mb-2">
                                        <label
                                            style="padding-{{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 10px">{{__('messages.store_client_id')}}</label><br>
                                        <input type="text" class="form-control" name="client_id"
                                               value="{{ $socialLoginService['client_id'] }}">
                                    </div>
                                    <div class="form-group mb-2">
                                        <label
                                            style="padding-{{Session::get('direction') === "rtl" ? 'right' : 'left'}}: 10px">{{__('messages.store_client_secret')}}</label><br>
                                        <input type="text" class="form-control" name="client_secret"
                                               value="{{ $socialLoginService['client_secret'] }}">
                                    </div>
                                    <button type="{{env('APP_MODE')!='demo'?'submit':'button'}}"
                                            class="btn btn-primary mb-2">{{__('messages.save')}}</button>
                                </form>
                            </div>
                        </div>
                    </div>
            @endforeach
            @endif
        </div>
        {{-- Modal Starts--}}
        <!-- Google -->
        <div class="modal fade" id="google-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">{{__('messages.google_api_setup_instructions')}}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <ol>
                            <li>{{__('messages.go_to_the_credentials_page')}} ({{__('messages.click')}} <a href="https://console.cloud.google.com/apis/credentials" target="_blank">{{__('here')}}</a>)</li>
                            <li>{{__('messages.click')}} <b>{{__('messages.create_credentials')}}</b> > <b>{{__('messages.auth_client_id')}}</b>.</li>
                            <li>{{__('messages.select_the')}} <b>{{__('messages.web_application')}}</b> {{__('messages.type')}}.</li>
                            <li>{{__('messages.name_your_auth_client')}}</li>
                            <li>{{__('messages.click')}} <b>{{__('messages.add_uri')}}</b> {{__('messages.from')}} <b>{{__('messages.authorized_redirect_uris')}}</b> , {{__('messages.provide_the')}} <code>{{__('messages.callback_uri')}}</code> {{__('messages.from_below_and_click')}} <b>{{__('messages.created')}}</b></li>
                            <li>{{__('messages.copy')}} <b>{{__('messages.client_id')}}</b> {{__('messages.and')}} <b>{{__('messages.client_secret')}}</b>, {{__('messages.past_in_the_input_field_below_and')}} <b>Save</b>.</li>
                        </ol>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">{{__('messages.close')}}</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Facebook -->
        <div class="modal fade" id="facebook-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">{{__('messages.facebook_api_set_instruction')}}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body"><b></b>
                        <ol>
                            <li>{{__('messages.goto_the_facebook_developer_page')}} (<a href="https://developers.facebook.com/apps/" target="_blank">{{__('messages.click_here')}}</a>)</li>
                            <li>{{__('messages.goto')}} <b>{{__('messages.get_started')}}</b> {{__('messages.from_navbar')}}</li>
                            <li>{{__('messages.from_register_tab_press')}} <b>{{__('messages.continue')}}</b> <small>({{__('messages.if_needed')}})</small></li>
                            <li>{{__('messages.provide_primary_email_and_press')}} <b>{{__('messages.confirm_email')}}</b> <small>({{__('messages.if_needed')}})</small></li>
                            <li>{{__('messages.in_about_section_select')}} <b>{{__('messages.other')}}</b> {{__('messages.and_press')}} <b>{{__('messages.complete_registration')}}</b></li>

                            <li><b>{{__('messages.create_app')}}</b> > {{__('messages.select_an_app_type_and_press')}} <b>{{__('messages.next')}}</b></li>
                            <li>{{__('messages.complete_the_details_form_and_press')}} <b>{{__('messages.create_app')}}</b></li><br/>

                            <li>{{__('messages.form')}} <b>{{__('messages.facebook_login')}}</b> {{__('messages.press')}} <b>{{__('messages.set_up')}}</b></li>
                            <li>{{__('messages.select')}} <b>{{__('messages.web')}}</b></li>
                            <li>{{__('messages.provide')}} <b>{{__('messages.site_url')}}</b> <small>({{__('messages.base_url_of_the_site')}}: https://example.com)</small> > <b>{{__('messages.save')}}</b></li><br/>
                            <li>{{__('messages.now_go_to')}} <b>{{__('messages.setting')}}</b> {{__('messages.form')}} <b>{{__('messages.facebook_login')}}</b> ({{__('messages.left_sidebar')}})</li>
                            <li>{{__('messages.make_sure_to_check')}} <b>{{__('messages.client_auth_login')}}</b> <small>({{__('messages.must_on')}})</small></li>
                            <li>{{__('messages.provide')}} <code>{{__('messages.valid_auth_redirect_uris')}}</code> {{__('messages.from_below_and_click')}} <b>{{__('messages.save_changes')}}</b></li>

                            <li>{{__('messages.now_go_to')}} <b>{{__('messages.setting')}}</b> ({{__('messages.from_left_sidebar')}}) > <b>{{__('messages.basic')}}</b></li>
                            <li>{{__('messages.fill_the_form_and_press')}} <b>{{__('messages.save_changes')}}</b></li>
                            <li>{{__('messages.now_copy')}} <b>{{__('messages.client_id')}}</b> & <b>{{__('messages.client_secret')}}</b>, {{__('messages.past_in_the_input_field_below_and')}} <b>{{__('messages.save')}}</b>.</li>
                        </ol>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">{{__('messages.close')}}</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Twitter -->
        <div class="modal fade" id="twitter-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">{{__('messages.twitter_api_set_up_instructions')}}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body"><b></b>
                        {{__('messages.instruction_will_be_available_very_soon')}}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">{{__('messages.close')}}</button>
                    </div>
                </div>
            </div>
        </div>
        {{-- Modal Ends--}}
    </div>
@endsection

@push('script_2')
    <script>
        function copyToClipboard(element) {
            var $temp = $("<input>");
            $("body").append($temp);
            $temp.val($(element).text()).select();
            document.execCommand("copy");
            $temp.remove();

            toastr.success("{{__('Copied to the clipboard')}}");
        }
    </script>

@endpush
