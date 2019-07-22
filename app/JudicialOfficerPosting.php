<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JudicialOfficerPosting extends Model
{
    protected $fillable = [
        'judicial_officer_id','designation_id','court_id','court_complex_id','mode_id','from_date','to_date','created_by'
    ];

    public $timestamps = true;
    /**
     * Get the designation that owns the judicial officer posting.
     */
    public function designation()
    {
        return $this->belongsTo('App\Designation','designation_id','id');
    }

    /**
     * Get the user that owns the judicial officer posting.
     */
    public function created_by()
    {
        return $this->belongsTo('App\User','created_by','id');
    }

    /**
     * Get the mode that owns the judicial officer posting.
     */
    public function mode()
    {
        return $this->belongsTo('App\Mode','mode_id','id');
    }

    /**
     * Get the court complex that owns the judicial officer posting.
     */
    public function court_complex()
    {
        return $this->belongsTo('App\CourtComplex','court_complex_id','id');
    }

    /**
     * Get the judicial official that owns the judicial officer posting.
     */
    public function judicial_officer()
    {
        return $this->belongsTo('App\JudicialOfficer','judicial_officer_id','id');
    }

    /**
     * Get the court that owns the judicial officer posting.
     */
    public function court()
    {
        return $this->belongsTo('App\Court','court_id','id');
    }

    /**
     * Get the court complex that owns the court.
     */
    public function judicial_officer_posting_preferences()
    {
        return $this->hasMany('App\JudicialOfficerPostingPreference','judicial_officer_id','id');
    }


}
