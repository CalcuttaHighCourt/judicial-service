<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"> 
    <meta name="Integrated Information Management System" content=" ">
    <meta name="Developer" content="Anabil Bhattacharya, Rupsa Bose">
    <meta name="Guide" content="Shri Kallol Chattopadhyay, Shri Abhranil Neogi">
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>" />
    <title>IIMS</title>    
    
    <?php echo $__env->make('layouts.css_links', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <header class="main-header">        
            <!-- Logo -->
            <?php if(Auth::check() && Auth::user()->user_type->type_name=="Administrator"): ?>
                <a href="dashboard/admin" class="logo"> 
            <?php elseif(Auth::check() && Auth::user()->user_type->type_name=="Department"): ?>
                <a href="dashboard/dept" class="logo">
            <?php elseif(Auth::check() && Auth::user()->user_type->type_name=="Court"): ?>
                <a href="dashboard/court" class="logo"> 
            <?php elseif(Auth::check() && Auth::user()->user_type->type_name=="Judicial Officer"): ?>
                <a href="dashboard/jo" class="logo"> 
            <?php elseif(Auth::check() && Auth::user()->user_type->type_name=="Appointment"): ?>
                <a href="#" class="logo"> 
            <?php elseif(Auth::check() && Auth::user()->user_type->type_name=="Inspection"): ?>
                <a href="#" class="logo"> 
            <?php endif; ?>  
                <span class="logo-lg"><b>IIMS</b>
            </a>
        </span>
            </a>
            
            <nav class="navbar navbar-static-top">
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>                
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="<?php echo e(asset('images/FacelessMan.png')); ?>" class="user-image" alt="User Image">
                                <span class="hidden-xs">
                                        <?php if(Auth::check()): ?>
                                            <?php echo e(Auth::user()->name); ?>

                                        <?php endif; ?>
                                </span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="<?php echo e(asset('images/FacelessMan.png')); ?>" class="img-circle" alt="User Image">
                                    <p>
                                        <?php if(Auth::check()): ?>
                                            <?php echo e(Auth::user()->user_type->type_name); ?>

                                        <?php endif; ?>
                                    </p>
                                </li>

                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="update_password" class="btn btn-primary btn-flat">Update Password</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="<?php echo e(route('logout')); ?>"  class="btn btn-danger btn-flat"  onclick="event.preventDefault();
                                        document.getElementById('logout-form').submit();">Sign out</a>
                                        <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
                                            <?php echo csrf_field(); ?>
                                        </form>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <!-- Control Sidebar Toggle Button -->

                    </ul>
                </div>
            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu" data-widget="tree">
                <?php if(Auth::check() && Auth::user()->user_type->type_name=="Judicial Officer"): ?>
                        <li>
                            <a href="<?php echo e(url('zone_pref_jr')); ?>"><i class="fa fa-search-minus"></i>
                                <span>Posting Preference</span><span class="pull-right-container"><i class="fa fa-square-left pull-right"></i></span>
                            </a> 
                           
                        </li>
                        <li class="header"></li>
                        <?php endif; ?>
                        
                        <?php if(Auth::check() && Auth::user()->user_type->type_name=="Inspection"||Auth::user()->user_type->type_name=="Appointment"||Auth::user()->user_type->type_name=="Administrator"||Auth::user()->user_type->type_name=="Department"): ?>
                            <li class="treeview">
                                <a href="#"><i class="fa fa-search-minus"></i>
                                    <span>Master Maintenance</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                                </a>
                                <ul class="treeview-menu">
                                    <?php if(Auth::check() && (Auth::user()->user_type->type_name=="Inspection")): ?>
                                        <li><a href="<?php echo e(url('grade')); ?>"> ACR Grade Master</a></li>
                                    <?php endif; ?>
                                    
                                    <?php if(Auth::check() && (Auth::user()->user_type->type_name=="Administrator")): ?>
                                        <li><a href="<?php echo e(url('court')); ?>">Court Master</a></li>
                                        <li><a href="<?php echo e(url('subdivision')); ?>"> Subdivision Master</a></li>
                                        <li><a href="<?php echo e(url('district')); ?>"> District Master</a></li>
                                        <li><a href="<?php echo e(url('zone')); ?>">  Zone Master</a></li>
                                        <li><a href="<?php echo e(url('state')); ?>">  State Master</a></li>
                                        <li><a href="<?php echo e(url('document_types')); ?>"> Document Type Master</a></li>
                                        <li><a href="<?php echo e(url('departments')); ?>"> Department for LCR </span></a></li>
                                        <li><a href="<?php echo e(url('designation')); ?>"> Designation </span></a></li>
                                        <li><a href="<?php echo e(url('mode')); ?>"> Posting Modes </span></a></li>
                                        <li><a  href="<?php echo e(url('Category')); ?>"> Category </span></a></li>
                                        <li><a  href="<?php echo e(url('religion')); ?>"> Religion </span></a></li>
                                        <li><a  href="<?php echo e(url('qualification')); ?>"> Qualification </span></a></li>
                                        <li><a  href="<?php echo e(url('recruitmentbatch')); ?>"> Recruitment Batch </span></a></li>
                                        <li><a href="<?php echo e(url('user_type')); ?>"> User Type </a></li>
                                        <li><a href="<?php echo e(url('register')); ?>"> User Maintenance </a></li>
                                    <?php endif; ?>

                                    <?php if(Auth::check() && (Auth::user()->user_type->type_name=="Appointment")): ?>
                                        <li><a href="<?php echo e(url('court')); ?>">Court Master</a></li>
                                        <li><a href="<?php echo e(url('subdivision')); ?>"> Subdivision Master</a></li>
                                        <li><a href="<?php echo e(url('district')); ?>"> District Master</a></li>
                                        <li><a href="<?php echo e(url('zone')); ?>">  Zone Master</a></li>
                                        <li><a href="<?php echo e(url('state')); ?>">  State Master</a></li>
                                        <li><a href="<?php echo e(url('document_types')); ?>"> Document Type Master</a></li>
                                        <li><a  href="<?php echo e(url('Category')); ?>"> Category </span></a></li>
                                        <li><a  href="<?php echo e(url('jo_posting/search')); ?>"> Judicial Officer Posting </span></a></li>
                                        <li><a  href="<?php echo e(url('religion')); ?>"> Religion </span></a></li>
                                        <li><a  href="<?php echo e(url('qualification')); ?>"> Qualification </span></a></li>
                                        <li><a  href="<?php echo e(url('recruitmentbatch')); ?>"> Recruitment Batch </span></a></li>
                                        <li><a href="<?php echo e(url('user_type')); ?>"> User Type </a></li>
                                        <li><a href="<?php echo e(url('register')); ?>"> User Maintenance </a></li>
                                    <?php endif; ?>

                                    <?php if(Auth::check() && (Auth::user()->user_type->type_name=="Department")): ?>
                                        <li><a href="<?php echo e(url('departments')); ?>"> Department for LCR </span></a></li>
                                        <li><a href="<?php echo e(url('court')); ?>">Court Master</a></li>
                                    <?php endif; ?>
                                </ul>
                            </li>                            
                        <?php endif; ?>

                        
                        <li class="header"></li>

                         <?php if(Auth::check() && Auth::user()->user_type->type_name=="Inspection"): ?>
                            <li class="treeview">
                                <a href="#"><i class="fa fa-search-minus"></i>
                                    <span>ACR</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="<?php echo e(url('acr_history')); ?>">  ACR History</a></li>
                                    <li><a href="<?php echo e(url('acr_fetch')); ?>">  ACR Fetch</a></li>
                                </ul>
                            </li>                            
                        <?php endif; ?>

                         <?php if(Auth::check() && Auth::user()->user_type->type_name=="Appointment"): ?>
                            <li class="treeview">
                                <a href="#"><i class="fa fa-search-minus"></i>
                                    <span>Judicial Officer Entry</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="<?php echo e(url('jo_entry_form')); ?>"> Entry JO Details</a></li>
                                    <li><a href="<?php echo e(url('modify_jo_details')); ?>"> Modify JO Details</a></li>
                                    <li><a href="#"> Document Upload</a></li>
                                </ul>
                            </li>      
                            
                        <?php endif; ?>

                        <li class="treeview">
                                <a href="#"><i class="fa fa-search-minus"></i>
                                    <span>JO Grade</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                                </a>
                                <ul class="treeview-menu">
                                    <li><a href="<?php echo e(url('jo_grade')); ?>">Create Grade List</a></li>
                                    <li><a href="<?php echo e(url('show_grade_list')); ?>">Show Grade List</a></li>
                                </ul>
                            </li>     
                            
                    <?php if(Auth::check() && Auth::user()->user_type->type_name=="Department"): ?>
                        <li class="header"></li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-search-minus"></i>
                                <span>Lower Court Record</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="<?php echo e(url('lcr_hc')); ?>"><i class="fa fa-circle-o text-red"></i> <span> Request for LCR </span></a></li>
                            </ul>
                        </li>
                    <?php endif; ?>

                                  
                   

                   <?php if(Auth::check() && Auth::user()->user_type->type_name=="Court"): ?>
                        <li class="header"></li>
                        <li class="treeview">
                            <a href="#"> <i class="fa fa-copy"></i>
                                <span>Lower Court Record</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a  href="<?php echo e(url('lcr_view')); ?>"><i class="fa fa-circle-o text-yellow"></i><span>Response to LCR Request</span></a></li>                                
                            </ul>
                        </li>
                    <?php endif; ?>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- this will be used to logout after being inactive for 5 minutes -->
        <div style="display:none;">
            <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST">
                <?php echo csrf_field(); ?>
                <input type="submit" id="submit">
            </form>
        </div>
           
        <!-- Go Top button -->
        <div id="goTop"></div>  

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">

            <!-- Main content -->
            <section class="content">
                <?php echo $__env->yieldContent('content'); ?>
            
        
        <?php echo $__env->make('layouts.js_links', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>        
        <?php /**PATH C:\laragon\www\judicial-service\resources\views/layouts/header.blade.php ENDPATH**/ ?>