<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','court_id','judicial_officer_id','user_id','user_type_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];





    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function designations()
    {
        return $this->hasMany('App\Designation','created_by','id');
    }

    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function judicial_officer_positngs()
    {
        return $this->hasMany('App\JudicialOfficerPosting','created_by','id');
    }

    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function courts()
    {
        return $this->hasMany('App\Court','created_by','id');
    }

    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function modes()
    {
        return $this->hasMany('App\Mode','created_by','id');
    }

    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function court_complexes()
    {
        return $this->hasMany('App\CourtComplex','created_by','id');
    }


    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function judicial_officer_posting_preferences()
    {
        return $this->hasMany('App\JudicialOfficerPostingPreferences','created_by','id');
    }


    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function recruitment_batches()
    {
        return $this->hasMany('App\RecruitmentBatch','created_by','id');
    }


    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function states()
    {
        return $this->hasMany('App\State','created_by','id');
    }


    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function castes()
    {
        return $this->hasMany('App\Caste','created_by','id');
    }

    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function zones()
    {
        return $this->hasMany('App\Zone','created_by','id');
    }

     /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function districts()
    {
        return $this->hasMany('App\District','created_by','id');
    }

    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function religions()
    {
        return $this->hasMany('App\Religion','created_by','id');
    }

    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function subdivisions()
    {
        return $this->hasMany('App\Subdivision','created_by','id');
    }
    
    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function jo_reporting_reviewings()
    {
        return $this->hasMany('App\JoReportingReviewing','created_by','id');
    }


    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function qualifications()
    {
        return $this->hasMany('App\Qualification','created_by','id');
    }

    /**
     * Get the user that has ceated the JO reporting reviewing .
     */
    public function judicial_officer_qualifications()
    {
        return $this->hasMany('App\JudicialOfficerQualification','created_by','id');
    }

    public function judicial_officer()
    {
        return $this->hasOne('App\JudicialOfficer','id','judicial_officer_id');
    }

}
