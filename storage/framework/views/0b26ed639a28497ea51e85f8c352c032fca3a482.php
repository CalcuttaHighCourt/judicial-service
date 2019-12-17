<!-- jQuery 3 -->
    <script src="<?php echo e(asset('js/jquery.min.js')); ?>"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="<?php echo e(asset('js/bootstrap.min.js')); ?>"></script>
    <!-- SlimScroll -->
    <script src="<?php echo e(asset('js/jquery.slimscroll.min.js')); ?>"></script>
    <!-- FastClick -->
    <script src="<?php echo e(asset('js/fastclick.js')); ?>"></script>
    <!-- AdminLTE App -->
    <script src="<?php echo e(asset('js/adminlte.min.js')); ?>"></script>
    <!-- Sweet Alert-->
    <script src="<?php echo e(asset('js/Sweet Alert/sweetalert.min.js')); ?>"></script>
    <!-- Data Table -->
    <script src="<?php echo e(asset('js/dataTables.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/dataTables.responsive.min.js')); ?>"></script>
    <!-- Select-2 -->
    <script src="<?php echo e(asset('js/select2.min.js')); ?>"></script>
    <!-- Date Picker -->    
    <script src="<?php echo e(asset('js/bootstrap-datepicker.js')); ?>"></script>
    <!-- Editor -->
    <script src="<?php echo e(asset('js/bootstrap3-wysihtml5.all.min.js')); ?>"></script>
    <!-- moment min -->    
    <script src="<?php echo e(asset('js/moment.min.js')); ?>"></script>
    <!-- Date Range Picker -->    
    <script src="<?php echo e(asset('js/daterangepicker.min.js')); ?>"></script>
    <!-- For Data Table Buttons STARTS -->
    <script src="<?php echo e(asset('js/dataTables.buttons.min.js')); ?>"></script>        
    <script src="<?php echo e(asset('js/buttons.flash.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/jszip.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/pdfmake.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/vfs_fonts.js')); ?>"></script>
    <script src="<?php echo e(asset('js/buttons.html5.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/buttons.print.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/buttons.colVis.min.js')); ?>"></script>
    <!-- For Data Table Buttons ENDS -->
    <!--Bootstrap Toggle Buttons-->
    <script src="<?php echo e(asset('js/bootstrap-toggle.min.js')); ?>"></script>
    <!-- Go To Top -->
    <script src="<?php echo e(asset('js/jquery.gotop.min.js')); ?>"></script>
    

    <script src="<?php echo e(asset('js/rowReorder/dataTables.select.min.js')); ?>"></script>       
    <script src="<?php echo e(asset('js/rowReorder/jquery.dataTables.min.js')); ?>"></script>       
    <script src="<?php echo e(asset('js/rowReorder/dataTables.editor.min.js')); ?>"></script>     
    <script src="<?php echo e(asset('js/rowReorder/dataTables.rowReorder.min.js')); ?>"></script>     
    
    

    <!-- Chart -->
    <script src="<?php echo e(asset('js/chart.js')); ?>"></script>
    

    <script>
        // Session Timeout For Inactive Window STARTS
        $(document).ready(function(){
            var idle_time = 900000; // for 15 minutes
            var idleSecondsCounter=1;

            document.onclick = function() {
                idleSecondsCounter = 0;
            };

            document.onmousemove = function() {
                idleSecondsCounter = 0;
            };

            document.onkeypress = function() {
                idleSecondsCounter = 0;
            };

            setInterval(function(){
                if(idleSecondsCounter==1){
                    $("#submit").trigger("click");
                }
                else{
                    idleSecondsCounter = 1;
                }
            },idle_time)

            // Go Top button initialization
            $("#goTop").goTop();

        });
        // Session Timeout For Inactive Window ENDS

        
    </script>
    <?php /**PATH C:\laragon\www\judicial-service\resources\views/layouts/js_links.blade.php ENDPATH**/ ?>