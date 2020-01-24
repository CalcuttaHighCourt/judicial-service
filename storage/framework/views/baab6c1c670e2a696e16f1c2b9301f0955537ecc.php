 
<?php $__env->startSection('content'); ?>
<style>
   .select2-results__option{
   color:#d43c3c;
   }
</style>

<!-- Bootstrap Boilerplate... -->
<div id="info-panel" class="panel panel-default">
<!-- IIIIIIIIIII -->
<div id="info-panel-heading" class="panel-heading"><h2>Activate the Posting Preference Window for Judicial Officers </h2></div>
<!-- IIIIIIIIIII -->
<div class="panel-body">
<br><br>
<!-- New Task Form -->

<div class="form-group required row">
    <div class="form-group required row">
        <div class="col-sm-offset-3 col-sm-3">
            <div id="judicial_officer-group" class="form-group our-form-group">
            <!-- IIIIIIIIIII -->
                <select id="judicial_officer" class="form-control select2 info-form-control judicial_officer"
                        name="judicial_officer"> 
                        <option value="">Select Judicial Officer</option>
                        <?php echo $__env->make('judicial_officers.judicial_officer_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                </select>
            </div>
        </div>
        <div class="col-sm-2 form-group" id="pref_window_flag">
            
            <input type="checkbox" name="pref_window_flag" id="display_flag" data-toggle="toggle" data-width="100">
        </div>
    </div>
</div>    

<!--loader starts-->
<div class="col-sm-offset-5 col-md-3" id="wait" style="display:none;">
   <img src='images/loader.gif'width="25%" height="10%" />
   <br>Loading..
</div>
<!--loader ends-->

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>


<meta name="_token" content="<?php echo csrf_token(); ?>" />

<!--  -->
<script>
   $(document).ready(function() {
   
   /*LOADER*/
   
   	    $(document).ajaxStart(function() {
            $("#wait").css("display", "block");
        });
        $(document).ajaxComplete(function() {
            $("#wait").css("display", "none");
        });
   
    /*LOADER*/
   
    /* select2 initialisation */
   
    $(".select2").select2(); 
  
    $('#display_flag').bootstrapToggle({
                on: 'Enabled',
                off: 'Disabled',
                onstyle: 'success',
                offstyle: 'danger'
            }); // Toggle button initialization

   
    
     
   /*Cloning of Year and Grades */
   
         
         
   });
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/appointments/preference_window_open.blade.php ENDPATH**/ ?>