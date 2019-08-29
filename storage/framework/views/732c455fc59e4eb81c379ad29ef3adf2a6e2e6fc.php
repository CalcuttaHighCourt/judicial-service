<?php $__env->startSection('title', 'Login'); ?>

<?php $__env->startSection('page_heading'); ?>
	Login Page
<?php $__env->stopSection(); ?>

<?php $__env->startSection('center_main_content'); ?>
<div class="container-fluid">
<div class="row">
   <div class="col-sm-offset-2 col-sm-10">
        <div class="panel panel-default">
            <div class="panel-heading">Login</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="<?php echo e(url('/login')); ?>" autocomplete="off">
                        <?php echo e(csrf_field()); ?>


                            <div class="form-group<?php echo e($errors->has('email') ? ' has-error' : ''); ?>">
                                <label for="email" class="col-sm-offset-1 col-sm-4 control-label">Username <span class="text-muted">or</span> E-Mail Address</label>

                                <div class="col-sm-6">
                                <!-- <input id="email" type="email" class="form-control" name="email" value="<?php echo e(old('email')); ?>"> -->
                                    <input id="email"  type="email" class="form-control" name="email" value="<?php echo e(old('email')); ?>">

                                    <?php if($errors->has('email')): ?>
                                        <span class="help-block">
                                            <strong><?php echo e($errors->first('email')); ?></strong>
                                        </span>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="form-group<?php echo e($errors->has('password') ? ' has-error' : ''); ?>">
                                <label for="password" class="col-sm-offset-1 col-sm-4 control-label">Password</label>

                                <div class="col-sm-6">
                                    <input id="password" type="password" class="form-control" name="password">

                                    <?php if($errors->has('password')): ?>
                                        <span class="help-block">
                                            <strong><?php echo e($errors->first('password')); ?></strong>
                                        </span>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-4">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="remember"> Remember Me
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-4">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fa fa-btn fa-sign-in"></i> Login
                                    </button>

                                    <a class="btn btn-link" href="<?php echo e(url('/password/reset')); ?>">Forgot Your Password?</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>  
            </div>
         </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.1_column_content', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


<?php $__env->startSection('main_container'); ?>

	<?php echo $__env->yieldContent('1_column_content'); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?>
	class=""
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/auth/login.blade.php ENDPATH**/ ?>