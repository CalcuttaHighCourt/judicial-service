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
            'jo_code' => 'nullable|unique:judicial_officers,jo_code|string|alpha_dash|max:50',
            'registration_no' => 'required|unique:judicial_officers,registration_no|integer|max:99999',
            'officer_name' => 'required|string|regex:/^[\pL\s\-]+$/u|max:100',
            'gender' => 'required|string|alpha|in:M,F,O|max:10',
            'guardian_name' => 'required|string|regex:/^[\pL\s\-]+$/u|max:50',
            'gurdian_relation' => 'required|string|regex:/^[\pL\s\-]+$/u|max:50',
            'date_of_birth' => 'required|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
            'home_state_id' => 'required|integer|exists:states,id|max:10000',
            'home_district_id' => 'required|integer|exists:districts,id|max:10000',
            'hometown' => 'required|string|regex:/^[\pL\s\-]+$/u|max:100',
            'present_address' => 'required|string|max:255',
            'permanent_address' => 'required|string|max:255',
            'religion_id' => 'nullable|integer|exists:religions,id|max:1000',
            'category_id' => 'nullable|integer|exists:categories,id|max:1000',
            'blood_group' => 'nullable|string|in:A+,A-,B+,B-,AB+,AB-,O+,O-|max:100',
            'identification_mark' => 'nullable|string|regex:/^[\pL\s\-]+$/u|max:100',
            'aadhar_no' => 'nullable|integer|min:12|max:12',
            'pan_no' => 'nullable|string|alpha_num|min:10|max:10',
            'pf_no' => 'nullable|string|alpha_num|max:20',
            'mobile_no_1' => 'required|integer|max:9999999999|unique:judicial_officers,mobile_no_1',
            'mobile_no_2' => 'nullable|integer|max:9999999999',
            'email_id_1' => 'required|email:rfc,dns|max:100|unique:judicial_officers,email_id_1',
            'email_id_2' => 'nullable|email:rfc,dns|max:100',
            'recruitment_batch_id' => 'required|integer|exists:recruitment_batches,id|max:10000',
            'date_of_joining' => 'required|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
            'date_of_confirmation' => 'required|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
            'date_of_retirement' => 'required|date_format:d-m-Y|after:1900-01-01',  
            'qualification_id' => 'array',
            'qualification_id.*' => 'required_with:passing_year.*|nullable|integer|exists:qualifications,id|max:500',
            'passing_year' => 'array',
            'passing_year.*' => 'required_with:qualification_id.*|nullable|integer|min:1900|max:'.date('Y'),
            'subdivision_id' => 'array',
            'subdivision_id.*' => 'required_with:from_year.*,to_year.*|nullable|integer|exists:subdivisions,id|max:1000',
            'from_year' => 'array',
            'from_year.*' => 'required_with:subdivision_id.*,to_year.*|nullable|integer|min:1900|max:'.date('Y'),
            'to_year' => 'array',
            'to_year.*' => 'required_with:subdivision_id.*,from_year.*|nullable|integer|min:1900|max:'.date('Y'),
            'designation_id' => 'array',
            'designation_id.*' => 'required_with:court_id.*,mode_id.*,from_date.*,to_date.*|nullable|integer|exists:designations,id|max:500',
            'reporting_officer_id' => 'array',
            'reporting_officer_id.*' => 'nullable|integer|exists:judicial_officers,id|max:999999',            
            'court_id' => 'array',
            'court_id.*' => 'required_with:designation_id.*,mode_id.*,from_date.*,to_date.*|nullable|integer|exists:courts,id|max:1000',            
            'mode_id' => 'array',
            'mode_id.*' => 'required_with:court_id.*,designation_id.*,from_date.*,to_date.*|nullable|integer|exists:modes,id|max:1000',
            'from_date' => 'array',
            'from_date.*' => 'required_with:court_id.*,mode_id.*,designation_id.*,to_date.*|nullable|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
            'to_date' => 'array',
            'to_date.*' => 'nullable|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),          
            //'file' => 'sometimes|mimes:jpeg,jpg,bmp,png|max:2048', 
            
        ];
            
    }

    
    public function messages(){
        // custom error messages   
        return [
            'jo_code.required' => 'Judicial Officer Code is required.',
            'mobile_no_1.required' => 'Primary Mobile No. is required.',
            'email_id_1.required' => 'Primary Email Id is required.',
        ];        
    }
    
}
