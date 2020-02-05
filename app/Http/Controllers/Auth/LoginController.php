<?php

namespace App\Http\Controllers\Auth;

use \Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected function authenticated(Request $request, $user)
    {
        if(Auth::user()->user_type->type_name=="Administrator"){
            return redirect('dashboard/admin') ;
        }   
        
        if(Auth::user()->user_type->type_name=="Court"){
            return redirect('dashboard/court') ;
        }  
        
        if(Auth::user()->user_type->type_name=="Inspection"){
            return redirect('dashboard/inspection') ;
        }  

        if(Auth::user()->user_type->type_name=="Appointment"){
            return redirect('dashboard/appointment') ;
        }  

        if(Auth::user()->user_type->type_name=="Judicial Officer"){
            return redirect('dashboard/jo') ;
        }  

        if(Auth::user()->user_type->type_name=="Department"){
            return redirect('dashboard/dept') ;
        }  
    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    
    protected function credentials(Request $request)
    {
        $field = filter_var($request->get($this->username()), FILTER_VALIDATE_EMAIL)
        ? 'email'
        : 'user_id';

        return [
            $field => $request->get($this->username()),
            'password' => $request->password,
        ];
    }
}
