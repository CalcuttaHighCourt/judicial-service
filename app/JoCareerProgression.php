<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JoCareerProgression extends Model
{
    protected $casts = [
        'career_progression' => 'array'
    ];

    public $timestamps = true;
}
