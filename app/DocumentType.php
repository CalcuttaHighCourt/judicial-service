<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DocumentType extends Model
{

    protected $fillable = [
        'type_name'
    ];
   
    public $timestamps = true;
}
