@extends('layouts.admin.app')

@section('title','Withdraw Request')

@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                <li class="breadcrumb-item" aria-current="page">{{__('messages.withdraw')}}  </li>
            </ol>
        </nav>

        <!-- Page Heading -->
        <div class="row" style="margin-top: 20px">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>{{ __('messages.withdraw')}} {{ __('messages.request')}} {{ __('messages.table')}} <span
                                class="badge badge-soft-dark ml-2">{{$withdraw_req->total()}}</span></h5>
                        <select name="withdraw_status_filter" onchange="status_filter(this.value)"
                                class="custom-select float-right" style="width: 200px">
                            <option
                                value="all" {{session()->has('withdraw_status_filter') && session('withdraw_status_filter') == 'all'?'selected':''}}>
                                {{__('messages.all')}}
                            </option>
                            <option
                                value="approved" {{session()->has('withdraw_status_filter') && session('withdraw_status_filter') == 'approved'?'selected':''}}>
                                {{__('messages.approved')}}
                            </option>
                            <option
                                value="denied" {{session()->has('withdraw_status_filter') && session('withdraw_status_filter') == 'denied'?'selected':''}}>
                                {{__('messages.denied')}}
                            </option>
                            <option
                                value="pending" {{session()->has('withdraw_status_filter') && session('withdraw_status_filter') == 'pending'?'selected':''}}>
                                {{__('messages.pending')}}
                            </option>

                        </select>
                    </div>
                    <div class="card-body" style="padding: 0">
                        <div class="table-responsive">
                            <table id="datatable"
                                   class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                                   style="width: 100%">
                                <thead class="thead-light">
                                <tr>
                                    <th>{{__('messages.sl#')}}</th>
                                    <th>{{__('messages.amount')}}</th>
                                    {{-- <th>{{__('messages.note')}}</th> --}}
                                    <th>{{ __('messages.restaurant') }}</th>
                                    <th>{{__('messages.request_time')}}</th>
                                    <th>{{__('messages.status')}}</th>
                                    <th style="width: 5px">{{__('messages.action')}}</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($withdraw_req as $k=>$wr)
                                    <tr>
                                        <td scope="row">{{$k+$withdraw_req->firstItem()}}</td>
                                        <td>{{$wr['amount']}}</td>
                                        {{-- <td>{{$wr->__action_note}}</td> --}}
                                        <td>
                                            @if($wr->vendor && isset($wr->vendor->restaurants[0]))
                                            <a class="deco-none"
                                               href="{{route('admin.vendor.view',[$wr->vendor['id']])}}">{{ Str::limit($wr->vendor?$wr->vendor->restaurants[0]->name:__('messages.Restaurant deleted!'), 20, '...') }}</a>
                                            @else
                                            {{__('messages.Restaurant deleted!') }}
                                            @endif
                                        </td>
                                        <td>{{date('Y-m-d '.config('timeformat'),strtotime($wr->created_at))}}</td>
                                        <td>
                                            @if($wr->approved==0)
                                                <label class="badge badge-primary">Pending</label>
                                            @elseif($wr->approved==1)
                                                <label class="badge badge-success">Approved</label>
                                            @else
                                                <label class="badge badge-danger">Denied</label>
                                            @endif
                                        </td>
                                        <td>
                                            @if($wr->vendor)
                                            <a href="{{route('admin.vendor.withdraw_view',[$wr['id'],$wr->vendor['id']])}}"
                                               class="btn btn-white btn-sm"><i class="tio-visible"></i>
                                            </a>
                                            @else
                                            {{__('messages.restaurant').' '.__('messages.deleted') }}
                                            @endif
                                            {{--<a class="btn btn-danger btn-sm" href="javascript:"
                                            onclick="form_alert('withdraw-{{$wr['id']}}','Want to delete this  ?')">{{__('messages.Delete')}}</a>
                                            <form action="{{route('vendor.withdraw.close',[$wr['id']])}}"
                                                  method="post" id="withdraw-{{$wr['id']}}">
                                                @csrf @method('delete')
                                            </form>--}}

                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer">
                        {{$withdraw_req->links()}}
                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection

@push('script_2')
    <script>
        function status_filter(type) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.post({
                url: '{{route('admin.vendor.status-filter')}}',
                data: {
                    withdraw_status_filter: type
                },
                beforeSend: function () {
                    $('#loading').show()
                },
                success: function (data) {
                    console.log(data)
                    location.reload();
                },
                complete: function () {
                    $('#loading').hide()
                }
            });
        }
    </script>
@endpush

