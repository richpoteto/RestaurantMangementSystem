
@extends('layouts.vendor.app')
@section('title',__('messages.edit_restaurant'))
@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{asset('public/assets/admin')}}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
     <!-- Custom styles for this page -->
     <link href="{{asset('public/assets/admin/css/croppie.css')}}" rel="stylesheet">
     <meta name="csrf-token" content="{{ csrf_token() }}">
     <style>
        @media(max-width:375px){
         #shop-image-modal .modal-content{
           width: 367px !important;
         margin-left: 0 !important;
     }
    
     }

@media(max-width:500px){
 #shop-image-modal .modal-content{
           width: 400px !important;
         margin-left: 0 !important;
     }
   
   
}
 </style>
@endpush
@section('content')
    <!-- Content Row -->
    <div class="content container-fluid"> 
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h1 class="h3 mb-0 text-capitalize">{{__('messages.edit')}} {{__('messages.restaurant')}} {{__('messages.info')}}</h1>
                </div>
                <div class="card-body">
                    <form action="{{route('vendor.shop.update')}}" method="post"
                          enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name">{{__('messages.restaurant')}} {{__('messages.name')}} <span class="text-danger">*</span></label>
                                    <input type="text" name="name" value="{{$shop->name}}" class="form-control" id="name"
                                            required>
                                </div>
                                <div class="form-group">
                                    <label for="name">{{__('messages.contact')}} {{__('messages.number')}}<span class="text-danger">*</span></label>
                                    <input type="text" name="contact" value="{{$shop->phone}}" class="form-control" id="name"
                                            required>
                                </div>
                                <div class="form-group">
                                    <label for="address">{{__('messages.address')}}<span class="text-danger">*</span></label>
                                    <textarea type="text" rows="4" name="address" value="" class="form-control" id="address"
                                            required>{{$shop->address}}</textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name">{{__('messages.upload')}} {{__('messages.logo')}}</label>
                                    <div class="custom-file">
                                        <input type="file" name="image" id="customFileUpload" class="custom-file-input"
                                            accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                        <label class="custom-file-label" for="customFileUpload">{{__('messages.choose')}} {{__('messages.file')}}</label>
                                    </div>
                                </div> 
                                <center>
                                    <img style="width: auto;border: 1px solid; border-radius: 10px; max-height:200px;" id="viewer"
                                    onerror="this.src='{{asset('public/assets/admin/img/image-place-holder.png')}}'"
                                    src="{{asset('storage/app/public/restaurant/'.$shop->logo)}}" alt="Product thumbnail"/>
                                </center>  
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name">{{__('messages.upload')}} {{__('messages.cover')}} {{__('messages.photo')}} <span class="text-danger">({{__('messages.ratio')}} 2:1)</span></label>
                            <div class="custom-file">
                                <input type="file" name="photo" id="coverImageUpload" class="custom-file-input"
                                    accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                <label class="custom-file-label" for="customFileUpload">{{__('messages.choose')}} {{__('messages.file')}}</label>
                            </div>
                        </div> 
                        <center>
                            <img style="max-width: 100%;border: 1px solid; border-radius: 10px; max-height:200px;" id="coverImageViewer"
                            onerror="this.src='{{asset('public/assets/admin/img/restaurant_cover.jpg')}}'"
                            src="{{asset('storage/app/public/restaurant/cover/'.$shop->cover_photo)}}" alt="Product thumbnail"/>
                        </center>  
                        <br>
                        <button type="submit" class="btn btn-primary text-capitalize" id="btn_update">{{__('messages.update')}}</button>
                        <a class="btn btn-danger text-capitalize" href="{{route('vendor.shop.view')}}">{{__('messages.cancel')}}</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection

@push('script_2')

   <script>
        function readURL(input, viewer) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#'+viewer).attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#coverImageUpload").change(function () {
            readURL(this, 'coverImageViewer');
        });
        $("#customFileUpload").change(function () {
            readURL(this, 'viewer');
        });
   </script>
@endpush
