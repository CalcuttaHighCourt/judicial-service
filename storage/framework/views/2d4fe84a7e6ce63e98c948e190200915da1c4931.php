 <?php $__env->startSection('title', 'Courts'); ?>
<?php $__env->startSection('page_heading'); ?> Courts <?php $__env->stopSection(); ?>
<?php $__env->startSection('center_main_content'); ?>

<div class="col-sm-12">

    <!-- Bootstrap Boilerplate... -->
    <div id="info-panel" class="panel panel-default" style="background:white;">
        <!-- IIIIIIIIIII -->
        <div id="info-panel-heading" class="panel-heading"><h1 align="center">DEPARTMENT DASHBOARD</h1></div>
        <!-- IIIIIIIIIII -->
        <div class="panel-body">
            
            <h3 style="color:red;">Work in Progress</h3>
        </div>
    </div>
</div>

<?php $__env->stopSection(); ?> <?php echo $__env->make('layouts.1_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?> <?php echo $__env->yieldContent('1_column_content'); ?> <?php $__env->stopSection(); ?>

<?php $__env->startSection('meta'); ?>
##parent-placeholder-cb030491157b26a570b6ee91e5b068d99c3b72f6##

<?php $__env->stopSection(); ?>

<?php $__env->startSection('end_scripts'); ?> ##parent-placeholder-36ee17f40f3980c360dd4f0dee7896f1cfc0384a##

<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?> ##parent-placeholder-1fa5d88582eaf7c8fca74b6f4d35a679841c3cf9## class="" <?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/departments/dept_dashboard.blade.php ENDPATH**/ ?>