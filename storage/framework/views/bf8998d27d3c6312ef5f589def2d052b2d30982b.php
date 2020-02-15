 
<?php $__env->startSection('content'); ?>
<!-- Main content -->

	<div id="info-panel" class="panel panel-default">
		<!-- IIIIIIIIIII -->
		<div id="info-panel-heading" class="panel-heading">ADD NEW DESIGNATION</div>
		<!-- IIIIIIIIIII -->
		<div class="panel-body">

			<!-- New Task Form -->
			<div class="row">
				<div id="department_name-group" class="form-group our-form-group">
				<!-- IIIIIIIIIII -->
					<label for="department_name" class="col-sm-offset-1 col-sm-2 control-label">Designation</label>
					<div class="col-sm-4">
						<input id="designation_name" type="text"
							class="form-control info-form-control" name="designation_name"> <span
							id="designation_name-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
							<strong id="designation_name-strong" class="our-error-message-strong"></strong>
							<!-- IIIIIIIIIII -->
						</span>
					</div>
				</div>
			</div>
			<div class="row">
				<div id="rank_id-group" class="form-group our-form-group">
					<label for="rank_name" class="col-sm-offset-1 col-sm-2 control-label">Rank</label>
					<div class="col-sm-4">
						<select id="rank_id" class="form-control info-form-control"
								name="rank_id"> <?php echo $__env->make('ranks.rank_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
						</select>
						
					</div>
				</div>
			</div>
			<div class="row" style="display:none;">
				<div id="designation_id-group" class="form-group our-form-group">
					<label for="designation_id" class="col-sm-offset-1 col-sm-2 control-label">Designation Id</label>
					<div class="col-sm-4">
						<input id="designation_id" type="text"
								class="form-control info-form-control" name="designation_id"> <span
								id="designation_id-span" class="help-block our-help-block"> <!-- IIIIIIIIIII -->
								
								<!-- IIIIIIIIIII -->
						</span>
					</div>
				</div>
			</div>
			
			<div class="row">
			<br>
				<div id="button-group" class="form-group our-form-group col-sm-offset-4 col-sm-3">
					<button id="save" type="submit"
							class="btn btn-success save-button info-form-button">
							<i class="fa fa-btn fa-floppy-o"></i> Save
					</button>
					<button id="edit" type="submit"
								class="btn btn-warning edit info-form-button" style="display:none;">
								<i class="fa fa-btn fa-floppy-o"></i> Edit
						</button>
					<button id="reset" type="reset"
							class="btn btn-danger save-button info-form-button">
							<i class="fa fa-btn fa-floppy-o"></i> Reset
					</button>
				</div>
			</div>
				

				<div id="info-panel-buttons" class="form-group hide">
					<div class="col-md-6 col-md-offset-4">
						<button id="add-button" type="submit"
							class="btn btn-primary add-button info-form-button">
							<i class="fa fa-btn fa-plus-circle"></i> Add New Department
						</button>
					</div>
				
			</div>
		</div>

	<div id="datatable-panel" class="panel panel-default">
		<div id="datatable-panel-heading" class="panel-heading clearfix">
			<div class="panel-title pull-left">Designation Master</div>
			
			<div class="pull-right">
				<button id="add-new-button" type="submit" class="btn btn-primary add-new-button">
					<i class="fa fa-plus-circle"></i> Add New
				</button>
			</div>
		</div>
		
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-striped notice-types-table"
					id="datatable-table" style="width: 100%;">

					<!-- Table Headings -->
					<thead>
						<tr>
							<th>Sl No</th>
							<th>Designation Name</th>
							<th>Rank</th>
							<th>Action</th>
						</tr>

					</thead>
					<tbody></tbody>
					<!-- Table Footer -->
				</table>
			</div>

		</div>
	</div>


<meta name="_token" content="<?php echo csrf_token(); ?>" />

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>

<script>

var table="";

 $(document).ready(function(){



 //Datatable Code For Showing Data :: START

var table = $('#datatable-table').DataTable({
		"processing": true,
		"serverSide": true,
		"ajax":{
			"url":"<?php echo e(url('Designation')); ?>-Datatable-Server-Side",
			"dataType": "json",
            "type": "POST",
			"data":{ 
					_token: $('meta[name="csrf-token"]').attr('content')}
                },      
		 		"columns": [                
						{"data": "SL_NO"},
						{"data": "DESIGNATION_NAME"},
						{"data": "RANK"},
						{"data": "ACTION"}
					]

				});




	$(document).on("click","#save",function(){
		
		var designation_name= $("#designation_name").val();
		var rank_id=$("#rank_id").val();

		//console.log(designation_name);

		$.ajax({
			type:"POST",
			url:"designations",
			data: {
					_token: $('meta[name="csrf-token"]').attr('content'),
					designation_name:designation_name,
					rank_id:rank_id
				},
				success:function(response){

					swal("Successfull","Department has been successfully added","success");
					//table.api().ajax.reload();
				
				},
				error:function(response){

					swal("Error","","error");
					
				}
		});
		
	});

	//event on clicking the edit pen in data table

	$(document).on("click",".edit-button",function(){
		 scrollToElement($('#info-panel'));
		 var data = table.row( $(this).parents('tr')).data();
		 //alert("abc");
		console.log(data);
		 $("#designation_name").val(data.DESIGNATION_NAME);
		 $("#rank_id").val(data.RANK_ID);
		 $("#designation_id").val(data.ID);

		$("#edit").show();
		$("#save").hide();
		$("#reset").hide();
	
	});

	$(document).on("click","#edit",function(){
		
		var designation_name=$("#designation_name").val();
		var rank_id= $("#rank_id").val();
		var designation_id= $("#designation_id").val();
		

		$.ajax({
			type:"POST",
			url:"designation_edit",
			data:{
				_token: $('meta[name="csrf-token"]').attr('content'),
				designation_name:designation_name,
				rank_id:rank_id,
				designation_id:designation_id
			},
			success:function(response){
				swal("Updated","Designation has been updated","success");
				table.ajax.reload();
			},
			error:function(response){
				swal("Not Updated","Designation has not been updated","error");
			}
		});
	});
	

});

function scrollToElement(ele) {
// 	alert(ele.html());
// 	$(window).scrollTop(ele.offset().top-60).scrollLeft(ele.offset().left);
        $('html, body').animate({
            scrollTop: ele.offset().top - 60,
        }, 1000);
    }

</script>
<?php $__env->stopSection(); ?>



<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/designations/index.blade.php ENDPATH**/ ?>