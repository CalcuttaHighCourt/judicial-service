@section('header')

<!-- Fixed navbar -->
<nav id="sidebar" class="navbar-fixed-top" scroll="yes">
    <div class="container-fluid">
        <div class="sidebar-header" style="background-color:#077E70">
            <div class="row">
                &nbsp;
            </div>
               <h3>Integrated Informations Management System</h3>
           
        </div>
       

        <ul class="list-unstyled components">

            @if(Auth::check() && Auth::user()->user_type->type_name=="Administrator")
            <li>
                <a href="#masterSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-edit"></i>Master Maintenance</a>
                <ul class="collapse list-unstyled" id="masterSubmenu">
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('court')}}">
                            <span data-feather="home"></span>
                            <i class="fa fa-gavel" aria-hidden="true"></i>
                            Court Master
                        </a>
                    </li>
                   
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('subdivision')}}">
                            <span data-feather="file"></span>
                            
                            <i class="fa fa-crosshairs" aria-hidden="true"></i>
                            Subdivision Master
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('district')}}">
                        <i class="fa fa-location-arrow" aria-hidden="true"></i>
                            District Master 
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('zone')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-thumb-tack" aria-hidden="true"></i>
                            Zone Master
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('state')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            State Master 
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('jo_postings')}}">
                             <span data-feather="file"></span>
                             <i class="fa fa-crosshairs" aria-hidden="true"></i>
                                Posting Preference HC
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="{{url('user_type')}}">
                            <span data-feather="home"></span>
                            <i class="fa fa-user" aria-hidden="true"></i>
                            User Type 
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('designation')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-sun-o" aria-hidden="true"></i>
                            Designation Master
                        </a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="{{url('mode')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-dot-circle-o" aria-hidden="true"></i>
                            Mode Master
                        </a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="{{url('qualification')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-certificate" aria-hidden="true"></i>
                            Qualification Master
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="{{url('recruitmentbatch')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-cog" aria-hidden="true"></i>
                            Recruitment Batch
                        </a>
                    </li>


                   

                    <li class="nav-item">
                        <a class="nav-link" href="{{url('religion')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-dot-circle-o" aria-hidden="true"></i>
                            Religion
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="{{url('Category')}}">
                            <span data-feather="home"></span>
                            <i class="fa fa-dot-circle-o" aria-hidden="true"></i>
                            Category Master
                        </a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="{{url('jo_reporting_reviewing')}}">
                            <span data-feather="home"></span>
                            <i class="fa fa-dot-circle-o" aria-hidden="true"></i>
                            Reporting & reviewing officer
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('grade')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-crosshairs" aria-hidden="true"></i>
                            ACR Grade Master
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="#adminjomenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-address-book"></i>Judicial Officer</a>
                <ul class="collapse list-unstyled" id="adminjomenu">
                    <li class="nav-item">           
                        <a class="nav-link" href="{{url('jo_entry_form')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-briefcase"></i>
                            Profile Details Entry
                        </a>
                    </li>
                    <li class="nav-item">           
                        <a class="nav-link" href="#">
                            <span data-feather="file"></span>
                            <i class="fa fa-briefcase"></i>
                            Documents Entry
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="#usermaster" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-circle"></i>User Creation</a>
                <ul class="collapse list-unstyled" id="usermaster">
                     <li><a href="{{ url('/register') }}">Register</a></li>
                    </ul>
            </li>
           
            @endif

            @if(Auth::check() && Auth::user()->user_type->type_name=="Judicial Officer")
            


            <li class="nav-item">
                <a class="nav-link" href="{{url('zone_pref_jr')}}">
                    <span data-feather="file"></span>
                    <i class="fa fa-square" aria-hidden="true"></i>
                    Zone Preference JO
                </a>
            </li>

            <!--  <li><a href="{{route('profile')}}"><i class="fa fa-btn fa-sign-out"></i>Profile</a></li>-->

            
            @endif

            @if(Auth::check() && Auth::user()->user_type->type_name=="Inspection")

            <li>
                <a href="#masterSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-edit"></i>Master Maintenance</a>
                <ul class="collapse list-unstyled" id="masterSubmenu">
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('grade')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-crosshairs" aria-hidden="true"></i>
                            ACR Grade Master
                        </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="{{url('court')}}">
                            <span data-feather="home"></span>
                            <i class="fa fa-gavel" aria-hidden="true"></i>
                            Court Master
                        </a>
                    </li>
                   
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('subdivision')}}">
                            <span data-feather="file"></span>
                            
                            <i class="fa fa-crosshairs" aria-hidden="true"></i>
                            Subdivision Master
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('district')}}">
                        <i class="fa fa-location-arrow" aria-hidden="true"></i>
                            District Master 
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('zone')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-thumb-tack" aria-hidden="true"></i>
                            Zone Master
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('state')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            State Master 
                        </a>
                    </li> 
                </ul>
            </li>
            <li>
                <a href="#mainmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-address-book"></i>Judicial Officer</a>
                <ul class="collapse list-unstyled" id="mainmenu">
                    <li class="nav-item">           
                        <a class="nav-link" href="{{url('jo_entry_form')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-briefcase"></i>
                            Profile Details Entry
                        </a>
                    </li>
                    <li class="nav-item">           
                        <a class="nav-link" href="#">
                            <span data-feather="file"></span>
                            <i class="fa fa-briefcase"></i>
                            Documents Entry
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="#acrmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-snowflake-o"></i>ACR</a>
                <ul class="collapse list-unstyled" id="acrmenu">

                    <li class="nav-item">
                        <a class="nav-link" href="{{url('acr_history')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-square" aria-hidden="true"></i>
                            ACR History
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('acr_fetch')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-crosshairs" aria-hidden="true"></i>
                            ACR Fetch
                        </a>
                    </li>
                </ul>
           </li>

            @endif

            @if(Auth::check() && Auth::user()->user_type->type_name=="Appointment")

             <li>
                <a href="#appointmentmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-edit"></i>Master Maintenance</a>
                <ul class="collapse list-unstyled" id="appointmentmenu">
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('court')}}">
                            <span data-feather="home"></span>
                            <i class="fa fa-gavel" aria-hidden="true"></i>
                            Court Master
                        </a>
                    </li>
                   
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('subdivision')}}">
                            <span data-feather="file"></span>
                            
                            <i class="fa fa-crosshairs" aria-hidden="true"></i>
                            Subdivision Master
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('district')}}">
                        <i class="fa fa-location-arrow" aria-hidden="true"></i>
                            District Master 
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('zone')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-thumb-tack" aria-hidden="true"></i>
                            Zone Master
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('state')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            State Master 
                        </a>
                    </li> 
                </ul>
            </li>

            <li>
                <a href="#jomenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-address-book"></i>Judicial Officer</a>
                <ul class="collapse list-unstyled" id="jomenu">
                    <li class="nav-item">           
                        <a class="nav-link" href="{{url('jo_entry_form')}}">
                            <span data-feather="file"></span>
                            <i class="fa fa-briefcase"></i>
                            Profile Details Entry
                        </a>
                    </li>
                    <li class="nav-item">           
                        <a class="nav-link" href="#">
                            <span data-feather="file"></span>
                            <i class="fa fa-briefcase"></i>
                            Documents Entry
                        </a>
                    </li>
                </ul>
            </li>

            @endif

            @if(Auth::check() && Auth::user()->user_type->type_name=="Department")
            <li>
                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="fa fa-copy"></i>
                    Lower Court Record
                </a>
                <ul class="collapse list-unstyled" id="pageSubmenu">
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('lcr_hc')}}">
                            <span data-feather="home"></span>
                            <i class="fa fa-dot-circle-o" aria-hidden="true"></i>
                            Request for LCR
                        </a>
                    </li>
                </ul>
                @endif


            @if(Auth::check() && Auth::user()->user_type->type_name=="Court")
            <li>
                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="fa fa-copy"></i>
                    Lower Court Record
                </a>
                <ul class="collapse list-unstyled" id="pageSubmenu">
                    <li class="nav-item">
                        <a class="nav-link" href="{{url('lcr_view')}}">
                            <span data-feather="home"></span>
                            <i class="fa fa-dot-circle-o" aria-hidden="true"></i>
                            Response to LCR Request
                        </a>
                    </li>
                </ul>
            </li>
            @endif

            <li>
                <!-- <a href="acr_history">
                    <i class="fa fa-image"></i>
                    Portfolio
                </a> -->
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-question"></i>
                    FAQ
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-paper-plane"></i>
                    Contact
                </a>
            </li>
        </ul>

    </div>
        
    </nav>


    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">

            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed"
                        data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                        aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                </button>

                <!-- logo -->
                <a class="navbar-brand" href="{{ url('/') }}"> <img
                        src="{{asset('images/ashok.png')}}"
                        class="img-responsive custom-navbar-brand-img"
                        alt="Calcutta High Court" />
                </a>
                <!-- /logo -->
                <a class="navbar-brand" href="{{ url('/') }}"> <img
                        src="{{asset('images/logo-name.png')}}"
                        class="img-responsive custom-navbar-brand-img"
                        alt="Calcutta High Court"/>
                </a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">	

        
                <ul class="nav navbar-nav navbar-right">

                    <!-- Authentication Links -->
                    @if (Auth::guest())
                    <li><a href="{{ url('/login') }}">Login</a></li>
                   
                    @else
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                                            data-toggle="dropdown" role="button" aria-expanded="false"> {{
                            Auth::user()->name }} <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu">

                            <!-- <li><a href="{{route('profile')}}"><i class="fa fa-btn fa-sign-out"></i>Profile</a></li>-->
                            
                            <li><a href="#" onclick="$('#logout_form').submit();"><i class="fa fa-btn fa-sign-out"></i>Logout</a></li>
                        </ul>
                    </li> @endif

                </ul>
                <form id="logout_form" action="{{ url('/logout') }}" name="logout_form" method="POST"></form>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</nav>


@endsection