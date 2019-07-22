<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JoReportingReviewing extends Model
{
    protected $fillable = [
        'judicial_officer_id','reporting_officer_id','reviewing_officer_id','created_by'
    ];

    public $timestamps = true;


    /**
     * Get the judicial officer that owns the JO reporting reviewing .
     */
    public function judicial_officer()
    {
        return $this->belongsTo('App\JudicialOfficer','judicial_officer_id','id');
    }


    /**
     * Get the Reviewing officer that owns the JO reporting reviewing .
     */
    public function reviewing_officer()
    {
        return $this->belongsTo('App\JudicialOfficer','reviewing_officer_id','id');
    }

    /**
     * Get the Reporting officer that owns the JO reporting reviewing .
     */
    public function reporting_officer()
    {
        return $this->belongsTo('App\JudicialOfficer','reporting_officer_id','id');
    }

    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function created_by()
    {
        return $this->belongsTo('App\User','created_by','id');
    }
    
}

