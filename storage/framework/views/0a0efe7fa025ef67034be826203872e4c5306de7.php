<?php $__currentLoopData = App\Mode::orderBy('posting_mode', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $mode): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<option value="<?php echo e($mode->id); ?>" <?php if(old('mode') == $mode->posting_mode): ?> selected="selected" <?php endif; ?>><?php echo e($mode->posting_mode); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/modes/mode_options.blade.php ENDPATH**/ ?>