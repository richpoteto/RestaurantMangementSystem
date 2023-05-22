@extends('layouts.landing.app')

@section('title','About Us')

@section('content')
    <main>
        <div class="main-body-div">
            <!-- Top Start -->
            <section class="top-start" style="min-height: 100px">
                <div class="container">
                    <div class="row">
                        <div class="col-12 mt-2 text-center">
                            <h1>{{__('messages.about_us')}}</h1>
                        </div>
                        <div class="col-12">
                            {!! $data !!}
                        </div>
                    </div>
                </div>
            </section>
            <!-- Top End -->
        </div>
    </main>
@endsection
