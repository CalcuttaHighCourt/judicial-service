<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class District extends Model
{
    protected $fillable = [
        'district_name','state_id','created_by'
    ];

    public $timestamps = true;
    
    /**
     * Get the recruitment batch that owns the District.
     */
    public function state()
    {
        return $this->belongsTo('App\State','state_id','id');
    }


    
        /**
     * Get the zone that owns the District.
     */
    public function zone()
    {
        return $this->belongsTo('App\Zone','zone_id','id');
    }


    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function created_by()
    {
        return $this->belongsTo('App\User','created_by','id');
    }

 /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function judicial_officers()
    {
        return $this->hasMany('App\JudicialOfficer','home_district_id','id');
    }

    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function subdivisions()
    {
        return $this->hasMany('App\Subdivision','district_id','id');
    }

    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function court_complexes()
    {
        return $this->hasMany('App\CourtComplex','district_id','id');
    }
}
