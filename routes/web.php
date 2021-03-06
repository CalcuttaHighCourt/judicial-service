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

Auth::routes();
	
Route::get('/', function () {
    return view('auth.login');
});


// Master Maintenance :: START
Route::group(['middleware' => ['auth','role_manager:Administrator']],function (){

	Route::resource('users', 'UserController')->except(['create', 'edit']);

	Route::get ( 'dashboard/admin', function () {
		return view ( 'departments.admin_dashboard' );
	} );


	/*Court*/

	Route::resource('courts', 'CourtController')->except(['create', 'edit']);

	Route::get ( 'Court-Datatable-Server-Side', 'CourtController@index2' );
	
	Route::get ( 'court', function () {
		return view ( 'courts.index' );
	} );


	/*District*/

	Route::resource('districts', 'DistrictController')->except(['create', 'edit']);

	Route::get ( 'District-Datatable-Server-Side', 'DistrictController@index2' );

	Route::get ( 'district', function () {
		return view ( 'districts.index' );
	} );


	/*User type*/

	Route::get ('User_types-Datatable-Server-Side', 'UserTypeController@index_for_datatable' );

	Route::resource('usertypes', 'UserTypeController')->except(['create', 'edit']);

	Route::get ( 'user_type', function () {
		return view ( 'user_types.index' );
		} );
	

	/*Qualification*/

	Route::resource('judicial_officer_qualifications', 'JudicialOfficerQualificationController')
	->except(['create', 'edit']);

	Route::resource('qualifications', 'QualificationController')->except(['create', 'edit']);

	Route::get ( 'Qualification-Datatable-Server-Side', 'QualificationController@index_for_datatable' );

	Route::get ( 'qualification', function () {
		return view ( 'qualifications.index' );
	} );


	/*Recruitement Batches */

	Route::resource('recruitmentbatches', 'RecruitmentBatchController')->except(['create', 'edit']);

	Route::get ( 'RecruitmentBatch-Datatable-Server-Side', 'RecruitmentBatchController@index_for_datatable' );

	Route::get ( 'recruitmentbatch', function () {
		return view ( 'recruitmentbatches.index' );
	} );


	/*State */

	Route::resource('states', 'StateController')->except(['create', 'edit']);

	Route::get ( 'State-Datatable-Server-Side', 'StateController@index2' );

	Route::get ( 'state', function () {
		return view ( 'states.index' );
	} );
	

	/*Subdivision */

	Route::resource('subdivisions', 'SubdivisionController')->except(['create', 'edit']);

	Route::get ( 'Subdivision-Datatable-Server-Side', 'SubdivisionController@index_for_datatable' );

	Route::get ( 'subdivision', function () {
		return view ( 'subdivisions.index' );
	} );


	/*Zone*/

	Route::resource('zones', 'ZoneController')->except(['create', 'edit']);

	Route::get ( 'Zone-Datatable-Server-Side', 'ZoneController@index_for_datatable' );

	Route::get ( 'zone', function () {
		return view ( 'zones.index' );
	} );


	/*Mode */

	Route::resource('modes', 'ModeController')->except(['create', 'edit']);

	Route::get ( 'Mode-Datatable-Server-Side', 'ModeController@index_for_datatable' );

	Route::get ( 'mode', function () {
		return view ( 'modes.index' );
	} );


	/*Lcr Department */

	Route::resource('departments', 'LcrDepartmentController')->except(['create', 'edit']);

	Route::post( 'Department-Datatable-Server-Side', 'LcrDepartmentController@index_for_datatable' );


	/*Designation*/

	Route::resource('designations', 'DesignationController')->except(['create', 'edit']);

	Route::post ( 'Designation-Datatable-Server-Side', 'DesignationController@index_for_datatable' );

	Route::post('designation_edit', 'DesignationController@update_designation');

	Route::get ( 'designation', function () {
		return view ( 'designations.index' );
	});
	

	/*Register */

	Route::get ('register', 'Auth\RegisterController@showRegistrationForm');

	Route::post ('register', 'Auth\RegisterController@register');

});
// Master Maintenance :: END


