 
<?php $__env->startSection('content'); ?>

<style>
   .select2-results__option{
   color:#d43c3c;
   }
</style>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 col-md-offset-0">
            <div class="panel panel-default">
                <div class="panel-heading">Register</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="<?php echo e(url('/register')); ?>">
                        <?php echo e(csrf_field()); ?>

                        
                        <div class="form-group<?php echo e($errors->has('user_id') ? ' has-error' : ''); ?>">
                            <label for="user_id" class="col-md-4 control-label">Userid</label>

                            <div class="col-md-6">
                                <input id="user_id" type="text" class="form-control" name="user_id" value="<?php echo e(old('userid')); ?>">

                                <?php if($errors->has('user_id')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('user_id')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>
                        
                        <div class="form-group<?php echo e($errors->has('usertype') ? ' has-error' : ''); ?>">
                            <label for="usertype" class="col-sm-4 control-label">User Type</label>

                            <div class="col-md-6">
                                <select id="usertype"  class="form-control select2" name="usertype">
                                <option value="">Select an Option...</option>
                                <?php echo $__env->make('user_types.user_type_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </select>

                                <?php if($errors->has('usertype')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('usertype')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="form-group<?php echo e($errors->has('court') ? ' has-error' : ''); ?>" id="court-div" name="court-div" style="display:none;">
                            <label for="court" class="col-sm-4 control-label">Court</label>

                            <div class="col-sm-6" >
                                <select id="court"  class="form-control select2" name="court">
                                <option value="">Select an Option...</option>
                                <?php echo $__env->make('courts.court_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </select>

                                <?php if($errors->has('court')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('court')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group<?php echo e($errors->has('judicial_officers') ? ' has-error' : ''); ?>" id="jo-div" name="jo-div" style="display:none;">
                            <label for="jo" class="col-sm-4 control-label">Judicial Officer</label>

                            <div class="col-sm-6" >
                                <select id="jo"  class="form-control select2" name="jo">
                                <option value="">Select an Option...</option>
                                <?php echo $__env->make('judicial_officers.judicial_officer_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </select>

                                <?php if($errors->has('judicial_officers')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('judicial_officers')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>

                         <div class="form-group<?php echo e($errors->has('department') ? ' has-error' : ''); ?>" id="dept-div" name="dept-div" style="display:none;" >
                            <label for="department" class="col-sm-4 control-label">Department</label>

                            <div class="col-sm-6" >
                                <select id="department"  class="form-control select2" name="department">
                                <option value="">Select an Option...</option>
                                <?php echo $__env->make('lcr_departments.lcr_department_options', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                </select>

                                <?php if($errors->has('department')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('department')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group<?php echo e($errors->has('name') ? ' has-error' : ''); ?>">
                            <label for="name" class="col-sm-4 control-label">Name</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="name" value="<?php echo e(old('name')); ?>">

                                <?php if($errors->has('name')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('name')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group<?php echo e($errors->has('email') ? ' has-error' : ''); ?>">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="<?php echo e(old('email')); ?>">

                                <?php if($errors->has('email')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('email')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group<?php echo e($errors->has('password') ? ' has-error' : ''); ?>">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password">

                                <?php if($errors->has('password')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('password')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group<?php echo e($errors->has('password_confirmation') ? ' has-error' : ''); ?>">
                            <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation">

                                <?php if($errors->has('password_confirmation')): ?>
                                    <span class="help-block">
                                        <strong><?php echo e($errors->first('password_confirmation')); ?></strong>
                                    </span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-btn fa-user"></i> Register
                                </button>
                            </div>
                        </div>
                        
                        <?php if(Session::has('msg')): ?>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <div class="alert alert-success alert-dismissible" role="alert">
                                	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                	<?php echo Session::get('msg'); ?>

                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>

<script>
    $(function() {

            //customizable select box with support for searching
            $('#court').select2();
            $('#jo').select2();
            $("#department").select2();

            $(".select2").select2();
            $(".select2"). select2({ width: '100%' });
    });

    $("#usertype").change (function(){

        var user_type = $("#usertype option:selected").text();
        $("#court-div").hide();
        $("#jo-div").hide();
        $("#dept-div").hide();

        if( user_type == "Court")
        {            
            $("#court-div").show();
        }

         if( user_type == "Department")
        {            
            $("#dept-div").show();
        }

        else if( user_type == "Judicial Officer")
        {            
            $("#jo-div").show();
        }
        
          

    });

</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/auth/register.blade.php ENDPATH**/ ?>