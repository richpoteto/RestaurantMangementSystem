@extends('layouts.admin.app')
@section('title','Employee Add')
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
            <li class="breadcrumb-item" aria-current="page">{{__('messages.add')}} {{__('messages.Employee')}}</li>
        </ol>
    </nav>
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-2">
        <h1 class="h3 mb-0 text-black-50">{{__('messages.Employee')}}</h1>
    </div>

    <!-- Content Row -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    {{__('messages.employee_form')}}
                </div>
                <div class="card-body">
                    <form action="{{route('admin.employee.add-new')}}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="input-label qcont" for="fname">{{__('messages.first')}} {{__('messages.name')}}</label>
                                    <input type="text" name="f_name" class="form-control" id="fname"
                                           placeholder="{{__('messages.first_name')}}" value="{{old('f_name')}}" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="input-label qcont" for="lname">{{__('messages.last')}} {{__('messages.name')}}</label>
                                    <input type="text" name="l_name" class="form-control" id="lname" value="{{old('l_name')}}"
                                           placeholder="{{__('messages.last_name')}}" value="{{old('name')}}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="input-label" for="title">{{__('messages.zone')}}</label>
                                    <select name="zone_id" class="form-control js-select2-custom">
                                        @if(!isset(auth('admin')->user()->zone_id))
                                        <option value="" {{!isset($e->zone_id)?'selected':''}}>{{__('messages.all')}}</option>
                                        @endif
                                        @php($zones=\App\Models\Zone::all())
                                        @foreach($zones as $zone)
                                            <option value="{{$zone['id']}}">{{$zone['name']}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="input-label qcont" for="role_id">{{__('messages.Role')}}</label>
                                    <select class="form-control js-select2-custom" name="role_id"
                                            style="width: 100%" required>
                                        <option value="" selected disabled>{{__('messages.select')}} {{__('messages.Role')}}</option>
                                        @foreach($rls as $r)
                                            <option value="{{$r->id}}">{{$r->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <small class="nav-subtitle border-bottom">{{__('messages.login')}} {{__('messages.info')}}</small>
                        <br>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="input-label qcont" for="phone">{{__('messages.phone')}}</label>
                                    <input type="tel" name="phone" value="{{old('phone')}}" class="form-control" id="phone"
                                           placeholder="Ex : +88017********" required>
                                </div>
                                <div class="col-md-4">
                                    <label class="input-label qcont" for="email">{{__('messages.email')}}</label>
                                    <input type="email" name="email" value="{{old('email')}}" class="form-control" id="email"
                                           placeholder="Ex : ex@gmail.com" required>
                                </div>
                                <div class="col-md-4">
                                    <label class="input-label qcont" for="password">{{__('messages.password')}}</label>
                                    <input type="text" name="password" class="form-control" id="password" value="{{old('password')}}"
                                           placeholder="{{__('messages.password_length_placeholder',['length'=>'6+'])}}" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label class="input-label qcont" for="customFileUpload">{{__('messages.employee_image')}}</label>
                                    <div class="form-group">
                                        <div class="custom-file">
                                            <input type="file" name="image" id="customFileUpload" class="custom-file-input"
                                                accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" value="{{old('image')}}" required>
                                            <label class="custom-file-label" for="customFileUpload">{{__('messages.choose')}} {{__('messages.file')}}</label>
                                        </div>
                                    </div> 
                                    <center>
                                        <img style="width: auto;border: 1px solid; border-radius: 10px; max-height:200px;" id="viewer"
                                            src="{{asset('public\assets\admin\img\400x400\img2.jpg')}}" alt="Employee thumbnail"/>
                                    </center>   
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
