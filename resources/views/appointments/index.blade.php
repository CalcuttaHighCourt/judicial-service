@extends('layouts.app') 
@section('content')
<style>
   .select2-results__option{
   color:#d43c3c;
   }
</style>

<!-- Bootstrap Boilerplate... -->
<div id="info-panel" class="panel panel-default">
<!-- IIIIIIIIIII -->
<div id="info-panel-heading" class="panel-heading"><h2>Station Preference Details</h2></div>
<!-- IIIIIIIIIII -->
<div class="panel-body">
<div class="form-group required row">
      <div id="table_header" class="panel-body">
         <div class="row">
            <a href="download_posting_preferences">
                <input type="button" class="btn btn-primary" id="download_report" value="Download Report">
            </a>
        </div>   
        <div id="view_details" class="panel-body">  
         <div class="table-responsive">
            <div style="overflow-x:auto;">
                <table class="table table-bordered table-striped" id="details_for_posting_preference" style="width: 100%;white-space: nowrap;">
                    <thead>
                        <tr>                            
                            <th>SL NO.</th>
                            <th>JO NAME</th>
                            <th>POSTED AS</th>
                            <th>STATION PREFERENCE</th>
                            <th>PREFERENCE REMARK</th>
                            <th>OTHER INFO.</th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                    </tbody>
                </table>
            </div>
         </div>
      </div>
   </div>

<!--loader starts-->
<div class="col-sm-offset-5 col-md-3" id="wait" style="display:none;">
   <img src='images/loader.gif'width="25%" height="10%" />
   <br>Loading..
</div>
<!--loader ends-->

<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script src="{{asset('js/jquery/jquery.min.js')}}"></script>


<meta name="_token" content="{!! csrf_token() !!}" />

<!--  -->
<script>
   $(document).ready(function() {
   
   /*LOADER*/
   
   	    $(document).ajaxStart(function() {
            $("#wait").css("display", "block");
        });
        $(document).ajaxComplete(function() {
            $("#wait").css("display", "none");
        });
   
    /*LOADER*/
   
    /* select2 initialisation */
   
    $(".select2").select2(); 
  
    $.ajax({
            type: "POST",
            url: "show_details_for_posting_preference",                
            data:{
                _token: $('meta[name="csrf-token"]').attr('content')
            },
        success:function(response){
                var obj = $.parseJSON(response);
                console.log(obj);
                var i;
                var str="";
                for(i=0;  i < obj.display_pref_for_jo.length; i++){
                    str+="<tr>"+
                    //sl no
                    "<td><strong>"+(i+1)+".</strong></td>"+
                    //jo_name | jo_code
                    "<td>"+obj.officer_name[i]+"</td>";
                    //posted as
                    var j;
                    for(j=0; j < obj.posted_as[i].length; j++)
                    {
                        str+="<td>"+obj.posted_as[i][j].designation_name+"</td>";
                    }
                    //Station preference
                    str+="<td>";
                    if( obj.preference_details[i].length > 0){
                        for(j=0; j < obj.preference_details[i].length; j++)
                        {   
                            str+="<strong>"+(j+1)+".</strong>"+obj.preference_details[i][j].station_name+"<br>\n";                      
                        }
                    }
                    else{
                        str+="Station preference not yet given";
                    }
                    
                    str+="</td>";

                    //JO Remarks
                    if( obj.preference_details[i].length > 0)
                        str+="<td>"+obj.preference_details[i]['0'].remarks+"</td>";                    
                    else                              
                      str+="<td></td>";

                    //other info
                    //zone tenure details
                    str+="<td><strong>Zone-wise Posting history</strong>";
                    for(j=0; j < obj.zone_tenure[i].length; j++){
                        str+=obj.zone_tenure[i][j];
                    }
                    //hometown
                   
                    str+= "<br>\n<strong>Hometown</strong> : "+obj.display_pref_for_jo[i].hometown+",<strong>State</strong>: "+obj.home_state['0'][i].state_name ;
                   
                    if( obj.practice_subdivision[i].length>0){
                        str+="<br><br>\n\n<strong>Place of Practice :</strong><br>";
                        //practice subdivisions
                        for(j=0; j < obj.practice_subdivision[i].length; j++){
                            str+="<strong>"+(j+1)+".</strong>"+obj.practice_subdivision[i][j].subdivision_name+"<br>\n";
                        }
                    }
                    else{
                        str+="";
                    }

                    //spouse info
                    if(obj.spouse_details[i].length>0){
                        str+="<br><br>\n\n";                        
                        str+="<br><strong>Spouse : </strong>"+obj.spouse_details[i]['0'].officer_name+"<br>\n"+obj.spouse_details[i]['0'].designation_name;                                            
                    }
                    else{
                        str+="";
                    }
                    str+="</td>"+"</tr>"; 
                }

                $("#tbody").html(str);
                $(".table").DataTable({
                    // dom: 'Bfrtip',
                    // buttons: [
                    //     {
                    //         extend: 'pdfHtml5',
                    //         orientation: 'landscape',
                    //         pageSize: 'LEGAL',
                    //         exportOptions: {
                    //             columns: ':visible',
                    //             stripNewlines: false
                    //         },
                    //     title: 'High Court At Calcutta',
                    //     messageTop: function () {
                                       
                    //           return 'Posting Preference Details of The Judicial Officers who have submitted their Choice of posting';
                    //     },
                        
                        
                    //     }
                    // ]
                });
   
            //console.log(str);       
                
            }
        });     
         
   });
</script>
@endsection
