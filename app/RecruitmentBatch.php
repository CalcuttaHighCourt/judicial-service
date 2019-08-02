<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RecruitmentBatch extends Model
{
    protected $fillable = [
        'recruitment_batch_desc','batch_year','created_by'
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
        return $this->hasMany('App\JudicialOfficer','recruitment_batch_id','id');
    }

}
