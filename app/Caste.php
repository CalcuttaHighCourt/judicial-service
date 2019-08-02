<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Caste extends Model
{

    protected $fillable = [
        'caste_name','created_by'
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
     * Get the recruitment batch that owns the Judicial officer.
     */
    public function judicial_officers()
    {
        return $this->hasMany('App\JudicialOfficer','caste_id','id');
    }
}
