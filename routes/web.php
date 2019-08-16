<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});

Route::resource('users', 'UserController')->except(['create', 'edit']);

Route::resource('court_complexes', 'CourtComplexController')->except(['create', 'edit']);
Route::get ( 'Court_complex-Datatable-Server-Side', 'CourtComplexController@index2' );
Route::get ( 'court_complex', function () {
	return view ( 'court_complexes.index' );
} );


Route::resource('courts', 'CourtController')->except(['create', 'edit']);
Route::get ( 'Court-Datatable-Server-Side', 'CourtController@index2' );
Route::get ( 'court', function () {
	return view ( 'courts.index' );
} );



Route::resource('districts', 'DistrictController')->except(['create', 'edit']);
Route::get ( 'District-Datatable-Server-Side', 'DistrictController@index2' );
Route::get ( 'district', function () {
	return view ( 'districts.index' );
} );




Route::resource('judicial_officer_postings', 'JudicialOfficerPostingController')
->except(['create', 'edit']);
Route::get ( 'Judicial_Officer_Posting-Datatable-Server-Side', 'JudicialOfficerPostingController@index_for_datatable' );
Route::get ( 'judicial_officer_posting', function () {
	return view ( 'judicial_officer_postings.index' );
} );
Route::get ( 'jo_postings', function () {
	return view ( 'jo_postings.index' );
} );

Route::post('jo_posting/search', 'JudicialOfficerPostingController@jo_current_posting_details');

Route::post('zone_pref/submit', 'JudicialOfficerPostingPreferenceController@store');

Route::get('zone_pref_jr', 'JudicialOfficerPostingController@zone_pref_details_fetch');

Route::post('zone_pref_jr/worksheet', 'JudicialOfficerController@store_worksheet');

Route::post('zone_pref_jr/worksheet_show', 'JudicialOfficerController@show_worksheet');

Route::resource('judicialofficerpostingpreferences', 'JudicialOfficerPostingPreferenceController')
->except(['create', 'edit']);
Route::get ( 'JudicialOfficerPostingPreference-Datatable-Server-Side', 'JudicialOfficerPostingPreferenceController@index_for_datatable' );
Route::get ( 'judicialofficerpostingpreference', function () {
	return view ( 'judicial_officer_posting_preferences.index' );
} );

Route::resource('judicial_officer_qualifications', 'JudicialOfficerQualificationController')
->except(['create', 'edit']);

Route::resource('recruitmentbatches', 'RecruitmentBatchController')->except(['create', 'edit']);
Route::get ( 'RecruitmentBatch-Datatable-Server-Side', 'RecruitmentBatchController@index_for_datatable' );
Route::get ( 'recruitmentbatch', function () {
	return view ( 'recruitmentbatches.index' );
} );


Route::resource('qualifications', 'QualificationController')->except(['create', 'edit']);
Route::get ( 'Qualification-Datatable-Server-Side', 'QualificationController@index_for_datatable' );
Route::get ( 'qualification', function () {
	return view ( 'qualifications.index' );
} );



Route::resource('states', 'StateController')->except(['create', 'edit']);
Route::get ( 'State-Datatable-Server-Side', 'StateController@index2' );
Route::get ( 'state', function () {
	return view ( 'states.index' );
} );


Route::resource('subdivisions', 'SubdivisionController')->except(['create', 'edit']);
Route::get ( 'Subdivision-Datatable-Server-Side', 'SubdivisionController@index_for_datatable' );
Route::get ( 'subdivision', function () {
	return view ( 'subdivisions.index' );
} );

Route::resource('zones', 'ZoneController')->except(['create', 'edit']);
Route::get ( 'Zone-Datatable-Server-Side', 'ZoneController@index_for_datatable' );
Route::get ( 'zone', function () {
	return view ( 'zones.index' );
} );

Route::resource('modes', 'ModeController')->except(['create', 'edit']);
Route::get ( 'Mode-Datatable-Server-Side', 'ModeController@index_for_datatable' );
Route::get ( 'mode', function () {
	return view ( 'modes.index' );
} );


Route::resource('castes', 'CasteController')->except(['create', 'edit']);
Route::get ( 'Caste-Datatable-Server-Side', 'CasteController@index2' );
Route::get ( 'caste', function () {
	return view ( 'castes.index' );
} );


Route::resource('religions', 'ReligionController')->except(['create', 'edit']);
Route::get ( 'Religion-Datatable-Server-Side', 'ReligionController@index2' );
Route::get ( 'religion', function () {
	return view ( 'religions.index' );
} );

Route::resource('jo_reporting_reviewings', 'JoReportingReviewingController')
->except(['create', 'edit']);
Route::get ( 'JoReportingReviewing-Datatable-Server-Side', 'JoReportingReviewingController@index2' );
Route::get ( 'jo_reporting_reviewing', function () {
	return view ( 'jo_reporting_reviewings.index' );
} );


Route::resource('judicial_officers', 'JudicialOfficerController')
->except(['create', 'edit']);
Route::get ( 'JudicialOfficer-Datatable-Server-Side', 'JudicialOfficerController@index2' );
Route::get ( 'judicial_officer', function () {
	return view ( 'judicial_officers.index' );
} );

Route::resource('designations', 'DesignationController')->except(['create', 'edit']);
Route::get ( 'Designation-Datatable-Server-Side', 'DesignationController@index2' );
Route::get ( 'designation', function () {
	return view ( 'designations.index' );
} );

Route::get ( 'lcr', function () {
	return view ( 'lcr.index' );
} );

Route::post('lcr_hc_end_populate/court_complex', 'LcrController@hc_index_court_complex');

Route::post('lcr_hc_end_populate/court', 'LcrController@hc_index_court');

Route::post('lcr_request_by_hc/databaseentry', 'LcrController@database_entry');

Route::get ( 'lcr_view', function () {
	return view ( 'lcr.lower_index' );
} );

Route::get ( 'lcr_compliance', function () {
	return view ( 'lcr.lower_compliance' );
} );

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');