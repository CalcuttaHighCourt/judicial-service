@extends('layouts.app') 
@section('content')
<!-- Main content -->
<div class="box box-default">
    <div class="box-header with-border">
        <h3 class="box-title">Composite Search Window </h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
        </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <div class="form-group row">
            <div class="col-sm-3">
                <label for="jo_code" class="control-label">JO CODE</label>
                <input class="form-control" type="text" id="jo_code" placeholder="e.g. WBxxxx" autocomplete="off"> 
            </div>

            <div class="col-sm-3">
                <label for="officer_name" class="control-label">NAME</label>
                <input class="form-control" type="text" id="officer_name" placeholder="Officer's Name" autocomplete="off"> 
            </div>

            <div class="col-sm-3">
                <label class="control-label">GENDER:</label>
                <br/>
                <input class="form-check-input" name="gender" type="radio" value="M">
                <label class="form-check-label" style="font-size:medium">
                    Male
                </label>
    
                <input class="form-check-input" name="gender" type="radio" value="F">
                <label class="form-check-label" style="font-size:medium">
                    Female
                </label>

                <input class="form-check-input" name="gender" type="radio" value="O">
                <label class="form-check-label" style="font-size:medium">
                    Other
                </label>
            </div>

            <div class="col-sm-3">  
                <br/>              
                <label for="couple_officer" class="control-label">COUPLE OFFICER</label>                                 
                <input class="form-check-input" type="checkbox" id="couple_officer"> 
            </div>

        </div>

        <div class="form-group row">
            <div class="col-xs-3">
                <label for="home_state" class="control-label">
                    HOME STATE 
                </label>
                <select id="home_state" class="form-control info-form-control select2" name="home_state" style="width:100%">
                    <option value="">Select an Option</option>
                    @include('states.state_options')
                </select>
            </div>

            <div class="col-xs-3">
                <label for="home_district" class="control-label">
                    HOME DISTRICT 
                </label>
                <select id="home_district" class="form-control info-form-control select2" name="home_district" style="width:100%">
                    <option value="">Select an Option</option>
                    @include('districts.district_options')
                </select>
            </div>

            <div class="col-xs-3">
                <label for="recruitment_batch_id" class="control-label">
                     RECRUITMENT BATCH 
                </label>
                <select id="recruitment_batch_id" class="form-control info-form-control select2" name="recruitment_batch_id" style="width:100%">
                    <option value="">Select an Option</option>
                    @include('recruitmentbatches.recruitmentbatch_options')
                </select>
            </div>

            <div class="col-xs-2">
                <label for="recruitment_batch_year" class="control-label">
                    BATCH YEAR 
                </label>
                <select class="form-control info-form-control select2" id="recruitment_batch_year" style="width:100%">
                    <option value="">Select Year</option>
                    @for($i=Date('Y');$i>=1950;$i--)
                        <option value="{{$i}}">{{$i}}</option>
                    @endfor
                </select>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-3">
                <div class="form-group">
                    <label>JOINING DATE IN A RANGE</label>
                    <input type="text" class="form-control date_range" id="joining_date" placeholder="e.g.  22/05/2020 - 02/06/2020" autocomplete="false">
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label>CONFIRMATION DATE IN A RANGE</label>
                    <input type="text" class="form-control date_range" id="confirmation_date" placeholder="e.g. 19/03/2020 - 12/06/2020" autocomplete="false">
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label>SUPERANNUATION DATE IN A RANGE</label>
                    <input type="text" class="form-control date_range" id="superannuation_date" placeholder="e.g. 22/05/2020 - 02/06/2020" autocomplete="false">
                </div>
            </div>

        </div>   
        
        <div class="form-group row">  
            <div class="col-md-3">
                <label>EDUCATIONAL QUALIFICATION</label>
                <select class="form-control info-form-control select2 degree_id" style="width:100%">
                    <option value="">Select an Option</option>
                    @include('qualifications.qualification_options')
                </select>
            </div>

            <div class="col-md-3">
                <label>PLACE OF PRACTICE</label>
                <select class="form-control info-form-control select2 subdivision_id" style="width:100%">
                    <option value="">Select an Option</option>
                    @include('subdivisions.subdivision_options')
                </select>
            </div>

            <div class="col-md-3">
                <label>YEAR OF PRACTICE IN A RANGE</label>
                <div class="input-group">                
                    <input type="number" class="year form-control" placeholder="e.g. 2010" autocomplete="false">
                    <div class="input-group-addon">TO</div>
                    <input type="number" class="year form-control" placeholder="e.g. 2015" autocomplete="false">
                </div>
            </div>

        </div>

        <div class="form-group row">
            <div class="col-md-3">
                <label>POSTING MODE</label>
                <select class="form-control info-form-control posting_id select2" id="mode_id" style="width:100%">
                    <option value="">Select an Option</option>
                    @include('modes.mode_options')
                </select>
            </div>

            <div class="col-md-3">
                <label>GRADE / RANK</label>
                <select class="form-control info-form-control select2 rank_id" style="width:100%">
                    <option value="">Select an Option</option>
                    @include('ranks.rank_options')
                </select>
            </div>

            <div class="col-md-3">
                <label>DESIGNATION</label>
                <select class="form-control info-form-control select2 designation_id" style="width:100%">
                    <option value="">Select an Option</option>
                    @include('designations.designation_options')
                </select>
            </div>

            <div class="col-md-3">
                <label>PLACE OF POSTING</label>
                <select class="form-control info-form-control place_of_posting select2" id="place_of_posting" style="width:100%">
                    <option value="">Select an Option</option>
                    @include('place_of_posting.place_of_posting_option')
                </select>
            </div>

        </div>

        <div class="form-group row">
            <div class="col-md-3">
                <label>DEPUTATION DESIGNATION</label>
                <select class="form-control info-form-control deputation_designation select2" id="deputation_designation" style="width:100%">
                    <option value="">Select an Option</option>
                    @foreach(App\JudicialOfficerPosting::where('deputation_designation','<>','')
                                                        ->orWhere('deputation_posting_place','<>','')
                                                        ->select('deputation_designation','deputation_posting_place')
                                                        ->distinct()->get() as $posting)
                        <option value="{{$posting->deputation_designation}}|{{$posting->deputation_posting_place}}">{{$posting->deputation_designation}}, {{$posting->deputation_posting_place}}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label>POSTING DATE IN A RANGE</label>
                    <input type="text" class="form-control date_range" id="posting_date" placeholder="e.g. 11/07/2015 - 02/06/2020"  autocomplete="false">
                </div>
            </div>

            <div class="col-md-3">
                <label>ZONE OF POSTING</label>
                <select class="form-control info-form-control zone_id select2" id="zone_id" style="width:100%">
                    <option value="">Select an Option</option>
                    @include('zones.zone_options')
                </select>
            </div>

            <div class="col-sm-3">  
                <br/>              
                <label for="couple_officer" class="control-label">PRESENT POSTING</label>                                 
                <input class="form-check-input" type="checkbox" id="present_posting"> 
            </div>

        </div>

        <div class="form-group row">
            <div class="col-md-3">
                <label>CAREER PROGRESSION (ACP)</label>
                <select class="form-control info-form-control career_progression select2" id="career_progression" style="width:100%">
                    <option value="">Select an Option</option>
                    @include('career_progression_stages.career_progression_options')
                </select>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label>ACP CONFIRMATION DATE IN A RANGE</label>
                    <input type="text" class="form-control date_range" id="cp_date" placeholder="e.g.  22/05/2020 - 02/06/2020" autocomplete="false">
                </div>
            </div>

        </div>
     
    </div>
