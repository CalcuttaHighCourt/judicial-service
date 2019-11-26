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
            'registration_no' => 'required|unique:judicial_officers,registration_no|integer|max:99999',
            'officer_name' => 'required|regex:/^[\pL\s\-]+$/u|max:50',
            'gender' => 'required|alpha|max:10',
            'guardian_name' => 'required|regex:/^[\pL\s\-]+$/u|max:50',
            'gurdian_relation' => 'required|regex:/^[\pL\s\-]+$/u|max:30',
            'date_of_birth' => 'required|date_format:d-m-Y',
            'home_state_id' => 'required|integer|exists:states,id',
            'home_district_id' => 'required|integer|exists:districts,id',
            'hometown' => 'required|regex:/^[\pL\s\-]+$/u|max:50',
            'present_address' => 'required|string|max:255',
            'permanent_address' => 'required|string|max:255',
            'religion_id' => 'nullable|integer|exists:religions,id',
            'category_id' => 'nullable|integer|exists:castes,id',
            'blood_group' => 'nullable|max:5',
            'identification_mark' => 'nullable|alpha_dash|max:255',
            'aadhar_no' => 'nullable|integer|max:12',
            'pan_no' => 'nullable|alpha_num|max:10',
            'pf_no' => 'nullable|alpha_num|max:20',
            'mobile_no_1' => 'required|integer|max:9999999999|unique:judicial_officers,mobile_no_1',
            'mobile_no_2' => 'nullable|integer|max:9999999999',
            'mobile_no_3' => 'nullable|integer|max:9999999999',
            'email_id_1' => 'required|email:rfc,dns|max:40|unique:judicial_officers,email_id_1',
            'email_id_2' => 'nullable|email:rfc,dns|max:40',
            'email_id_3' => 'nullable|email:rfc,dns|max:40',
            'recruitment_batch_id' => 'required|integer|exists:recruitment_batches,id',
            'date_of_joining' => 'required|date_format:d-m-Y',
            'date_of_confirmation' => 'required|date_format:d-m-Y',
            'date_of_retirement' => 'required|date_format:d-m-Y',            
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
