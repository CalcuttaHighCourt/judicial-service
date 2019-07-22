<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mode extends Model
{

    protected $fillable = [
        'posting_mode','created_by'
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
    public function judicial_officer_positngs()
    {
        return $this->hasMany('App\JudicialOfficerPosting','mode_id','id');
    }


}
