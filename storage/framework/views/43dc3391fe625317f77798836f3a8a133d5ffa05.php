<?php $__env->startSection('end_scripts'); ?>
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<?php echo e(asset('js/jquery.min.js')); ?>"></script>
<script src="<?php echo e(asset('js/bootstrap.min.js')); ?>"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="<?php echo e(asset('js/ie10_support/ie10-viewport-bug-workaround.js')); ?>"></script>

<script src="<?php echo e(asset('js/datatable/jquery.dataTables.min.js')); ?>"></script>
<script src="<?php echo e(asset('js/datatable/dataTables.bootstrap.min.js')); ?>"></script>
 <!-- Date Picker -->    
 <script src="<?php echo e(asset('js/bootstrap-datepicker.js')); ?>"></script>
<!-- <script src="<?php echo e(asset('js/datepicker/bootstrap-datepicker.min.js')); ?>"></script> -->

<script src="<?php echo e(asset('js/moment/moment.min.js')); ?>"></script>


<script src="<?php echo e(asset('js/fileinput/fileinput.min.js')); ?>"></script>
<script src="<?php echo e(asset('js/Sweet Alert/sweetalert.min.js')); ?>"></script>
<!-- Select-2 -->
<script src="<?php echo e(asset('js/select2.min.js')); ?>"></script>

<!-- Editor -->
<script src="<?php echo e(asset('js/bootstrap3-wysihtml5.all.min.js')); ?>"></script>

<script>
function myHtmlEncode(value){
	//create a in-memory div, set it's inner text(which jQuery automatically encodes)
	//then grab the encoded contents back out.  The div never exists on the page.
	return $('<div/>').text(value).html();
}

function myHtmlDecode(value){
	return $('<div/>').html(value).text();
}
</script>



<?php $__env->startSection('end_scripts_1'); ?> <?php echo $__env->yieldSection(); ?> <?php $__env->startSection('end_scripts_2'); ?> <?php echo $__env->yieldSection(); ?>
<?php $__env->startSection('end_scripts_3'); ?> <?php echo $__env->yieldSection(); ?> <?php $__env->startSection('end_scripts_4'); ?> <?php echo $__env->yieldSection(); ?>
<?php $__env->startSection('end_scripts_5'); ?> <?php echo $__env->yieldSection(); ?> <?php $__env->startSection('end_scripts_6'); ?> <?php echo $__env->yieldSection(); ?>

<?php $__env->startSection('end_scripts_7'); ?> <?php echo $__env->yieldSection(); ?> <?php $__env->startSection('end_scripts_8'); ?> <?php echo $__env->yieldSection(); ?>
<?php $__env->startSection('end_scripts_9'); ?> <?php echo $__env->yieldSection(); ?> <?php $__env->startSection('end_scripts_10'); ?> <?php echo $__env->yieldSection(); ?>

<?php $__env->stopSection(); ?>
<?php /**PATH C:\laragon\www\Judicial-Service\resources\views/layouts/end_scripts.blade.php ENDPATH**/ ?>