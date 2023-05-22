@extends('layouts.blank')
@section('content')
    <div class="container">
        <div class="card mt-6">
            <div class="card-body">
                <div class="card-header">
                    <div class="row" style="width: 100%">
                        <div class="col-12">
                            <div class="mar-ver pad-btm text-center">
                                <h1 class="h3">Admin Account Settings <i class="fa fa-cogs"></i></h1>
                                <p>Provide your information.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pt-5">
                    <div class="col-3"></div>
                    <div class="col-md-6">
                        <div class="text-muted font-13">
                            <form method="POST" action="{{ route('system_settings') }}">
                                @csrf
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="system_name">Business Name</label>
                                            <input type="text" class="form-control" name="business_name" required>
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="admin_name">First Name</label>
                                            <input type="text" class="form-control" name="f_name" required>
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="admin_name">Last Name</label>
                                            <input type="text" class="form-control" name="l_name" required>
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="admin_email">Email</label>
                                            <input type="email" class="form-control" id="admin_email" name="email" required>
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="form-group">
                                            <label for="admin_phone">Phone</label>
                                            <input type="text" class="form-control" name="phone" required>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="admin_password">Admin Password (At least 8 characters)</label>
                                            <input type="text" class="form-control" id="admin_password" name="password"
                                                   required>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-info">Continue</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-3"></div>
                </div>
            </div>
        </div>
    </div>
@endsection
