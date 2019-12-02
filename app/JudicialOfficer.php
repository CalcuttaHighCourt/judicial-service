<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JudicialOfficer extends Model
{
    
    public $timestamps = true;
    
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
        return $this->hasMany('App\JudicialOfficerPosting','judicial_officer_id','id')->orderBy('from_date', 'DESC');
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
