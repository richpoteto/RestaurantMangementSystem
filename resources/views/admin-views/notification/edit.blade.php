@extends('layouts.admin.app')

@section('title',__('messages.update').' '.__('messages.notification'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-notifications"></i> {{__('messages.notification')}} {{__('messages.update')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="{{route('admin.notification.update',[$notification['id']])}}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.title')}}</label>
                                <input type="text" value="{{$notification['title']}}" name="notification_title" class="form-control" placeholder="{{__('messages.new_notification')}}" required maxlength="191">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlInput1">{{__('messages.zone')}}</label>
                                <select name="zone" class="form-control js-select2-custom" >
                                    <option value="all" {{isset($notification->zone_id)?'':'selected'}}>{{__('messages.all')}} {{__('messages.zone')}}</option>
                                    @foreach(\App\Models\Zone::orderBy('name')->get() as $z)
                                        <option value="{{$z['id']}}"  {{$notification->zone_id==$z['id']?'selected':''}}>{{$z['name']}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label class="input-label" for="tergat">{{__('messages.send')}} {{__('messages.to')}}</label>
                        
                                <select name="tergat" class="form-control" id="tergat" data-placeholder="{{__('messages.select')}} {{__('messages.tergat')}}" required>
                                    <option value="customer" {{$notification->tergat=='customer'?'selected':''}}>{{__('messages.customer')}}</option>
                                    <option value="deliveryman" {{$notification->tergat=='deliveryman'?'selected':''}}>{{__('messages.deliveryman')}}</option>
                                    <option value="restaurant" {{$notification->tergat=='restaurant'?'selected':''}}>{{__('messages.restaurant')}}</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.description')}}</label>
                        <textarea name="description" class="form-control" required>{{$notification['description']}}</textarea>
                    </div>
                    <div class="form-group">
                        <label>{{__('messages.image')}}</label><small style="color: red">* ( {{__('messages.ratio')}} 3:1 )</small>
                        <div class="custom-file">
                            <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                   accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                            <label class="custom-file-label" for="customFileEg1">{{__('messages.choose')}} {{__('messages.file')}}</label>
                        </div>
                        <hr>
                        <center>
                            <img style="width: 30%;border: 1px solid; border-radius: 10px;" id="viewer"
                                 src="{{asset('storage/app/public/notification')}}/{{$notification['image']}}"  onerror="src='{{asset('public/assets/admin/img/900x400/img1.jpg')}}'" alt="image"/>
                        </center>
                    </div>
                    <hr>
                    <button type="submit" class="btn btn-primary">{{__('messages.submit')}}</button>
                </form>
            </div>
            <!-- End Table -->
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

        $("#customFileEg1").change(function () {
            readURL(this);
        });
    </script>
@endpush
