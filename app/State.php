<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class State extends Model
{

    protected $fillable = [
        'state_name','created_by'
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
    public function judicial_officers()
    {
        return $this->hasMany('App\JudicialOfficer','home_state_id','id');
    }

     /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function districts()
    {
        return $this->hasMany('App\District','state_id','id');
    }

    
}
