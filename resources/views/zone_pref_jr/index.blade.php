@extends('layouts.app') 
@section('content')
<!-- Main content -->

                                                                                                                                                                
<style>
    .select2-container--default .select2-selection--multiple .select2-selection__choice{
        background-color:#111;
        
    }
    .select2-container--default .select2-results__option{
    background-color: #28415b;
}
</style>
<br/>
   
   <div id="info-panel" class="panel panel-default">
      <br>
      <div class="col-sm-offset-1 col-sm-11">
         <!-- IIIIIIIIIII -->
         <ul class="nav nav-pills" role="tablist">
            <li class="nav-item">
               <a class="nav-link active" id="posting_details" style="border-style:outset" data-toggle="tab" href="#postings">Posting Details</a>
            </li>
            <li class="nav-item">
               <a class="nav-link active" id="judicial_diary" style="border-style:outset" data-toggle="tab" href="#daily_diary">Judicial diary</a>
            </li>
            <!-- <li class="nav-item">
               <a class="nav-link active"  style="border-style:outset" data-toggle="tab" href="#acr">Annual Confidential Report</a>
            </li> -->
         </ul>
      </div>
      <!-- IIIIIIIIIII -->
      <div class="tab-content clearfix">
         <div class="tab-pan" id="postings">
            <!-- New Task Form -->
            <div id="content" class="col-sm-offset-1 col-sm-11 content">
               <br><br>
               <input type="hidden" id="JudicialOfficerPostingPreference-id">
               <div id="officer_name-group" class="form-group row our-form-group">
                  <label for="officer_name" class="col-sm-offset-1 col-sm-4 ">Officer Name: {{Auth::user()->name}}</label>
               </div>
               <div id="zone-group" class="form-group row our-form-group">
                    <label for="zone" class="col-sm-offset-1 col-sm-4 ">Current Zone of Posting:<span id="cur_zone_name" name="cur_zone_name"> {{$zone_options['current_zone']}}</span></label></span></label>
                    <label for="zone" class="col-sm-offset-1 col-sm-4 ">Previous Zone of Posting:<span id="pre_zone_name" name="pre_zone_name"> {{$zone_options['previous_zone']}}</span></label>
               </div>
               <hr>
                <div id="purpose_div" >
                    <div class="row">
                        <div class="col-sm-7 col-sm-offset-1">
                            <table class="table table-bordered">
                                <tr>
                                    <td>
                                        <b>Stations to be selected:</b><br/>
                                        <select multiple="multiple" id='lstBox1' style="width:400px; height:300px">
                                            @php 
                                                $i=0;
                                            @endphp
                                            @if($zone_options['no_of_preference']=='NA')
                                                Posting Data Yet to be Updated..
                                            @else
                                                @foreach($zone_options['zones'] as  $key=>$zone)
                                                <h2><option value=" " disabled>Zone:{{$zone->zone_name}}</option></h2>
                                                    @foreach($zone_options[$zone->zone_name] as $key=>$district)
                                                        <option data-zone="{{$zone->id}}" value="{{$district->district_name}}">{{$key+1}}. {{$district->district_name}}</option>
                                                    @endforeach
                                                    @php 
                                                        $j=$key+1;
                                                    @endphp    
                                                    @foreach($zone_options[$zone->id] as $subdivision)
                                                        <option data-zone="{{$zone->id}}" value="{{$subdivision->subdivision_name}}"> {{++$j}}. {{$subdivision->subdivision_name}}</option>
                                                    @endforeach
                                                    <option><hr></option>
                                                @endforeach    
                                            @endif                                    
                                        </select>
                                    </td>
                                    <td style='width:50px;text-align:center;vertical-align:middle;'>
                                        <input type='button' id='btnRight' value ='  &#x2192  '/>
                                        <br/><input type='button' id='btnLeft' value ='  &#x2190  '/>
                                    </td>
                                    <td>
                                        <b>Zone selection according to preference</b><br/>
                                        <select multiple="multiple" id='lstBox2' style="width:400px; height:300px"> 
                                        </select>
                                    </td>
                                    <td style='width:50px;text-align:center;vertical-align:middle;'>                            
                                        <br/><button type='button' class="up_down" id='btnUp' value ='Up'>&#x2191</button>
                                        <br/><button type='button' class="up_down" id='btnDown' value ='Down'>&#x2193</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
               
                <div class="row">
                  <div class="col-sm-offset-1 col-sm-5">
                     <label for="remarks">Remarks</label>
                     <textarea class="form-control" rows="3" id="remarks"></textarea>
                  </div>
                </div>
                <div class="row">
                    <br>
                    <div class="col-sm-offset-2 col-sm-2">
                        <button id="draft" type="button"class="btn btn-warning draft-button info-form-button" value="draft">Draft</button>
                    </div>
                    <div class="col-sm-2">
                        <button id="submit" type="button" class="btn btn-primary add-button info-form-button" value="submit">Final Submit</button>
                    </div>
                </div>
   
               </div>
            </div>
         </div>
      </div>

     
      <br>
      <br>
      <!-- digital dairy starts here---->
      <br><br><br>
      <div class="tab-pan" id="daily_diary" style="display:none;">
         <div class="col-sm-offset-1 col-sm-11">
            <br><br>
            <div class="form-group row">
               <div class="date col-sm-offset-2 col-sm-2">
                  <input type="text" class="form-control date diary_date" id="date" placeholder="Choose Date" autocomplete="off" style="background-color:#F8FEFB;border:2px solid black;border-radius: 4px;">
               </div>
               <div class="col-sm-3">
                  <button id="submit_diary" type="button"
                     class="btn btn-primary add-button info-form-button">
                  Submit
                  </button>
               </div>
            </div>
        </div>
    <div class="col-sm-12">
   <!-- Bootstrap Boilerplate... -->
   <div id="info-panel" class="panel panel-default">
         <div class="box col-sm-offset-1">
            <div class="box-header" id="diary_editor" style="display:none;">
               <h3 class="box-title col-sm-offset-3" >DAILY WORKSHEET
                  <small>of : <span id="date_span"></span></small>
               </h3>
               <!-- /.box-header -->
               <div class="box-body pad col-sm-offset-1 col-sm-10">
                  <form>
                     <textarea class="text_content" id="text_content" placeholder="Place some text here"
                        style="width: 100%; height: 100%; font-size: 100%; line-height: 80%x; border: 1px solid #dddddd; padding: 10px;"></textarea>
                  </form>
                  <div class="col-sm-offset-5 col-sm-3">
                     <button id="submit_worksheet" type="button"
                        class="btn btn-warning add-button info-form-button">Submit
                     </button>
                  </div>
               </div>
            </div>
         </div>
      </div>
    </div>
   </div> 
      <!-- /.col-->
   </div>
