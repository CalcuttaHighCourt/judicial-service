<?php $__currentLoopData = App\RecruitmentBatch::orderBy('recruitment_batch_desc', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $recruitment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<option value="<?php echo e($recruitment->id); ?>" <?php if(old('recruitment') == $recruitment->recruitment_batch_desc): ?> selected="selected" <?php endif; ?>><?php echo e($recruitment->recruitment_batch_desc); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH C:\laragon\www\Judicial-Service\resources\views/recruitmentbatches/recruitmentbatch_options.blade.php ENDPATH**/ ?>