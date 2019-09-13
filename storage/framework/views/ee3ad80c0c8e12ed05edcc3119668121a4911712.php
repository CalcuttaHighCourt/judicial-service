<?php $__currentLoopData = App\Religion::orderBy('religion_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $religion): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<option value="<?php echo e($religion->id); ?>" <?php if(old('religion') == $religion->religion_name): ?> selected="selected" <?php endif; ?>><?php echo e($religion->religion_name); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

<?php /**PATH C:\laragon\www\judicial-service\resources\views/religions/religion_options.blade.php ENDPATH**/ ?>