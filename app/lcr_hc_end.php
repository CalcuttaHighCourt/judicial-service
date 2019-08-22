<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Lcr_hc_end extends Model
{
        public $timestamps = true;

        public function lcr_case_details()
        {
                return $this->hasMany('App\Lcr_lc_detail','hc_id','id');
        }
        public function case_type()
        {
                return $this->hasOne('App\Hc_case_type','id','hc_case_record');
        }
}
