{{--
<!-- views/Courts/index.blade.php -->
--}}
@extends('layouts.app') @section('title', 'Courts')
@section('page_heading') Courts @endsection
@section('center_main_content')

<div class="col-sm-12">

    <!-- Bootstrap Boilerplate... -->
    <div id="info-panel" class="panel panel-default" style="background:white;">
        <!-- IIIIIIIIIII -->
        <div id="info-panel-heading" class="panel-heading"><h1 align="center">ADMIN DASHBOARD</h1></div>
        <!-- IIIIIIIIIII -->
        <div class="panel-body">
            
            <h3 style="color:red;">Work in Progress</h3>
        </div>
    </div>
</div>

@endsection @include('layouts.1_column_content')


@section('main_container') @yield('1_column_content') @endsection

@section('meta')
@parent

@endsection

@section('end_scripts') @parent

@endsection

@section('body_attributes') @parent class="" @endsection
