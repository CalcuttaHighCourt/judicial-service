<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Qualification extends Model
{
    protected $fillable = [
        'qualification_name','created_by'
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
    public function judicial_officer_qualifications()
    {
        return $this->hasMany('App\JudicialOfficerQualification','qualification_id','id');
    }
}
