@extends('layouts.vendor.app')

@section('title',__('messages.adding_gallery'))

@push('css_or_js')
<!-- Custom styles for this page -->
<link href="{{asset('public/assets/admin/css/croppie.css')}}" rel="stylesheet">
<style>
    .flex-item {
        padding: 10px;
        flex: 20%;
    }

    /* Responsive layout - makes a one column-layout instead of a two-column layout */
    @media (max-width: 768px) {
        .flex-item {
            flex: 50%;
        }
    }

    @media (max-width: 480px) {
        .flex-item {
            flex: 100%;
        }
    }
</style>
@endpush

@section('content')
<div class="content container-fluid">
    <!-- Page Header -->
    <div class="page-header">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('vendor.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                <li class="breadcrumb-item" aria-current="page">{{__('messages.adding_gallery')}}</li>
            </ol>
        </nav>
    </div>
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col-sm mb-2 mb-sm-0">
                <h1 class="page-header-title"><i class="tio-filter-list"></i> {{__('messages.adding_gallery')}}</h1>
            </div>
        </div>
    </div>
    <!-- End Page Header -->
    <div class="card my-2">
        <div class="card-body">
            <!-- @php($landing_page_images = \App\Models\BusinessSetting::where(['key'=>'landing_page_images'])->first())
            @php($landing_page_images = isset($landing_page_images->value)?json_decode($landing_page_images->value, true):null) -->
            @php($vendor = auth('vendor')->user())
            @php($foodGallery = json_decode($vendor->food_gallery, true) ?? [])
            @php($diningGallery = json_decode($vendor->dining_gallery, true) ?? [])
            @php($chefGallery = json_decode($vendor->chef_gallery, true) ?? [])
            @php($productGallery = json_decode($vendor->product_gallery, true) ?? [])

            <form action="{{route('vendor.add-gallery.update')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label class="input-label">{{__('messages.food_gallery')}}<small style="color: red">* ( {{__('messages.size')}}: 772 X 899 px )</small></label>
                    <div class="custom-file">
                        <input type="file" name="food_gallery[]" id="customFileEg1" class="custom-file-input" accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" multiple>
                        <label class="custom-file-label" for="customFileEg1">{{__('messages.choose')}} {{__('messages.file')}}</label>
                    </div>

                    <center id="image-viewer-section" class="pt-2">
                        <!-- <img style="height: 200px;border: 1px solid; border-radius: 10px;" id="viewer"
                                src="{{asset('public/assets/landing')}}/image/{{isset($landing_page_images['top_content_image'])?$landing_page_images['top_content_image']:'double_screen_image.png'}}"
                                onerror="this.src='{{asset('public/assets/admin/img/400x400/img2.jpg')}}'"
                                alt=""/> -->

                        @foreach ($foodGallery as $key => $imageName)
                        <img style="height: 50px;border: 1px solid; border-radius: 10px;" src="{{asset('storage/chef/image/'.$imageName)}}" />
                        @endforeach
                    </center>
                </div>
                <div class="form-group text-center">
                    <input type="submit" class="btn btn-success" value="{{__('messages.upload')}}">
                </div>
            </form>
            <form action="{{route('vendor.add-gallery.update')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label class="input-label">{{__('messages.dining_gallery')}}<small style="color: red">* ( {{__('messages.size')}}: 1241 X 1755 px )</small></label>
                    <div class="custom-file">
                        <input type="file" name="dining_gallery[]" id="customFileEg2" class="custom-file-input" accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" multiple>
                        <label class="custom-file-label" for="customFileEg2">{{__('messages.choose')}} {{__('messages.file')}}</label>
                    </div>

                    <center id="image-viewer-section2" class="pt-2">
                        <!-- <img style="height: 200px;border: 1px solid; border-radius: 10px;" id="viewer2"
                                src="{{asset('public/assets/landing')}}/image/{{isset($landing_page_images['about_us_image'])?$landing_page_images['about_us_image']:'about_us_image.png'}}"
                                onerror="this.src='{{asset('public/assets/admin/img/400x400/img2.jpg')}}'"
                                alt=""/> -->
                        @foreach ($diningGallery as $key => $imageName)
                        <img style="height: 50px;border: 1px solid; border-radius: 10px;" src="{{asset('storage/chef/image/'.$imageName)}}" />
                        @endforeach
                    </center>
                </div>
                <div class="form-group text-center">
                    <input type="submit" class="btn btn-success" value="{{__('messages.upload')}}">
                </div>
            </form>
            <form action="{{route('vendor.add-gallery.update')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label class="input-label">{{__('messages.chef_gallery')}}<small style="color: red">* ( {{__('messages.size')}}: 1241 X 1755 px )</small></label>
                    <div class="custom-file">
                        <input type="file" name="chef_gallery[]" id="customFileEg3" class="custom-file-input" accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" multiple>
                        <label class="custom-file-label" for="customFileEg3">{{__('messages.choose')}} {{__('messages.file')}}</label>
                    </div>

                    <center id="image-viewer-section3" class="pt-2">
                        <!-- <img style="height: 200px;border: 1px solid; border-radius: 10px;" id="viewer3"
                                src="{{asset('public/assets/landing')}}/image/{{isset($landing_page_images['feature_section_image'])?$landing_page_images['feature_section_image']:'feature_section_image.png'}}"
                                onerror="this.src='{{asset('public/assets/admin/img/400x400/img2.jpg')}}'"
                                alt=""/> -->
                        @foreach ($chefGallery as $key => $imageName)
                        <img style="height: 50px;border: 1px solid; border-radius: 10px;" src="{{asset('storage/chef/image/'.$imageName)}}" />
                        @endforeach
                    </center>
                </div>
                <div class="form-group text-center">
                    <input type="submit" class="btn btn-success" value="{{__('messages.upload')}}">
                </div>
            </form>
            <form action="{{route('vendor.add-gallery.update')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label class="input-label">{{__('messages.product_gallery')}}<small style="color: red">* ( {{__('messages.size')}}: 1241 X 1755 px )</small></label>
                    <div class="custom-file">
                        <input type="file" name="product_gallery[]" id="customFileEg4" class="custom-file-input" accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" multiple>
                        <label class="custom-file-label" for="customFileEg4">{{__('messages.choose')}} {{__('messages.file')}}</label>
                    </div>

                    <center id="image-viewer-section4" class="pt-2">
                        <!-- <img style="height: 200px;border: 1px solid; border-radius: 10px;" id="viewer4"
                                src="{{asset('public/assets/landing')}}/image/{{isset($landing_page_images['mobile_app_section_image'])?$landing_page_images['mobile_app_section_image']:'our_app_image.png.png'}}"
                                onerror="this.src='{{asset('public/assets/admin/img/400x400/img2.jpg')}}'"
                                alt=""/> -->
                        @foreach ($productGallery as $key => $imageName)
                        <img style="height: 50px;border: 1px solid; border-radius: 10px;" src="{{asset('storage/chef/image/'.$imageName)}}" />
                        @endforeach
                    </center>
                </div>

                <div class="form-group text-center">
                    <input type="submit" class="btn btn-success" value="{{__('messages.upload')}}">
                </div>
            </form>
        </div>
    </div>
</div>

@endsection

@push('script_2')
<script>
    function readURL(input, viewer) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#' + viewer).attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#customFileEg1").change(function() {
        readURL(this, 'viewer');
        $('#image-viewer-section').show(1000);
    });


    $("#customFileEg2").change(function() {
        readURL(this, 'viewer2');
        $('#image-viewer-section2').show(1000);
    });

    $("#customFileEg3").change(function() {
        readURL(this, 'viewer3');
        $('#image-viewer-section3').show(1000);
    });

    $("#customFileEg4").change(function() {
        readURL(this, 'viewer4');
        $('#image-viewer-section4').show(1000);
    });
</script>
@endpush