</div>

	

<meta name="_token" content="{!! csrf_token() !!}" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="{{asset('js/jquery/jquery.min.js')}}"></script>

<script>

$(document).ready(function(){

    // Datepicker Initialization
    $(".date").datepicker({
        format: "dd-mm-yyyy",
        autoclose: true,   
        orientation: "auto",
        endDate: '+0d',
    });

    // Select2 initialization
    $(".select2").select2();

    // For Joining Date Range Picker :: STARTS
    var joining_from_date;
    var joining_to_date;
    $("#joining_date").daterangepicker({
            opens: 'left',
            autoUpdateInput: false,
            endDate:moment(),
            maxDate:moment(),
            locale: {
                format: 'DD/MM/YYYY',
                cancelLabel: 'Clear'
            }
        }, function(start, end, label) {
            joining_from_date = start.format('YYYY-MM-DD');
            joining_to_date = end.format('YYYY-MM-DD');
    });

    $("#joining_date").on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
    });

    $("#joining_date").on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });            
    // For Joining Date Range Picker :: ENDS


    // For Confirmation Date Range Picker :: STARTS
    var confirmation_from_date;
    var confirmation_to_date;
    $("#confirmation_date").daterangepicker({
            opens: 'left',
            autoUpdateInput: false,
            endDate:moment(),
            maxDate:moment(),
            locale: {
                format: 'DD/MM/YYYY',
                cancelLabel: 'Clear'
            }
        }, function(start, end, label) {
            confirmation_from_date = start.format('YYYY-MM-DD');
            confirmation_to_date = end.format('YYYY-MM-DD');
    });

    $("#confirmation_date").on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
    });

    $("#confirmation_date").on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });            
    // For Confirmation Date Range Picker :: ENDS


    // For Superannuation Date Range Picker :: STARTS
    var superannuation_from_date;
    var superannuation_to_date;
    $("#superannuation_date").daterangepicker({
            opens: 'left',
            autoUpdateInput: false,
            endDate:moment(),
            maxDate:moment(),
            locale: {
                format: 'DD/MM/YYYY',
                cancelLabel: 'Clear'
            }
        }, function(start, end, label) {
            superannuation_from_date = start.format('YYYY-MM-DD');
            superannuation_to_date = end.format('YYYY-MM-DD');
    });

    $("#superannuation_date").on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
    });

    $("#superannuation_date").on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });            
    // For Superannuation Date Range Picker :: ENDS


    // For Posting Date Range Picker :: STARTS
    var posting_from_date;
    var posting_to_date;
    $("#posting_date").daterangepicker({
            opens: 'left',
            autoUpdateInput: false,
            endDate:moment(),
            maxDate:moment(),
            locale: {
                format: 'DD/MM/YYYY',
                cancelLabel: 'Clear'
            }
        }, function(start, end, label) {
            joining_from_date = start.format('YYYY-MM-DD');
            joining_to_date = end.format('YYYY-MM-DD');
    });

    $("#posting_date").on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
    });

    $("#posting_date").on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });            
    // For Posting Date Range Picker :: ENDS


    // For CP Date Range Picker :: STARTS
    var cp_from_date;
    var cp_to_date;
    $("#cp_date").daterangepicker({
            opens: 'left',
            autoUpdateInput: false,
            endDate:moment(),
            maxDate:moment(),
            locale: {
                format: 'DD/MM/YYYY',
                cancelLabel: 'Clear'
            }
        }, function(start, end, label) {
            joining_from_date = start.format('YYYY-MM-DD');
            joining_to_date = end.format('YYYY-MM-DD');
    });

    $("#cp_date").on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
    });

    $("#cp_date").on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });            
    // For CP Date Range Picker :: ENDS


});

</script>
@endsection


