@include('layouts.meta') 
@include('layouts.css')
@include('layouts.upper_scripts') 
@include('layouts.header_menu') 

@include('layouts.page_footer')
@include('layouts.sticky_footer')
@include('layouts.end_scripts')
<!DOCTYPE html>
<html lang="en">
    <head>
        @yield('meta') 
        @yield('css')
        <title>Calcutta High Court - @yield('title')</title>
        @yield('upper_scripts')
    </head>
    <body @section('body_attributes') class="custom-background" @show>
           @yield('header')
           <div class="container-fluid custom-main-container">
            @yield('main_container')
        </div>
        @yield('sticky_footer') @yield('end_scripts')
    </body>
</html>
