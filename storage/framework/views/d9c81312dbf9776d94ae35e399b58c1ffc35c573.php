<?php $__currentLoopData = App\State::orderBy('state_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $state): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<option value="<?php echo e($state->id); ?>" <?php if(old('state') == $state->state_name): ?> selected="selected" <?php endif; ?>><?php echo e($state->state_name); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH C:\laragon\www\Judicial-Service\resources\views/states/state_options.blade.php ENDPATH**/ ?>