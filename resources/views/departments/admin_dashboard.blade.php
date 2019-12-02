{{--
<!-- views/Courts/index.blade.php -->
--}}
@extends('layouts.app') @section('title', 'Courts')
@section('page_heading') Courts @endsection
@section('center_main_content')


@endsection @include('layouts.1_column_content')


@section('main_container') @yield('1_column_content') @endsection

@section('meta')
@parent

@endsection

@section('end_scripts') @parent

@endsection

@section('body_attributes') @parent class="" @endsection