</div>
<!-- /.box-header -->
</div>

<meta name="_token" content="{!! csrf_token() !!}" />



<!--Closing that has been openned in the header.blade.php -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script src="{{asset('js/jquery/jquery.min.js')}}"></script>



<script type="text/javascript">

$(document).ready(function(){
    
    /*Initialising the text editor*/
        
    $(".text_content").wysihtml5();
    
    /*LOADER*/
    $(document).ajaxStart(function() {
        $("#wait").css("display", "block");
    });
    $(document).ajaxComplete(function() {
        $("#wait").css("display", "none");
    });
    /*LOADER*/  
   
    /*date initialization:start */
    $(".diary_date").datepicker({
        format: "dd-mm-yyyy",
        endDate:'0',
        autoclose: true,   
        orientation: "auto",
    }).on('change', function () {
        $('.datepicker').hide();
    }); 
    /*date initialization:end */

    /*For opening the posting tab:starts*/   
    $(document).on("click","#posting_details",function(){
        $("#daily_diary").hide();
        $("#postings").show();
    });
    /*For opening the posting tab:ends*/   

    /*Button code for arrow key:start*/

        //right key
         $('#btnRight').click(function(e) {
            var selectedOpts = $('#lstBox1 option:selected');
            var leftListPosition = $("#lstBox1").prop('selectedIndex');

            if (selectedOpts.length == 0) {
                alert("Nothing to move.");
                e.preventDefault();
            }

            selectedOpts.attr('data-leftListPosition',leftListPosition);
            $('#lstBox2').append($(selectedOpts).clone());
            $(selectedOpts).attr('disabled',true);
            e.preventDefault();
        });

        //left key
        $('#btnLeft').click(function(e) {
            var selectedOpts = $('#lstBox2 option:selected');
            var position = $('#lstBox2 option:selected').data('leftlistposition');

            if (selectedOpts.length == 0) {
                alert("Nothing to move.");
                e.preventDefault();
            }
            
            $(selectedOpts).remove();

            $('#lstBox1 option').eq(position).prop('disabled', false);

            e.preventDefault();
           
        });        

        // up key
         $(".up_down").click(function(){
            var $op = $('#lstBox2 option:selected'),
                $this = $(this);
            if($op.length == 0)
            {
                alert("Select the station first");
                e.preventDefault(); 
            }
            if($op.length){
                ($this.val() == 'Up') ? 
                    $op.first().prev().before($op) : 
                    $op.last().next().after($op);
            }
        });

    /*Button code for arrow key:end*/

    /*CODE FOR DIGITAL DIARY:STARTS*/
     $(document).on("click","#judicial_diary",function(){
        $("#postings").hide();
        $("#daily_diary").show();
    });
    
    $(document).on("click","#submit_diary",function(){

        $("#diary_editor").show();
        $("#date_span").html($(".diary_date").val());
        $("#submit_diary").hide();
        var date=$("#date").val();
        $.ajax({
                type:"POST",
                url:"zone_pref_jr/worksheet_show",
                data:{
                    _token: $('meta[name="csrf-token"]').attr('content'),
                    date:date
                },
                success:function(response){
                    if(response.length>0)
                        $("iframe").contents().find("html").find("body").html(response['0'].description);
                    else
                        $("iframe").contents().find("html").find("body").html("");
                },
        });
    });
    $(document).on("change","#date",function(){
        $("#submit_diary").show();
    });
    $(document).on("click","#submit_worksheet",function(){
        var date=$("#date").val();
        var details=$("#text_content").val();
        $.ajax({
            type:"POST",
            url:"zone_pref_jr/worksheet",
            data:{
                _token: $('meta[name="csrf-token"]').attr('content'),
                    date:date,
                    details:details
                },
            success:function(response){
                $("#date").val('');
                $("#text_content").val('');
                swal("Saved Successfully","","success");
            },
            error:function(response){
                swal("Error","","error");
            }
        });
    });
    /* CODE FOR DIGITAL DIARY:ENDS */

    /*CODE FOR ZONE PREFERENCE:STARTS */

   // var posting_pref=  new Array();

   

    function send_data(flag){       


        var station_name = new Array();
        var station_zone = new Array();
        var remarks= $("#remarks").val();

        $("#lstBox2 option").each(function(index,value){

           // console.log($(this).data('zone'));
           
            station_name.push($(this).val());
            station_zone.push($(this).data('zone'));
            
        });


        //console.log(station_name);

        if(station_name.length==0){
            swal("Invalid Input","Selected Station Can Not Be Empty","error");
            return false;
        }
        
        
        $.ajax({
            type: "POST",
            url:"zone_pref_jr/draft", 
            data: {
                _token: $('meta[name="csrf-token"]').attr('content'),
                station_name:station_name,
                station_zone:station_zone,
                remarks:remarks,                
                flag:flag
            },
            success:function(response){
                swal("Saved","Zone Preference has been saved if draft mode ","success");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                if(jqXHR.status!=422 && jqXHR.status!=400){
                    swal("Server Error",errorThrown,"error");
                }
                else{
                    msg = "";
                    $.each(jqXHR.responseJSON.errors, function(key,value) {
                        msg+=value+"\n";						
                    });
                    swal("Invalid Input",msg,"error");
                }
            }
        })
   }
    

    //events of draft and submit::start

        $(document).on("click",".info-form-button",function(){
            $this = $(this);
          
            $event=$this.val();
          

            if( $event=="draft"){
                send_data('N');
               }
            else{
                send_data('Y');
                
            }

        });
    //events of draft and submit::end
    
});
</script>
@endsection



