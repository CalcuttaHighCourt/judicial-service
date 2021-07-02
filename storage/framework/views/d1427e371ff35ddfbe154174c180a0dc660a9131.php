 
<?php $__env->startSection('content'); ?>

<div class="row">    
    <div class="col-md-4 col-sm-6 col-xs-12">
        <div class="info-box bg-purple">
            <span class="info-box-icon"></span>
            <div class="info-box-content">
              <span class="info-box-text"><strong>Total JO : <?php echo e($data['total_jo']); ?> </strong></span>
              <span class="info-box-text">Male: <?php echo e($data['total_jo_gender_wise']['0']['count']); ?></span>
              <span class="info-box-text">Female: <?php echo e($data['total_jo_gender_wise']['1']['count']); ?> </span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>

    <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box bg-red">
                <span class="info-box-icon"></span>
    
                <div class="info-box-content">
                    <span class="info-box-text"><strong>Current JO Strength : <?php echo e($data['current_jo_strength']); ?>  </strong></span>                                      
                    <span class="info-box-text">Male: <?php echo e($data['total_jo_strength_gender_wise']['0']['count']); ?></span>                    
                    <span class="info-box-text">Female: <?php echo e($data['total_jo_strength_gender_wise']['1']['count']); ?></span>                    
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
    </div>

    
    <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box bg-green">
                <span class="info-box-icon"></span>
    
                <div class="info-box-content">
                    <span class="info-box-text"><strong>Total DJ : <?php echo e($data['rank_wise_gender']['0']['count'] + $data['rank_wise_gender']['1']['count']); ?> </strong></span>                    
                    <span class="info-box-text">Male: <?php echo e($data['rank_wise_gender']['1']['count']); ?> </span>                    
                    <span class="info-box-text">Female: <?php echo e($data['rank_wise_gender']['0']['count']); ?> </span>                    
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
    </div> 

    <div class="col-md-4 col-sm-6 col-xs-12">
        <div class="info-box" style="background-color:DarkKhaki">
            <span class="info-box-icon"></span>

            <div class="info-box-content">
                <span class="info-box-text"><strong>Total ADJ (FTC) : <?php echo e($data['rank_wise_gender']['2']['count'] + $data['rank_wise_gender']['4']['count']); ?> </strong></span>
                <span class="info-box-text">Male: <?php echo e($data['rank_wise_gender']['4']['count']); ?> </span>
                <span class="info-box-text">Female: <?php echo e($data['rank_wise_gender']['2']['count']); ?> </span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div> 

    <div class="col-md-4 col-sm-6 col-xs-12">
        <div class="info-box" style="background-color:gold">
            <span class="info-box-icon"></span>

            <div class="info-box-content">
                <span class="info-box-text"><strong>Total CJSD : <?php echo e($data['rank_wise_gender']['3']['count'] + $data['rank_wise_gender']['5']['count']); ?> </strong></span>                
                <span class="info-box-text">Male: <?php echo e($data['rank_wise_gender']['5']['count']); ?> </span>                
                <span class="info-box-text">Female: <?php echo e($data['rank_wise_gender']['3']['count']); ?> </span>                
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div> 

    <div class="col-md-4 col-sm-6 col-xs-12">
        <div class="info-box" style="background-color:aquamarine">
            <span class="info-box-icon"></span>

            <div class="info-box-content">
                <span class="info-box-text"><strong>Total CJJD : <?php echo e($data['rank_wise_gender']['6']['count'] + $data['rank_wise_gender']['7']['count']); ?> </strong></span>                
                <span class="info-box-text">Male: <?php echo e($data['rank_wise_gender']['7']['count']); ?> </span>                
                <span class="info-box-text">Female: <?php echo e($data['rank_wise_gender']['6']['count']); ?> </span>                
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div> 
	
</div>



