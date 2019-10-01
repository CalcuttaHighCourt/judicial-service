<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AcrHistory extends Model
{
    public function grade_detail()
    {
        return $this->belongsTo('App\GradeDetail','grade_id','id');
    }
    
}
