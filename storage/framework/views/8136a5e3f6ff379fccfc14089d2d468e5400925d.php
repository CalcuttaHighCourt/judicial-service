 <?php $__env->startSection('title', 'JudicialOfficerPostingPreference'); ?>
<?php $__env->startSection('page_heading'); ?> JudicialOfficerPostingPreference <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
<style>
    .select2-container--default .select2-selection--multiple .select2-selection__choice{
        background-color:#111;
        
    }
    .select2-container--default .select2-results__option{
    background-color: #28415b;
}
</style>
<!-- Bootstrap Boilerplate... -->
<div id="info-panel" class="panel panel-default">
	<!-- IIIIIIIIIII -->
    <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#add_new">Posting Details</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#daily_dairy">Judicial Dairy</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">Annual Confidential Report</a>
    </li>
  </ul>
	
	<!-- IIIIIIIIIII -->
	<div class="panel-body">

		<!-- New Task Form -->
		<form id="info-form add_new" class="form-horizontal" role="form" method="POST"
			action="<?php echo e(url('/admin/JudicialOfficerPostingPreference')); ?>">
			<?php echo e(csrf_field()); ?>

			<input type="hidden" id="JudicialOfficerPostingPreference-id">
			<div id="officer_name-group" class="form-group row our-form-group">
                <label for="officer_name" class="col-md-5 ">Officer Name: <?php echo e(Auth::user()->name); ?></label>
            </div>
            <div id="jo_code-group" class="form-group row our-form-group">
                <label for="jo_code" class="col-md-3">Code: <?php echo e(Auth::user()->jo_code); ?></label>
            </div>
            <div id="zone-group" class="form-group row our-form-group">
                <label for="zone" class="col-md-2 ">Current Zone of Posting:<span id="cur_zone_name" name="cur_zone_name"><?php echo e($zone_pref_details['current_zone']['zone_name']); ?></span></label>
            </div>
            <div id="zone-group" class="form-group row our-form-group">
                <label for="zone" class="col-md-2 ">Previous Zone of Posting:<span id="pre_zone_name" name="pre_zone_name"><?php echo e($zone_pref_details['just_prev_zone']['zone_name']); ?></span></label>
            </div>
            <hr>
        
            <div id="posting_pref-group" class="form-group row our-form-group">
                
                <div class="col-md-2">
                <label for="posting_pref">Posting Preference </label>
                <select id="posting_pref" class="form-control select2 js-example-basic-multiple posting_pref" style="width:150px" name="posting_pref" multiple="multiple">
                    
							 <?php $__currentLoopData = $zone_pref_details['zones']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $zone): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($zone->id); ?>"><?php echo e($zone->zone_name); ?></option>
                             <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
				</div>
                         

				<div class="col-md-2">
                    <br>
					<button id="submit" type="button"
						class="btn btn-primary add-button info-form-button">
						Submit
					</button>
				</div>
            </div>
            <br><br>

            <div class="table-responsive" style="display:none;"  id="jo_details" name="jo_details">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>Officer Name</th>                    
                  <th>JO Code</th>
                  <th>Previous Zone</th>                  
                  <th>Current Zone</th>
                  <th>Court Complex</th>                  
                  <th>Court</th>
                  <th>Designation</th>                  
                  <th>Date From</th>
                  <th>Preference 1</th>
                  <th>Preference 2</th>

                </tr>
              </thead>
              <tbody>          
              </tbody>
            </table>
          </div>
		</form>
	</div>
</div>



	</div>
</div>
<div id="test-div"></div>

<?php $__env->stopSection(); ?> <?php echo $__env->make('layouts.1_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?> <?php echo $__env->yieldContent('1_column_content'); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('meta'); ?>
##parent-placeholder-cb030491157b26a570b6ee91e5b068d99c3b72f6##
<meta name="_token" content="<?php echo csrf_token(); ?>" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('end_scripts'); ?> ##parent-placeholder-36ee17f40f3980c360dd4f0dee7896f1cfc0384a##


<script type="text/javascript">
      $(document).ready(function(){

            $('.select2').select2({
                placeholder:"Select an option",
            });

           /*LOADER*/

            $(document).ajaxStart(function() {
                $("#wait").css("display", "block");
            });
            $(document).ajaxComplete(function() {
                $("#wait").css("display", "none");
            });

         /*LOADER*/
   
        //Addition of Ps_Details starts
        
            $(document).on("click", "#search",function(){

                var jo_code = $("#officer_name").val();

            //    $("#jo_details").show();
                
                $.ajax({

                    type:"POST",
                    url:"jo_posting/search",
                    data:{
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        jo_code:jo_code                      
                },
                success:function(response)
                {
                    //console.log(response);
                   
                    $("#jo_details").show();

                   // $("#officer_name").val('');
                    var details="";
                    details+=      '<tr>'+
                                        '<td>'+response[0].jo_code+'</td>'+
                                        '<td>'+response[0].designation_name+'</td>'+
                                        '<td>'+response[0].district_name+'</td>'+
                                        '<td>'+response[0].zone_name+'</td>'+
                                        '<td>'+response[0].from_date+'</td>'+
                                        '<td>'+response[0].duration+'</td>'+
                                    '</tr>';

                                //console.log(details);
                    $('table tbody').html(details);
                },
                error:function(response) {  
                           
                    }                
                
                });

            });//end of search

    $(document).on("click","#submit",function(){

        var pref=$("#posting_pref").val();
        var pref_name=$("#posting_pref option:selected").text();        

        if(pref==null)
        {
            swal("Please Select your preferences","","error");
            return false;
        }
        else if(pref.length<2)
        {
            swal("Please Select Minimum 2 preferences","","error");
            return false;
        }
        else
        {
            var str="";
            var i;
            for(i=0;i<pref.length;i++){
                str+="Preference - "+(i+1)+" : "+pref_name[i]+"\n";
                //console.log(i);
            }

            swal({
                    title: "Are You Sure?",
                    text: str,
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
            .then((willApprove) => {
                if(willApprove) {                           

                    //Add dept using ajax : start
                        $.ajax({
                            type:"POST",
                            url:"zone_pref/submit",
                            data:{
                                _token: $('meta[name="csrf-token"]').attr('content'),
                                pref:pref
                            },                                                          
                            success:function(response){
                                // console.log(response);                                     
                                swal("Preference Added Successfully","Successful","success");
                                table.api().ajax.reload();   

                            },
                            error:function(response) {  
                                if(response.responseJSON.errors.hasOwnProperty('pref'))
                                    swal("Cannot Add New Department", ""+response.responseJSON.errors.pref['0'], "error");                                                       
                                }

                            });//Add dept using ajax : end
                            
                    }//end of swal if(willApprove)

                })//permission to save given verification           


        } //end of else  if(pref.length<2)

                                      
    });//end of  $(document).on("click","#submit",function()

});


</script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\Judicial-Service\resources\views/zone_pref_jr/index.blade.php ENDPATH**/ ?>