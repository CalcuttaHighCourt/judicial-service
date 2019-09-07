<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class JoEntryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'jo_code' => 'required|unique:judicial_officers,jo_code|alpha_dash',
            'officer_name' => 'required|alpha|max:50',
            'gender' => 'required|alpha|max:10',
            'guardian_name' => 'required|alpha|max:50',
            'gurdian_relation' => 'required|alpha|max:30',
            'date_of_birth' => 'required|date_format:d-m-Y',
            'home_state_id' => 'required|integer|exists:states,id',
            'home_district_id' => 'required|integer|exists:districts,id',
            'hometown' => 'required|alpha|max:50',
            'present_address' => 'required|alpha_dash|max:255',
            'permanent_address' => 'required|alpha_dash|max:255',
            'religion_id' => 'nullable|integer|exists:religions,id',
            'category_id' => 'nullable|integer|exists:castes,id',
            'blood_group' => 'nullable|max:5',
            'identification_mark' => 'nullable|alpha_dash|max:255',
            'aadhar_no' => 'nullable|integer|max:12',
            'pan_no' => 'nullable|alpha_num|max:10',
            'pf_no' => 'nullable|alpha_num|max:20',
            'mobile_no_1' => 'required|integer|max:9999999999',
            'mobile_no_2' => 'nullable|integer|max:9999999999',
            'mobile_no_3' => 'nullable|integer|max:9999999999',
            'email_id_1' => 'required|email:rfc,dns|max:40',
            'email_id_2' => 'nullable|email:rfc,dns|max:40',
            'email_id_3' => 'nullable|email:rfc,dns|max:40',
            'recruitment_batch_id' => 'required|integer|exists:recruitment_batches,id',
            'date_of_joining' => 'required|date_format:d-m-Y',
            'date_of_confirmation' => 'required|date_format:d-m-Y',
            'date_of_retirement' => 'required|date_format:d-m-Y',            
            //'file' => 'sometimes|mimes:jpeg,jpg,bmp,png|max:2048',
            'qualification_id' => 'array',
            'qualification_id.*' => 'required_with:passing_year.*|nullable|integer|exists:qualifications,id',
            'passing_year' => 'array',
            'passing_year.*' => 'required_with:qualification_id.*|nullable|integer',
            'designation_id' => 'array',
            'designation_id.*' => 'required_with:court_id.*,court_complex_id.*,mode_id.*,from_date.*,to_date.*|nullable|integer|exists:designations,id',
            'court_id' => 'array',
            'court_id.*' => 'required_with:designation_id.*,court_complex_id.*,mode_id.*,from_date.*,to_date.*|nullable|integer|exists:courts,id',
            'court_complex_id' => 'array',
            'court_complex_id.*' => 'required_with:court_id.*,designation_id.*,mode_id.*,from_date.*,to_date.*|nullable|integer|exists:court_complexes,id',
            'mode_id' => 'array',
            'mode_id.*' => 'required_with:court_id.*,court_complex_id.*,designation_id.*,from_date.*,to_date.*|nullable|integer|exists:modes,id',
            'from_date' => 'array',
            'from_date.*' => 'required_with:court_id.*,court_complex_id.*,mode_id.*,designation_id.*,to_date.*|nullable|date_format:d-m-Y',
            'to_date' => 'array',
            'to_date.*' => 'required_with:court_id.*,court_complex_id.*,mode_id.*,from_date.*,designation_id.*|nullable|date_format:d-m-Y',
        ];
    }

    
    public function messages(){
        // custom error messages       
        
        return [
            'jo_code.required' => 'Judicial Officer Code is required !!',
        ];        
    }
    
}
