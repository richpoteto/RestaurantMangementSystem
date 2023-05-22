@extends('layouts.vendor.app')

@section('title','Food Bulk Export')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('vendor.dashboard')}}">{{trans('messages.dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page"><a
                        href="{{route('vendor.food.list')}}">{{trans('messages.foods')}}</a>
                </li>
                <li class="breadcrumb-item">{{trans('messages.bulk_import')}} </li>
            </ol>
        </nav>


        <div class="card mt-2 rest-part">
            <div class="card-header">
                <h4>Export Foods</h4>
            </div>
            <div class="card-body">
                <form class="product-form" action="{{route('vendor.food.bulk-export')}}" method="POST"
                        enctype="multipart/form-data">
                    @csrf

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="input-label" for="exampleFormControlSelect1">{{__('messages.type')}}<span
                                        class="input-label-secondary"></span></label>
                                <select name="type" id="type" data-placeholder="{{__('messages.select')}} {{__('messages.type')}}" class="form-control" required title="Select Type">
                                    <option value="all">{{__('messages.all')}} {{__('messages.data')}}</option>    
                                    <option value="date_wise">{{__('messages.date')}} {{__('messages.wise')}}</option>
                                    <option value="id_wise">{{__('messages.id')}} {{__('messages.wise')}}</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group id_wise">
                                <label class="input-label" for="exampleFormControlSelect1">{{__('messages.start')}} {{__('messages.id')}}<span
                                        class="input-label-secondary"></span></label>
                                <input type="number" name="start_id" class="form-control">
                            </div>
                            <div class="form-group date_wise">
                                <label class="input-label" for="exampleFormControlSelect1">{{__('messages.from')}} {{__('messages.date')}}<span
                                        class="input-label-secondary"></span></label>
                                <input type="date" name="from_date" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group id_wise">
                                <label class="input-label" for="exampleFormControlSelect1">{{__('messages.end')}} {{__('messages.id')}}<span
                                        class="input-label-secondary"></span></label>
                                <input type="number" name="end_id" class="form-control">
                            </div>
                            <div class="form-group date_wise">
                                <label class="input-label text-capitalize" for="exampleFormControlSelect1">{{__('messages.to')}} {{__('messages.date')}}<span
                                        class="input-label-secondary"></span></label>
                                <input type="date" name="to_date" class="form-control">
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">{{__('messages.submit')}}</button>
                    </div>
                </form>
            </div>
            <div class="card card-footer">
            </div>
        </div>
    </div>
@endsection

@push('script_2')
<script>
    $(document).on('ready', function (){
        $('.id_wise').hide();
        $('.date_wise').hide();
        $('#type').on('change', function()
        {
            $('.id_wise').hide();
            $('.date_wise').hide();
            $('.'+$(this).val()).show();
        })
    });
</script>
@endpush
