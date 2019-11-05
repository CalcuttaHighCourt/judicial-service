<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JudicialOfficerPostingPreference extends Model
{
    protected $fillable = [
        'judicial_officer_id','zone_id','remarks','created_by'
    ];

    public $timestamps = true;
    
 /**
     * Get the court complex that owns the judicial officer posting preference.
     */
    public function zone()
    {
        return $this->belongsTo('App\Zone','zone_id','id');
    }

     /**
     * Get the user that owns the judicial officer posting preference.
     */
    public function created_by()
    {
        return $this->belongsTo('App\User','created_by','id');
    }

     /**
     * Get the judicial officer that owns the judicial officer posting preference.
     */
    public function judicial_officer()
    {
        return $this->belongsTo('App\JudicialOfficer','judicial_officer_id','id');
    }

}
