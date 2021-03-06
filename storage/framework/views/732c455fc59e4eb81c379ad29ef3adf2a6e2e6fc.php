<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Security-Policy" content="script-src 'self' 'unsafe-inline' 'unsafe-eval'">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
    <meta name="Integrated Information Managing System" content="DDMS is developed by the
    Calcutta High Court and its purpose is to monitor the flow of seizures of narcotic & psychotropic substance 
    and respective disposals all through the state.">
    <meta name="Developer" content="Anabil Bhattacharya, Rupsa Bose">
    <meta name="Guide" content="Mr. Kallol Chattopadhyay, Mr. Abhranil Neogi, Mr. Partha Sarathi Ghosh, Mrs. Jaini Paul, Mr. Sankalpa Roy">    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>" />
    <title>IIMS</title>  

    <!-- Scripts -->
    <script src="<?php echo e(asset('js/app.js')); ?>" defer></script>
    <script src="<?php echo e(asset('js/jquery.min.js')); ?>"></script>

    <!-- Google Font -->
    <link rel="stylesheet" href="<?php echo e(asset('css/googlefont.css')); ?>">

    <!-- Styles -->
    <link href="<?php echo e(asset('css/app.css')); ?>" rel="stylesheet">
</head>

<body style="background-image: url(<?php echo e(asset('images/calcuttahighcourt.jpg')); ?>);background-position: center;background-repeat: no-repeat;background-size: cover;">
    <div id="app">

        <main class="py-4">
        

            <div class="container" style="opacity:0.9; margin-top:10%">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <div class="col-sm-12 text-center" style="border:#d9a04e 5px solid;background-color:#b8c9f6;-webkit-border-radius: 15px 15px 15px 15px;border-radius: 15px 15px 15px 15px;">
                                    <strong><h5 style="margin-bottom:1px;">INTEGRATED INFORMTAION MANAGING SYSTEM</h5></strong>
                                    <strong>CALCUTTA HIGH COURT</strong>
                                </div>
                            </div>                            

                            <div class="card-body">
                                <div class="col-sm-2">
                                    <img src="<?php echo e(asset('images/CHC_logo.png')); ?>" style="height:70px; margin-left:200px; margin-bottom:10px">
                                </div>
                                <form method="POST" action="<?php echo e(route('login')); ?>">
                                    <?php echo csrf_field(); ?>

                                    <div class="form-group row">
                                        <label for="email" class="col-md-4 col-form-label text-md-right"><?php echo e(__('Email ID / User ID')); ?></label>

                                        <div class="col-md-6">
                                            <input id="email" type="text" autocomplete="off" class="form-control<?php echo e($errors->has('email') ? ' is-invalid' : ''); ?>" name="email" value="<?php echo e(old('email')); ?>" autofocus> <?php if($errors->has('email')): ?>
                                            <span class="invalid-feedback" role="alert">
                                                <strong><?php echo e($errors->first('email')); ?></strong>
                                            </span> <?php endif; ?>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="password" class="col-md-4 col-form-label text-md-right"><?php echo e(__('Password')); ?></label>

                                        <div class="col-md-6">
                                            <input id="password" type="password" autocomplete="off" class="form-control<?php echo e($errors->has('password') ? ' is-invalid' : ''); ?>" name="password"> <?php if($errors->has('password')): ?>
                                            <span class="invalid-feedback" role="alert">
                                                <strong><?php echo e($errors->first('password')); ?></strong>
                                            </span> <?php endif; ?>
                                        </div>
                                    </div>




                                    <div class="form-group row mb-0">
                                        <div class="col-md-8 offset-md-5">
                                            <button type="submit" class="btn btn-primary">
                                                <?php echo e(__('Login')); ?>

                                            </button>

                                            
                                        </div>                                        
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
      
    </script>
</body>

</html><?php /**PATH C:\laragon\www\judicial-service\resources\views/auth/login.blade.php ENDPATH**/ ?>