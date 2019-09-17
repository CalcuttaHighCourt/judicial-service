<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JudicialOfficer extends Model
{
    protected $fillable = [
        'jo_code', 'officer_name', 
        'gender','court_id',
        'guardian_name','date_of_birth',
        'home_state_id','home_district_id',
        'hometown','present_address',
        'permanent_address','religion_id',
        'category_id','blood_group',
        'identification_mark','gurdian_relation',
        'identification_mark','aadhaar_no',
        'pan_no','pf_no',
        'mobile_no_1','mobile_no_1',
        'mobile_no_2','mobile_no_3',
        'email_id_1','email_id_2',
        'email_id_3','recruitment_batch_id',
        'date_of_joining','date_of_confirmation',
        'date_of_retirement', 'present_reporting_officer_id',
        'present_reviewing_officer_id'
    ];
    /**
     * Get the recruitment batch that owns the Judicial officer.
     */
    public function recruitment_batch()
    {
        return $this->belongsTo('App\RecruitmentBatch','recruitment_batch_id','id');
    }

    /**
     * Get the recruitment batch that owns the Judicial officer.
     */
    public function state()
    {
        return $this->belongsTo('App\State','home_state_id','id');
    }

    /**
     * Get the recruitment batch that owns the Judicial officer.
     */
    public function caste()
    {
        return $this->belongsTo('App\Caste','category_id','id');
    }

    /**
     * Get the recruitment batch that owns the Judicial officer.
     */
    public function district()
    {
        return $this->belongsTo('App\District','home_district_id','id');
    }

    /**
     * Get the recruitment batch that owns the Judicial officer.
     */
    public function religion()
    {
        return $this->belongsTo('App\Religion','religion_id','id');
    }

    /**
     * Get the court complex that owns the court.
     */
    public function judicial_officer_postings()
    {
        return $this->hasMany('App\JudicialOfficerPosting','judicial_officer_id','id');
    }


    /**
     * Get the court complex that owns the court.
     */
    public function judicial_officer_qualifications()
    {
        return $this->hasMany('App\JudicialOfficerQualification','judicial_officer_id','id');
    }

    /**
     * Get the court complex that owns the court.
     */
    public function subordinate_officers()
    {
        return $this->hasMany('App\JoReportingReviewing','judicial_officer_id','id');
    }


    /**
     * Get the court complex that owns the court.
     */
    public function jo_repoting_officer()
    {
        return $this->belongsTo('App\JudicialOfficer','present_reporting_officer_id','id');
    }
    
    /**
     * Get the court complex that owns the court.
     */
    public function jo_reviewing_officer()
    {
        return $this->belongsTo('App\JudicialOfficer','present_reviewing_officer_id','id');
    }
    

    /**
     * Get the court complex that owns the court.
     */
    public function jo_photos()
    {
        return $this->belongsTo('App\JudicialOfficer','judicial_officer_id','id');
    }
    

    
}
