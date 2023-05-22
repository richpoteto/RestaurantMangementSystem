@extends('layouts.admin.app')

@section('title','Restaurant Bulk Import')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{trans('messages.dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page"><a
                        href="{{route('admin.vendor.list')}}">{{trans('messages.restaurants')}}</a>
                </li>
                <li class="breadcrumb-item">{{trans('messages.bulk_import')}} </li>
            </ol>
        </nav>
        <h1 class="text-capitalize">{{__('messages.restaurants')}} {{__('messages.bulk_import')}}</h1>
        <!-- Content Row -->
        <div class="row">
            <div class="col-12">
                <div class="jumbotron pt-1" style="background: white">
                    <h3>Instructions : </h3>
                    <p>1. Download the format file and fill it with proper data.</p>

                    <p>2. You can download the example file to understand how the data must be filled.</p>

                    <p>3. Once you have downloaded and filled the format file, upload it in the form below and
                        submit.Make sure the phone numbers and email addresses are unique.</p>

                    <p>4. After uploading restaurants you need to edit them and set restaurants's logo and cover.</p>

                    <p>5. You can get category and zone id from their list, please input the right ids.</p>

                    <p>6. You can upload your restaurant images in restaurant folder from gallery, and copy image`s path.</p>
                    
                    <p>7. Default password for restaurant is 12345678.</p>

                </div>
            </div>

            <div class="col-md-12">
                <form class="product-form" action="{{route('admin.vendor.bulk-import')}}" method="POST"
                      enctype="multipart/form-data">
                    @csrf
                    <div class="card mt-2 rest-part">
                        <div class="card-header">
                            <h4>Import Restaurants File</h4>
                            <a href="{{asset('public/assets/restaurants_bulk_format.xlsx')}}" download=""
                               class="btn btn-secondary">Download Format</a>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-4">
                                        <input type="file" name="products_file">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card card-footer">
                        <div class="row">
                            <div class="col-md-12" style="padding-top: 20px">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('script')

@endpush
