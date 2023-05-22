@extends('layouts.vendor.app')

@section('title','Review List')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title">{{__('messages.customers')}} {{__('messages.reviews')}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">
                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header">
                        <h5 class="card-header-title"></h5>
                    </div>
                    <!-- End Header -->

                    <!-- Table -->
                    <div class="table-responsive datatable-custom">
                        <table id="columnSearchDatatable"
                               class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                               data-hs-datatables-options='{
                                 "order": [],
                                 "orderCellsTop": true,
                                 "paging": false
                               }'>
                            <thead class="thead-light">
                            <tr>
                                <th>{{__('messages.#')}}</th>
                                <th>{{__('messages.food')}}</th>
                                <th>{{__('messages.reviewer')}}</th>
                                <th>{{__('messages.review')}}</th>
                                <th>{{__('messages.rating')}}</th>
                                <th>{{__('messages.date')}}</th>
                            </tr>
                            </thead>

                            <tbody>
                            @foreach($reviews as $key=>$review)
                                <tr>
                                    <td>{{$key+$reviews->firstItem()}}</td>
                                    <td>
                                        @if ($review->food)
                                        <a class="media align-items-center" href="{{route('vendor.food.view',[$review->food['id']])}}">
                                            <img class="avatar avatar-lg mr-3" src="{{asset('storage/app/public/product')}}/{{$review->food['image']}}" 
                                                onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'" alt="{{$review->food->name}} image">
                                            <div class="media-body">
                                                <h5 class="text-hover-primary mb-0">{{Str::limit($review->food['name'],10)}}</h5>
                                            </div>
                                        </a>
                                        @else
                                            {{__('messages.Food deleted!')}}
                                        @endif
                                    </td>
                                    <td>
                                        @if($review->customer)
                                        <div class="d-flex align-items-center">
                                            <div class="avatar avatar-circle">
                                                <img class="avatar-img" width="75" height="75"
                                                    onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                                    src="{{asset('storage/app/public/profile/'.$review->customer->image)}}"
                                                    alt="Image Description">
                                            </div>
                                            <div class="ml-3">
                                            <span class="d-block h5 text-hover-primary mb-0">{{Str::limit($review->customer['f_name']." ".$review->customer['l_name'], 15)}} <i
                                                    class="tio-verified text-primary" data-toggle="tooltip" data-placement="top"
                                                    title="Verified Customer"></i></span>
                                                <span class="d-block font-size-sm text-body">{{Str::limit($review->customer->email, 20)}}</span>
                                            </div>
                                        </div>
                                        @else
                                        {{__('messages.customer_not_found')}}
                                        @endif
                                    </td>
                                    <td>
                                        <div class="text-wrap" style="width: 18rem;">
                                            <p>
                                                {{Str::limit($review['comment'], 80)}}
                                            </p>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="text-wrap">
                                            <div class="d-flex mb-2">
                                                <label class="badge badge-soft-info">
                                                    {{$review->rating}} <i class="tio-star"></i>
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        {{date('d M Y '.config('timeformat'),strtotime($review['created_at']))}}
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <hr>
                        <table>
                            <tfoot>
                            {!! $reviews->links() !!}
                            </tfoot>
                        </table>
                    </div>
                    <!-- End Table -->
                </div>
                <!-- End Card -->
            </div>
        </div>
    </div>

@endsection

@push('script_2')
    <script>
        $(document).on('ready', function () {
            // INITIALIZATION OF DATATABLES
            // =======================================================
            var datatable = $.HSCore.components.HSDatatables.init($('#columnSearchDatatable'));

        });
    </script>
@endpush