<div class="row">
    <div class="col-md-4">
    <div class="box box-primary collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title">New joinees as CJJD in last one year</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <ul class="products-list product-list-in-box">
                <?php if(sizeof($data['new_joiness_cjjd']) > 1): ?>
                    <?php $__currentLoopData = $data['new_joiness_cjjd']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $new_officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <li class="item">
                        <h4><?php echo e($new_officer['officer_name']); ?></h4>
                        <span class="label label-warning pull-right"><?php echo e($new_officer['jo_code']); ?></span>
                        <span class="product-description"> - <?php echo e($new_officer['designation']); ?> <br/>DOJ: <?php echo e($new_officer['date_of_joining']); ?>  </span>
                    </li>
                    <!-- /.item -->
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>    
                <?php else: ?>
                    <li class="item">
                        <h4>No Officer Found</h4>
                    </li>
                <?php endif; ?>            
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
    </div>
    <!-- /.col -->

    <div class="col-md-4">
            <div class="box box-primary collapsed-box">
                    <div class="box-header with-border">
                      <h3 class="box-title">New joinees as DJ in last one year</h3>
        
                      <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                      <ul class="products-list product-list-in-box">
                        <?php if(sizeof($data['new_joiness_dj']) > 1): ?>
                            <?php $__currentLoopData = $data['new_joiness_dj']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $new_officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li class="item">
                                    <h4><?php echo e($new_officer['officer_name']); ?></h4>
                                    <span class="label label-warning pull-right"><?php echo e($new_officer['jo_code']); ?></span>
                                    <span class="product-description"> - <?php echo e($new_officer['designation']); ?> <br/>DOJ: <?php echo e($new_officer['date_of_joining']); ?>  </span>
                                </li>
                                <!-- /.item -->
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>    
                        <?php else: ?>
                            <li class="item">
                                <h4>No Officer Found</h4>
                            </li>
                        <?php endif; ?>                  
                      </ul>
                    </div>
                    <!-- /.box-body -->
                  </div>
                  <!-- /.box -->
            </div>
            <!-- /.col -->

            <div class="col-md-4">
                    <div class="box box-primary collapsed-box">
                            <div class="box-header with-border">
                              <h3 class="box-title">Superannuation in coming one year</h3>
                
                              <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                              </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                              <ul class="products-list product-list-in-box">
                                <?php if(sizeof($data['retirement_in_coming_year']) > 1): ?>
                                    <?php $__currentLoopData = $data['retirement_in_coming_year']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <li class="item">
                                            <h4><?php echo e($officer['officer_name']); ?></h4>
                                            <span class="label label-warning pull-right"><?php echo e($officer['jo_code']); ?></span>
                                            <span class="product-description"> - <?php echo e($officer['designation']); ?> <br/>DOR: <?php echo e($officer['date_of_retirement']); ?>  </span>
                                        </li>
                                        <!-- /.item -->
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>    
                                <?php else: ?>
                                    <li class="item">
                                        <h4>No Officer Found</h4>
                                    </li>
                                <?php endif; ?>      
                              </ul>
                            </div>
                            <!-- /.box-body -->
                          </div>
                          <!-- /.box -->
                    </div>
                    <!-- /.col -->                    
</div>

