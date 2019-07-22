<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JudicialOfficerQualification extends Model
{
    /**
     * Get the qualification for the JO qualification.
     */
    public function qualification()
    {
        return $this->belongsTo('App\Qualification','qualification_id','id');
    }

    /**
     * Get the judicial officer that owns the JO qualification.
     */
    public function judicial_officer()
    {
        return $this->belongsTo('App\JudicialOfficer','judicial_officer_id','id');
    
    }

    /**
     * Get the user that owns the JO qualification.
     */
    public function created_by()
    {
        return $this->belongsTo('App\User','created_by','id');
    }
}
