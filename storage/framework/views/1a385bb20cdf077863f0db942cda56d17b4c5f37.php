<?php $__currentLoopData = App\Qualification::orderBy('qualification_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $qualification): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<option value="<?php echo e($qualification->id); ?>" <?php if(old('qualification') == $qualification->qualification_name): ?> selected="selected" <?php endif; ?>><?php echo e($qualification->qualification_name); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/qualifications/qualification_options.blade.php ENDPATH**/ ?>