<?php $__env->startSection('header'); ?>
<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<!-- logo -->

			<a class="navbar-brand" href="<?php echo e(url('/')); ?>"> <img
				src="<?php echo e(asset('images/logo.png')); ?>"
				class="img-responsive custom-navbar-brand-img"
				alt="Calcutta High Court" />
			</a>

			<!-- /logo -->
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<?php echo e(url('/')); ?>">Home</a></li>

				<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">About
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="<?php echo e(url('page/About-High-Court')); ?>">High Court</a></li>

						<li><a href="<?php echo e(url('page/History')); ?>">History</a></li>
						<li><a href="<?php echo e(url('page/Sesqui-Centinary-Celebration')); ?>">Sesqui-Centinary
								Celebration</a></li>
						<li><a href="<?php echo e(url('page/High-Court-Registry')); ?>">High Court
								Registry</a></li>
						<li><a href="<?php echo e(url('page/Our-Contacts')); ?>">Our Contacts</a></li>
						<li><a href="<?php echo e(url('page/Right-To-Information')); ?>">Right to
								Information</a></li>
						<!--<li><a href="<?php echo e(url('page/Contact-Us')); ?>">Contact Us</a></li>-->
						<!-- this need to be changed - SRoy -->
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Cause Lists <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<!-- 						<li><a href="<?php echo e(url('page/Cause-List-OS')); ?>">Original Side</a></li> -->
						<!-- 						<li><a href="<?php echo e(url('page/Cause-List-AS')); ?>">Appellate Side</a></li> -->
						<li><a target="_blank" rel="noopener noreferrer" href="http://clists.nic.in/">Original Side</a></li>
						<li><a target="_blank" rel="noopener noreferrer" href="http://clists.nic.in/">Appellate Side</a></li>
						<li><a href="<?php echo e(url('/Old-Cause-Lists')); ?>">Old Cause Lists</a></li>

					</ul>
				
				<li><a href="<?php echo e(url('/Case-Status')); ?>">Case Status</a></li>
				<!-- 				<li class="dropdown"><a href="#" class="dropdown-toggle" -->
				<!-- 					data-toggle="dropdown">Case Status <span class="caret"></span></a> -->
				<!-- 					<ul class="dropdown-menu"> -->
				<!-- 						<li><a target="_blank" rel="noopener noreferrer" href="http://www.courtnic.nic.in/calcutta/content.asp">Original Side</a></li> -->
				<!-- 						<li><a target="_blank" rel="noopener noreferrer" href="http://www.courtnic.nic.in/calcutta_app/content.asp">Appellate Side</a></li> -->
				<!-- 					</ul> -->
				<!-- 				</li> -->

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Orders & Judgments <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="http://164.100.79.153/judis/kolkata"
							target="_blank" rel="noopener noreferrer">Original Side</a></li>
						<li><a href="http://164.100.79.153/judis/kolkata_app"
							target="_blank" rel="noopener noreferrer">Appellate Side</a></li>
						<li><a
							href="http://164.100.79.153/judis/andaman"
							target="_blank" rel="noopener noreferrer">Orders from Circuit Bench, Port Blair</a></li>
						<!-- 						<li><a href="<?php echo e(url('page/Order-Judgement-OS')); ?>">Original Side</a></li> -->
						<!-- 						<li><a href="<?php echo e(url('page/Order-Judgement-AS')); ?>">Appellate Side</a></li> -->
						<!-- 						<li><a href="<?php echo e(url('page/Order-Judgement-CB-Port-Blair')); ?>">Orders from Circuit Bench, Port Blair</a></li> -->
					</ul>
				
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">Services
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="<?php echo e(url('Display-Board')); ?>">Display Board</a></li>
						<li><a href="<?php echo e(url('Calendar')); ?>"> Calendar</a></li>
						<li><a href="<?php echo e(url('page/E-Library')); ?>"> e-Library</a></li>
						<li><a href="<?php echo e(url('Library-Collections')); ?>"> Library Catalogue</a></li>
						<li><a href="<?php echo e(url('page/Android-Apps')); ?>"> ANDROID APPS</a></li>
						<li><a href="<?php echo e(url('page/Certified-Copies')); ?>">Certified Copies</a></li>
						<li><a href="<?php echo e(url('page/Pendency-of-Cases')); ?>">Pendency of Cases</a>
							<ul class="dropdown-menu">
								<li><a href="<?php echo e(url('page/Pendancy-of-Cases-OS')); ?>">Original Side</a></li>
								<li><a href="<?php echo e(url('page/Pendancy-of-Cases-AS')); ?>">Appellate
										Side</a></li>
							</ul></li>

					</ul></li>

			</ul>

			<!-- Right Side Of Navbar -->
			<ul class="nav navbar-nav navbar-right">

				<!-- Authentication Links -->
				<?php if(Auth::guest()): ?>
				<li><a href="<?php echo e(url('/login')); ?>">Login</a></li>
				<li><a href="<?php echo e(url('/register')); ?>">Register</a></li>
				<?php else: ?>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <?php echo e(Auth::user()->name); ?> <span class="caret"></span>
				</a>

					<ul class="dropdown-menu" role="menu">
						<li><a href="#" onclick="$( '#logout_form' ).submit();"><i
								class="fa fa-btn fa-sign-out"></i>Logout</a></li>
					</ul></li> <?php endif; ?>

			</ul>
                        <form id="logout_form" action="<?php echo e(url('/logout')); ?>" name="logout_form" method="POST"></form>

		</div>
		<!--/.nav-collapse -->

	</div>




</nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-3 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
			  	<li class="treeview">
                <a class="nav-link active" href="#">
                  <span data-feather="home"></span>
				  	 Master Maintainence <span class="sr-only">(current)</span>
                </a>
				<a class="nav-link active" href="court">
                  <span data-feather="home"></span>
				  	Court Master Maintainence <span class="sr-only">(current)</span>
                </a>
				<a class="nav-link active" href="district">
                  <span data-feather="home"></span>
				  	District Master Maintainence <span class="sr-only">(current)</span>
                </a>
              </li>
			</li>
            <li class="nav-item">
			  <li class="treeview">
                <a class="nav-link" href="court">
                  <span data-feather="file"></span>
                  Court Master Maintainance
                </a>
              </li>
			</li>
              <!-- <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="shopping-cart"></span>
                  Products
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="users"></span>
                  Customers
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="bar-chart-2"></span>
                  Reports
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="layers"></span>
                  Integrations
                </a>
              </li>
            </ul>

            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Saved reports</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Current month
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Last quarter
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Social engagement
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Year-end sale
                </a>
              </li>
            </ul> -->
			</div>
		  </nav>



<?php /**PATH C:\laragon\www\Judicial-Service\resources\views/layouts/header_menu.blade.php ENDPATH**/ ?>