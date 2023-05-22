@extends('layouts.vendor.app')
@section('title',__('messages.restaurant_view'))
@push('css_or_js')
    <!-- Custom styles for this page -->
@endpush

@section('content')
<div class="content container-fluid"> 
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header" >
                <h3 class="mb-0  text-capitalize position-absolute">{{__('messages.my_shop')}} {{__('messages.info')}} </h3>
            </div>
            <div class="card-body">
                @if($shop->cover_photo)
                <div class="row">
                    <div class="col-12"  style="max-height:320px; overflow-y: hidden;">
                         <img src="{{asset('storage/app/public/restaurant/cover/'.$shop->cover_photo)}}" onerror="this.src='{{asset('public/assets/admin/img/900x400/img1.jpg')}}'" style="max-height:auto;width: 100%;">
                    </div>
                </div>
                @endif
                <div class="row mt-2">
                    @if($shop->image=='def.png')
                        <div class="col-md-4">
                            <img height="280" width="280"  class="rounded-circle border"
                            src="{{asset('public/assets/back-end')}}/img/shop.png"
                            onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                            alt="User Pic">
                        </div>
                    @else
                        <div class="col-md-4">
                            <img src="{{asset('storage/app/public/restaurant/'.$shop->logo)}}" class="rounded-circle border"
                            onerror="this.src='{{asset('public/assets/admin/img/160x160/img1.jpg')}}'"
                            height="200" width="200" alt="">
                        </div>
                    @endif
                 
                    <!-- http://localhost/Food-multivendor/public/assets/admin/img/restaurant_cover.jpg -->
                    <div class="col-md-8 mt-4">
                        <span class="h4">{{__('messages.name')}} : {{$shop->name}}</span><br>
                        <span class="h5">{{__('messages.phone')}} : <a style="text-decoration:none; color:black;" href="tel:{{$shop->phone}}">{{$shop->phone}}</a></span><br>
                        <span class="h5">{{__('messages.address')}} : {{$shop->address}}</span><br><br>
                        <span class="h5">SWUSHD Comssion : {{(\App\Models\BusinessSetting::where('key','admin_commission')->first()->value)}}%</span><br>
                        <span class="h5">Credit Card Comssion : {{(\App\Models\BusinessSetting::where('key','card_commission')->first()->value)}}%</span><br>
                        <span class="h5">Flat Credit Card Comssion : {{(\App\Models\BusinessSetting::where('key','flat_card_commission')->first()->value)}}%</span><br>
                        <span class="h5">Foreign Credit Card Comssion : {{(\App\Models\BusinessSetting::where('key','foreign_card_commission')->first()->value)}}%</span><br>
                        <span class="h5">{{__('messages.vat/tax')}} : {{$shop->tax}}%</span><br><br>
                        <a class="btn btn-primary mt-1" href="{{route('vendor.shop.edit')}}">EDIT</a>
                    </div>
                </div>
               
            </div>
        </div>
    </div>
</div>
</div>
@endsection

@push('script')
    <!-- Page level plugins -->
@endpush