Route::group(['middleware' => ['auth','role_manager:Judicial Officer']],function (){

	/*Posting zone preference*/

	Route::get ( 'dashboard/jo', function () {
		return view ( 'jo_entry_form.jo_dashboard' );
	} );

	Route::get ('profile', 'JoEntryFormController@profile')->name('profile');

	Route::get('zone_pref_jr', 'JudicialOfficerPostingPreferenceController@fetch_zone');

	Route::post('zone_pref_details/table_show', 'JudicialOfficerPostingPreferenceController@zone_pref_table_content');

	
	Route::post('zone_pref_jr/draft', 'JudicialOfficerPostingPreferenceController@store');

	Route::post('zone_pref_jr/submit', 'JudicialOfficerPostingPreferenceController@submit');

	Route::post('zone_pref_details/populate', 'JudicialOfficerPostingPreferenceController@zone_pref_content');

	Route::post('zone_pref/options', 'JudicialOfficerPostingPreferenceController@zone_selection');

	
	//JO's Digital Diary
	Route::post('zone_pref_jr/worksheet', 'JudicialOfficerController@store_worksheet');

	Route::post('zone_pref_jr/worksheet_show', 'JudicialOfficerController@show_worksheet');


	//jo preference not needed right
	Route::resource('judicialofficerpostingpreferences', 'JudicialOfficerPostingPreferenceController')
	->except(['create', 'edit']);

	Route::get ( 'JudicialOfficerPostingPreference-Datatable-Server-Side', 'JudicialOfficerPostingPreferenceController@index_for_datatable' );

	Route::get ( 'judicialofficerpostingpreference', function () {
		return view ( 'judicial_officer_posting_preferences.index' );
	} );

	
});

	Route::group(['middleware' => ['auth','role_manager:Inspection|Administrator']],function (){


		/* Grade */

		Route::resource('grades', 'GradeController')->except(['create', 'edit']);

		Route::Post('show_grades', 'GradeController@get_all_grade_data' );


		//Route::get ( 'Grade-Datatable-Server-Side', 'GradeController@index2' );

		Route::get ( 'grade', function () {
			return view ( 'acr.grade_details' );
		} );

		/*ACR History*/

		Route::get ( 'acr_history', function () {
			return view ( 'acr.acr_history' );
		} );

		Route::Post('acr_history/store', 'ACRController@acr_history_save' );

		Route::Post('populate_assessment_year/history','ACRController@officerwise_assessment_year');

		/*ACR Serach*/

		Route::get ( 'acr_fetch', function () {
			return view ( 'acr.acr_fetch' );
		} );

		Route::Post('acr_fetch/search', 'ACRController@fetch_acr_history');

		/*Document Type */

		Route::resource('document_types', 'DocumentTypeController')->except(['create', 'edit']);

		Route::post('document_edit', 'DocumentTypeController@update_documents');

		Route::post( 'Document-Datatable-Server-Side', 'DocumentTypeController@index_for_datatable' );

	});

	/*Inspection */

	Route::group(['middleware' => ['auth','role_manager:Inspection']],function (){

		Route::get ( 'dashboard/inspection', function () {
			return view ( 'departments.inspection_dashboard' );
		} );

	});


	/*Appointment */

	Route::group(['middleware' => ['auth','role_manager:Appointment']],function (){

		Route::get ( 'dashboard/appointment', function () {
			return view ( 'departments.appointment_dashboard' );
		} );

		Route::get ( 'appointment', function () {
			return view ( 'appointments.index' );
		} );

		// Route::get ( 'pref_windows', function () {
		// 	return view ( 'appointments.preference_window_open' );
		// } );

		Route::get('jo_list_for_pref_window',
		'JudicialOfficerPostingPreferenceController@list_of_valid_judicial_officers');

		Route::post('disable_window_for_jo_pref',
		'JudicialOfficerPostingPreferenceController@closing_window_jo_pref');

		Route::post('enable_window_for_jo_pref',
		'JudicialOfficerPostingPreferenceController@openning_individual_window');

		Route::post('disable_pref_window_for_all_active_jo',
		'JudicialOfficerPostingPreferenceController@closing_preference_window_for_all_judicial_officers');

		Route::post('enable_pref_window_for_all_active_jo',
		'JudicialOfficerPostingPreferenceController@openning_preference_window_for_all_judicial_officers');

		Route::post('datatable_for_active_window',
		'JudicialOfficerPostingPreferenceController@detailed_table');

		Route::post('datatable_for_zonewise_posting',
		'JudicialOfficerPostingPreferenceController@zonewise_tenurewise_jo');

		
		// Route::post('zonewise_tenure_for_jo',
		// 'JudicialOfficerPostingPreferenceController@zonewise_tenurewise_jo');
		
		Route::get ('jo_grade', function () {
			return view ('jo_grade.index');
		});

		Route::post('show_details_for_posting_preference', 'JudicialOfficerPostingPreferenceController@preference_display_for_appointment');

		Route::get('download_posting_preferences/{rank}', 'JoDetailsPdfController@download_posting_preferences');
		
		Route::get('download_filtered_jo_details/{zone}/{cadre}/{year}/{month}/{day}/{terminal_date}', 'JoDetailsPdfController@zonewise_tenurewise_jo_download');

		Route::post('activate_window_for_jo_preference', 'JudicialOfficerPostingPreferenceController@activate_preference_window');
		
		Route::post('jo_grade/rank_wise_jo_list', 'JoGradeController@rank_wise_jo_list')->name('rank_wise_jo_list');

		Route::post('jo_grade/save_jo_grade', 'JoGradeController@save_jo_grade')->name('save_jo_grade');

		Route::get ('show_grade_list', function () {
			return view ('jo_grade.show_grade');
		});
		
		Route::post('jo_grade/show_jo_graded_list', 'JoGradeController@get_final_jo_graded_list')->name('show_jo_graded_list');

		Route::post('jo_grade/jo_list_info', 'JoGradeController@get_jo_list_info')->name('jo_list_info');


	});


	/*Inspection and Appointmen and Administrator */


	Route::group(['middleware' => ['auth','role_manager:Inspection|Administrator|Appointment']],function (){
		
		Route::get ('jo_entry_form', function () {
			return view ('jo_entry_form.index');
		});

		Route::resource('jo_entry', 'JoEntryFormController')->except(['create', 'edit']);

		Route::post('jo_entry/fetch_district','JoEntryFormController@fetch_district')->name('fetch_district');

		Route::post('jo_entry/fetch_rank_designation', 'JoEntryFormController@fetch_rank_designation')->name('fetch_rank_designation');

		Route::post('jo_entry/fetch_jo_details_pdf', 'JoDetailsPdfController@fetch_jo_details_pdf')->name('fetch_jo_details_pdf');

		Route::post('jo_entry/upload_image', 'JoEntryFormController@jo_upload_image')->name('jo_image_upload');

		Route::post('jo_entry/upload_document', 'JoEntryFormController@jo_upload_document')->name('upload_jo_document');

		Route::post('jo_entry/remove_document', 'JoEntryFormController@remove_jo_document')->name('remove_jo_document');

		Route::post('jo_entry/show_all_jo', 'JoEntryFormController@show_all_jo')->name('list_of_jo');
		
		Route::get ('modify_jo_details', function () {
			return view ('jo_entry_form.modify_jo_details');
		});
		
		Route::post('fetch_jo_details','JoEntryFormController@fetch_jo_details')->name('fetch_jo_details');

		Route::post('fetch_rankwise_career_progression_stages','JoEntryFormController@fetch_rankwise_career_progression_stages')->name('fetch_rankwise_career_progression_stages');

		Route::post('update_basic_details','JoEntryFormController@update_basic_details')->name('update_basic_details');

		Route::post('update_contact_details','JoEntryFormController@update_contact_details')->name('update_contact_details');
		
		Route::post('update_profile_image','JoEntryFormController@update_profile_image')->name('update_profile_image');

		Route::post('update_posting_details','JoEntryFormController@update_posting_details')->name('update_posting_details');

		Route::post('update_practice_details','JoEntryFormController@update_practice_details')->name('update_practice_details');

		Route::post('update_qualification_details','JoEntryFormController@update_qualification_details')->name('update_qualification_details');

		Route::post('update_career_progression_details','JoEntryFormController@update_career_progression_details')->name('update_career_progression_details');

		Route::post('jo_posting/search', 'JudicialOfficerPostingController@jo_current_posting_details');

		Route::get ('search_jo_details', function () {
			return view ('search.search_jo_details');
		});

	});

	/*Court */

	Route::group(['middleware' => ['auth','role_manager:Court']],function (){

		/*LCR */

		Route::get ( 'dashboard/court', function () {
			return view ( 'courts.court_dashboard' );
		} );

		Route::post('lower_compliance/submit_comply', 'LcrController@submit_comply')->name('submit_comply');

		Route::post('lower_compliance/submit_forward', 'LcrController@submit_forward')->name('submit_forward');

		Route::get('lcr_view', 'LcrController@fetch_details');

		Route::get ( 'lcr_compliance/{lcr_id}', 'LcrController@complaince_details' );

		

		
	});


	Route::group(['middleware' => ['auth','role_manager:Department']],function (){


		Route::get ( 'dashboard/dept', function () {
			return view ( 'departments.dept_dashboard' );
		} );

		Route::post('lcr_hc_end_populate/subdivision', 'LcrController@hc_index_subdivision');

		Route::post('lcr_hc_end_populate/court', 'LcrController@hc_index_court');

		Route::post('lcr_request_by_hc/databaseentry', 'LcrController@database_entry');

		Route::post ( 'lcr_details', 'LcrController@fetch_status_details')->name('fetch_status');

		Route::get ( 'lcr_hc', function () {
			return view ( 'lcr.index' );
		} );



	});

	// Route::post('lcr_compliance/{lcr_id}', 'LcrController@show');

	

	

Route::get('/home', 'HomeController@index')->name('home');