<?php $__currentLoopData = App\Category::orderBy('category_name', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<option value="<?php echo e($category->id); ?>" <?php if(old('category') == $category->category_name): ?> selected="selected" <?php endif; ?>><?php echo e($category->category_name); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/categories/categories_options.blade.php ENDPATH**/ ?>