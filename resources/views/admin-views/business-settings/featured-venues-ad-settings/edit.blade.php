@extends('layouts.admin.app')

@section('title','Update Featured Venue Advertisement')

@push('css_or_js')
<style>
    .select2 .select2-container .select2-container--default .select2-container--above .select2-container--focus{
        width:100% !important;
    }
</style>
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page">{{__('messages.mobile_ads')}}</li>
                    <li class="breadcrumb-item"><a href="{{route('admin.business-settings.featured-venues.add-new')}}">{{__('messages.featured_venues_ad_settings')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page">{{__('messages.update')}}</li>
                </ol>
            </nav>
        </div>
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-edit"></i>Update Featured Venue Infomation</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <div class="card">
                    <div class="card-body">
                        <form action="{{route('admin.business-settings.featured-venues.update', [$featuredVenue['id']])}}" method="post">
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.title')}}</label>
                                        <input type="text" name="title" class="form-control" value="{{$featuredVenue->title}}" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.venue_name')}}</label>
                                        <input type="text" name="venue_name" class="form-control" value="{{$featuredVenue->venue_name}}" required>
                                    </div>
                                    <div class="form-group ">
                                        <label class="input-label" for="exampleFormControlInput1">{{ __('messages.short') }}
                                            {{ __('messages.description') }}</label>
                                        <textarea type="text" name="description" class="form-control ckeditor" placeholder="{{$featuredVenue->description}}" required>{{$featuredVenue->description}}</textarea>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">{{__('messages.submit')}}</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End Table -->
        </div>
    </div>

@endsection

@push('script_2')
<script>
</script>
@endpush
