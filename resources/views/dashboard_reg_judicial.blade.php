@extends('layouts.app') @section('title', 'Judicial Officer Entry')
@section('page_heading') Judicial Officer Entry @endsection
@section('center_main_content')
<!-- styling the font color of options displaying in the select2 dropdown -->
<style>
.select2-results__option{
    color:#d43c3c;
}
</style>
<div class="row">    
    <div class="col-md-4 col-sm-6 col-xs-12">
        <div class="info-box bg-purple">
            <span class="info-box-icon"><i class="fa fa-lock" style="margin-top:20px"></i></span>

            <div class="info-box-content">
                <span class="info-box-text"><strong>Total Seizure</strong></span>
                <span class="info-box-number"></span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
</div>

    