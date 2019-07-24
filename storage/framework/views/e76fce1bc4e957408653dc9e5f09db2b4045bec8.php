<?php $__env->startSection('header'); ?>
<!-- Fixed navbar -->
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

			<a class="navbar-brand" href="<?php echo e(url('/')); ?>"> <img
				src="<?php echo e(asset('images/ashok.png')); ?>"
				class="img-responsive custom-navbar-brand-img"
				alt="Calcutta High Court" />
			</a>

			<!-- /logo -->
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<a class="navbar-brand" href="<?php echo e(url('/')); ?>"> <img
				src="<?php echo e(asset('images/logo-name.png')); ?>"
				class="img-responsive custom-navbar-brand-img"
				alt="Calcutta High Court"/>
			</a>
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
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column" style="margin-top:25px;">
				
				<li class="nav-item">
			  	<li class="treeview">
				  	 <span style="color:#ffffff;font-size:17px;"><u>Master Maintainence</u></span>
				</li></li>
								
				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="court">
						<span data-feather="home"></span>
							Court Master
						</a>
					</li>
				</li>

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="subdivision">
						<span data-feather="file"></span>
						Subdivision Master
						</a>
					</li>
				</li>
						
				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="district">
						<span data-feather="home"></span>
							District Master 
						</a>
					</li>
				</li>
				

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="zone">
						<span data-feather="file"></span>
						Zone Master
						</a>
					</li>
				</li>

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="state">
						<span data-feather="file"></span>
						State Master 
						</a>
					</li>
				</li>
						
				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="judicial_officer">
						<span data-feather="file"></span>
						 Judicial Officer
						</a>
					</li>
				</li>

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="designation">
						<span data-feather="file"></span>
						Designation Master
						</a>
					</li>
				</li>

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="mode">
						<span data-feather="file"></span>
						Mode Master
						</a>
					</li>
				</li>

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="qualification">
						<span data-feather="file"></span>
						Qualification Master
						</a>
					</li>
				</li>

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="recruitmentbatch">
						<span data-feather="file"></span>
						Recruitment Batch
						</a>
					</li>
				</li>

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="jo_postings">
						<span data-feather="file"></span>
						Posting Preference HC
						</a>
					</li>
				</li>

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="zone_pref_jr">
						<span data-feather="file"></span>
						Zone Preference JO
						</a>
					</li>
				</li>

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="religion">
						<span data-feather="file"></span>
						Religion
						</a>
					</li>
				</li>

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="caste">
						<span data-feather="home"></span>
							Caste Master
						</a>
					</li>
				</li>

				<li class="nav-item">
					<li class="treeview">
						<a class="nav-link" href="jo_reporting_reviewing">
						<span data-feather="home"></span>
							Reporting & reviewing officer
						</a>
					</li>
				</li>

				
				
				


				



				

				

				
			</ul>
			</div>
		  </nav>
		  



<?php /**PATH C:\laragon\www\Judicial-Service\resources\views/layouts/header_menu.blade.php ENDPATH**/ ?>