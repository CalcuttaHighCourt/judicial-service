<?php $__currentLoopData = App\CareerProgressionStage::get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $stage): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <option value="<?php echo e($stage->id); ?>" <?php if(old('stage') == $stage->stage_name): ?> selected="selected" <?php endif; ?>><?php echo e($stage->stage_name); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/career_progression_stages/career_progression_options.blade.php ENDPATH**/ ?>