<div class="row">
    <div class="col-md-4">
    <div class="box box-primary collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title">On Deputation (CJJD)</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <ul class="products-list product-list-in-box">
                <?php if(sizeof($data['on_deputation_cjjd']) > 1): ?>
                    <?php $__currentLoopData = $data['on_deputation_cjjd']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li class="item">
                            <h4><?php echo e($officer['officer_name']); ?></h4>
                            <span class="label label-warning pull-right"><?php echo e($officer['jo_code']); ?></span>
                            <span class="product-description"> - <?php echo e($officer['designation']); ?> <br/>Since <?php echo e($officer['from_date']); ?>  </span>
                        </li>
                        <!-- /.item -->
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>    
                <?php else: ?>
                    <li class="item">
                        <h4>No Officer Found</h4>
                    </li>
                <?php endif; ?>      
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
    </div>
    <!-- /.col -->

    <div class="col-md-4">
            <div class="box box-primary collapsed-box">
                    <div class="box-header with-border">
                      <h3 class="box-title">On Deputation (CJSD)</h3>
        
                      <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                      <ul class="products-list product-list-in-box">
                        <?php if(sizeof($data['on_deputation_cjsd']) > 1): ?>
                            <?php $__currentLoopData = $data['on_deputation_cjsd']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li class="item">
                                    <h4><?php echo e($officer['officer_name']); ?></h4>
                                    <span class="label label-warning pull-right"><?php echo e($officer['jo_code']); ?></span>
                                    <span class="product-description"> - <?php echo e($officer['designation']); ?> <br/>Since <?php echo e($officer['from_date']); ?>  </span>
                                </li>
                                <!-- /.item -->
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>    
                        <?php else: ?>
                            <li class="item">
                                <h4>No Officer Found</h4>
                            </li>
                        <?php endif; ?>    
                      </ul>
                    </div>
                    <!-- /.box-body -->
                  </div>
                  <!-- /.box -->
            </div>
            <!-- /.col -->

            <div class="col-md-4">
                    <div class="box box-primary collapsed-box">
                            <div class="box-header with-border">
                              <h3 class="box-title">On Deputation (DJ)</h3>
                
                              <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                              </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                              <ul class="products-list product-list-in-box">
                                <?php if(sizeof($data['on_deputation_dj']) > 1): ?>
                                    <?php $__currentLoopData = $data['on_deputation_dj']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <li class="item">
                                            <h4><?php echo e($officer['officer_name']); ?></h4>
                                            <span class="label label-warning pull-right"><?php echo e($officer['jo_code']); ?></span>
                                            <span class="product-description"> - <?php echo e($officer['designation']); ?> <br/>Since <?php echo e($officer['from_date']); ?>  </span>
                                        </li>
                                        <!-- /.item -->
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>    
                                <?php else: ?>
                                    <li class="item">
                                        <h4>No Officer Found</h4>
                                    </li>
                                <?php endif; ?>  
                              </ul>
                            </div>
                            <!-- /.box-body -->
                          </div>
                          <!-- /.box -->
                    </div>
                    <!-- /.col -->                    
</div>

