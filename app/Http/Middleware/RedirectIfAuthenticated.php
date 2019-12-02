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
    if(Auth::guard($guard)->check() && Auth::user()->user_type=='Court') {
        return redirect('dashboard/court');
    }
    if(Auth::guard($guard)->check() && Auth::user()->user_type=='Judicial Officer') {
        return redirect('dashboard/jo');
    }

        return $next($request);
    }
}
