<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Court extends Model
{
    protected $fillable = [
        'court_name','court_complex_id','created_by','subdivision_id'
    ];

    public $timestamps = true;
    /**
     * Get the court complex that owns the court.
     */
    public function court_complex()
    {
        return $this->belongsTo('App\CourtComplex','court_complex_id','id');
    }

    /**
     * Get the user that owns the court.
     */
    public function created_by()
    {
        return $this->belongsTo('App\User','created_by','id');
    }

    /**
     * Get the court complex that owns the court.
     */
    public function judicial_officer_postings()
    {
        return $this->hasMany('App\JudicialOfficerPosting','court_id','id');
    }
}
