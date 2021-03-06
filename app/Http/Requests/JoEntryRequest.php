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
            'date_of_birth' => 'required|date_format:d-m-Y|before:date_of_joining|before:date_of_confirmation|before:date_of_retirement',
            'home_state_id' => 'required|integer|exists:states,id|max:10000',
            'state_flag' => 'required|string|max:20|in:west_bengal,other',
            'home_district_id' => 'required_if:state_flag,==,west_bengal|integer|exists:districts,id|max:200',
            'other_home_district' => 'required_if:state_flag,==,other|string|max:100',
            'hometown' => 'nullable|string|max:100',
            'present_address' => 'required|string',
            'permanent_address' => 'required|string',
            'mobile_no_1' => 'nullable|integer|max:9999999999|unique:judicial_officers,mobile_no_1',
            'mobile_no_2' => 'nullable|integer|max:9999999999|unique:judicial_officers,mobile_no_2',
            'email_id_1' => 'nullable|email|max:100|unique:judicial_officers,email_id_1',
            'email_id_2' => 'nullable|email|max:100|unique:judicial_officers,email_id_2',
            'recruitment_batch_id' => 'required|integer|exists:recruitment_batches,id|max:10000',
            'recruitment_batch_year' => 'nullable|integer|min:1950|max:'.date('Y'),
            'date_of_joining' => 'required|date_format:d-m-Y|before_or_equal:date_of_confirmation|before:date_of_retirement|after:date_of_birth',
            'date_of_confirmation' => 'nullable|date_format:d-m-Y|after:date_of_birth|after_or_equal:date_of_joining|before:date_of_retirement',
            'date_of_retirement' => 'required|date_format:d-m-Y|after:date_of_birth|after:date_of_joining',  
            'qualification_id' => 'array',
            'qualification_id.*' => 'required_with:passing_year.*|nullable|integer|exists:qualifications,id|max:500',
            'passing_year' => 'array',
            'passing_year.*' => 'nullable|integer|min:1900|max:'.date('Y'),
            'subdivision_id' => 'array',
            'subdivision_id.*' => 'required_with:from_year.*,to_year.*|nullable|integer|exists:subdivisions,id|max:1000',
            'from_year' => 'array',
            'from_year.*' => 'required_with:to_year.*|nullable|integer|min:1900|max:to_year.*',
            'to_year' => 'array',
            'to_year.*' => 'required_with:from_year.*|nullable|integer|min:from_year.*|max:'.date('Y'),            
            'flag_mode' => 'nullable|alpha|max:30|in:regular,deputation',
            'mode_id' => 'nullable|required_with:flag_mode,rank_id,from_date|integer|max:1000|exists:modes,id',
            'rank_id' => 'nullable|required_with:mode_id,rank_id,flag_mode|integer|max:50|exists:ranks,id',
            'designation_id' => 'nullable|required_if:flag_mode,==,regular|integer|max:5000|exists:designations,id',
            'place_of_posting' => 'nullable|required_if:flag_mode,==,regular|string|max:255',
            'deputation_designation' => 'nullable|required_if:flag_mode,==,deputation|string|max:500',
            'reporting_officer_id' => 'nullable|integer|max:999999|exists:judicial_officers,id',   
            'other_reporting_officer_name' => 'nullable|string|max:100|regex:/^[\pL\s\-]+$/u',
            'other_reporting_officer_designation' => 'nullable|required_with:other_reporting_officer_name|string|max:100',
            'zone_id' => 'nullable|required_with:mode_id,rank_id,flag_mode|integer|max:500|exists:zones,id',            
            'deputation_posting_place' => 'nullable|required_if:flag_mode,==,deputation|string|max:255',
            'from_date' => 'nullable|required_with:mode_id,rank_id,flag_mode|date_format:d-m-Y|after_or_equal:date_of_joining|before_or_equal:'.date('Y-m-d'),
            'to_date' => 'nullable|date_format:d-m-Y|after_or_equal:from_date|before:'.date('Y-m-d'),                     
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
