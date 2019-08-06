
<?php
try{
?>

<?php $__currentLoopData = App\NoticeType::orderBy('type', 'asc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $notice_type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
	<li><a href="<?php echo e(route('show_notices',[$notice_type->file_prefix])); ?>"><?php echo e($notice_type->type); ?></a></li>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php 
}catch (\Exception $e){
    echo config('our_globals.db_error_message_large');
    return;
}
?>
<li><a href="<?php echo e(route('show_notices',['All'])); ?>">All Notices</a></li><?php /**PATH F:\laragon\www\judicial-officer\resources\views/notice_types/notices_menu.blade.php ENDPATH**/ ?>