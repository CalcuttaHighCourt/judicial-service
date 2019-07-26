<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CourtComplex extends Model
{
    protected $fillable = [
        'court_complex_name','latitude','longitude','district_id',
        'zone_id','created_by','subdivision_id'
    ];

    public $timestamps = true;

    protected $table = 'court_complexes';

    
     /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function created_by()
    {
        return $this->belongsTo('App\User','created_by','id');
    }

    
     /**
     * Get the courts for the court complex.
     */

    public function district()
    {
        return $this->belongsTo('App\District','district_id','id');
    }

    public function zone()
    {
        return $this->belongsTo('App\Zone','zone_id','id');
    }

    public function subdivisions()
    {
        return $this->belongsTo('App\Subdivision','subdivision_id','id');
    }



    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function judicial_officer_postings()
    {
        return $this->hasMany('App\JudicialOfficerPosting','court_complex_id','id');
    }

     /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function judicial_officer_posting_preferences()
    {
        return $this->hasMany('App\JudicialOfficerPostingPreference','court_complex_id','id');
    }

     /**
     * Get the courts for the court complex.
     */

    public function courts()
    {
        return $this->hasMany('App\Court','court_complex_id','id');
    }
    
    
}
