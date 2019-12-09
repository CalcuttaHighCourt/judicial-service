<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
<link rel="icon" href="{{asset('images/favicon.ico')}}">
<!-- Bootstrap core CSS -->
<link href="{{asset('css/bootstrap.min.css')}}" rel="stylesheet">
<!--  our CSS -->
<link href="{{asset('css/style.css')}}" rel="stylesheet">
<link href="{{asset('css/bootstrap-submenu.min.css')}}" rel="stylesheet">
<link href="{{asset('css/font-awesome.min.css')}}" rel="stylesheet">

<link href="{{asset('css/datatable/dataTables.bootstrap.min.css')}}" rel="stylesheet">

<link href="{{asset('css/fileinput/fileinput.min.css')}}" rel="stylesheet">

<!-- Select-2 -->
<link rel="stylesheet" href="{{asset('css/select2.min.css')}}">
<link rel="stylesheet" href="{{asset('css/bootstrap-datepicker.css')}}">  

<!-- Editor -->
<link rel="stylesheet" href="{{asset('css/bootstrap3-wysihtml5.min.css')}}">


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="Welcome to the Judicial Officers Portal of Calcutta High Court. NIC-WBSC and Calcutta High Court's Software development unit have developed this web portal.">
<meta name="author" content="Anabil Bhattacharya (Software Developer, CHC), Rupsa Bose (Software Developer, CHC), Avishek Gayen (Software Developer, CHC)">



</head>
<div class="panel panel-default col-sm-offset-3 col-sm-5">
    <div class="panel-heading">Login</div>
    <div class="panel-body">
        <form class="form-horizontal" role="form" method="POST" action="{{ url('/login') }}" autocomplete="off">
            {{ csrf_field() }}

                <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                    <label for="email" class="col-sm-offset-1 col-sm-4 control-label">Username <span class="text-muted">or</span> E-Mail Address</label>

                    <div class="col-sm-6">
                   
                        <input id="email"  type="email" class="form-control" name="email" value="{{ old('email') }}">

                        @if ($errors->has('email'))
                            <span class="help-block">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                    <label for="password" class="col-sm-offset-1 col-sm-4 control-label">Password</label>

                    <div class="col-sm-6">
                        <input id="password" type="password" class="form-control" name="password">

                        @if ($errors->has('password'))
                            <span class="help-block">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-4">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="remember"> Remember Me
                            </label>
                            <a class="btn btn-link" href="{{ url('/password/reset') }}">Forgot Your Password?</a>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-2 ">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa fa-btn fa-sign-in"></i> Login
                        </button>
                </div>
            </div>
        </form>
    </div>
</div>




@section('main_container')

	@yield('1_column_content')

@endsection

@section('body_attributes')
	class=""
@endsection