<div class="row">
    <div class="col-md-4">
    <div class="box box-primary collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title">On Special Posting (CJSD)</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <ul class="products-list product-list-in-box">
                <?php if(sizeof($data['on_special_posting_cjsd']) > 1): ?>
                    <?php $__currentLoopData = $data['on_special_posting_cjsd']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li class="item">
                            <h4><?php echo e($officer['officer_name']); ?></h4>
                            <span class="label label-warning pull-right"><?php echo e($officer['jo_code']); ?></span>
                            <span class="product-description"> - <?php echo e($officer['designation']); ?> <br/>Since <?php echo e($officer['from_date']); ?>  </span>
                        </li>
                        <!-- /.item -->
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>    
                <?php else: ?>
                    <li class="item">
                        <h4>No Officer Found</h4>
                    </li>
                <?php endif; ?>    
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
    </div>
    <!-- /.col -->

    <div class="col-md-4">
            <div class="box box-primary collapsed-box">
                    <div class="box-header with-border">
                      <h3 class="box-title">On Special Posting (DJ)</h3>
        
                      <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                      <ul class="products-list product-list-in-box">
                        <?php if(sizeof($data['on_special_posting_dj']) > 1): ?>
                            <?php $__currentLoopData = $data['on_special_posting_dj']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li class="item">
                                    <h4><?php echo e($officer['officer_name']); ?></h4>
                                    <span class="label label-warning pull-right"><?php echo e($officer['jo_code']); ?></span>
                                    <span class="product-description"> - <?php echo e($officer['designation']); ?> <br/>Since <?php echo e($officer['from_date']); ?>  </span>
                                </li>
                                <!-- /.item -->
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>    
                        <?php else: ?>
                            <li class="item">
                                <h4>No Officer Found</h4>
                            </li>
                        <?php endif; ?>    
                      </ul>
                    </div>
                    <!-- /.box-body -->
                  </div>
                  <!-- /.box -->
            </div>
            <!-- /.col -->

            <div class="col-md-4">
                    <div class="box box-primary collapsed-box">
                            <div class="box-header with-border">
                              <h3 class="box-title">Couple Officers (CJJD)</h3>
                
                              <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                              </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                              <ul class="products-list product-list-in-box">                                
                                <?php if(sizeof($data['couple_officers_cjjd']) > 1): ?>
                                    
                                    <?php $flag = Array(); ?>
                                    
                                    <?php $__currentLoopData = $data['couple_officers_cjjd']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php if(!array_search($officer['spouse_jo_code'],$flag)): ?>                                       
                                            <li class="item">
                                                <h4><?php echo e($officer['jo_name']); ?></h4>
                                                <span class="label label-warning pull-right"><?php echo e($officer['jo_code']); ?></span>
                                                <span class="product-description"> - <?php echo e($officer['designation']); ?> <br/>Since <?php echo e($officer['from_date']); ?>  </span>
                                                <h4>&</h4>
                                                <h4><?php echo e($officer['spouse_name']); ?></h4>
                                                <span class="label label-warning pull-right"><?php echo e($officer['spouse_jo_code']); ?></span>
                                                <span class="product-description"> - <?php echo e($officer['spouse_designation']); ?> <br/>Since <?php echo e($officer['spouse_from_date']); ?>  </span>
                                            </li>
                                            <!-- /.item -->
                                            <?php array_push($flag, $officer['jo_code']); ?>
                                        <?php else: ?>
                                            <?php continue; ?>
                                        <?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>   
                                <?php else: ?>
                                    <li class="item">
                                        <h4>No Officer Found</h4>
                                    </li>
                                <?php endif; ?>    
                              </ul>
                            </div>
                            <!-- /.box-body -->
                          </div>
                          <!-- /.box -->
                    </div>
                    <!-- /.col -->                    
</div>

