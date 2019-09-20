<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">

<head>
<link rel="icon" href="<?php echo e(asset('images/favicon.ico')); ?>">
<!-- Bootstrap core CSS -->
<link href="<?php echo e(asset('css/bootstrap.min.css')); ?>" rel="stylesheet">
<!--  our CSS -->
<link href="<?php echo e(asset('css/style.css')); ?>" rel="stylesheet">
<link href="<?php echo e(asset('css/bootstrap-submenu.min.css')); ?>" rel="stylesheet">
<link href="<?php echo e(asset('css/font-awesome.min.css')); ?>" rel="stylesheet">

<link href="<?php echo e(asset('css/datatable/dataTables.bootstrap.min.css')); ?>" rel="stylesheet">

<link href="<?php echo e(asset('css/fileinput/fileinput.min.css')); ?>" rel="stylesheet">

<!-- Select-2 -->
<link rel="stylesheet" href="<?php echo e(asset('css/select2.min.css')); ?>">
<link rel="stylesheet" href="<?php echo e(asset('css/bootstrap-datepicker.css')); ?>">  

<!-- Editor -->
<link rel="stylesheet" href="<?php echo e(asset('css/bootstrap3-wysihtml5.min.css')); ?>">


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="Welcome to the Judicial Officers Portal of Calcutta High Court. NIC-WBSC and Calcutta High Court's Software development unit have developed this web portal.">
<meta name="author" content="Sankalpa Roy(NIC-WBSC), Anabil Bhattacharya (Software Developer, CHC), Rupsa Bose (Software Developer, CHC), Arpan Kr. Roy (Software Developer, CHC)">



</head>
<div class="panel panel-default col-sm-offset-3 col-sm-5">
    <div class="panel-heading">Login</div>
    <div class="panel-body">
        <form class="form-horizontal" role="form" method="POST" action="<?php echo e(url('/login')); ?>" autocomplete="off">
            <?php echo e(csrf_field()); ?>


                <div class="form-group<?php echo e($errors->has('email') ? ' has-error' : ''); ?>">
                    <label for="email" class="col-sm-offset-1 col-sm-4 control-label">Username <span class="text-muted">or</span> E-Mail Address</label>

                    <div class="col-sm-6">
                   
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
                            <a class="btn btn-link" href="<?php echo e(url('/password/reset')); ?>">Forgot Your Password?</a>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-2 ">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa fa-btn fa-sign-in"></i> Login
                        </button>
                </div>
            </div>
        </form>
    </div>
</div>




<?php $__env->startSection('main_container'); ?>

	<?php echo $__env->yieldContent('1_column_content'); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('body_attributes'); ?>
	class=""
<?php $__env->stopSection(); ?><?php /**PATH F:\laragon\www\judicial-service\resources\views/auth/login.blade.php ENDPATH**/ ?>