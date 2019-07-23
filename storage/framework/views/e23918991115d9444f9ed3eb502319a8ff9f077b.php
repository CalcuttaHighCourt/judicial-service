<?php echo $__env->make('layouts.meta', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?> 
<?php echo $__env->make('layouts.css', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->make('layouts.upper_scripts', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?> 
<?php echo $__env->make('layouts.header_menu', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?> 

<?php echo $__env->make('layouts.page_footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->make('layouts.sticky_footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->make('layouts.end_scripts', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php echo $__env->yieldContent('meta'); ?> 
<?php echo $__env->yieldContent('css'); ?>
<title>Calcutta High Court - <?php echo $__env->yieldContent('title'); ?></title>
<?php echo $__env->yieldContent('upper_scripts'); ?>
</head>
<body <?php $__env->startSection('body_attributes'); ?> class="custom-background" <?php echo $__env->yieldSection(); ?>>
	<?php echo $__env->yieldContent('header'); ?>
	<div class="container-fluid custom-main-container">
		<?php echo $__env->yieldContent('main_container'); ?>
	</div>
	 <?php echo $__env->yieldContent('sticky_footer'); ?> <?php echo $__env->yieldContent('end_scripts'); ?>
</body>
</html>
<?php /**PATH C:\laragon\www\Judicial-Service\resources\views/layouts/app.blade.php ENDPATH**/ ?>