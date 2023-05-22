@extends('layouts.admin.app')

@section('title','FCM Settings')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">{{__('messages.firebase')}} {{__('messages.push')}} {{__('messages.notification')}} {{__('messages.setup')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="card">
                    <div class="card-body">
                        <form action="{{env('APP_MODE')!='demo'?route('admin.business-settings.update-fcm'):'javascript:'}}" method="post"
                              enctype="multipart/form-data">
                            @csrf
                            @php($key=\App\Models\BusinessSetting::where('key','push_notification_key')->first())
                            <div class="form-group">
                                <label class="input-label"
                                       for="exampleFormControlInput1">{{__('messages.server')}} {{__('messages.key')}}</label>
                                <textarea name="push_notification_key" class="form-control"
                                          required>{{env('APP_MODE')!='demo'?$key->value??'':''}}</textarea>
                            </div>
                            @php($project_id=\App\Models\BusinessSetting::where('key','fcm_project_id')->first())
                            <div class="row" style="{{$project_id?($project_id->value?'display: none;':''):''}}">
                                
                                <div class="col-md-12 col-12">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">FCM Project ID</label>
                                        <input type="text" value="{{$project_id->value??''}}"
                                               name="fcm_project_id" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <button type="{{env('APP_MODE')!='demo'?'submit':'button'}}" onclick="{{env('APP_MODE')!='demo'?'':'call_demo()'}}" class="btn btn-primary">{{__('messages.submit')}}</button>
                        </form>
                    </div>
                </div>
            </div>

            <hr>
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">

                <div class="card">
                    <div class="card-header">
                        <h2>{{__('messages.push')}} {{__('messages.messages')}}</h2>
                    </div>
                    <div class="card-body">
                        <form action="{{route('admin.business-settings.update-fcm-messages')}}" method="post"
                              enctype="multipart/form-data">
                            @csrf

                            <div class="row">
                                @php($opm=\App\Models\BusinessSetting::where('key','order_pending_message')->first())
                                @php($data=$opm?json_decode($opm->value,true):null)
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label class="toggle-switch d-flex align-items-center mb-3"
                                               for="pending_status">
                                            <input type="checkbox" name="pending_status" class="toggle-switch-input"
                                                   value="1" id="pending_status" {{$data?($data['status']==1?'checked':''):''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                              </span>
                                            <span class="toggle-switch-content">
                                            <span
                                                class="d-block">{{__('messages.order')}} {{__('messages.pending')}} {{__('messages.message')}}</span>
                                          </span>
                                        </label>
                                        <textarea name="pending_message"
                                                  class="form-control">{{$data['message']??''}}</textarea>
                                    </div>
                                </div>

                                @php($ocm=\App\Models\BusinessSetting::where('key','order_confirmation_msg')->first())
                                @php($data=$ocm?json_decode($ocm->value,true):'')
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label class="toggle-switch d-flex align-items-center mb-3"
                                               for="confirm_status">
                                            <input type="checkbox" name="confirm_status" class="toggle-switch-input"
                                                   value="1" id="confirm_status" {{$data?($data['status']==1?'checked':''):''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                              </span>
                                            <span class="toggle-switch-content">
                                                <span
                                                    class="d-block"> {{__('messages.order')}} {{__('messages.confirmation')}} {{__('messages.message')}}</span>
                                              </span>
                                        </label>

                                        <textarea name="confirm_message"
                                                  class="form-control">{{$data['message']??''}}</textarea>
                                    </div>
                                </div>

                                @php($oprm=\App\Models\BusinessSetting::where('key','order_processing_message')->first())
                                @php($data=$oprm?json_decode($oprm->value,true):null)
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label class="toggle-switch d-flex align-items-center mb-3"
                                               for="processing_status">
                                            <input type="checkbox" name="processing_status"
                                                   class="toggle-switch-input"
                                                   value="1" id="processing_status" {{$data?($data['status']==1?'checked':''):''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                              </span>
                                            <span class="toggle-switch-content">
                                                <span
                                                    class="d-block">{{__('messages.order')}} {{__('messages.processing')}} {{__('messages.message')}}</span>
                                              </span>
                                        </label>

                                        <textarea name="processing_message"
                                                  class="form-control">{{$data['message']??''}}</textarea>
                                    </div>
                                </div>

                                @php($dbs=\App\Models\BusinessSetting::where('key','order_handover_message')->first())
                                @php($data=$dbs?json_decode($dbs->value,true):'')
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label class="toggle-switch d-flex align-items-center mb-3"
                                               for="order_handover_message_status">
                                            <input type="checkbox" name="order_handover_message_status"
                                                   class="toggle-switch-input"
                                                   value="1"
                                                   id="order_handover_message_status" {{$data?($data['status']==1?'checked':''):''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                              </span>
                                            <span class="toggle-switch-content">
                                                <span
                                                    class="d-block"> {{__('messages.restaurant')}} {{__('messages.handover')}} {{__('messages.message')}}</span>
                                              </span>
                                        </label>

                                        <textarea name="order_handover_message"
                                                  class="form-control">{{$data['message']??''}}</textarea>
                                    </div>
                                </div>

                                @php($ofdm=\App\Models\BusinessSetting::where('key','out_for_delivery_message')->first())
                                @php($data=$ofdm?json_decode($ofdm->value,true):'')
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label class="toggle-switch d-flex align-items-center mb-3"
                                               for="out_for_delivery">
                                            <input type="checkbox" name="out_for_delivery_status"
                                                   class="toggle-switch-input"
                                                   value="1" id="out_for_delivery" {{$data?($data['status']==1?'checked':''):''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                              </span>
                                            <span class="toggle-switch-content">
                                                <span
                                                    class="d-block">{{__('messages.order')}} {{__('messages.out_for_delivery')}} {{__('messages.message')}}</span>
                                              </span>
                                        </label>
                                        <textarea name="out_for_delivery_message"
                                                  class="form-control">{{$data['message']??''}}</textarea>
                                    </div>
                                </div>

                                @php($odm=\App\Models\BusinessSetting::where('key','order_delivered_message')->first())
                                @php($data=$odm?json_decode($odm->value,true):'')
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label class="toggle-switch d-flex align-items-center mb-3"
                                               for="delivered_status">
                                            <input type="checkbox" name="delivered_status"
                                                   class="toggle-switch-input"
                                                   value="1" id="delivered_status" {{$data?($data['status']==1?'checked':''):''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                              </span>
                                            <span class="toggle-switch-content">
                                                <span
                                                    class="d-block">{{__('messages.order')}} {{__('messages.delivered')}} {{__('messages.message')}}</span>
                                              </span>
                                        </label>

                                        <textarea name="delivered_message"
                                                  class="form-control">{{$data['message']??''}}</textarea>
                                    </div>
                                </div>

                                @php($dba=\App\Models\BusinessSetting::where('key','delivery_boy_assign_message')->first())
                                @php($data=$dba?json_decode($dba->value,true):'')
                                <div class="col-md-6 col-12">
                                    <div class="form-group">

                                        <label class="toggle-switch d-flex align-items-center mb-3"
                                               for="delivery_boy_assign">
                                            <input type="checkbox" name="delivery_boy_assign_status"
                                                   class="toggle-switch-input"
                                                   value="1"
                                                   id="delivery_boy_assign" {{$data?($data['status']==1?'checked':''):''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                              </span>
                                            <span class="toggle-switch-content">
                                                <span
                                                    class="d-block">{{__('messages.deliveryman')}} {{__('messages.assign')}} {{__('messages.message')}}</span>
                                              </span>
                                        </label>

                                        <textarea name="delivery_boy_assign_message"
                                                  class="form-control">{{$data['message']??''}}</textarea>
                                    </div>
                                </div>

                                {{--@php($dbs=\App\Models\BusinessSetting::where('key','delivery_boy_start_message')->first())
                                @php($data=$dbs?json_decode($dbs->value,true):'')
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label class="toggle-switch d-flex align-items-center mb-3"
                                               for="delivery_boy_start_status">
                                            <input type="checkbox" name="delivery_boy_start_status"
                                                   class="toggle-switch-input"
                                                   value="1"
                                                   id="delivery_boy_start_status" {{$data?($data['status']==1?'checked':''):''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                              </span>
                                            <span class="toggle-switch-content">
                                                <span
                                                    class="d-block"> {{__('messages.deliveryman')}} {{__('messages.start')}} {{__('messages.message')}}</span>
                                              </span>
                                        </label>

                                        <textarea name="delivery_boy_start_message"
                                                  class="form-control">{{$data['message']??''}}</textarea>
                                    </div>
                                </div>--}}
                                
                                @php($dbc=\App\Models\BusinessSetting::where('key','delivery_boy_delivered_message')->first())
                                @php($data=$dbc?json_decode($dbc->value,true):'')
                                <div class="col-md-6 col-12">
                                    <div class="form-group">

                                        <label class="toggle-switch d-flex align-items-center mb-3"
                                               for="delivery_boy_delivered">
                                            <input type="checkbox" name="delivery_boy_delivered_status"
                                                   class="toggle-switch-input"
                                                   value="1"
                                                   id="delivery_boy_delivered" {{$data?($data['status']==1?'checked':''):''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                              </span>
                                            <span class="toggle-switch-content">
                                                <span
                                                    class="d-block">{{__('messages.deliveryman')}} {{__('messages.delivered')}} {{__('messages.message')}}</span>
                                              </span>
                                        </label>

                                        <textarea name="delivery_boy_delivered_message"
                                                  class="form-control">{{$data['message']??''}}</textarea>
                                    </div>
                                </div>

                                @php($dbc=\App\Models\BusinessSetting::where('key','order_cancled_message')->first())
                                @php($data=$dbc?json_decode($dbc->value,true):'')
                                <div class="col-md-6 col-12">
                                    <div class="form-group">

                                        <label class="toggle-switch d-flex align-items-center mb-3"
                                               for="order_cancled_message">
                                            <input type="checkbox" name="order_cancled_message_status"
                                                   class="toggle-switch-input"
                                                   value="1"
                                                   id="order_cancled_message" {{$data?($data['status']==1?'checked':''):''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                              </span>
                                            <span class="toggle-switch-content">
                                                <span
                                                    class="d-block">{{__('messages.order')}} {{__('messages.canceled')}} {{__('messages.message')}}</span>
                                              </span>
                                        </label>

                                        <textarea name="order_cancled_message"
                                                  class="form-control">{{$data['message']??''}}</textarea>
                                    </div>
                                </div>

                                @php($orm=\App\Models\BusinessSetting::where('key','order_refunded_message')->first())
                                @php($data=$orm?json_decode($orm->value,true):'')
                                <div class="col-md-6 col-12">
                                    <div class="form-group">

                                        <label class="toggle-switch d-flex align-items-center mb-3"
                                               for="order_refunded_message">
                                            <input type="checkbox" name="order_refunded_message_status"
                                                   class="toggle-switch-input"
                                                   value="1"
                                                   id="order_refunded_message" {{$data?($data['status']==1?'checked':''):''}}>
                                            <span class="toggle-switch-label">
                                                <span class="toggle-switch-indicator"></span>
                                              </span>
                                            <span class="toggle-switch-content">
                                                <span
                                                    class="d-block">{{__('messages.order')}} {{__('messages.refunded')}} {{__('messages.message')}}</span>
                                              </span>
                                        </label>

                                        <textarea name="order_refunded_message"
                                                  class="form-control">{{$data['message']??''}}</textarea>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <button type="submit" class="btn btn-primary">{{__('messages.submit')}}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script_2')

@endpush
