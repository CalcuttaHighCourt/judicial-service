<?php $__currentLoopData = App\Caste::orderBy('caste_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $caste): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<option value="<?php echo e($caste->id); ?>" <?php if(old('caste') == $caste->caste_name): ?> selected="selected" <?php endif; ?>><?php echo e($caste->caste_name); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH F:\laragon\www\judicial-service\resources\views/castes/caste_options.blade.php ENDPATH**/ ?>