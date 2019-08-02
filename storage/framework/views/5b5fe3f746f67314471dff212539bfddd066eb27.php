<?php

use App\Http\Controllers\PageController;
?>


<?php
$calendar_display = "month";
?>



<?php $__env->startSection('title', 'Home'); ?>

<?php $__env->startSection('page_heading'); ?>
Home Page
<?php $__env->stopSection(); ?>



<?php $__env->startSection('left_main_content'); ?>





<div class="panel custom-panel">
    <div class="col-sm-12">
        <div id="info-panel" class="panel panel-danger">
            <!-- IIIIIIIIIII -->
            <div id="info-panel-heading" class="panel-heading">ALERTS</div>
            <!-- IIIIIIIIIII -->
            <div class="panel-body">

                <!-- Lower Court Request Form -->
                <span><strong>Notification:</strong> There are some LCR request received<br><br>
                    1. TS / 1/ 2019, TS/ 5/ 2018 and TA / 50 / 2019 is required by Hon’ble High Court in the Case No: <a href="lcr_compliance" >CRM / 10/ 2019</a> within 05/12/2019. 
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



<?php $__env->stopSection(); ?>

<?php $__env->startSection('right_sidebar_content'); ?>


<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.2_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?>
<?php echo $__env->yieldContent('2_column_content'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?>
<?php $__env->stopSection(); ?>

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

        $(document).on("click", "#case_details", function () {
            $("#case_details").
        })

    });


</script>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/lcr/lower_index.blade.php ENDPATH**/ ?>