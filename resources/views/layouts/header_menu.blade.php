@section('header')
<!-- Fixed navbar -->
<nav id="sidebar">
    <div class="sidebar-header">
        <h3>Bootstrap Sidebar</h3>
        <strong>BS</strong>
    </div>

    <ul class="list-unstyled components">
        <li class="active">
            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fa fa-home"></i>
                Home
            </a>
            <ul class="collapse list-unstyled" id="homeSubmenu">
                <li>
                    <a href="#">Home 1</a>
                </li>
                <li>
                    <a href="#">Home 2</a>
                </li>
                <li>
                    <a href="#">Home 3</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class="fa fa-briefcase"></i>
                About
            </a>
            <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <i class="fa fa-copy"></i>
                Pages
            </a>
            <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="#">Page 1</a>
                </li>
                <li>
                    <a href="#">Page 2</a>
                </li>
                <li>
                    <a href="#">Page 3</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class="fa fa-image"></i>
                Portfolio
            </a>
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

    <ul class="list-unstyled CTAs">
        <li>
            <a href="https://bootstrapious.com/tutorial/files/sidebar.zip" class="download">Download source</a>
        </li>
        <li>
            <a href="https://bootstrapious.com/p/bootstrap-sidebar" class="article">Back to article</a>
        </li>
    </ul>
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

            <div class="navbar-brand" style="margin-left:120px;line-height:1.2;"> 
                <span style="font-family:'Vijaya'!important;font-size:28px;">INTEGRATED INFORMATION MANAGEMENT SYSTEM</span>
            </div>
            <!-- Right Side Of Navbar -->
            <ul class="nav navbar-nav navbar-right">

                <!-- Authentication Links -->
                @if (Auth::guest())
                <li><a href="{{ url('/login') }}">Login</a></li>
                <li><a href="{{ url('/register') }}">Register</a></li>
                @else
                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                        data-toggle="dropdown" role="button" aria-expanded="false"> {{
						Auth::user()->name }} <span class="caret"></span>
                    </a>

                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#" onclick="$('#logout_form').submit();"><i
                                    class="fa fa-btn fa-sign-out"></i>Logout</a></li>
                    </ul></li> @endif

            </ul>
            <form id="logout_form" action="{{ url('/logout') }}" name="logout_form" method="POST"></form>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>

<nav class="col-md-2 d-none d-md-block bg-light sidebar" style="background-color:#404040;">
    <div class="sidebar-sticky">
        <ul class="nav flex-column" style="margin-top:25%;">


            <li class="treeview">
                <a href="#">
                    <i class="fa fa-edit"></i>
                    <span ><u>Master Maintainence</u></span>
                    <span class="pull-right-container" style="color:#ffffff;font-size:17px;"><i class="fa fa-angle-left pull-right"></i></span>
            </li>
            </li>


            <ul class="treeview-menu">
                <li class="nav-item">
                    <a class="nav-link" href="court">
                        <span data-feather="home"></span>
                        Court Master
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="subdivision">
                        <span data-feather="file"></span>
                        Subdivision Master
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="district">
                        <span data-feather="home"></span>
                        District Master 
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="zone">
                        <span data-feather="file"></span>
                        Zone Master
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="state">
                        <span data-feather="file"></span>
                        State Master 
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="judicial_officer">
                        <span data-feather="file"></span>
                        Judicial Officer
                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="designation">
                        <span data-feather="file"></span>
                        Designation Master
                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="mode">
                        <span data-feather="file"></span>
                        Mode Master
                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="qualification">
                        <span data-feather="file"></span>
                        Qualification Master
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="recruitmentbatch">
                        <span data-feather="file"></span>
                        Recruitment Batch
                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="jo_postings">
                        <span data-feather="file"></span>
                        Posting Preference HC
                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="zone_pref_jr">
                        <span data-feather="file"></span>
                        Zone Preference JO
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="religion">
                        <span data-feather="file"></span>
                        Religion
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="caste">
                        <span data-feather="home"></span>
                        Caste Master
                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="jo_reporting_reviewing">
                        <span data-feather="home"></span>
                        Reporting & reviewing officer
                    </a>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="lcr">
                        <span data-feather="home"></span>
                        Lower Court Report
                    </a>
                </li>

            </ul>
    </div>
</nav>
@endsection