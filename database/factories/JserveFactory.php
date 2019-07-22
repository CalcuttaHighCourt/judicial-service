<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\User;
use App\State;
use App\Zone;
use App\District;
use App\CourtComplex;
use App\Court;
use App\Subdivision;
use App\Designation;

use Illuminate\Support\Str;
use Faker\Generator as Faker;

$factory->define(User::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->email,
        'email_verified_at' => now(),
        'password' => $faker->password,
        'remember_token' => Str::random(10),
        'created_at' => now(),
        'updated_at' => now(),
    ];
});

$factory->define(State::class, function (Faker $faker) {
    return [
        'state_name' => $faker->unique()->state,        
        'created_at' => now(),
        'updated_at' => now(),
    ];
});

$factory->define(Zone::class, function (Faker $faker) {
    return [
        'zone_name' => $faker->unique()->randomLetter,        
        'created_at' => now(),
        'updated_at' => now(),
    ];
});

$factory->define(District::class, function (Faker $faker) {
    return [
        'district_name' => $faker->unique()->city,        
        'created_at' => now(),
        'updated_at' => now(),
    ];
});

$factory->define(CourtComplex::class, function (Faker $faker) {
    return [
        'court_complex_name' => $faker->unique()->company,
        'latitude' => $faker->latitude,        
        'longitude' => $faker->longitude,
        'created_at' => now(),
        'updated_at' => now(),
    ];
});

$factory->define(Court::class, function (Faker $faker) {
    return [
        'court_name' => $faker->unique()->word,        
        'created_at' => now(),
        'updated_at' => now(),
    ];
});

$factory->define(Subdivision::class, function (Faker $faker) {
    return [
        'subdivision_name' => $faker->unique()->word,        
        'created_at' => now(),
        'updated_at' => now(),
    ];
});

$factory->define(Designation::class, function (Faker $faker) {
    return [
        'designation_name' => $faker->unique()->jobTitle,        
        'created_at' => now(),
        'updated_at' => now(),
    ];
});

