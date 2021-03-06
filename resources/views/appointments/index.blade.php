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
<div class="form-group row">
      <div id="table_header" class="panel-body">
        <div class="row col-sm-offset-3 " id="div_rank" style="display:none;">
            <label class="control-label">
                    Grade / Rank 
            </label>
            <select class="form-control info-form-control select2" style="width:20%" id="rank_id">
                <option value="">Select an Option</option>
                @include('ranks.rank_options')
            </select>      
            <input type="button" class="btn btn-success" id="cadrewise_search" value="Cadrewise Search">
        </div>
        <div id="div_table">
            <div class="row">
               
                    <input type="button" class="btn btn-primary" id="download_report" value="Download Report">
              
            </div>   
            <div id="view_details" class="panel-body">  
            <div class="table-responsive">
                <div style="overflow-x:auto; overflow-y:auto; height:450px">
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
   </div>

<!--loader starts-->
<div class="col-sm-offset-5 col-md-3" id="wait" style="display:none;">
    <img src="{{asset('images/loader.gif')}}" width="25%" height="10%" />
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

    /*Cadre Wise Search:start*/

        $(document).on("click","#cadrewise_search",function(){

            $("#div_table").hide();
            var rank = $("#rank_id option:selected").val();

            $.ajax({
                type: "POST",
                url: "show_details_for_posting_preference", 
                data:{
                    _token: $('meta[name="csrf-token"]').attr('content'),
                    rank:rank
                },
                success:function(response){
                    $(".table").DataTable().destroy();
                    var obj = $.parseJSON(response);
                    console.log(obj);
                    var i;
                    var str="";

                    if(obj.display_pref_for_jo.length==0){
                        $("#download_report").hide();
                    }
                    else{
                        $("#download_report").show();
                    }
                    
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
                        
                        if(obj.display_pref_for_jo[i].hometown!="" && obj.display_pref_for_jo[i].hometown!=null)
                            str+= "<br>\n<strong>Hometown</strong> : "+obj.display_pref_for_jo[i].hometown+", "+obj.display_pref_for_jo[i].state_name ;
                    
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
                    $(".table").DataTable();
                    
                    $("#div_rank").show();
                    $("#div_table").show();

                },
                error:function(response){
                    swal("Search Unsuccessfull"," Cadrewise searching is not done","error");
                    $("#div_rank").show();
                    $("#div_table").show();
                }
            }) ;          
        });
    /*Cadre Wise Search:end*/
    /*pdf download:start*/
         $(document).on("click","#download_report",function(){             
            var rank = $("#rank_id option:selected").val();
            if(rank== ""){
                rank= 0;
            }
           // console.log(rank);
            var x= "download_posting_preferences/";
            var y=rank;
            x=x+y;
           console.log(x);
            window.location.replace(x);


     
        });
   /*pdf download:end*/

    /* select2 initialisation */
   
    $(".select2").select2(); 
  
    $("#cadrewise_search").trigger('click');
         
   });
</script>
@endsection
