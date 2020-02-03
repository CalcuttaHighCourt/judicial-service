<?php

namespace App;
use Carbon\Carbon;

use Illuminate\Database\Eloquent\Model;

class JoDocument extends Model
{
    public $timestamps = true;

    public function getCreatedAtAttribute($date)
    {
        return Carbon::createFromFormat('Y-m-d H:i:s', $date)->format('d-m-Y');
    }

    public function getUpdatedAtAttribute($date)
    {
        return Carbon::createFromFormat('Y-m-d H:i:s', $date)->format('d-m-Y');
    }
}
