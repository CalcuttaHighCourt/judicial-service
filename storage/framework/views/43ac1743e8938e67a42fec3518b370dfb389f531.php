<?php
use App\Http\Controllers\PageController;
?>


<?php
	$calendar_display="month";
	?>



<?php $__env->startSection('title', 'Home'); ?>

<?php $__env->startSection('page_heading'); ?>
	Home Page
<?php $__env->stopSection(); ?>



<?php $__env->startSection('left_main_content'); ?>





<div class="panel custom-panel">
	<!--<div class="text-center"><a href="<?php echo e(url('/page/Oath-Taking-Ceremony-01052018')); ?>">Oath taking ceremony of the Hon'ble Chief Justice Jyotirmay Bhattacharya held on 1<sup>st</sup> May, 2018</a></div>-->
	<div class="text-center"><a href="<?php echo e(url('/page/Oath-Taking-Ceremony-30102018')); ?>">Oath taking ceremony of the Hon'ble Chief Justice Debasish Kar Gupta held on 30<sup>th</sup> Oct, 2018</a></div>
	<br/>
	<div class="col-sm-10 col-sm-offset-1 ">
	<?php echo $__env->make('layouts.carousel', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
</div>
	
</div>


<div class="col-sm-12 col-sm-offset-0">
	<?php
	$notice_type_file_prefix='All';
	$limit=10;
	?>
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\judicial-officer\resources\views/index.blade.php ENDPATH**/ ?>