<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subdivision extends Model
{
    protected $fillable = [
        'subdivision_name','district_id','created_by','zone_id'
    ];

    public $timestamps = true;
 
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

    public function court_complexes()
    {
        return $this->hasMany('App\CourtComplex','subdivision_id','id');
    }
}
