 <?php $__env->startSection('title', 'LCR Lower Court End'); ?>
<?php $__env->startSection('page_heading'); ?> LCR Lower Court End <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>
<div class="panel custom-panel">
    <div class="col-sm-12">
        <div id="info-panel" class="panel panel-danger">
            <!-- IIIIIIIIIII -->
            <div id="info-panel-heading" class="panel-heading">ALERTS</div>
            <!-- IIIIIIIIIII -->
            <div class="panel-body">

                <!-- Lower Court Request Form -->
                <span><strong>Notification:</strong> There are some LCR request received<br><br>
                

    <?php $__currentLoopData = $data['hc_records']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $hc_record): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

     
            <?php $__currentLoopData = $hc_record['lcr_case_details']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lc): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                
                <span id="lower" style="background-color:#ffffff;color:#C11111;"><strong><?php echo e(($lc['lower_case_type']['type_name'])); ?>/<?php echo e(($lc['lower_case_no'])); ?>/<?php echo e(($lc['lower_case_year'])); ?></strong></span>

            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            &nbsp;
            is required by Hon’ble High Court in the Case No: <a href="<?php echo e(url('lcr_compliance/'.$hc_record['id'])); ?>"><?php echo e(($hc_record['case_type']['type_name'])); ?>/<?php echo e($hc_record['hc_case_no']); ?>/<?php echo e($hc_record['hc_case_year']); ?></a>
            <br> within <span id="deadline" style="background-color:#ffffff;color:#C11111;"><strong><?php echo e($hc_record['deadline']); ?></strong></span>
            <br>
            <hr>

    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> 


                    <hr>
                    
                </span>
              

                <!--loader starts-->
                <div class="col-md-offset-5 col-md-3" id="wait" style="display:none;">
                    <img src='images/loader.gif'width="25%" height="10%" />
                    <br>Loading..
                </div>

            </div>
            <hr>

        </div>
    </div>
</div>

<?php $__env->stopSection(); ?> <?php echo $__env->make('layouts.1_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?> <?php echo $__env->yieldContent('1_column_content'); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('meta'); ?>
##parent-placeholder-cb030491157b26a570b6ee91e5b068d99c3b72f6##
<meta name="_token" content="<?php echo csrf_token(); ?>" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('end_scripts'); ?> ##parent-placeholder-36ee17f40f3980c360dd4f0dee7896f1cfc0384a##

<script type="text/javascript">

    $(document).ready(function () {

        /*LOADER*/

        $(document).ajaxStart(function () {
            $("#wait").css("display", "block");
        });
        $(document).ajaxComplete(function () {
            $("#wait").css("display", "none");
        });

        /*LOADER*/

      

    });


</script>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/lcr/lower_index.blade.php ENDPATH**/ ?>