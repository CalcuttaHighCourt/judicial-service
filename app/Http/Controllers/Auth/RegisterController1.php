<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Auth\Events\Registered;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
       // $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'user_id' => ['required','unique:users,user_id'],
           'name' => ['required', 'string', 'max:255'],
            'usertype' => ['required', 'max:255','exists:user_types,id'],
            'court' => ['nullable','max:255','exists:courts,id'],
            'jo' => ['nullable','max:255','exists:judicial_officers,id'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        

        if(!empty($data['court']))
        {
            $data['jo'] =null;
        }

        if(!empty($data['jo']))
        {
           $data['court'] =null;
        }

        //dd($data['user_id']) ;exit;

        return User::create([
        'name' => $data['name'],
        'user_type_id'=> $data['usertype'],
        'court_id'=>$data['court'],
        'judicial_officer_id'=> $data['jo'],
        'email' => $data['email'],
        'user_id' => $data['user_id'],
        'password' => Hash::make($data['password']),
        
        ]);

    }

    public function register(Request $request)
    {
        
        
        $this->validator($request->all())->validate();
        
        event(new Registered($user = $this->create($request->all())));

        //$this->guard()->login($user);
        
        return $this->registered($request, $user)
                        ?: redirect($this->redirectPath());

    }
}
