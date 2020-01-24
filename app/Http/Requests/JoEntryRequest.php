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
            'jo_code' => 'nullable|unique:judicial_officers,jo_code|string|alpha_num|max:50',
            'registration_no' => 'required|unique:judicial_officers,registration_no|integer|max:99999',
            'officer_name' => 'required|string|max:100',
            'gender' => 'required|string|alpha|in:M,F,O|max:10',
            'spouse' => 'nullable|integer|exists:judicial_officers,id|max:999999',
            'date_of_birth' => 'required|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
            'home_state_id' => 'required|integer|exists:states,id|max:10000',
            'state_flag' => 'required|string|max:20|in:west_bengal,other',
            'home_district_id' => 'required_if:state_flag,==,west_bengal|integer|exists:districts,id|max:200',
            'other_home_district' => 'required_if:state_flag,==,other|string|regex:/^[\pL\s\-]+$/u|max:100',
            'hometown' => 'required|string|regex:/^[\pL\s\-]+$/u|max:100',
            'present_address' => 'required|string|max:255',
            'permanent_address' => 'required|string|max:255',
            'mobile_no_1' => 'required|integer|max:9999999999|unique:judicial_officers,mobile_no_1',
            'mobile_no_2' => 'nullable|integer|max:9999999999|unique:judicial_officers,mobile_no_2',
            'email_id_1' => 'required|email:rfc,dns|max:100|unique:judicial_officers,email_id_1',
            'email_id_2' => 'nullable|email:rfc,dns|max:100|unique:judicial_officers,email_id_2',
            'recruitment_batch_id' => 'required|integer|exists:recruitment_batches,id|max:10000',
            'recruitment_batch_year' => 'required|integer|min:1950|max:'.date('Y'),
            'date_of_joining' => 'required|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
            'date_of_confirmation' => 'nullable|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
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
            'flag_mode' => 'nullable|alpha|max:30|in:regular,deputation',
            'mode_id' => 'nullable|required_with:flag_mode,rank_id,from_date|integer|max:1000|exists:modes,id',
            'rank_id' => 'nullable|required_with:mode_id,rank_id,flag_mode|integer|max:50|exists:ranks,id',
            'designation_id' => 'nullable|integer|max:500|exists:designations,id',
            'deputation_designation' => 'nullable|required_if:flag_mode,==,deputation|string|max:500',
            'reporting_officer_id' => 'nullable|integer|max:999999|exists:judicial_officers,id',   
            'other_reporting_officer_name' => 'nullable|string|max:100|regex:/^[\pL\s\-]+$/u',
            'other_reporting_officer_designation' => 'nullable|required_with:other_reporting_officer_name|string|max:100|regex:/^[\pL\s\-]+$/u',
            'zone_id' => 'nullable|required_with:mode_id,rank_id,flag_mode|integer|max:500|exists:zones,id',            
            'deputation_posting_place' => 'nullable|required_if:flag_mode,==,deputation|string|max:255',
            'from_date' => 'nullable|required_with:mode_id,rank_id,flag_mode|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),
            'to_date' => 'nullable|date_format:d-m-Y|after:1900-01-01|before:'.date('Y-m-d'),                     
            'posting_remark' => 'nullable|string',
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
