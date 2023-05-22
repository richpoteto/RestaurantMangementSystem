@extends('layouts.admin.app')

@section('title',__('messages.app_settings'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title text-capitalize">{{__('messages.app_settings')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->

        @php($new_venue_days=\App\Models\BusinessSetting::where(['key'=>'new_venue_days'])->first())
        @php($new_venue_days=$new_venue_days?$new_venue_days->value:null)

        @php($trending_threshold_value=\App\Models\BusinessSetting::where(['key'=>'trending_threshold_value'])->first())
        @php($trending_threshold_value=$trending_threshold_value?$trending_threshold_value->value:null)

        @php($nearby_distance_max=\App\Models\BusinessSetting::where(['key'=>'nearby_distance_max'])->first())
        @php($nearby_distance_max=$nearby_distance_max?$nearby_distance_max->value:null)

        @php($average_system_order=\App\Models\BusinessSetting::where(['key'=>'average_system_order'])->first())
        @php($average_system_order=$average_system_order?$average_system_order->value:null)

        @php($app_minimum_version_android=\App\Models\BusinessSetting::where(['key'=>'app_minimum_version_android'])->first())
        @php($app_minimum_version_android=$app_minimum_version_android?$app_minimum_version_android->value:null)

        @php($app_url_android=\App\Models\BusinessSetting::where(['key'=>'app_url_android'])->first())
        @php($app_url_android=$app_url_android?$app_url_android->value:null)

        @php($app_minimum_version_ios=\App\Models\BusinessSetting::where(['key'=>'app_minimum_version_ios'])->first())
        @php($app_minimum_version_ios=$app_minimum_version_ios?$app_minimum_version_ios->value:null)

        @php($app_url_ios=\App\Models\BusinessSetting::where(['key'=>'app_url_ios'])->first())
        @php($app_url_ios=$app_url_ios?$app_url_ios->value:null)

        @php($popular_food=\App\Models\BusinessSetting::where(['key'=>'popular_food'])->first())
        @php($popular_food=$popular_food?$popular_food->value:null)

        @php($popular_restaurant=\App\Models\BusinessSetting::where(['key'=>'popular_restaurant'])->first())
        @php($popular_restaurant=$popular_restaurant?$popular_restaurant->value:null)

        @php($new_restaurant=\App\Models\BusinessSetting::where(['key'=>'new_restaurant'])->first())
        @php($new_restaurant=$new_restaurant?$new_restaurant->value:null)

        @php($most_reviewed_foods=\App\Models\BusinessSetting::where(['key'=>'most_reviewed_foods'])->first())
        @php($most_reviewed_foods=$most_reviewed_foods?$most_reviewed_foods->value:null)
    
        <div class="row">
            <div class="col-md-6 col-sm-6 col-12">
                <div class="form-group">
                    <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="popular_food">
                        <span class="pr-2">{{__('messages.popular_foods')}}:</span> 
                        <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.business-settings.toggle-settings',['popular_food',$popular_food?0:1, 'popular_food'])}}'" id="popular_food" {{$popular_food?'checked':''}}>
                        <span class="toggle-switch-label">
                            <span class="toggle-switch-indicator"></span>
                        </span>
                    </label>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-12">
                <div class="form-group">
                    <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="popular_restaurant">
                        <span class="pr-2">{{__('messages.popular_restaurants')}}:</span> 
                        <input type="checkbox" name="popular_restaurant" class="toggle-switch-input" onclick="location.href='{{route('admin.business-settings.toggle-settings',['popular_restaurant',$popular_restaurant?0:1, 'popular_restaurant'])}}'" id="popular_restaurant" {{$popular_restaurant?'checked':''}}>
                        <span class="toggle-switch-label">
                            <span class="toggle-switch-indicator"></span>
                        </span>
                    </label>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-12">
                <div class="form-group">
                    <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="new_restaurant">
                        <span class="pr-2 text-capitalize">{{__('messages.new_restaurants')}}:</span> 
                        <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.business-settings.toggle-settings',['new_restaurant',$new_restaurant?0:1, 'new_restaurant'])}}'" id="new_restaurant" {{$new_restaurant?'checked':''}}>
                        <span class="toggle-switch-label">
                            <span class="toggle-switch-indicator"></span>
                        </span>
                    </label>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 col-12">
                <div class="form-group">
                    <label class="toggle-switch toggle-switch-sm d-flex justify-content-between border border-secondary rounded px-4 form-control" for="most_reviewed_foods">
                        <span class="pr-2 text-capitalize">{{__('messages.most_reviewed_foods')}}:</span> 
                        <input type="checkbox" class="toggle-switch-input" onclick="location.href='{{route('admin.business-settings.toggle-settings',['most_reviewed_foods',$most_reviewed_foods?0:1, 'most_reviewed_foods'])}}'" id="most_reviewed_foods" {{$most_reviewed_foods?'checked':''}}>
                        <span class="toggle-switch-label">
                            <span class="toggle-switch-indicator"></span>
                        </span>
                    </label>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row gx-2 gx-lg-3">
                    <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                        <form action="{{route('admin.business-settings.app-settings')}}" method="post"
                            enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label  class="input-label d-inline text-capitalize">{{__('messages.new_venue_days')}} </label>
                                        <input type="number" placeholder="{{__('messages.new_venue_days_max')}}" class="form-control" name="new_venue_days"
                                            value="{{env('APP_MODE')!='demo'?$new_venue_days??'':''}}">
                                    </div>
                                    <div class="form-group">
                                        <label class="input-label d-inline text-capitalize">{{__('messages.trending_threshold_value')}} </label>
                                        <input type="text" placeholder="{{__('messages.trending_threshold_value_min')}}" class="form-control" name="trending_threshold_value"
                                            value="{{env('APP_MODE')!='demo'?$trending_threshold_value??'':''}}">
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label  class="input-label d-inline text-capitalize">{{__('messages.nearby_distance')}}</label>
                                        <input type="number" placeholder="{{__('messages.nearby_distance_max')}}" class="form-control" name="nearby_distance_max"
                                            value="{{env('APP_MODE')!='demo'?$nearby_distance_max??'':''}}">
                                    </div>
                                    <div class="form-group">
                                        <label class="input-label d-inline text-capitalize">{{__('messages.average_system_order')}} </label>
                                        <input type="text" placeholder="{{__('messages.average_system_order_price')}}" class="form-control" name="average_system_order"
                                            value="{{env('APP_MODE')!='demo'?$average_system_order??'':''}}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label  class="input-label d-inline text-capitalize">{{__('messages.app_minimum_version')}} ({{__('messages.android')}})</label>
                                        <input type="number" placeholder="{{__('messages.app_minimum_version')}}" class="form-control" name="app_minimum_version_android"
                                            value="{{env('APP_MODE')!='demo'?$app_minimum_version_android??'':''}}">
                                    </div>
                                    <div class="form-group">
                                        <label class="input-label d-inline text-capitalize">{{__('messages.app_url')}} ({{__('messages.android')}})</label>
                                        <input type="text" placeholder="{{__('messages.app_url')}}" class="form-control" name="app_url_android"
                                            value="{{env('APP_MODE')!='demo'?$app_url_android??'':''}}">
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label  class="input-label d-inline text-capitalize">{{__('messages.app_minimum_version')}} ({{__('messages.ios')}})</label>
                                        <input type="number" placeholder="{{__('messages.app_minimum_version')}}" class="form-control" name="app_minimum_version_ios"
                                            value="{{env('APP_MODE')!='demo'?$app_minimum_version_ios??'':''}}">
                                    </div>
                                    <div class="form-group">
                                        <label class="input-label d-inline text-capitalize">{{__('messages.app_url')}} ({{__('messages.ios')}})</label>
                                        <input type="text" placeholder="{{__('messages.app_url')}}" class="form-control" name="app_url_ios"
                                            value="{{env('APP_MODE')!='demo'?$app_url_ios??'':''}}">
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <button type="{{env('APP_MODE')!='demo'?'submit':'button'}}" onclick="{{env('APP_MODE')!='demo'?'':'call_demo()'}}" class="btn btn-primary mb-2">{{trans('messages.submit')}}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>

@endsection

@push('script_2')

@endpush
