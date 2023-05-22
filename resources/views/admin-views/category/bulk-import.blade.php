@extends('layouts.admin.app')

@section('title','Categories Bulk Import')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{trans('messages.dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page"><a
                        href="{{route('admin.category.add')}}">{{trans('messages.category')}}</a>
                </li>
                <li class="breadcrumb-item">{{trans('messages.bulk_import')}} </li>
            </ol>
        </nav>
        <h1 class="text-capitalize">{{__('messages.categories')}} {{__('messages.bulk_import')}}</h1>
        <!-- Content Row -->
        <div class="row">
            <div class="col-12">
                <div class="jumbotron pt-1" style="background: white">
                    <h3>Instructions : </h3>
                    <p> 1. Download the format file and fill it with proper data.</p>

                    <p>2. You can download the example file to understand how the data must be filled.</p>

                    <p>3. Once you have downloaded and filled the format file, upload it in the form below and
                        submit.</p>

                    <p> 4. After uploading categories you need to edit them and set category's images.</p>

                    <p> 5. For parent category "position" will 0 and for sub category it will be 1.</p>

                    <p> 6. By default status will be 1, please input the right ids.</p>
                    <p> 7. For a category parent_id will be empty, for sub category it will be the category id.</p>

                </div>
            </div>

            <div class="col-md-12">
                <form class="product-form" action="{{route('admin.category.bulk-import')}}" method="POST"
                      enctype="multipart/form-data">
                    @csrf
                    <div class="card mt-2 rest-part">
                        <div class="card-header">
                            <h4>{{__('messages.Import Categories File')}}</h4>
                            <a href="{{asset('public/assets/categories_bulk_format.xlsx')}}" download=""
                               class="btn btn-secondary">{{__('messages.Download Format')}}</a>
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
                                <button type="submit" class="btn btn-primary">{{__('messages.Submit')}}</button>
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
