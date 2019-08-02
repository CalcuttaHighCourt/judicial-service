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
						<li><a href="#" onclick="$.ajax({
							type: 'POST',
							url: '<?php echo e(url('/logout')); ?>',
						});"><i
								class="fa fa-btn fa-sign-out"></i>Logout</a></li>
					</ul></li> <?php endif; ?>

			</ul>

		</div>
		<!--/.nav-collapse -->

	</div>




</nav>

<?php if(Auth::check()): ?>
<br />
<br />
<a class="navbar-brand" href="#"><?php echo e(strtoupper(Auth::user()->user_name)); ?>&nbsp;MENU</a>
<br />
<br />
<div class="container-fluid">

	<div class="row">
		<br />
		<div class="col-sm-12">
			<div class="well text-right">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">DISPLAY BOARD UPLOAD</a>
				</div>
				<a class="btn btn-default navbar-btn"
					href="<?php echo e(url('/Display-Board-Records/SPA/')); ?>">Display Board Records</a> 
			</div>
		</div>
	</div>


</div>
<?php else: ?>
<div class="row">&nbsp;</div>
<?php endif; ?> <?php $__env->stopSection(); ?>
<?php /**PATH F:\laragon\www\judicial-officer\resources\views/layouts/header_menu.blade.php ENDPATH**/ ?>