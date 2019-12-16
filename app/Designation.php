<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Designation extends Model
{

    protected $fillable = [
        'designation_name','created_by','rank_id'
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
    public function judicial_officer_postings()
    {
        return $this->hasMany('App\JudicialOfficerPosting','designation_id','id');
    }



}
