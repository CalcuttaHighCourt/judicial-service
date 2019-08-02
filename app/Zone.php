<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Zone extends Model
{
    protected $fillable = [
        'zone_name','created_by'
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
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function districts()
    {
        return $this->hasMany('App\District','zone_id','id');
    }
    public function court_complexes()
    {
        return $this->hasMany('App\CourtComplex','zone_id','id');
    }
}
