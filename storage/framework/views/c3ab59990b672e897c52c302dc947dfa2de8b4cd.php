<?php $__currentLoopData = App\Subdivision::orderBy('subdivision_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subdivision): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<option data-zone="<?php echo e($subdivision->zone_id); ?>" value="<?php echo e($subdivision->subdivision_name); ?>"><?php echo e($subdivision->subdivision_name); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

<?php $__currentLoopData = App\District::orderBy('district_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $district): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<option data-zone="<?php echo e($district->zone_id); ?>" value="<?php echo e($district->district_name); ?>"><?php echo e($district->district_name); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/place_of_posting/place_of_posting_option.blade.php ENDPATH**/ ?>