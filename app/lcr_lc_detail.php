<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Lcr_lc_detail extends Model
{
        public $timestamps = true;

        public function lower_case_type()
        {
                return $this->hasOne('App\Lower_case_type','id','lower_case_record');
        }
}
