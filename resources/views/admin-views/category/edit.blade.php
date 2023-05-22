@extends('layouts.admin.app')

@section('title',__('messages.Update category'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="page-header">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                        <li class="breadcrumb-item"><a href="{{route('admin.category.add')}}">{{__('messages.category')}}</a></li>
                        @if ($category->position == 1)
                            <li class="breadcrumb-item"><a href="{{route('admin.category.add-sub-category')}}">{{__('messages.sub_category')}}</a></li>
                        @endif
                        @if ($category->position == 2)
                            <li class="breadcrumb-item"><a href="{{route('admin.category.add-sub-category')}}">{{__('messages.sub_category')}}</a></li>
                            <li class="breadcrumb-item"><a href="{{route('admin.category.add-sub-sub-category')}}">Sub {{__('messages.sub_category')}}</a></li>
                        @endif
                        <li class="breadcrumb-item" aria-current="page">{{__('messages.update')}}</li>
                    </ol>
                </nav>
            </div>
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-edit"></i>{{__('messages.category')}} {{__('messages.update')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <form action="{{route('admin.category.update',[$category['id']])}}" method="post" enctype="multipart/form-data">
                    @csrf
                    @php($language=\App\Models\BusinessSetting::where('key','language')->first())
                    @php($language = $language->value ?? null)
                    @php($default_lang = 'en')
                    @if($language)
                        @php($default_lang = json_decode($language)[0])
                        <ul class="nav nav-tabs mb-4">
                            @foreach(json_decode($language) as $lang)
                                <li class="nav-item">
                                    <a class="nav-link lang_link {{$lang == $default_lang? 'active':''}}" href="#" id="{{$lang}}-link">{{\App\CentralLogics\Helpers::get_language_name($lang).'('.strtoupper($lang).')'}}</a>
                                </li>
                            @endforeach
                        </ul>
                    @endif
                    <div class="row">
                        <div class="col-md-6 col-6">
                            @if($language)
                                @foreach(json_decode($language) as $lang)
                                    <?php
                                        if(count($category['translations'])){
                                            $translate = [];
                                            foreach($category['translations'] as $t)
                                            {
                                                if($t->locale == $lang && $t->key=="name"){
                                                    $translate[$lang]['name'] = $t->value;
                                                }
                                            }
                                        }
                                    ?>
                                    <div class="form-group {{$lang != $default_lang ? 'd-none':''}} lang_form" id="{{$lang}}-form">
                                        <label class="input-label" for="exampleFormControlInput1">{{__('messages.name')}} ({{strtoupper($lang)}})</label>
                                        <input type="text" name="name" class="form-control" placeholder="{{__('messages.new_category')}}" maxlength="191" value="{{$lang==$default_lang?$category['name']:($translate[$lang]['name']??'')}}" {{$lang == $default_lang? 'required':''}} oninvalid="document.getElementById('en-link').click()">
                                    </div>
                                    <input type="hidden" name="lang[]" value="{{$lang}}">
                                @endforeach
                            @else
                                <div class="form-group">
                                    <label class="input-label" for="exampleFormControlInput1">{{__('messages.name')}}</label>
                                    <input type="text" name="name" class="form-control" placeholder="{{__('messages.new_category')}}" value="{{old('name')}}" required maxlength="191">
                                </div>
                                <input type="hidden" name="lang[]" value="{{$lang}}">
                            @endif
                            <div class="form-group">
                                <label>{{__('messages.image')}}</label><small style="color: red">* ( {{__('messages.ratio')}} 1:1 )</small>
                                <div class="custom-file">
                                    <input type="file" name="image" id="customFileEg1" class="custom-file-input"
                                           accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                    <label class="custom-file-label" for="customFileEg1">{{__('messages.choose')}} {{__('messages.file')}}</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-6">
                            <center>
                                <img style="width: 200px; height: 200px; object-fit: cover; border: 1px solid; border-radius: 10px;" id="imageViewer"
                                    onerror="this.src='{{asset('public/assets/admin/img/900x400/img1.jpg')}}'"
                                     src="{{asset('storage/app/public/category')}}/{{$category['image']}}" alt="image"/>
                            </center>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">{{__('messages.update')}}</button>
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
                    $('#imageViewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileEg1").change(function () {
            readURL(this);
        });
    </script>
    <script>
        $(".lang_link").click(function(e){
            e.preventDefault();
            $(".lang_link").removeClass('active');
            $(".lang_form").addClass('d-none');
            $(this).addClass('active');

            let form_id = this.id;
            let lang = form_id.substring(0, form_id.length - 5);
            console.log(lang);
            $("#"+lang+"-form").removeClass('d-none');
            if(lang == '{{$default_lang}}')
            {
                $(".from_part_2").removeClass('d-none');
            }
            else
            {
                $(".from_part_2").addClass('d-none');
            }
        });
    </script>
@endpush
