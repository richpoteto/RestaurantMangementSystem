@extends('layouts.admin.app')

@section('title','Food Preview')

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-6">
                    <h1 class="page-header-title text-break">{{$product['name']}}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->

        <!-- Card -->
        <div class="card mb-3 mb-lg-5">
            <!-- Body -->
            <div class="card-body">
                <div class="row align-items-md-center gx-md-5">
                    <div class="col-sm-4 mb-3 mb-md-0">
                        <div class="d-flex align-items-center">
                            <img class="avatar avatar-xxl avatar-4by3 mr-4"
                                 src="{{asset('storage/app/public/product')}}/{{$product['image']}}"
                                 onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'"
                                 alt="Image Description">
                            <div class="d-block">
                                <h4 class="display-2 text-dark mb-0">{{round($product->avg_rating,1)}}</h4>
                                <p> {{__('messages.of')}} {{$product->reviews->count()}} {{__('messages.reviews')}}
                                    <span class="badge badge-soft-dark badge-pill ml-1"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-5">
                        <ul class="list-unstyled list-unstyled-py-2 mb-0">

                        @php($total=$product->rating?array_sum(json_decode($product->rating, true)):0)
                        <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                @php($five=$product->rating?json_decode($product->rating, true)[5]:0)
                                <span
                                    class="mr-3">5 {{__('messages.star')}}</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: {{$total==0?0:($five/$total)*100}}%;"
                                         aria-valuenow="{{$total==0?0:($five/$total)*100}}"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3">{{$five}}</span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                @php($four=$product->rating?json_decode($product->rating, true)[4]:0)
                                <span class="mr-3">4 {{__('messages.star')}}</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: {{$total==0?0:($four/$total)*100}}%;"
                                         aria-valuenow="{{$total==0?0:($four/$total)*100}}"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3">{{$four}}</span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                @php($three=$product->rating?json_decode($product->rating, true)[3]:0)
                                <span class="mr-3">3 {{__('messages.star')}}</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: {{$total==0?0:($three/$total)*100}}%;"
                                         aria-valuenow="{{$total==0?0:($three/$total)*100}}"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3">{{$three}}</span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                @php($two=$product->rating?json_decode($product->rating, true)[2]:0)
                                <span class="mr-3">2 {{__('messages.star')}}</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: {{$total==0?0:($two/$total)*100}}%;"
                                         aria-valuenow="{{$total==0?0:($two/$total)*100}}"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3">{{$two}}</span>
                            </li>
                            <!-- End Review Ratings -->

                            <!-- Review Ratings -->
                            <li class="d-flex align-items-center font-size-sm">
                                @php($one=$product->rating?json_decode($product->rating, true)[1]:0)
                                <span class="mr-3">1 {{__('messages.star')}}</span>
                                <div class="progress flex-grow-1">
                                    <div class="progress-bar" role="progressbar"
                                         style="width: {{$total==0?0:($one/$total)*100}}%;"
                                         aria-valuenow="{{$total==0?0:($one/$total)*100}}"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="ml-3">{{$one}}</span>
                            </li>
                            <!-- End Review Ratings -->
                        </ul>
                    </div>
                    <div class="col-sm-3 border-left text-center">
                        <span class="mb-1">Restaurant info</span>
                        @if($product->restaurant)
                        <img class="avatar-img avatar-circle" style="width: 75px;margin:auto;"
                                onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                                src="{{asset('storage/app/public/restaurant/'.$product->restaurant->logo)}}"
                                alt="Image Description">
                            <label class="input-label">{{$product->restaurant['name']}}</label>
                        @else
                        <span class="badge-info">{{__('messages.restaurant')}} {{__('messages.deleted')}}</span>
                        @endif
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <hr>
                    </div>
                    <div class="col-sm-4 col-12 pt-2">
                        <h4 class="border-bottom">{{$product['name']}}</h4>
                        <span>{{__('messages.price')}} :
                            <span>{{\App\CentralLogics\Helpers::format_currency($product['price'])}}</span>
                        </span><br>
                        <span>{{__('messages.discount')}} :
                            <span>{{\App\CentralLogics\Helpers::format_currency(\App\CentralLogics\Helpers::discount_calculate($product,$product['price']))}}</span>
                        </span><br>
                        <span>
                            {{__('messages.available')}} {{__('messages.time')}} {{__('messages.starts')}} : {{date(config('timeformat'),strtotime($product['available_time_starts']))}}
                        </span><br>
                        <span>
                            {{__('messages.available')}} {{__('messages.time')}} {{__('messages.ends')}} : {{date(config('timeformat'), strtotime($product['available_time_ends']))}}
                        </span>
                        <h4 class="border-bottom mt-2"> {{__('messages.variations')}} </h4>
                        @foreach(json_decode($product['variations'],true) as $variation)
                            <span class="text-capitalize">
                              {{$variation['type']}} : {{\App\CentralLogics\Helpers::format_currency($variation['price'])}}
                            </span><br>
                        @endforeach
                        <h4 class="border-bottom mt-2"> Addons </h4>
                        @foreach(\App\Models\AddOn::whereIn('id',json_decode($product['add_ons'],true))->get() as $addon)
                            <span class="text-capitalize">
                              {{$addon['name']}} : {{\App\CentralLogics\Helpers::format_currency($addon['price'])}}
                            </span><br>
                        @endforeach
                    </div>

                    <div class="col-sm-8 col-12 pt-2 border-left">
                        <h4>{{__('messages.short')}} {{__('messages.description')}} : </h4>
                        {!!$product['description'] !!}
                    </div>
                </div>
            </div>
            <!-- End Body -->
        </div>
        <!-- End Card -->
    </div>
@endsection

@push('script_2')
<script>
    function status_form_alert(id, message, e) {
        e.preventDefault();
        Swal.fire({
            title: '{{__('messages.are_you_sure')}}',   
            text: message,
            type: 'warning',
            showCancelButton: true,
            cancelButtonColor: 'default',
            confirmButtonColor: '#FC6A57',
            cancelButtonText: 'No',
            confirmButtonText: 'Yes',
            reverseButtons: true
        }).then((result) => {
            if (result.value) {
                $('#'+id).submit()
            }
        })
    }
</script>
@endpush
