<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    { 
        if(Auth::guard($guard)->check() && Auth::user()->user_type->type_name=="Administrator") {          
          return redirect('dashboard/admin');
        }

        if(Auth::guard($guard)->check() && Auth::user()->user_type->type_name=="Court") {          
            return redirect('dashboard/court');
          }

          if(Auth::guard($guard)->check() && Auth::user()->user_type->type_name=="Inspection") {          
            return redirect('dashboard/inspection');
          }

          if(Auth::guard($guard)->check() && Auth::user()->user_type->type_name=="Appointment") {          
            return redirect('dashboard/appointment');
          }

          if(Auth::guard($guard)->check() && Auth::user()->user_type->type_name=="Judicial Officer") {          
            return redirect('dashboard/jo');
          }

          if(Auth::guard($guard)->check() && Auth::user()->user_type->type_name=="Department") {          
            return redirect('dashboard/dept');
          }

        return $next($request);

    }
}
        
   

