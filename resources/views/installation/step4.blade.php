@extends('layouts.blank')
@section('content')
    <div class="container">
        <div class="card mt-6">
            <div class="card-body">
                <div class="card-header">
                    <div class="row" style="width: 100%">
                        <div class="col-12">
                            @if(session()->has('error'))
                                <div class="alert alert-danger" role="alert">
                                    {{session('error')}}
                                </div>
                            @endif
                            <div class="mar-ver pad-btm text-center">
                                <h1 class="h3">Import Software Database</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pt-5">
                    <div class="col-3"></div>
                    <div class="col-md-12">

                        <p class="text-muted font-13 text-center">
                            <strong>Database is connected <i class="fa fa-check"></i></strong>. Proceed
                            <strong>Press Install</strong>.
                            This automated process will configure your database.
                        </p>
                        @if(session()->has('error'))
                            <div class="text-center mar-top pad-top">
                                <a href="{{ route('force-import-sql') }}" class="btn btn-danger" onclick="showLoder()">Force
                                    Import Database</a>
                            </div>
                        @else
                            <div class="text-center mar-top pad-top">
                                <a href="{{ route('import_sql') }}" class="btn btn-info" onclick="showLoder()">Import
                                    Database</a>
                            </div>
                        @endif

                    </div>
                    <div class="col-3"></div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script type="text/javascript">
        function showLoder() {
            $('#loading').fadeIn();
        }
    </script>
@endsection
