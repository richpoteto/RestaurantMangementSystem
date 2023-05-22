@extends('layouts.admin.app')

@section('title','Messages')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        .conv-active {
            background: #f3f3f3 !important;
        }
    </style>
@endpush

@section('content')

    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb breadcrumb-no-gutter">
                            <li class="breadcrumb-item"><a class="breadcrumb-link" href="javascript:">{{__('messages.customers')}}</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">{{__('messages.customer')}} {{__('messages.messages')}}</li>
                        </ol>
                    </nav>

                    <h1 class="page-header-title">{{__('messages.conversation')}} {{__('messages.list')}}</h1>
                </div>

                <div class="col-sm-auto">

                </div>
            </div>
        </div>
        <!-- End Page Header -->

        <div class="row">
            <div class="col-lg-4 col-4">
                <!-- Card -->
                <div class="card mb-3 mb-lg-5">
                    <!-- Body -->
                    <div class="card-body" style="overflow-y: scroll;height: 600px">
                        <div class="border-bottom"></div>
                        @php($array=[])
                        @foreach($conversations as $conv)
                            @if(in_array($conv->user_id,$array)==false)
                                @php(array_push($array,$conv->user_id))
                                @php($user=\App\Models\User::find($conv->user_id))
                                @php($unchecked=\App\Models\Conversation::where(['user_id'=>$conv->user_id,'checked'=>0])->count())
                                <div
                                    class="d-flex border-bottom pb-2 pt-2 justify-content-between align-items-center customer-list {{$unchecked!=0?'conv-active':''}}"
                                    onclick="viewConvs('{{route('admin.message.view',[$conv->user_id])}}','customer-{{$conv->user_id}}')"
                                    style="cursor: pointer; padding-left: 6px; border-radius: 10px;margin-top: 2px;"
                                    id="customer-{{$conv->user_id}}">
                                    <div class="avatar avatar-lg avatar-circle d-none d-md-block">
                                        <img class="avatar-img" style="width: 54px;height: 54px"
                                             src="{{asset('storage/app/public/profile/'.$user['image'])}}"
                                             onerror="this.src='{{asset('public/assets/admin')}}/img/160x160/img1.jpg'"
                                             alt="Image Description">
                                    </div>
                                    <h5 class="mb-0 mr-3">
                                        {{$user['f_name'].' '.$user['l_name']}} <span
                                            class="{{$unchecked!=0?'badge badge-info':''}}">{{$unchecked!=0?$unchecked:''}}</span>
                                    </h5>
                                </div>
                            @endif
                        @endforeach
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
            <div class="col-lg-8 col-8" id="view-conversation">
                <center style="margin-top: 10%">
                    <h4 style="color: rgba(113,120,133,0.62)">{{__('messages.view')}} {{__('messages.conversation')}}</h4>
                </center>
                {{--view here--}}
            </div>
        </div>
        <!-- End Row -->
    </div>

@endsection

@push('script_2')
    <script>
        function viewConvs(url,id_to_active) {
            $('.customer-list').removeClass('conv-active');
            $('#'+id_to_active).addClass('conv-active');
            $.get({
                url: url,
                success: function (data) {
                    $('#view-conversation').html(data.view);
                }
            });
        }

        function replyConvs(url) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: url,
                data: $('#reply-form').serialize(),
                success: function (data) {
                    toastr.success('Message sent', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                    $('#view-conversation').html(data.view);
                },
                error() {
                    toastr.error('Reply message is required!', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        }

    </script>
@endpush
