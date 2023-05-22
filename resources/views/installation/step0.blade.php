@extends('layouts.blank')

@section('content')
    <div class="container">
        <div class="card mt-6">
            <div class="card-body">
                <div class="card-header">
                   <div class="row" style="width: 100%">
                       <div class="col-12">
                           <div class="text-center">
                               <h1 class="h3">StackFood Software Installation</h1>
                               <p>Provide information which is required.</p>
                           </div>
                       </div>
                   </div>
                </div>
                <div class="row mt-4">
                    <div class="col-3"></div>
                    <div class="col-md-6">
                        <ol class="list-group">
                            <li class="list-group-item text-semibold"><i class="fa fa-check"></i> Database Name</li>
                            <li class="list-group-item text-semibold"><i class="fa fa-check"></i> Database Username</li>
                            <li class="list-group-item text-semibold"><i class="fa fa-check"></i> Database Password</li>
                            <li class="list-group-item text-semibold"><i class="fa fa-check"></i> Database Hostname</li>
                        </ol>
                        <p style="font-size: 14px;" class="pt-5">
                            We will check permission to write several files,proceed..
                        </p>
                        <br>
                        <div class="text-center">
                            <a href="{{ route('step1') }}" class="btn btn-info text-light">
                                Ready ? Then start <i class="fa fa-forward"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-3"></div>
                </div>
            </div>
        </div>
    </div>
@endsection