<div class="row">
    <div class="col-md-4">
    <div class="box box-primary collapsed-box">
            <div class="box-header with-border">
              <h3 class="box-title">Couple Officers (CJSD)</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <ul class="products-list product-list-in-box">
                <?php if(sizeof($data['couple_officers_cjsd']) > 1): ?>
                                    
                    <?php $flag = Array(); ?>
                    
                    <?php $__currentLoopData = $data['couple_officers_cjsd']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php if(!array_search($officer['spouse_jo_code'],$flag)): ?>                                       
                            <li class="item">
                                <h4><?php echo e($officer['jo_name']); ?></h4>
                                <span class="label label-warning pull-right"><?php echo e($officer['jo_code']); ?></span>
                                <span class="product-description"> - <?php echo e($officer['designation']); ?> <br/>Since <?php echo e($officer['from_date']); ?>  </span>
                                <h4>&</h4>
                                <h4><?php echo e($officer['spouse_name']); ?></h4>
                                <span class="label label-warning pull-right"><?php echo e($officer['spouse_jo_code']); ?></span>
                                <span class="product-description"> - <?php echo e($officer['spouse_designation']); ?> <br/>Since <?php echo e($officer['spouse_from_date']); ?>  </span>
                            </li>
                            <!-- /.item -->
                            <?php array_push($flag, $officer['jo_code']); ?>
                        <?php else: ?>
                            <?php continue; ?>
                        <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>   
                <?php else: ?>
                    <li class="item">
                        <h4>No Officer Found</h4>
                    </li>
                <?php endif; ?>    
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
    </div>
    <!-- /.col -->

    <div class="col-md-4">
            <div class="box box-primary collapsed-box">
                    <div class="box-header with-border">
                      <h3 class="box-title">Couple Officers (ADJ FTC)</h3>
        
                      <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                        </button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                      <ul class="products-list product-list-in-box">
                        <?php if(sizeof($data['couple_officers_ftc']) > 1): ?>
                                        
                            <?php $flag = Array(); ?>
                            
                            <?php $__currentLoopData = $data['couple_officers_ftc']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php if(!array_search($officer['spouse_jo_code'],$flag)): ?>                                       
                                    <li class="item">
                                        <h4><?php echo e($officer['jo_name']); ?></h4>
                                        <span class="label label-warning pull-right"><?php echo e($officer['jo_code']); ?></span>
                                        <span class="product-description"> - <?php echo e($officer['designation']); ?> <br/>Since <?php echo e($officer['from_date']); ?>  </span>
                                        <h4>&</h4>
                                        <h4><?php echo e($officer['spouse_name']); ?></h4>
                                        <span class="label label-warning pull-right"><?php echo e($officer['spouse_jo_code']); ?></span>
                                        <span class="product-description"> - <?php echo e($officer['spouse_designation']); ?> <br/>Since <?php echo e($officer['spouse_from_date']); ?>  </span>
                                    </li>
                                    <!-- /.item -->
                                    <?php array_push($flag, $officer['jo_code']); ?>
                                <?php else: ?>
                                    <?php continue; ?>
                                <?php endif; ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>   
                        <?php else: ?>
                            <li class="item">
                                <h4>No Officer Found</h4>
                            </li>
                        <?php endif; ?>    
                      </ul>
                    </div>
                    <!-- /.box-body -->
                  </div>
                  <!-- /.box -->
            </div>
            <!-- /.col -->

            <div class="col-md-4">
                    <div class="box box-primary collapsed-box">
                            <div class="box-header with-border">
                              <h3 class="box-title">Couple Officers (DJ)</h3>
                
                              <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                              </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                              <ul class="products-list product-list-in-box">
                                <?php if(sizeof($data['couple_officers_dj']) > 1): ?>
                                        
                                    <?php $flag = Array(); ?>
                                    
                                    <?php $__currentLoopData = $data['couple_officers_dj']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php if(!array_search($officer['spouse_jo_code'],$flag)): ?>                                       
                                            <li class="item">
                                                <h4><?php echo e($officer['jo_name']); ?></h4>
                                                <span class="label label-warning pull-right"><?php echo e($officer['jo_code']); ?></span>
                                                <span class="product-description"> - <?php echo e($officer['designation']); ?> <br/>Since <?php echo e($officer['from_date']); ?>  </span>
                                                <h4>&</h4>
                                                <h4><?php echo e($officer['spouse_name']); ?></h4>
                                                <span class="label label-warning pull-right"><?php echo e($officer['spouse_jo_code']); ?></span>
                                                <span class="product-description"> - <?php echo e($officer['spouse_designation']); ?> <br/>Since <?php echo e($officer['spouse_from_date']); ?>  </span>
                                            </li>
                                            <!-- /.item -->
                                            <?php array_push($flag, $officer['jo_code']); ?>
                                        <?php else: ?>
                                            <?php continue; ?>
                                        <?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>   
                                <?php else: ?>
                                    <li class="item">
                                        <h4>No Officer Found</h4>
                                    </li>
                                <?php endif; ?>    
                              </ul>
                            </div>
                            <!-- /.box-body -->
                          </div>
                          <!-- /.box -->
                    </div>
                    <!-- /.col -->                    
</div>


<!--loader starts-->
<div class="col-sm-offset-5 col-md-3" id="wait" style="display:none;">
    <img src="<?php echo e(asset('images/loader.gif')); ?>" width="25%" height="10%" />
    <br>Loading..
</div>
<!--loader ends-->

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="<?php echo e(asset('js/jquery/jquery.min.js')); ?>"></script>

<meta name="_token" content="<?php echo csrf_token(); ?>" />

<script>
    $(document).ready(function() {

    })
</script>
<?php $__env->stopSection(); ?>





<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\judicial-service\resources\views/departments/appointment_dashboard.blade.php ENDPATH**/ ?>