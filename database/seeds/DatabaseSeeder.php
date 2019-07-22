<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        factory(App\User::class, 10)->create()->each(function ($user) {            
            $states = factory(App\State::class,5)->make();
            $user->states()->saveMany($states);

            $zones = factory(App\Zone::class,1)->make();
            $user->zones()->saveMany($zones);

            $districts = factory(App\District::class,3)->make([
                'state_id'=>$states->random()->id
            ]);
            $user->districts()->saveMany($districts);

            $court_complexes = factory(App\CourtComplex::class,5)->make([
                'district_id'=>$districts->random()->id,
                'zone_id'=>$zones->random()->id
            ]);
            $user->court_complexes()->saveMany($court_complexes);

            $courts = factory(App\Court::class,3)->make([
                'court_complex_id'=>$court_complexes->random()->id
            ]);
            $user->courts()->saveMany($courts);

            $subdivisions = factory(App\Subdivision::class,4)->make([
                'district_id'=>$districts->random()->id
            ]);
            $user->subdivisions()->saveMany($subdivisions);

            $designations = factory(App\Designation::class,2)->make();
            $user->designations()->saveMany($designations);
        });
    }
}
