<?php $__currentLoopData = App\JudicialOfficer::orderBy('officer_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $judicial_officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<option value="<?php echo e($judicial_officer->id); ?>" data-jo_code="<?php echo e($judicial_officer->jo_code); ?>" <?php if(old('judicial_officer') == $judicial_officer->officer_name): ?> selected="selected" <?php endif; ?>><?php echo e($judicial_officer->officer_name); ?>|<?php echo e($judicial_officer->jo_code); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH F:\laragon\www\judicial-service\resources\views/judicial_officers/judicial_officer_options.blade.php ENDPATH**/ ?>