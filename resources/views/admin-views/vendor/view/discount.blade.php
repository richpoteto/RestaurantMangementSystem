@extends('layouts.admin.app')

@section('title',$restaurant->name."'s Settings")

@push('css_or_js')
    <!-- Custom styles for this page -->
    <link href="{{asset('public/assets/admin/css/croppie.css')}}" rel="stylesheet">

@endpush

@section('content')
<div class="content container-fluid">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
            <li class="breadcrumb-item" aria-current="page">{{__('messages.vendor_view')}}</li>
        </ol>
    </nav>

    <!-- Page Header -->
    <div class="page-header">

        <h1 class="page-header-title text-break">{{$restaurant->name}}</h1>
        
        <!-- Nav Scroller -->
        <div class="js-nav-scroller hs-nav-scroller-horizontal">
            <span class="hs-nav-scroller-arrow-prev" style="display: none;">
                <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                    <i class="tio-chevron-left"></i>
                </a>
            </span>

            <span class="hs-nav-scroller-arrow-next" style="display: none;">
                <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                    <i class="tio-chevron-right"></i>
                </a>
            </span>

            <!-- Nav -->
            <ul class="nav nav-tabs page-header-tabs">
            <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', $restaurant->id)}}">{{__('messages.restaurant')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', ['restaurant'=>$restaurant->id, 'tab'=> 'order'])}}"  aria-disabled="true">{{__('messages.order')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', ['restaurant'=>$restaurant->id, 'tab'=> 'product'])}}"  aria-disabled="true">{{__('messages.food')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="{{route('admin.vendor.view', ['restaurant'=>$restaurant->id, 'tab'=> 'discount'])}}"  aria-disabled="true">{{__('messages.discount')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', ['restaurant'=>$restaurant->id, 'tab'=> 'settings'])}}"  aria-disabled="true">{{__('messages.settings')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', ['restaurant'=>$restaurant->id, 'tab'=> 'transaction'])}}"  aria-disabled="true">{{__('messages.transaction')}}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{route('admin.vendor.view', ['restaurant'=>$restaurant->id, 'tab'=> 'reviews'])}}"  aria-disabled="true">{{__('messages.reviews')}}</a>
                </li>
            </ul>
            <!-- End Nav -->
        </div>
        <!-- End Nav Scroller -->
    </div>
        <!-- End Page Header -->
    <!-- Page Heading -->
    <div class="tab-content">
        <div class="tab-pane fade show active" id="vendor">
            <div class="row pt-2" >
                <div class="col-md-12">
                    <div class="card h-100">
                        <div class="card-header">
                            {{__('messages.discount')}} {{__('messages.info')}}
                            <button type="button" class="btn-sm btn-primary" data-toggle="modal" data-target="#updatesettingsmodal">
                                {{$restaurant->discount?__('messages.update').' '.__('messages.discount'):__('messages.add').' '.__('messages.discount')}}
                            </button>
                        </div>
                        <div class="card-body">
                            @if($restaurant->discount)
                            <div class="row">
                                <div class="col-6 border-right">
                                    <ul class="list-unstyled list-unstyled-py-3 text-dark mb-3">
                                        <li class="pb-1 pt-1">{{__('messages.start')}} {{__('messages.date')}} : {{$restaurant->discount?date('Y-m-d',strtotime($restaurant->discount->start_date)):''}}</li>
                                        <li class="pb-1 pt-1">{{__('messages.end')}} {{__('messages.date')}} : {{$restaurant->discount?date('Y-m-d', strtotime($restaurant->discount->end_date)):''}}</li>
                                        <li class="pb-1 pt-1">{{__('messages.start')}} {{__('messages.time')}} : {{$restaurant->discount?date(config('timeformat'), strtotime($restaurant->discount->start_time)):''}}</li>
                                        <li class="pb-1 pt-1">{{__('messages.end')}} {{__('messages.time')}} : {{$restaurant->discount?date(config('timeformat'), strtotime($restaurant->discount->end_time)):''}}</li>
                                    </ul>
                                </div>
                                <div class="col-6">
                                    <ul class="list-unstyled list-unstyled-py-3 text-dark mb-3">
                                        <li class="pb-1 pt-1">{{__('messages.discount')}} : {{$restaurant->discount?round($restaurant->discount->discount):0}}%</li>
                                        <li class="pb-1 pt-1">{{__('messages.max')}} {{__('messages.discount')}} : {{\App\CentralLogics\Helpers::format_currency($restaurant->discount?$restaurant->discount->max_discount:0)}}</li>
                                        <li class="pb-1 pt-1">{{__('messages.min')}} {{__('messages.purchase')}} : {{\App\CentralLogics\Helpers::format_currency($restaurant->discount?$restaurant->discount->min_purchase:0)}}</li>
                                    </ul>
                                </div>
                            </div>
                            @else
                            <div class="form-group">
                                <label class="d-flex justify-content-center rounded px-4 form-control" for="restaurant_status">
                                    <span class="card-subtitle">No discount</span> 
                                </label>
                            </div>
                            @endif
                            

                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="updatesettingsmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">{{$restaurant->discount?__('messages.update'):__('messages.add')}} {{__('messages.discount')}}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="{{route('admin.vendor.discount',[$restaurant['id']])}}" method="post" id="discount-form">
            @csrf 
            <div class="row">
                <div class="col-md-6 col-6">
                    <div class="form-group">
                        <label class="input-label" for="title">{{__('messages.start')}} {{__('messages.date')}}</label>
                        <input type="date" id="date_from" class="form-control" required name="start_date" value="{{$restaurant->discount?date('Y-m-d',strtotime($restaurant->discount->start_date)):''}}"> 
                    </div>
                </div>
                <div class="col-md-6 col-6">
                    <div class="form-group">
                        <label class="input-label" for="title">{{__('messages.end')}} {{__('messages.date')}}</label>
                        <input type="date" id="date_to" class="form-control" required name="end_date" value="{{$restaurant->discount?date('Y-m-d', strtotime($restaurant->discount->end_date)):''}}">
                    </div>

                </div>
                <div class="col-md-6 col-6">
                    <div class="form-group">
                        <label class="input-label" for="title">{{__('messages.start')}} {{__('messages.time')}}</label>
                        <input type="time" id="start_time" class="form-control" required name="start_time" value="{{$restaurant->discount?date('H:i',strtotime($restaurant->discount->start_time)):'00:00'}}">
                    </div>
                </div>
                <div class="col-md-6 col-6">
                    <label class="input-label" for="title">{{__('messages.end')}} {{__('messages.time')}}</label>
                    <input type="time" id="end_time" class="form-control" required name="end_time" value="{{$restaurant->discount?date('H:i', strtotime($restaurant->discount->end_time)):'23:59'}}">
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-6">
                    <div class="form-group">
                        <label class="input-label" for="title">{{__('messages.discount')}} (%)</label>
                        <input type="number" min="0" max="10000" step="0.01" name="discount" class="form-control" required value="{{$restaurant->discount?$restaurant->discount->discount:'0'}}">
                    </div>
                </div>
                <div class="col-md-4 col-6">
                    <div class="form-group">
                        <label class="input-label" for="title">{{__('messages.min')}} {{__('messages.purchase')}} ({{\App\CentralLogics\Helpers::currency_symbol()}})</label>
                        <input type="number" name="min_purchase" step="0.01" min="0" max="100000" class="form-control" placeholder="100" value="{{$restaurant->discount?$restaurant->discount->min_purchase:'0'}}"> 
                    </div>
                </div>
                <div class="col-md-4 col-6">
                    <div class="form-group">
                        <label class="input-label" for="title">{{__('messages.max')}} {{__('messages.discount')}} ({{\App\CentralLogics\Helpers::currency_symbol()}})</label>
                        <input type="number" min="0" max="1000000" step="0.01" name="max_discount" class="form-control" value="{{$restaurant->discount?$restaurant->discount->max_discount:'0'}}">
                    </div>
                </div>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">{{$restaurant->discount?__('messages.update'):__('messages.add')}}</button>
                @if($restaurant->discount)
                <button type="button" onclick="form_alert('discount-{{$restaurant->id}}','Want to remove discount?')" class="btn btn-danger">{{__('messages.delete')}}</button>
                @endif
            </div>
        </form>
        <form action="{{route('admin.vendor.clear-discount',[$restaurant->id])}}" method="post" id="discount-{{$restaurant->id}}">
            @csrf @method('delete')
        </form>
      </div>
    </div>
  </div>
</div>
@endsection

@push('script_2')
    <script>
        $(document).on('ready', function () {
            // INITIALIZATION OF SELECT2
            // =======================================================
            $('.js-select2-custom').each(function () {
                var select2 = $.HSCore.components.HSSelect2.init($(this));
            });
            $('#date_from').attr('min',(new Date()).toISOString().split('T')[0]);
            $('#date_to').attr('min',(new Date()).toISOString().split('T')[0]);
            
            $("#date_from").on("change", function () {
                $('#date_to').attr('min',$(this).val());
            });

            $("#date_to").on("change", function () {
                $('#date_from').attr('max',$(this).val());
            });
        });

        $('#discount-form').on('submit', function (e) {
            e.preventDefault();
            var formData = new FormData(this);
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('admin.vendor.discount',[$restaurant['id']])}}',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data.errors) {
                        for (var i = 0; i < data.errors.length; i++) {
                            toastr.error(data.errors[i].message, {
                                CloseButton: true,
                                ProgressBar: true
                            });
                        }
                    } else {
                        toastr.success(data.message, {
                            CloseButton: true,
                            ProgressBar: true
                        });

                        setTimeout(function () {
                            location.href = '{{route('admin.vendor.view', ['restaurant'=>$restaurant->id, 'tab'=> 'discount'])}}';
                        }, 2000);
                    }
                }
            });
        });
    </script>
@endpush
