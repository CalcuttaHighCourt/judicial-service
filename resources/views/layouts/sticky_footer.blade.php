@section('sticky_footer')
<footer>
		<div class="navbar-fixed-bottom">
			<div class="panel panel-default custom-footer-panel">
				<div class="panel-body">
					<div class="container-fluid">


						<div class="row custom-footer-row">

							<div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">

								<a class="custom-footer-links" target="_blank" rel="noopener noreferrer" href="http://clists.nic.in/">Cause&nbsp;Lists</a>
<!-- 								<a class="custom-footer-links" href="{{url('page/Cause-List')}}">Cause&nbsp;Lists</a> -->

							</div>
							<div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
								<!--<a class="custom-footer-links" target="_blank" rel="noopener noreferrer" href="http://www.courtnic.nic.in/">Case&nbsp;Status</a>-->
								<a class="custom-footer-links" href="{{ url('/Case-Status') }}">Case&nbsp;Status</a>
								
<!-- 								<a class="custom-footer-links" href="{{url('page/Case-Status')}}">Case&nbsp;Status</a> -->
								<!--                    <img src="images/portfolio/i2.png" class="img-responsive" alt="" > -->
							</div>
<!-- 							<div class="col-lg-2  col-md-2 col-sm-4 col-xs-6"> -->
<!-- 								<a class="custom-footer-links" target="_blank" rel="noopener noreferrer" -->
<!-- 									href="http://calcuttahighcourt.nic.in/pdf_files/actualcopyready.pdf">Certified&nbsp;Copies</a> -->
								<!--                     <img src="images/portfolio/i3.png" class="img-responsive" alt="" > -->
<!-- 							</div> -->
							<div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
								<a class="custom-footer-links" href="{{url('page/Pendency-of-Cases')}}">Pendency&nbsp;of&nbsp;Cases</a>
								<!--                     <img src="images/portfolio/i4.png" class="img-responsive" alt="" > -->
							</div>
							<div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
								<a class="custom-footer-links" target="_blank" rel="noopener noreferrer" href="http://judis.nic.in/">Orders&nbsp;& Judgements</a>
<!-- 								<a class="custom-footer-links" href="{{url('page/Order-Judgement')}}">Orders&nbsp;& Judgements</a> -->
								<!--                     <img src="images/portfolio/i5.png" class="img-responsive" alt="" > -->
							</div>
							<div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
								<a class="custom-footer-links" target="_blank" rel="noopener noreferrer"
									href="http://ecourts.gov.in/wb">District&nbsp;Courts</a>
								<!--                     <img src="images/portfolio/i6.png" class="img-responsive" alt="" > -->
							</div>
							<div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
								<a class="custom-footer-links" href="{{url('page/Important-Links')}}">Important&nbsp;Links</a>
								<!--                     <img src="images/portfolio/i6.png" class="img-responsive" alt="" > -->
							</div>
						</div>
						<!--/.row-->
						<!--             <p class="pull-left"> Copyright &copy; All right reserved. </p>  -->
					</div>
				</div>
			</div>
			<!--/.container-->
		</div>
		<!--/.footer-->

	</footer>
@endsection
