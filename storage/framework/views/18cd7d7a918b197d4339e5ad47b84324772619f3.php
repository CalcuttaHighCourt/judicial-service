<?php $__currentLoopData = App\Designation::join('subdivisions','designations.subdivision_id','=','subdivisions.id')->select('designations.id','subdivisions.zone_id','designation_name')->orderBy('designation_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $designations): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <option value="<?php echo e($designations->id); ?>" data-zone_id="<?php echo e($designations->zone_id); ?>" <?php if(old('designations') == $designations->designation_name): ?> selected="selected" <?php endif; ?>><?php echo e($designations->designation_name); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/designations/designation_options.blade.php ENDPATH**/ ?>