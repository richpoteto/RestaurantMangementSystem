@extends('layouts.admin.app')
@section('title','Gallery')
@push('css_or_js')
<style>
    #files{
        overflow-y:scroll;
        max-height: 400px;
    }
    .gallary-card{
        height:100px;
        overflow: hidden;
        width:100%;
        border:2px solid white;
        border-radius:5px;
    }
</style>
@endpush

@section('content')
<div class="content container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{trans('messages.dashboard')}}</a></li>
            <li class="breadcrumb-item text-capitalize" aria-current="page">{{trans('messages.file_manager')}}</li>
        </ol>
    </nav>
    <!-- Page Heading -->
    <div class="d-md-flex_ align-items-center justify-content-between mb-2">
        <div class="row">
            <div class="col-md-8">
                <h3 class="h3 mb-0 text-capitalize text-black-50">{{trans('messages.file_manager')}}</h3>
            </div>

            <div class="col-md-4">
                <button type="button" class="btn btn-primary modalTrigger  float-right" data-toggle="modal" data-target="#exampleModal">
                    <i class="tio-add-circle"></i>
                    <span class="text">{{trans('messages.add')}} {{trans('messages.new')}}</span>
                </button>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 20px">
        <div class="col-md-12">
            <div class="card">
            <div class="card-header py-1">
                @php
                    $pwd = explode('/',base64_decode($folder_path));
                @endphp
                    <h5 class="text-capitalize">{{end($pwd)}} <span class="badge badge-soft-dark ml-2" id="itemCount">{{count($data)}}</span></h5>
                    <a class="btn btn-primary" href="{{url()->previous()}}"><i class="tio-left-arrow"></i>{{__('messages.back')}}</a>
                </div>
                <div class="card-body" style="padding: 0">
                    <div class="row">
                        @foreach($data as $key=>$file)
                        <div class="col-sm-2">
                            @if($file['type']=='folder')
                            <a class="btn"  href="{{route('admin.file-manager.index', base64_encode($file['path']))}}">
                                <img class="img-thumbnail" src="{{asset('public/assets/admin/img/folder.png')}}" alt="">
                                <p>{{Str::limit($file['name'],10)}}</p>
                            </a>
                            @elseif($file['type']=='file')
                            <!-- <a class="btn" href="{{asset('storage/app/'.$file['path'])}}" download> -->
                            <button class="btn w-100"  data-toggle="modal" data-target="#imagemodal{{$key}}" title="{{$file['name']}}">
                                <div class="gallary-card">
                                    <img src="{{asset('storage/app/'.$file['path'])}}" alt="{{$file['name']}}" style="height:auto;width:100%;">
                                </div>    
                                <p style="overflow:hidden">{{Str::limit($file['name'],10)}}</p>
                            </button>
                            <div class="modal fade" id="imagemodal{{$key}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="myModalLabel">{{$file['name']}}</h4>
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        </div>
                                        <div class="modal-body">
                                            <img src="{{asset('storage/app/'.$file['path'])}}" style="width: 100%; height: auto;" >
                                        </div>
                                        <div class="modal-footer">
                                            <a class="btn btn-primary" href="{{route('admin.file-manager.download', base64_encode($file['path']))}}"><i class="tio-download"></i> {{__('messages.download')}} </a>
                                            <button class="btn btn-info" onclick="copy_test('{{$file['db_path']}}')"><i class="tio-copy"></i> Copy path</button>
                                            {{--<form action="{{route('admin.file-manager.destroy',base64_encode($file['path']))}}" method="post">
                                                @csrf
                                                @method('delete')    
                                                <button class="btn btn-danger" type="submit"><i class="tio-delete"></i> {{__('messages.delete')}}</button>
                                            </form>--}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endif
                        </div>
                        @endforeach
                    </div>
                </div>
                <div class="card-footer">
                    <div class="page-area">

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="indicator"></div>
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">{{__('messages.upload')}} {{__('messages.file')}} </h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <form action="{{route('admin.file-manager.image-upload')}}"  method="post" enctype="multipart/form-data">
                    @csrf
                    <input type="text" name="path" value = "{{base64_decode($folder_path)}}" hidden>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="images[]" id="customFileUpload" class="custom-file-input" accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" multiple>
                            <label class="custom-file-label" for="customFileUpload">{{__('messages.choose')}} {{__('messages.images')}}</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="file" id="customZipFileUpload" class="custom-file-input"
                                                        accept=".zip">
                            <label class="custom-file-label" id="zipFileLabel" for="customZipFileUpload">{{__('messages.upload_zip_file')}}</label>
                        </div>
                    </div>

                    <div class="row" id="files"></div>
                    <div class="form-group">
                        <input class="btn btn-primary" type="submit" value="{{__('messages.upload')}}">
                    </div>
                </form>

            </div>
            <div class="modal-footer">
            </div>
          </div>
        </div>
    </div>
</div>
@endsection

@push('script_2')
<script>
    function readURL(input) {
        $('#files').html("");
        for( var i = 0; i<input.files.length; i++)
        {
            if (input.files && input.files[i]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#files').append('<div class="col-md-2 col-sm-4 m-1"><img style="width: 100%;border: 1px solid; border-radius: 10px; max-height:200px;" id="viewer" src="'+e.target.result+'"/></div>');
                }
                reader.readAsDataURL(input.files[i]);
            }
        }

    }

    $("#customFileUpload").change(function () {
        readURL(this);
    });

    $('#customZipFileUpload').change(function(e){
        var fileName = e.target.files[0].name;
        $('#zipFileLabel').html(fileName);
    });

    // $(".image_link").on("click", function(e) {
    //     e.preventDefault();
    //     $('#imagepreview').attr('src', $(this).data('src')); // here asign the image to the modal when the user click the enlarge link
    //     $('#imagemodal').modal('show'); // imagemodal is the id attribute assigned to the bootstrap modal, then i use the show function
    // });

    function copy_test(copyText) {
        /* Copy the text inside the text field */
        navigator.clipboard.writeText(copyText);

        toastr.success('File path copied successfully!', {
            CloseButton: true,
            ProgressBar: true
        });
    }
    
</script>
@endpush
