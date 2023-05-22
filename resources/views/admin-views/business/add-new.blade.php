@extends('layouts.admin.app')
@section('title','Business Add')
@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
           @media(max-width:375px){
            #employee-image-modal .modal-content{
              width: 367px !important;
            margin-left: 0 !important;
        }
       
        }

   @media(max-width:500px){
    #employee-image-modal .modal-content{
              width: 400px !important;
            margin-left: 0 !important;
        }
      
      
   }
    </style>
@endpush

@section('content')
<div class="content container-fluid"> 
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
            <li class="breadcrumb-item"><a href="{{route('admin.business.list')}}">{{__('messages.business')}}</a></li>
            <li class="breadcrumb-item" aria-current="page">{{__('messages.add')}} {{__('messages.business')}}</li>
        </ol>
    </nav>
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-2">
        <h1 class="h3 mb-0 text-black-50">{{__('messages.business')}} {{__('messages.information')}}</h1>
    </div>

    <!-- Content Row -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <form id="business_form" action="{{ route('admin.business.store') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="input-label qcont" for="business_name">Business Name</label>
                                    <input type="text" name="business_name" class="form-control" id="business_name"
                                           placeholder="Business Name" value="{{old('business_name')}}" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="input-label qcont" for="website">Website</label>
                                    <input type="text" name="website" class="form-control" id="website" value="{{old('website')}}"
                                           placeholder="{{__('messages.website')}}" value="{{old('website')}}">
                                </div>
                            </div>
                        </div>
                      
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="input-label qcont" for="phone">{{__('messages.phone')}}</label>
                                    <input type="tel" name="phone" value="{{old('phone')}}" class="form-control" id="phone"
                                           placeholder="Ex : +88017********" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="input-label qcont" for="email">{{__('messages.email')}}</label>
                                    <input type="email" name="email" value="{{old('email')}}" class="form-control" id="email"
                                           placeholder="Ex : ex@gmail.com" required>
                                </div>
                              
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="input-label qcont" for="address">{{__('messages.address')}}</label>
                                    <input type="tel" name="address" value="{{old('address')}}" class="form-control" id="address"
                                           placeholder="Address" required>
                                </div>
                                
                                <div class="col-md-6">
                                    <label class="input-label qcont" for="fax">{{__('messages.fax')}}</label>
                                    <input type="text" name="fax" class="form-control" id="fax" value="{{old('fax')}}"
                                           placeholder="Fax" required>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">{{__('messages.submit')}}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script_2')
    
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#viewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileUpload").change(function () {
            readURL(this);
        });

        $(".js-example-theme-single").select2({
            theme: "classic"
        });

        $(".js-example-responsive").select2({
            width: 'resolve'
        });
    </script>
@endpush
