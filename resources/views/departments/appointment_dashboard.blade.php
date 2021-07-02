@extends('layouts.app') 
@section('content')

<div class="row">    
    <div class="col-md-4 col-sm-6 col-xs-12">
        <div class="info-box bg-purple">
            <span class="info-box-icon"></span>
            <div class="info-box-content">
              <span class="info-box-text"><strong>Total JO : {{$data['total_jo']}} </strong></span>
              <span class="info-box-text">Male: {{$data['total_jo_gender_wise']['0']['count']}}</span>
              <span class="info-box-text">Female: {{$data['total_jo_gender_wise']['1']['count']}} </span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>

    <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box bg-red">
                <span class="info-box-icon"></span>
    
                <div class="info-box-content">
                    <span class="info-box-text"><strong>Current JO Strength : {{$data['current_jo_strength']}}  </strong></span>                                      
                    <span class="info-box-text">Male: {{$data['total_jo_strength_gender_wise']['0']['count']}}</span>                    
                    <span class="info-box-text">Female: {{$data['total_jo_strength_gender_wise']['1']['count']}}</span>                    
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
    </div>

    
    <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box bg-green">
                <span class="info-box-icon"></span>
    
                <div class="info-box-content">
                    <span class="info-box-text"><strong>Total DJ : {{$data['rank_wise_gender']['0']['count'] + $data['rank_wise_gender']['1']['count']}} </strong></span>                    
                    <span class="info-box-text">Male: {{$data['rank_wise_gender']['1']['count']}} </span>                    
                    <span class="info-box-text">Female: {{$data['rank_wise_gender']['0']['count']}} </span>                    
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
    </div> 

    <div class="col-md-4 col-sm-6 col-xs-12">
        <div class="info-box" style="background-color:DarkKhaki">
            <span class="info-box-icon"></span>

            <div class="info-box-content">
                <span class="info-box-text"><strong>Total ADJ (FTC) : {{$data['rank_wise_gender']['2']['count'] + $data['rank_wise_gender']['4']['count']}} </strong></span>
                <span class="info-box-text">Male: {{$data['rank_wise_gender']['4']['count']}} </span>
                <span class="info-box-text">Female: {{$data['rank_wise_gender']['2']['count']}} </span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div> 

    <div class="col-md-4 col-sm-6 col-xs-12">
        <div class="info-box" style="background-color:gold">
            <span class="info-box-icon"></span>

            <div class="info-box-content">
                <span class="info-box-text"><strong>Total CJSD : {{$data['rank_wise_gender']['3']['count'] + $data['rank_wise_gender']['5']['count']}} </strong></span>                
                <span class="info-box-text">Male: {{$data['rank_wise_gender']['5']['count']}} </span>                
                <span class="info-box-text">Female: {{$data['rank_wise_gender']['3']['count']}} </span>                
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div> 

    <div class="col-md-4 col-sm-6 col-xs-12">
        <div class="info-box" style="background-color:aquamarine">
            <span class="info-box-icon"></span>

            <div class="info-box-content">
                <span class="info-box-text"><strong>Total CJJD : {{$data['rank_wise_gender']['6']['count'] + $data['rank_wise_gender']['7']['count']}} </strong></span>                
                <span class="info-box-text">Male: {{$data['rank_wise_gender']['7']['count']}} </span>                
                <span class="info-box-text">Female: {{$data['rank_wise_gender']['6']['count']}} </span>                
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
                @if(sizeof($data['new_joiness_cjjd']) > 1)
                    @foreach($data['new_joiness_cjjd'] as $new_officer)
                    <li class="item">
                        <h4>{{$new_officer['officer_name']}}</h4>
                        <span class="label label-warning pull-right">{{$new_officer['jo_code']}}</span>
                        <span class="product-description"> - {{$new_officer['designation']}} <br/>DOJ: {{$new_officer['date_of_joining']}}  </span>
                    </li>
                    <!-- /.item -->
                    @endforeach    
                @else
                    <li class="item">
                        <h4>No Officer Found</h4>
                    </li>
                @endif            
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
                        @if(sizeof($data['new_joiness_dj']) > 1)
                            @foreach($data['new_joiness_dj'] as $new_officer)
                                <li class="item">
                                    <h4>{{$new_officer['officer_name']}}</h4>
                                    <span class="label label-warning pull-right">{{$new_officer['jo_code']}}</span>
                                    <span class="product-description"> - {{$new_officer['designation']}} <br/>DOJ: {{$new_officer['date_of_joining']}}  </span>
                                </li>
                                <!-- /.item -->
                            @endforeach    
                        @else
                            <li class="item">
                                <h4>No Officer Found</h4>
                            </li>
                        @endif                  
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
                                @if(sizeof($data['retirement_in_coming_year']) > 1)
                                    @foreach($data['retirement_in_coming_year'] as $officer)
                                        <li class="item">
                                            <h4>{{$officer['officer_name']}}</h4>
                                            <span class="label label-warning pull-right">{{$officer['jo_code']}}</span>
                                            <span class="product-description"> - {{$officer['designation']}} <br/>DOR: {{$officer['date_of_retirement']}}  </span>
                                        </li>
                                        <!-- /.item -->
                                    @endforeach    
                                @else
                                    <li class="item">
                                        <h4>No Officer Found</h4>
                                    </li>
                                @endif      
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
                @if(sizeof($data['on_deputation_cjjd']) > 1)
                    @foreach($data['on_deputation_cjjd'] as $officer)
                        <li class="item">
                            <h4>{{$officer['officer_name']}}</h4>
                            <span class="label label-warning pull-right">{{$officer['jo_code']}}</span>
                            <span class="product-description"> - {{$officer['designation']}} <br/>Since {{$officer['from_date']}}  </span>
                        </li>
                        <!-- /.item -->
                    @endforeach    
                @else
                    <li class="item">
                        <h4>No Officer Found</h4>
                    </li>
                @endif      
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
                        @if(sizeof($data['on_deputation_cjsd']) > 1)
                            @foreach($data['on_deputation_cjsd'] as $officer)
                                <li class="item">
                                    <h4>{{$officer['officer_name']}}</h4>
                                    <span class="label label-warning pull-right">{{$officer['jo_code']}}</span>
                                    <span class="product-description"> - {{$officer['designation']}} <br/>Since {{$officer['from_date']}}  </span>
                                </li>
                                <!-- /.item -->
                            @endforeach    
                        @else
                            <li class="item">
                                <h4>No Officer Found</h4>
                            </li>
                        @endif    
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
                                @if(sizeof($data['on_deputation_dj']) > 1)
                                    @foreach($data['on_deputation_dj'] as $officer)
                                        <li class="item">
                                            <h4>{{$officer['officer_name']}}</h4>
                                            <span class="label label-warning pull-right">{{$officer['jo_code']}}</span>
                                            <span class="product-description"> - {{$officer['designation']}} <br/>Since {{$officer['from_date']}}  </span>
                                        </li>
                                        <!-- /.item -->
                                    @endforeach    
                                @else
                                    <li class="item">
                                        <h4>No Officer Found</h4>
                                    </li>
                                @endif  
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
                @if(sizeof($data['on_special_posting_cjsd']) > 1)
                    @foreach($data['on_special_posting_cjsd'] as $officer)
                        <li class="item">
                            <h4>{{$officer['officer_name']}}</h4>
                            <span class="label label-warning pull-right">{{$officer['jo_code']}}</span>
                            <span class="product-description"> - {{$officer['designation']}} <br/>Since {{$officer['from_date']}}  </span>
                        </li>
                        <!-- /.item -->
                    @endforeach    
                @else
                    <li class="item">
                        <h4>No Officer Found</h4>
                    </li>
                @endif    
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
                        @if(sizeof($data['on_special_posting_dj']) > 1)
                            @foreach($data['on_special_posting_dj'] as $officer)
                                <li class="item">
                                    <h4>{{$officer['officer_name']}}</h4>
                                    <span class="label label-warning pull-right">{{$officer['jo_code']}}</span>
                                    <span class="product-description"> - {{$officer['designation']}} <br/>Since {{$officer['from_date']}}  </span>
                                </li>
                                <!-- /.item -->
                            @endforeach    
                        @else
                            <li class="item">
                                <h4>No Officer Found</h4>
                            </li>
                        @endif    
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
                                @if(sizeof($data['couple_officers_cjjd']) > 1)
                                    
                                    @php $flag = Array(); @endphp
                                    
                                    @foreach($data['couple_officers_cjjd'] as $officer)
                                        @if(!array_search($officer['spouse_jo_code'],$flag))                                       
                                            <li class="item">
                                                <h4>{{$officer['jo_name']}}</h4>
                                                <span class="label label-warning pull-right">{{$officer['jo_code']}}</span>
                                                <span class="product-description"> - {{$officer['designation']}} <br/>Since {{$officer['from_date']}}  </span>
                                                <h4>&</h4>
                                                <h4>{{$officer['spouse_name']}}</h4>
                                                <span class="label label-warning pull-right">{{$officer['spouse_jo_code']}}</span>
                                                <span class="product-description"> - {{$officer['spouse_designation']}} <br/>Since {{$officer['spouse_from_date']}}  </span>
                                            </li>
                                            <!-- /.item -->
                                            @php array_push($flag, $officer['jo_code']); @endphp
                                        @else
                                            @php continue; @endphp
                                        @endif
                                    @endforeach   
                                @else
                                    <li class="item">
                                        <h4>No Officer Found</h4>
                                    </li>
                                @endif    
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
                @if(sizeof($data['couple_officers_cjsd']) > 1)
                                    
                    @php $flag = Array(); @endphp
                    
                    @foreach($data['couple_officers_cjsd'] as $officer)
                        @if(!array_search($officer['spouse_jo_code'],$flag))                                       
                            <li class="item">
                                <h4>{{$officer['jo_name']}}</h4>
                                <span class="label label-warning pull-right">{{$officer['jo_code']}}</span>
                                <span class="product-description"> - {{$officer['designation']}} <br/>Since {{$officer['from_date']}}  </span>
                                <h4>&</h4>
                                <h4>{{$officer['spouse_name']}}</h4>
                                <span class="label label-warning pull-right">{{$officer['spouse_jo_code']}}</span>
                                <span class="product-description"> - {{$officer['spouse_designation']}} <br/>Since {{$officer['spouse_from_date']}}  </span>
                            </li>
                            <!-- /.item -->
                            @php array_push($flag, $officer['jo_code']); @endphp
                        @else
                            @php continue; @endphp
                        @endif
                    @endforeach   
                @else
                    <li class="item">
                        <h4>No Officer Found</h4>
                    </li>
                @endif    
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
                        @if(sizeof($data['couple_officers_ftc']) > 1)
                                        
                            @php $flag = Array(); @endphp
                            
                            @foreach($data['couple_officers_ftc'] as $officer)
                                @if(!array_search($officer['spouse_jo_code'],$flag))                                       
                                    <li class="item">
                                        <h4>{{$officer['jo_name']}}</h4>
                                        <span class="label label-warning pull-right">{{$officer['jo_code']}}</span>
                                        <span class="product-description"> - {{$officer['designation']}} <br/>Since {{$officer['from_date']}}  </span>
                                        <h4>&</h4>
                                        <h4>{{$officer['spouse_name']}}</h4>
                                        <span class="label label-warning pull-right">{{$officer['spouse_jo_code']}}</span>
                                        <span class="product-description"> - {{$officer['spouse_designation']}} <br/>Since {{$officer['spouse_from_date']}}  </span>
                                    </li>
                                    <!-- /.item -->
                                    @php array_push($flag, $officer['jo_code']); @endphp
                                @else
                                    @php continue; @endphp
                                @endif
                            @endforeach   
                        @else
                            <li class="item">
                                <h4>No Officer Found</h4>
                            </li>
                        @endif    
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
                                @if(sizeof($data['couple_officers_dj']) > 1)
                                        
                                    @php $flag = Array(); @endphp
                                    
                                    @foreach($data['couple_officers_dj'] as $officer)
                                        @if(!array_search($officer['spouse_jo_code'],$flag))                                       
                                            <li class="item">
                                                <h4>{{$officer['jo_name']}}</h4>
                                                <span class="label label-warning pull-right">{{$officer['jo_code']}}</span>
                                                <span class="product-description"> - {{$officer['designation']}} <br/>Since {{$officer['from_date']}}  </span>
                                                <h4>&</h4>
                                                <h4>{{$officer['spouse_name']}}</h4>
                                                <span class="label label-warning pull-right">{{$officer['spouse_jo_code']}}</span>
                                                <span class="product-description"> - {{$officer['spouse_designation']}} <br/>Since {{$officer['spouse_from_date']}}  </span>
                                            </li>
                                            <!-- /.item -->
                                            @php array_push($flag, $officer['jo_code']); @endphp
                                        @else
                                            @php continue; @endphp
                                        @endif
                                    @endforeach   
                                @else
                                    <li class="item">
                                        <h4>No Officer Found</h4>
                                    </li>
                                @endif    
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

<script>
    $(document).ready(function() {

    })
</script>
@endsection




