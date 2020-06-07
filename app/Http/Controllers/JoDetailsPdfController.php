<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\JudicialOfficer;
use App\JudicialOfficerQualification;
use App\JoLegalExperience;
use App\JudicialOfficerPosting;
use App\JudicialOfficerPostingPreference;
use App\JoReporting;
use App\JoZoneTenure;
use App\State;
use App\District;
use App\Subdivision;
use App\Zone;
use App\User;
use App\UserType;
use Auth;
use DB;
use Carbon\Carbon;

require_once base_path().'/vendor/autoload.php';

class JoDetailsPdfController extends Controller
{
    public function fetch_jo_details_pdf(Request $request){
        $this->validate ($request, [             
            'registration_no' => 'required|integer|max:99999|exists:judicial_officers,registration_no',           
        ]);

        $mpdf = new \Mpdf\Mpdf(['format' => 'Legal']);

        $jo_details = JudicialOfficer::join('states','judicial_officers.home_state_id','states.id')
                                    ->join('districts','judicial_officers.home_district_id','districts.id')
                                    ->join('recruitment_batches','judicial_officers.recruitment_batch_id','recruitment_batches.id')
                                    ->where('registration_no',$request->registration_no)
                                    ->select('judicial_officers.*','states.state_name', 'districts.district_name','recruitment_batches.recruitment_batch_desc')
                                    ->get();
        
        $profile_image = asset('images/judicial_officers/'.$jo_details['0']->registration_no.'/'.$jo_details['0']->profile_image);
        
        if($jo_details['0']->profile_image!=null){
            $image = "<td rowspan='2' align=center>
                        <img src='".$profile_image."' style=\" height:18% \">
                    </td>";
        }
        else{
            $image = '';
        }
            
        // Gender
        if($jo_details['0']->gender=='M')
            $gender = 'Male';
        else if($jo_details['0']->gender=='F')
            $gender = 'Female';
        else if($jo_details['0']->gender=='O')
            $gender = 'Other';  
                       
        //JO Code:
        if($jo_details['0']->jo_code==null)
            $jo_details['0']->jo_code = 'Not Assigned';  

        // Mobile No. 1
        if($jo_details['0']->mobile_no_1!=null)
            $mobile_no_1 = $jo_details['0']->mobile_no_1;
        else
            $mobile_no_1 = 'Not Available';

        // Mobile No. 2
        if($jo_details['0']->mobile_no_2!=null)
            $mobile_no_2 = "| ".$jo_details['0']->mobile_no_2;
        else
            $mobile_no_2 = '';

        // Email ID 1
        if($jo_details['0']->email_id_1!=null)
            $email_id_1 = $jo_details['0']->email_id_1;
        else
            $email_id_1 = 'Not Available';

        // Email ID 2
        if($jo_details['0']->email_id_2!=null)
            $email_id_2 = "| ".$jo_details['0']->email_id_2;
        else
            $email_id_2 = '';

        // Recruitment Batch Year
        if($jo_details['0']->recruitment_batch_year!=null)
            $recruitment_batch = $jo_details['0']->recruitment_batch_desc.', '.$jo_details['0']->recruitment_batch_year;
        else
            $recruitment_batch = $jo_details['0']->recruitment_batch_desc;

        // Date of Confirmation
        if($jo_details['0']->date_of_confirmation!=null)
            $date_of_confirmation = Carbon::parse($jo_details['0']->date_of_confirmation)->format('d-m-Y');
        else
            $date_of_confirmation = 'Not Available';
        
        
        $content="<table width=\"100%\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" border=\"0\">
                    <tr>
                        <td colspan='2' align=left><h1>Name: ".$jo_details['0']->officer_name."</h1></td>
                    </tr>
                    <tr>
                        <td colspan='2' align=left><h2>Reg No.: ".$jo_details['0']->registration_no."  ||  JO Code : ".$jo_details['0']->jo_code."</h2></td>".$image."
                        
                    </tr>
                    <tr>                            
                        <td align=left style=\"padding-top: 2%;\"><h2>Contact Details</h2></td>
                    </tr>
                    <tr>
                        <td colspan='6'><hr/></td>
                    </tr>
                    <tr>
                        <td style=\"padding-top: 1%;\"><h3>Permanent Address: ".$jo_details['0']->permanent_address." , ".$jo_details['0']->hometown.", ".$jo_details['0']->district_name.", ".$jo_details['0']->state_name."</h3></td>
                    
                        <td align=left style=\"padding-left: 8%;\"><h3>Email ID: ".$email_id_1." ".$email_id_2."</h3></td>
                    </tr>
                    <tr>
                        <td style=\"padding-top: 1%;\"><h3>Present Address: ".$jo_details['0']->present_address."</h3></td>
                    
                        <td align=left style=\"padding-left: 8%;\"><h3>Contact No: ".$mobile_no_1." ".$mobile_no_2."</h3></td>
                    </tr>
                </table>
                <table width=\"100%\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" border=\"0\">
                    <tr>                            
                        <td align=left style=\"padding-top: 7%;\"><h2>Basic Details</h2></td>
                    </tr>
                    <tr>
                        <td colspan='6'><hr/></td>
                    </tr>
                    <tr>
                        <td style=\"padding-top: 1%;\"><h3>Gender: ".$gender."</h3></td>
                        <td style=\"padding-top: 1%;\"><h3>Recruitment Batch: </h3><h3>".$recruitment_batch."</h3></td>
                        <td style=\"padding-top: 1%;\"><h3>Date of Birth: </h3><h3>".Carbon::parse($jo_details['0']->date_of_birth)->format('d-m-Y')."</h3></td>                    </tr>
                    <tr>
                        <td style=\"padding-top: 1%;\"><h3>Date of Joining: </h3><h3>".Carbon::parse($jo_details['0']->date_of_joining)->format('d-m-Y')."</h3></td>
                        <td style=\"padding-top: 1%;\"><h3>Date of Confirmation: </h3><h3>".$date_of_confirmation."</h3></td>
                        <td style=\"padding-top: 1%;\"><h3>Date of Superannuation: </h3><h3>".Carbon::parse($jo_details['0']->date_of_retirement)->format('d-m-Y')."</h3></td>
                    </tr>                               
                </table>
                
                <table width=\"100%\">
                    <tr>                            
                        <td align=left style=\"padding-top: 7%;\"><h2>Qualification Details</h2></td>
                    </tr>
                    <tr>
                        <td colspan='6'><hr/></td>
                    </tr>
                ";
      
        $jo_qualifications = JudicialOfficerQualification::join('qualifications','judicial_officer_qualifications.qualification_id','qualifications.id')                    
                                                        ->where('judicial_officer_id',$jo_details['0']->id)
                                                        ->orderBy('passing_year','asc')
                                                        ->get();

        if(sizeof($jo_qualifications)>0){
                $content.="<tr>
                            <td align=left> 
                                <ol>           
                        ";
                foreach($jo_qualifications as $jo_qualification){
                    $content.="<li style=\"font-size: 1.17em\"><b>".$jo_qualification->qualification_name." in ".$jo_qualification->passing_year."</b></li>";
                }
            $content.="</ol></td></tr>";
        }
        else{
            $content.="<tr>
                        <td align=left>
                            <h3><i>Not Available</i></h3>
                        </td>
                    </tr>";
        }

       $content.="</table>
                
                <table width=\"100%\">
                    <tr>                            
                        <td align=left style=\"padding-top: 7%;\"><h2>Place of Practice</h2></td>
                    </tr>
                    <tr>
                        <td colspan='6'><hr/></td>
                    </tr>";

                $jo_legal_practices = JoLegalExperience::join('subdivisions','jo_legal_experiences.subdivision_id','subdivisions.id')                    
                                                        ->where('judicial_officer_id',$jo_details['0']->id)
                                                        ->orderBy('from_year','asc')
                                                        ->get();

                if(sizeof($jo_legal_practices)>0){
                    $content.="<tr>
                                <td align=left> 
                                    <ol>           
                                ";
                    foreach($jo_legal_practices as $jo_legal_practice){
                        $content.="<li style=\"font-size: 1.17em\"><b>In Subdivision: ".$jo_legal_practice->subdivision_name." From Year ".$jo_legal_practice->from_year." To ".$jo_legal_practice->to_year."</b></li>";
                    }

                    $content.="</ol></td></tr>";
                }
                else{
                    $content.="<tr>
                                <td align=left>
                                    <h3><i>Not Available</i></h3>
                                </td>
                            </tr>";
                }

       $content.= "</table>
                <pagebreak/>
                <h2>Posting Details</h2>
                <hr/>
                <table width=\"100%\" style=\"border: 4px solid #ddd; page-break-inside:avoid\">
                    <thead>
                        <tr>
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\"></th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">Posting Mode</th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">Posted As</th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">Posting Tenure</th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse;\">Remark <br>(if any)</th>
                        </tr>
                    </thead>
                    <tbody>";

        $jo_postings = JudicialOfficerPosting::leftJoin('designations','judicial_officer_postings.designation_id','designations.id')
                                                ->join('modes','judicial_officer_postings.mode_id','modes.id')
                                                ->where('judicial_officer_id',$jo_details['0']->id)
                                                ->orderBy('from_date','asc')
                                                ->get();

        foreach($jo_postings as $key => $jo_posting){
            // To Date
            if($jo_posting->to_date==null)
                $to_date = "Till Date";
            else
                $to_date = Carbon::parse($jo_posting->to_date)->format('d-m-Y');

            // Posting Remark
            if($jo_posting->posting_remark!="")
                $posting_remark = $jo_posting->posting_remark;
            else
                $posting_remark = 'NA';  

            if($jo_posting->designation_id !=null){
                $posted_as = $jo_posting->designation_name.', '.$jo_posting->place_of_posting;
                if($jo_posting->additional_designation!=""){
                    $posted_as = $posted_as. " \n and ".$jo_posting->additional_designation;
                }
            }
            else
                $posted_as = $jo_posting->deputation_designation.' At '.$jo_posting->deputation_posting_place;

            $content.="<tr>
                        <td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            ++$key.  
                        "</td>
                        <td align=\"left\" style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            $jo_posting->posting_mode.  
                        "</td>
                        <td align=\"left\" style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            $posted_as.  
                        "</td>                        
                        <td align=\"left\" style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            Carbon::parse($jo_posting->from_date)->format('d-m-Y')." <br/>To <br/>".$to_date.  
                        "</td>
                        <td align=\"left\" style=\"font-size: 1.17em; border-collapse:collapse; border-top: 4px solid #ddd;\">".
                            $posting_remark. 
                        "</td>
                    </tr>";
        }

        $content.="</tbody></table>
                <table width=\"100%\" style=\"page-break-inside:avoid\">
                <tr>                            
                    <td align=left style=\"padding-top: 7%;\"><h2>Zone Wise Service</h2></td>
                </tr>
                <tr>
                    <td colspan='6'><hr/></td>
                </tr>";

        $zones = Zone::orderBy('zone_name')->get();

        foreach($zones as $key4=>$zone){  
            $content.="<tr>
                        <td align=left style=\"font-size: 1.17em;\">";

            $zone_tenures = JudicialOfficerPosting::join('modes','judicial_officer_postings.mode_id','=','modes.id')
                                             ->where([ 
                                                 ['judicial_officer_id','=',$jo_details['0']->id],
                                                 ['zone_id','=',$zone->id],
                                                 ['posting_mode','not ilike',"%On Probation%"]
                                             ])->select('from_date','to_date')
                                             ->get();
             
             if(sizeof($zone_tenures)>0){
                 $str1="";
                 $diff_days = 0;

                 foreach ($zone_tenures as $key3=>$zone_tenure){
                     $from_date=Carbon::parse($zone_tenure->from_date);
                     if($zone_tenure->to_date == null){
                         $to_date= Carbon::now();
                     }
                     else{
                         $to_date=Carbon::parse($zone_tenure->to_date);
                     }
                         
                     $diff_days += $from_date->diffInDays($to_date);                                
                 }

                 //Calculation and string creation for duration spend in a zone in Y-M-D format:start 
                 $tenure="";                            
             
                 
                if( $diff_days >= 365){
                     $years =  floor($diff_days/365);
                     $days = fmod($diff_days,365);
                     if($days > 30){
                         $months= floor($days/30);
                         $days = fmod($days,30);

                         $tenure=$years." Year(s) ".$months." Month(s) ".$days." Day(s) ";
                     }
                     else{
                         $tenure=$years." Year(s) ".$days." Day(s) ";
                     }                                
                 }
                 else if($diff_days >= 30){

                     $months = floor($diff_days/30);
                     $days = fmod($diff_days,30);

                     $tenure=$months." Month(s) ".$days." Day(s) ";
                 }
                 else if($diff_days > 0){

                     $tenure=$diff_days." Day(s) ";
                 }
                 else
                     $tenure="Yet to be posted.";

                if($key4>0)
                    $str1.="<br><br><b>Zone ".$zone->zone_name." </b>: ".$tenure;
                else
                    $str1.="<b>Zone ".$zone->zone_name." </b>: ".$tenure;

                 $content.=$str1;
             }
             else{    
                if($key4>0)             
                    $content.="<br><br><b> Zone ".$zone->zone_name." </b>: Yet to be posted.";
                else
                    $content.="<b> Zone ".$zone->zone_name." </b>: Yet to be posted.";
            }

            $content.="</td></tr>";

        }   
         
         $content.="</table>";


        $mpdf->SetHTMLFooter('Report Generated by the IIMS - Calcutta High Court on '.Carbon::now()->format('d-m-Y'));

       $mpdf->WriteHTML($content);

        if (!is_dir(base_path().'/public/jo_documents/'.$jo_details['0']->registration_no)) 
        {
            mkdir(base_path().'/public/jo_documents/'.$jo_details['0']->registration_no, 0777, true);       
        }
        
        if(file_exists(base_path().'/public/jo_documents/'.$jo_details['0']->registration_no.'/'.$jo_details['0']->registration_no."_jo_details.pdf"))
        {
            unlink(base_path().'/public/jo_documents/'.$jo_details['0']->registration_no.'/'.$jo_details['0']->registration_no."_jo_details.pdf");
        }
        
        $mpdf->Output(base_path().'/public/jo_documents/'.$jo_details['0']->registration_no.'/'.$jo_details['0']->registration_no."_jo_details.pdf");
        $mpdf->close();

        return asset('jo_documents/'.$jo_details['0']->registration_no.'/'.$jo_details['0']->registration_no."_jo_details.pdf");
    }

    

    public function download_posting_preferences(Request $request){

        $mpdf = new \Mpdf\Mpdf(['orientation' => 'L']);

        $rank= $request->route('rank');
        if($rank==0){
                  
            $judicial_officer_details['display_pref_for_jo'] = JudicialOfficer::join('states','judicial_officers.home_state_id','=','states.id') 
                                                                        ->where('posting_preference_window_flag','=','Y')
                                                                        ->select('judicial_officers.id','officer_name','jo_code','hometown','home_state_id', 'state_name','registration_no','profile_image')
                                                                        ->orderBy('date_of_joining')
                                                                        ->orderBy('date_of_birth')
                                                                        ->get();
        }
        else{
            $judicial_officer_details['display_pref_for_jo'] = JudicialOfficer::join('judicial_officer_postings','judicial_officers.id','=','judicial_officer_postings.judicial_officer_id')
                                                                        ->join('states','judicial_officers.home_state_id','=','states.id') 
                                                                        ->where([
                                                                            ['posting_preference_window_flag','=','Y'],
                                                                            ['rank_id',$rank],
                                                                            ['to_date',null]
                                                                        ])                                                                                
                                                                        ->select('judicial_officers.id','officer_name','jo_code','hometown','home_state_id', 'state_name','registration_no','profile_image')
                                                                        ->orderBy('date_of_joining')
                                                                        ->orderBy('date_of_birth')
                                                                        ->get();

        }
                $zones = Zone::orderBy('zone_name')->get();
                
                if( sizeof($judicial_officer_details['display_pref_for_jo'])>0)
                {
                    foreach($judicial_officer_details['display_pref_for_jo'] as  $key=>$station_pref){

                        $profile_image=asset('images/judicial_officers/'.$judicial_officer_details['display_pref_for_jo'][$key]->registration_no.'/'.$judicial_officer_details['display_pref_for_jo'][$key]->profile_image);
                        //print_r($profile_image); exit;
                        $str1="";

                        if($judicial_officer_details['display_pref_for_jo'][$key]->profile_image!=null){
                        
                            $str1 = $judicial_officer_details['display_pref_for_jo'][$key]->officer_name."/".$judicial_officer_details['display_pref_for_jo'][$key]->jo_code. "<br><br>\n\n<img src ='". $profile_image."' style ='height:18%' >";
                        }
                        else{
                            $str1= $judicial_officer_details['display_pref_for_jo'][$key]->officer_name."/".$judicial_officer_details['display_pref_for_jo'][$key]->jo_code;

                        }
                        
                        
                        $station_pref->officer_name =$str1 ;

                        $judicial_officer_details['preference_details'][$key] = JudicialOfficerPostingPreference::where([
                                                                                                                    ['final_submission','=','Y'],
                                                                                                                    ['judicial_officer_id','=',$station_pref->id]
                                                                                                                ])->select('station_name','remarks')->get();
                      
                        //Current Posting Details
                        $judicial_officer_details['posted_as'][$key] = JudicialOfficerPosting::join('judicial_officers','judicial_officer_postings.judicial_officer_id','=','judicial_officers.id')
                                                                                        ->leftJoin('designations','judicial_officer_postings.designation_id','=','designations.id')
                                                                                        ->where('judicial_officers.id','=',$station_pref->id)
                                                                                        ->orderBy('judicial_officer_postings.from_date','DESC')
                                                                                        ->limit(1)
                                                                                        ->get();                           
                                                                                       
                        if($judicial_officer_details['posted_as'][$key]['0']['designation_id'] == null){
                            $judicial_officer_details['posted_as'][$key]['0']['designation_name']="<strong>Currently Deputed as</strong> ".$judicial_officer_details['posted_as'][$key]['0']['deputation_designation']." At ".$judicial_officer_details['posted_as'][$key]['0']['deputation_posting_place']." From ". Carbon::parse($judicial_officer_details['posted_as'][$key]['0']['from_date'])->format('d-m-Y');
                            
                        }
                        else if($judicial_officer_details['posted_as'][$key]['0']['additional_designation'] != null){
                            $judicial_officer_details['posted_as'][$key]['0']['designation_name']="<strong>Currently Posted as</strong> ".$judicial_officer_details['posted_as'][$key]['0']['designation_name'].", ".$judicial_officer_details['posted_as'][$key]['0']['place_of_posting']." From ". Carbon::parse($judicial_officer_details['posted_as'][$key]['0']['from_date'])->format('d-m-Y')." And ".$judicial_officer_details['posted_as'][$key]['0']['additional_designation'];
                           
                        }
                        else{
                            $judicial_officer_details['posted_as'][$key]['0']['designation_name']="<strong>Currently Posted as</strong> ".$judicial_officer_details['posted_as'][$key]['0']['designation_name'].", ".$judicial_officer_details['posted_as'][$key]['0']['place_of_posting']." From ". Carbon::parse($judicial_officer_details['posted_as'][$key]['0']['from_date'])->format('d-m-Y');
                            
                        } 
                        
                       // Posting details
                       $str ="";

                       $judicial_officer_details['posting_details'][$key] =  JudicialOfficerPosting ::leftjoin('designations','judicial_officer_postings.designation_id','designations.id')
                                                                                                            ->leftjoin('zones','judicial_officer_postings.zone_id','=','zones.id')                                                                                      
                                                                                                            ->where('judicial_officer_postings.judicial_officer_id','=',$station_pref->id)
                                                                                                            ->orderBy('judicial_officer_postings.from_date','ASC')
                                                                                                            ->select('judicial_officer_postings.judicial_officer_id','designations.designation_name', 'place_of_posting', 'judicial_officer_postings.additional_designation',
                                                                                                                    'judicial_officer_postings.deputation_designation','judicial_officer_postings.deputation_posting_place',
                                                                                                                    'judicial_officer_postings.from_date','judicial_officer_postings.to_date','zones.zone_name')
                                                                                                            ->get();
                        foreach($judicial_officer_details['posting_details'][$key] as $key5=>$posting){
                            $str.= "<br>";

                            if($posting['to_date'] != null)
                                $posting['to_date'] = Carbon::parse($posting['to_date'])->format('d-m-Y');
                            else
                                $posting['to_date'] = "Till Date";

                            $posting['from_date'] = Carbon::parse($posting['from_date'])->format('d-m-Y');  

                            if($posting['designation_name']==null){
                                $str.= "<strong>".($key5+1).".</strong> Deputed as ".$posting['deputation_designation']. "At ".$posting['deputation_posting_place']." From ".$posting['from_date']." To ".$posting['to_date'];
                            }
                            else if( $posting['additional_designation'] !=null){
                                $str.= "<strong>".($key5+1).".</strong> Posted as ".$posting['designation_name'].", ".$posting['place_of_posting']." From ".$posting['from_date']." To ".$posting['to_date']." And ".$posting['additional_designation'];
                            }
                            else{
                                $str.= "<strong>".($key5+1).". </strong> Posted as ".$posting['designation_name'].", ".$posting['place_of_posting']." From ".$posting['from_date']." To ".$posting['to_date'];
                            }
                            $str.=" <strong> (Zone: ".$posting->zone_name.") </strong>";
                        }

                        $judicial_officer_details['posted_as'][$key]['0']['designation_name'].="<br><br>\n\n".$str;       

                        foreach($zones as $key4=>$zone){                            
                           $diff_days = 0;
                           $zone_tenures = JudicialOfficerPosting::join('modes','judicial_officer_postings.mode_id','=','modes.id')
                                                                ->where([ 
                                                                    ['judicial_officer_id','=',$station_pref->id],
                                                                    ['zone_id','=',$zone->id],
                                                                    ['posting_mode','not ilike',"%On Probation%"]
                                                                ])->select('from_date','to_date')->get();
                            $str1="";

                            foreach ($zone_tenures as $key3=>$zone_tenure){
                                $from_date=Carbon::parse($zone_tenure->from_date);
                                if($zone_tenure->to_date == null){
                                    $to_date= Carbon::now();
                                }
                                else{
                                    $to_date=Carbon::parse($zone_tenure->to_date);
                                }
                                    
                                $diff_days += $from_date->diffInDays($to_date);                                
                            }

                            //Calculation and string creation for duration spend in a zone in Y-M-D format:start 
                            $tenure="";                            
                           
                            
                            if( $diff_days >= 365){
                                $years =  floor($diff_days/365);
                                $days = fmod($diff_days,365);
                                if($days > 30){
                                    $months= floor($days/30);
                                    $days = fmod($days,30);

                                    $tenure=$years." Year(s) ".$months." Month(s) ".$days." Day(s) ";
                                }
                                else{
                                    $tenure=$years." Year(s) ".$days." Day(s) ";
                                }                                
                            }
                            else if($diff_days >= 30){

                                $months = floor($diff_days/30);
                                $days = fmod($diff_days,30);

                                $tenure=$months." Month(s) ".$days." Day(s) ";
                            }
                            else if($diff_days > 0){

                                $tenure=$diff_days." Day(s) ";
                            }
                            else
                                $tenure="Yet to be posted.";

                            $str1.="<br><br>\n\n Zone ".$zone->zone_name." : ".$tenure;

                            //Calculation and string creation for duration spend in a zone in Y-M-D format:end
                            $judicial_officer_details['zone_tenure'][$key][$key4]=$str1;

                        }    
                        
                     
                        //Legal Practice Subdivisions
                        $judicial_officer_details['practice_subdivision'][$key] = JoLegalExperience::join('judicial_officers','jo_legal_experiences.judicial_officer_id','=','judicial_officers.id')
                                                                                                    ->join('subdivisions','jo_legal_experiences.subdivision_id','=','subdivisions.id')
                                                                                                    ->where('judicial_officers.id','=',$station_pref->id)
                                                                                                    ->get();

                   
                        if(sizeof($judicial_officer_details['practice_subdivision'][$key])>0){
                            foreach( $judicial_officer_details['practice_subdivision'][$key] as $key6=>$practice_details)
                            
                            $judicial_officer_details['practice_subdivision'][$key][$key6]['subdivision_name']=$judicial_officer_details['practice_subdivision'][$key][$key6]['subdivision_name']." From ".$judicial_officer_details['practice_subdivision'][$key][$key6]['from_year']." To ".$judicial_officer_details['practice_subdivision'][$key][$key6]['to_year'];
                            
                        }

                        //spouse details
                        $judicial_officer_details['spouse_details'][$key] = JudicialOfficer::where('judicial_officers.id','=',$station_pref->id)
                                                                                            ->select('judicial_officers.spouse')
                                                                                            ->get();
                                                          
                                                
                        if(sizeof($judicial_officer_details['spouse_details'][$key])>0){

                            $judicial_officer_details['spouse_details'][$key] = JudicialOfficerPosting::join('judicial_officers','judicial_officer_postings.judicial_officer_id','=','judicial_officers.id')
                                                                                        ->leftJoin('designations','judicial_officer_postings.designation_id','=','designations.id')
                                                                                        ->where([
                                                                                            ['judicial_officers.id','=',$judicial_officer_details['spouse_details'][$key]['0']['spouse']],
                                                                                            ['judicial_officers.date_of_retirement','>=',Carbon::now()]
                                                                                        ])
                                                                                        ->orderBy('from_date','DESC')
                                                                                        ->limit(1)
                                                                                        ->get();   
                                                                                        
                            if(sizeof($judicial_officer_details['spouse_details'][$key])>0){

                                if($judicial_officer_details['spouse_details'][$key]['0']['designation_id'] == null){
                                    $judicial_officer_details['spouse_details'][$key]['0']['designation_name']="Deputed as ".$judicial_officer_details['spouse_details'][$key]['0']['deputation_designation']." At ".$judicial_officer_details['spouse_details'][$key]['0']['deputation_posting_place']." From ". Carbon::parse($judicial_officer_details['spouse_details'][$key]['0']['from_date'])->format('d-m-Y');
                                }
                                else if($judicial_officer_details['spouse_details'][$key]['0']['additional_designation'] != null){
                                    $judicial_officer_details['spouse_details'][$key]['0']['designation_name']="Posted as ".$judicial_officer_details['spouse_details'][$key]['0']['designation_name'].", ".$judicial_officer_details['spouse_details'][$key]['0']['place_of_posting']." From ". Carbon::parse($judicial_officer_details['posted_as'][$key]['0']['from_date'])->format('d-m-Y')." And ".$judicial_officer_details['spouse_details'][$key]['0']['additional_designation'];
                                }
                                else{
                                    $judicial_officer_details['spouse_details'][$key]['0']['designation_name']="Posted as ".$judicial_officer_details['spouse_details'][$key]['0']['designation_name'].", ".$judicial_officer_details['spouse_details'][$key]['0']['place_of_posting']." From ". Carbon::parse($judicial_officer_details['spouse_details'][$key]['0']['from_date'])->format('d-m-Y');
                                }
                            }
                        }

                    }
                   
                } 

        

        $content = "";    
        for($i=0;  $i < sizeof($judicial_officer_details['display_pref_for_jo']); $i++){
            $content.= "<p align=\"center\" style=\"font-size: 15px;font-weight: bold;\">Posting Preference of Judicial Officer</p>
                    <table width=\"100%\" style=\"border-right: 4px solid #ddd; border-left: 4px solid #ddd; border-top: 4px solid #ddd;page-break-inside:avoid\">
                        <thead>
                            <tr>                                
                                <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd; border-bottom: 4px solid #ddd\">JO NAME</th>
                                <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd; border-bottom: 4px solid #ddd\">POSTED AS</th>
                                <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd; border-bottom: 4px solid #ddd\">STATION PREFERENCE</th>
                                <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd; border-bottom: 4px solid #ddd\">PREFERENCE REMARK</th>
                                <th style=\"font-size: 1.17em; border-collapse:collapse;border-bottom: 4px solid #ddd\">OTHER INFO.</th>
                            </tr>
                        </thead>
                        <tbody>";

            $content.="<tr>                       
                        <td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-bottom: 4px solid #ddd;\">".$judicial_officer_details['display_pref_for_jo'][$i]['officer_name']."</td>
                        <td align=\"left\" style=\"  font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-bottom: 4px solid #ddd;\">".$judicial_officer_details['posted_as'][$i]['0']['designation_name']."</td>";

            
            $content.="<td align=\"left\" style=\" font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-bottom: 4px solid #ddd;\">";
            if(sizeof($judicial_officer_details['preference_details'][$i]) > 0){
                for($j=0; $j<sizeof($judicial_officer_details['preference_details'][$i]); $j++)
                {   
                    $content.="<strong>".($j+1).". </strong>".$judicial_officer_details['preference_details'][$i][$j]['station_name']."<br><br>";                      
                }
            }
            else{
                $content.="Station preference not yet given";
            }
            
            $content.="</td>";

            
            if(sizeof($judicial_officer_details['preference_details'][$i]) > 0)
                $content.="<td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-bottom: 4px solid #ddd;\">".$judicial_officer_details['preference_details'][$i]['0']['remarks']."</td>";                    
            else                              
                $content.="<td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-bottom: 4px solid #ddd;\">Not Available</td>";

            
            $content.="<td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-bottom:4px solid #ddd;\"><strong>Zone-wise Posting history</strong>";
            for($j=0; $j<sizeof($judicial_officer_details['zone_tenure'][$i]); $j++){
                $content.=$judicial_officer_details['zone_tenure'][$i][$j];
            }
           
            if(!empty($judicial_officer_details['display_pref_for_jo'][$i]['hometown']))
                $content.= "<br><br><strong>Hometown</strong> : ".$judicial_officer_details['display_pref_for_jo'][$i]['hometown'].", ".$judicial_officer_details['display_pref_for_jo'][$i]['state_name'];
           
            if(sizeof($judicial_officer_details['practice_subdivision'][$i])>0){
                $content.="<br><br><strong>Place of Practice :</strong><br>";                
                for($j=0; $j < sizeof($judicial_officer_details['practice_subdivision'][$i]); $j++){
                    $content.="<strong>".($j+1).". </strong> ".$judicial_officer_details['practice_subdivision'][$i][$j]['subdivision_name']."<br>";
                }
            }
            else{
                $content.="";
            }
            
            if(sizeof($judicial_officer_details['spouse_details'][$i]) > 0){
                $content.="<br><br><strong>Spouse : </strong>".$judicial_officer_details['spouse_details'][$i]['0']['officer_name'].
                            "<br>".$judicial_officer_details['spouse_details'][$i]['0']['designation_name'];
            }
            else{
                $content.="";
            }

            $content.="</td></tr></tbody></table><pagebreak>"; 
        
         }

        
        $mpdf->SetHTMLFooter('<hr>Report Generated by the IIMS - Calcutta High Court on '.Carbon::now()->format('d-m-Y').'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{PAGENO}');


        $mpdf->WriteHTML($content);
        $mpdf->Output('jo_posting_pref.pdf','D');
                
    }
    public function zonewise_tenurewise_jo_download(Request $request){

        $mpdf = new \Mpdf\Mpdf(['orientation' => 'L']);

        $zone = $request->route('zone');
        if($zone==0){
            $zone="";
        }
        $cadre = $request->route('cadre');
        if($cadre==0){
            $cadre="";
        }
        $year = $request->route('year');
        
        $month = $request->route('month');
        
        $day = $request->route('day');

        $terminal_date = $request->route('terminal_date');
        if($terminal_date==0){
            $terminal_date="";
        }

        $jo_posting= array();
        $jo_details= array();
        $jo_info= array();
        $final_tenure = array();
        $data = array();
        $nestedData = array();
        $posting_details = array();
       

        //$duration = array();

        $tenure=0;
        $tenure_year=0;
        $tenure_month=0;
        $tenure_day=0;
        $posting_period="";
        $latest_zone_posting_details="";
        $i=0;
        $j=0;
        $counter=0;
        

        $tenure_in_days = $year*365 + $month*30 + $day;
              
        
            if($terminal_date==""){
                         //terminal date is not given
                if($cadre==""){            //cadre is not given
                    $current_postings = JudicialOfficerPosting::where([
                                                                        ["zone_id",$zone],
                                                                        ["to_date","=",null]
                                                                    ])
                                                                    ->orderBy('judicial_officer_id')
                                                                    ->get();    
                   
                
                    foreach( $current_postings as $key=>$zonewise_officer){
                        $judicial_officer_posting_details = JudicialOfficerPosting::leftjoin('zones','judicial_officer_postings.zone_id','=','zones.id')
                                                                                ->leftjoin('designations','judicial_officer_postings.designation_id','=','designations.id')
                                                                                ->leftjoin('judicial_officers','judicial_officer_postings.judicial_officer_id','=','judicial_officers.id')
                                                                                ->where('judicial_officer_id',$zonewise_officer->judicial_officer_id)
                                                                                ->orderBy('to_date','desc')
                                                                                ->get();
                        $latest_zone_posting_details = "";
                        $tenure = 0;
                        $i=0;
                        $posting_details= array(); 
                        
                        foreach($judicial_officer_posting_details as $key1=>$jo_posting_detail){
                            ++$i;                           
                            if($jo_posting_detail->zone_id == $zone){      //SAME ZONE
                                if($jo_posting_detail->to_date == null){    //CURRENT POSTING
                                    $from_date = Carbon::parse($jo_posting_detail->from_date);                   
                                    $to_date = Carbon::today();                                  
                                    if($jo_posting_detail->designation_id == null){
                                        $nestedData['latest_posting'] = $i.'. '.$jo_posting_detail->deputation_designation.', '.$jo_posting_detail->deputation_posting_place;                                        
                                        $latest_zone_posting_details = '<br>'.$i.'. '. $jo_posting_detail->deputation_designation.', deputed at '.$jo_posting_detail->deputation_posting_place.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To Till Date';
                                    }
                                    else{
                                        $nestedData['latest_posting'] = $i.'. '.$jo_posting_detail->designation_name.', '.$jo_posting_detail->place_of_posting;
                                        $latest_zone_posting_details= '<br>'. $i.'. '. $jo_posting_detail->designation_name.' posted as '.$jo_posting_detail->place_of_posting.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To Till Date';
                                    }
                                }
                                else{       //PREVIOUS POSTINGS IN THE SAME ZONE 
                                    $from_date = Carbon::parse($jo_posting_detail->from_date);           
                                    if($jo_posting_detail->designation_id == null){
                                        $latest_zone_posting_details = '<br>'.$i.'. '. $jo_posting_detail->deputation_designation.', deputed at '.$jo_posting_detail->deputation_posting_place.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To '.Carbon::parse($jo_posting_detail->to_date)->format('d-m-Y');
                                    }
                                    else{
                                        $latest_zone_posting_details = '<br>'. $i.'. '. $jo_posting_detail->designation_name.' posted as '.$jo_posting_detail->place_of_posting.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To '.Carbon::parse($jo_posting_detail->to_date)->format('d-m-Y');
                                    }
                                }
                                $tenure = $to_date->diffInDays($from_date);
                                array_push($posting_details,$latest_zone_posting_details);
                            }
                            else{
                                break;
                            }
                            
                        }
                        //print_r($tenure);exit;
                        //Calculation and string creation for duration spend in a zone in Y-M-D format:start                         
                        if($tenure>=$tenure_in_days){
                            ++$counter;
                            ++$i;
                            if( $tenure >= 365){
                                $years =  floor($tenure/365);
                                $days = fmod($tenure,365);
                                if($days > 30){
                                    $months= floor($days/30);
                                    $days = fmod($days,30);

                                    $posting_period=$years." Year(s) ".$months." Month(s) ".$days." Day(s) ";
                                }
                                else{
                                    $posting_period=$years." Year(s) ".$days." Day(s) ";
                                }                                
                            }
                            else if($tenure >= 30){

                                $months = floor($tenure/30);
                                $days = fmod($tenure,30);

                                $posting_period=$months." Month(s) ".$days." Day(s) ";
                            }
                            else if($tenure > 0){

                                $posting_period=$tenure." Day(s) ";
                            }
                            else
                                $posting_period="Yet to be posted.";
                            
          
                            
                            $nestedData['sl_no'] = $counter;
                            $nestedData['id'] = $jo_posting_detail->judicial_officer_id;
                            $nestedData['officer_name'] = $jo_posting_detail->officer_name.'/'.$jo_posting_detail->jo_code;
                            $str = "";
                            foreach($posting_details as $posting)
                            {
                                $str.= $posting;
                            }

                            $nestedData['current_zone_posting_details'] = $str;
                            $nestedData['duration_in_last_zone'] = $posting_period;
                            if($jo_posting_detail->posting_preference_window_flag == 'Y'){
                                $nestedData['action'] = 'Window is already open';
                            }      
                            else{
                                $nestedData['action'] = "<i class='fa fa-window-restore enable' style='color:blue;' aria-hidden='true'></i>";
                            }
                            
                            $data[] = $nestedData;
                        }
                    }  
                            
                            
                }
                else{       //when cadre is given
                    $current_postings = JudicialOfficerPosting::where([
                                                                        ["zone_id",$zone],
                                                                        ["to_date","=",null],
                                                                        ["rank_id",$cadre]
                                                                    ])
                                                                    ->orderBy('judicial_officer_id')
                                                                    ->get();    
                    

                    foreach( $current_postings as $key=>$zonewise_officer){
                        $judicial_officer_posting_details = JudicialOfficerPosting::leftjoin('zones','judicial_officer_postings.zone_id','=','zones.id')
                                                                                    ->leftjoin('designations','judicial_officer_postings.designation_id','=','designations.id')
                                                                                    ->leftjoin('judicial_officers','judicial_officer_postings.judicial_officer_id','=','judicial_officers.id')
                                                                                    ->where('judicial_officer_id',$zonewise_officer->judicial_officer_id)
                                                                                    ->orderBy('to_date','desc')
                                                                                    ->get();
                        $latest_zone_posting_details = "";
                        $tenure = 0;
                        $i=0;
                        $posting_details= array(); 

                        foreach($judicial_officer_posting_details as $key1=>$jo_posting_detail){
                            ++$i;                           
                            if($jo_posting_detail->zone_id == $zone){      //SAME ZONE
                                if($jo_posting_detail->to_date == null){    //CURRENT POSTING
                                    $from_date = Carbon::parse($jo_posting_detail->from_date);                   
                                    $to_date = Carbon::today();                                  
                                    if($jo_posting_detail->designation_id == null){
                                        $nestedData['latest_posting'] = $i.'. '.$jo_posting_detail->deputation_designation.', '.$jo_posting_detail->deputation_posting_place;                                        
                                        $latest_zone_posting_details = '<br>'.$i.'. '. $jo_posting_detail->deputation_designation.', deputed at '.$jo_posting_detail->deputation_posting_place.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To Till Date';
                                    }
                                    else{
                                        $nestedData['latest_posting'] = $i.'. '.$jo_posting_detail->designation_name.', '.$jo_posting_detail->place_of_posting;
                                        $latest_zone_posting_details= '<br>'. $i.'. '. $jo_posting_detail->designation_name.' posted as '.$jo_posting_detail->place_of_posting.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To Till Date';
                                    }
                                }
                                else{       //PREVIOUS POSTINGS IN THE SAME ZONE 
                                    $from_date = Carbon::parse($jo_posting_detail->from_date);           
                                    if($jo_posting_detail->designation_id == null){
                                        $latest_zone_posting_details = '<br>'.$i.'. '. $jo_posting_detail->deputation_designation.', deputed at '.$jo_posting_detail->deputation_posting_place.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To '.Carbon::parse($jo_posting_detail->to_date)->format('d-m-Y');
                                    }
                                    else{
                                        $latest_zone_posting_details = '<br>'. $i.'. '. $jo_posting_detail->designation_name.' posted as '.$jo_posting_detail->place_of_posting.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To '.Carbon::parse($jo_posting_detail->to_date)->format('d-m-Y');
                                    }
                                }
                                $tenure = $to_date->diffInDays($from_date);
                                array_push($posting_details,$latest_zone_posting_details);
                            }
                            else{
                                break;
                            }

                        }
                        //print_r($tenure);exit;
                        //Calculation and string creation for duration spend in a zone in Y-M-D format:start                         
                        if($tenure>=$tenure_in_days){
                            ++$counter;
                            if( $tenure >= 365){
                                $years =  floor($tenure/365);
                                $days = fmod($tenure,365);
                                if($days > 30){
                                    $months= floor($days/30);
                                    $days = fmod($days,30);

                                    $posting_period=$years." Year(s) ".$months." Month(s) ".$days." Day(s) ";
                                }
                                else{
                                    $posting_period=$years." Year(s) ".$days." Day(s) ";
                                }                                
                            }
                            else if($tenure >= 30){

                                $months = floor($tenure/30);
                                $days = fmod($tenure,30);
                                $posting_period=$months." Month(s) ".$days." Day(s) ";
                            }
                            else if($tenure > 0){

                                $posting_period=$tenure." Day(s) ";
                            }
                            else
                                $posting_period="Yet to be posted.";


                            $nestedData['sl_no'] = $counter;
                            $nestedData['id'] = $jo_posting_detail->judicial_officer_id;
                            $nestedData['officer_name'] = $jo_posting_detail->officer_name.'/'.$jo_posting_detail->jo_code;
                            $str = "";
                            foreach($posting_details as $posting)
                            {
                                $str.= $posting;
                            }

                            $nestedData['current_zone_posting_details'] = $str;
                            $nestedData['duration_in_last_zone'] = $posting_period;
                            if($jo_posting_detail->posting_preference_window_flag == 'Y'){
                                $nestedData['action'] = 'Window is already open';
                            }      
                            else{
                                $nestedData['action'] = "<i class='fa fa-window-restore enable' style='color:blue;' aria-hidden='true'></i>";
                            }

                            $data[] = $nestedData;
                            
                        }
                    }  

                }
            }
            else{       //Terminal date is given
                if($cadre==""){            //cadre is not given
                    $current_postings = JudicialOfficerPosting::where([
                                                                        ["zone_id",$zone],
                                                                        ["to_date","=",null]
                                                                    ])
                                                                    ->orderBy('judicial_officer_id')
                                                                    ->get();    
                  
                
                    foreach( $current_postings as $key=>$zonewise_officer){
                        $judicial_officer_posting_details = JudicialOfficerPosting::leftjoin('zones','judicial_officer_postings.zone_id','=','zones.id')
                                                                                ->leftjoin('designations','judicial_officer_postings.designation_id','=','designations.id')
                                                                                ->leftjoin('judicial_officers','judicial_officer_postings.judicial_officer_id','=','judicial_officers.id')
                                                                                ->where('judicial_officer_id',$zonewise_officer->judicial_officer_id)
                                                                                ->orderBy('to_date','desc')
                                                                                ->get();
                        $latest_zone_posting_details = "";
                        $tenure = 0;
                        $i=0;
                        $posting_details= array(); 
                        
                        foreach($judicial_officer_posting_details as $key1=>$jo_posting_detail){
                            ++$i;                           
                            if($jo_posting_detail->zone_id == $zone){      //SAME ZONE
                                if($jo_posting_detail->to_date == null){    //CURRENT POSTING
                                    $from_date = Carbon::parse($jo_posting_detail->from_date);                   
                                    $to_date = Carbon::parse($terminal_date);                                  
                                    if($jo_posting_detail->designation_id == null){
                                        $nestedData['latest_posting'] = $i.'. '.$jo_posting_detail->deputation_designation.', '.$jo_posting_detail->deputation_posting_place;                                        
                                        $latest_zone_posting_details = '<br>'.$i.'. '. $jo_posting_detail->deputation_designation.', deputed at '.$jo_posting_detail->deputation_posting_place.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To Till Date';
                                    }
                                    else{
                                        $nestedData['latest_posting'] = $i.'. '.$jo_posting_detail->designation_name.', '.$jo_posting_detail->place_of_posting;
                                        $latest_zone_posting_details= '<br>'. $i.'. '. $jo_posting_detail->designation_name.' posted as '.$jo_posting_detail->place_of_posting.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To Till Date';
                                    }
                                }
                                else{       //PREVIOUS POSTINGS IN THE SAME ZONE 
                                    $from_date = Carbon::parse($jo_posting_detail->from_date);           
                                    if($jo_posting_detail->designation_id == null){
                                        $latest_zone_posting_details = '<br>'.$i.'. '. $jo_posting_detail->deputation_designation.', deputed at '.$jo_posting_detail->deputation_posting_place.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To '.Carbon::parse($jo_posting_detail->to_date)->format('d-m-Y');
                                    }
                                    else{
                                        $latest_zone_posting_details = '<br>'. $i.'. '. $jo_posting_detail->designation_name.' posted as '.$jo_posting_detail->place_of_posting.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To '.Carbon::parse($jo_posting_detail->to_date)->format('d-m-Y');
                                    }
                                }
                                $tenure = $to_date->diffInDays($from_date);
                                array_push($posting_details,$latest_zone_posting_details);
                            }
                            else{
                                break;
                            }
                            
                        }
                        //print_r($tenure);exit;
                        //Calculation and string creation for duration spend in a zone in Y-M-D format:start                         
                        if($tenure>=$tenure_in_days){
                            ++$counter;
                            if( $tenure >= 365){
                                $years =  floor($tenure/365);
                                $days = fmod($tenure,365);
                                if($days > 30){
                                    $months= floor($days/30);
                                    $days = fmod($days,30);

                                    $posting_period=$years." Year(s) ".$months." Month(s) ".$days." Day(s) ";
                                }
                                else{
                                    $posting_period=$years." Year(s) ".$days." Day(s) ";
                                }                                
                            }
                            else if($tenure >= 30){

                                $months = floor($tenure/30);
                                $days = fmod($tenure,30);

                                $posting_period=$months." Month(s) ".$days." Day(s) ";
                            }
                            else if($tenure > 0){

                                $posting_period=$tenure." Day(s) ";
                            }
                            else
                                $posting_period="Yet to be posted.";
                            
                            $nestedData['sl_no'] = $counter;
                            $nestedData['id'] = $jo_posting_detail->judicial_officer_id;
                            $nestedData['officer_name'] = $jo_posting_detail->officer_name.'/'.$jo_posting_detail->jo_code;
                            $str = "";
                            foreach($posting_details as $posting)
                            {
                                $str.= $posting;
                            }

                            $nestedData['current_zone_posting_details'] = $str;
                            $nestedData['duration_in_last_zone'] = $posting_period;
                            if($jo_posting_detail->posting_preference_window_flag == 'Y'){
                                $nestedData['action'] = 'Window is already open';
                            }      
                            else{
                                $nestedData['action'] = "<i class='fa fa-window-restore enable' style='color:blue;' aria-hidden='true'></i>";
                            }
                            
                            $data[] = $nestedData;
                           
                        }
                    }  
                            
                            
                }
                else{       //when terminal date and cadre is given
                    $current_postings = JudicialOfficerPosting::where([
                                                                        ["zone_id",$zone],
                                                                        ["to_date","=",null],
                                                                        ["rank_id",$cadre]
                                                                    ])
                                                                    ->orderBy('judicial_officer_id')
                                                                    ->get();    
                

                    foreach( $current_postings as $key=>$zonewise_officer){
                        $judicial_officer_posting_details = JudicialOfficerPosting::leftjoin('zones','judicial_officer_postings.zone_id','=','zones.id')
                                                                                    ->leftjoin('designations','judicial_officer_postings.designation_id','=','designations.id')
                                                                                    ->leftjoin('judicial_officers','judicial_officer_postings.judicial_officer_id','=','judicial_officers.id')
                                                                                    ->where('judicial_officer_id',$zonewise_officer->judicial_officer_id)
                                                                                    ->orderBy('to_date','desc')
                                                                                    ->get();
                        $latest_zone_posting_details = "";
                        $tenure = 0;
                        $i=0;
                        $posting_details= array(); 

                        foreach($judicial_officer_posting_details as $key1=>$jo_posting_detail){
                            ++$i;                           
                            if($jo_posting_detail->zone_id == $zone){      //SAME ZONE
                                if($jo_posting_detail->to_date == null){    //CURRENT POSTING
                                    $from_date = Carbon::parse($jo_posting_detail->from_date);                   
                                    $to_date = Carbon::parse($terminal_date);                                 
                                    if($jo_posting_detail->designation_id == null){
                                        $nestedData['latest_posting'] = $i.'. '.$jo_posting_detail->deputation_designation.', '.$jo_posting_detail->deputation_posting_place;                                        
                                        $latest_zone_posting_details = '<br>'.$i.'. '. $jo_posting_detail->deputation_designation.', deputed at '.$jo_posting_detail->deputation_posting_place.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To Till Date';
                                    }
                                    else{
                                        $nestedData['latest_posting'] = $i.'. '.$jo_posting_detail->designation_name.', '.$jo_posting_detail->place_of_posting;
                                        $latest_zone_posting_details= '<br>'. $i.'. '. $jo_posting_detail->designation_name.' posted as '.$jo_posting_detail->place_of_posting.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To Till Date';
                                    }
                                }
                                else{       //PREVIOUS POSTINGS IN THE SAME ZONE 
                                    $from_date = Carbon::parse($jo_posting_detail->from_date);           
                                    if($jo_posting_detail->designation_id == null){
                                        $latest_zone_posting_details = '<br>'.$i.'. '. $jo_posting_detail->deputation_designation.', deputed at '.$jo_posting_detail->deputation_posting_place.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To '.Carbon::parse($jo_posting_detail->to_date)->format('d-m-Y');
                                    }
                                    else{
                                        $latest_zone_posting_details = '<br>'. $i.'. '. $jo_posting_detail->designation_name.' posted as '.$jo_posting_detail->place_of_posting.' From '.Carbon::parse($jo_posting_detail->from_date)->format('d-m-Y').' To '.Carbon::parse($jo_posting_detail->to_date)->format('d-m-Y');
                                    }
                                }
                                $tenure = $to_date->diffInDays($from_date);
                                array_push($posting_details,$latest_zone_posting_details);
                            }
                            else{
                                break;
                            }


                        }

                        
                        //print_r($tenure);exit;
                        //Calculation and string creation for duration spend in a zone in Y-M-D format:start                         
                        if($tenure>=$tenure_in_days){
                            ++$counter;
                            if( $tenure >= 365){
                                $years =  floor($tenure/365);
                                $days = fmod($tenure,365);
                                if($days > 30){
                                    $months= floor($days/30);
                                    $days = fmod($days,30);

                                    $posting_period=$years." Year(s) ".$months." Month(s) ".$days." Day(s) ";
                                }
                                else{
                                    $posting_period=$years." Year(s) ".$days." Day(s) ";
                                }                                
                            }
                            else if($tenure >= 30){

                                $months = floor($tenure/30);
                                $days = fmod($tenure,30);
                                $posting_period=$months." Month(s) ".$days." Day(s) ";
                            }
                            else if($tenure > 0){

                                $posting_period=$tenure." Day(s) ";
                            }
                            else
                                $posting_period="Yet to be posted.";


                            $nestedData['sl_no'] = $counter;
                            $nestedData['id'] = $jo_posting_detail->judicial_officer_id;
                            $nestedData['officer_name'] = $jo_posting_detail->officer_name.'/'.$jo_posting_detail->jo_code;

                            $str = "";
                            foreach($posting_details as $posting)
                            {
                                $str.= $posting;
                            }

                            $nestedData['current_zone_posting_details'] = $str;
                            $nestedData['duration_in_last_zone'] = $posting_period;
                            if($jo_posting_detail->posting_preference_window_flag == 'Y'){
                                $nestedData['action'] = 'Window is already open';
                            }      
                            else{
                                $nestedData['action'] = "<i class='fa fa-window-restore enable' style='color:blue;' aria-hidden='true'></i>";
                            }

                            $data[] = $nestedData;
                            
                        }
                    }  

                }
            }
        // echo "<pre>";
        // print_r($data);exit;
       
        $content= "<p align=\"center\" style=\"font-size: 15px;font-weight: bold;\">Current Zone Posting Details of Judicial Officer</p>
                        <table width=\"100%\" style=\"border-right: 4px solid #ddd; border-left: 4px solid #ddd; border-top: 4px solid #ddd;\">
                            <thead>
                                <tr>
                                    <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd; border-bottom: 4px solid #ddd\">SL NO.</th>
                                    <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd; border-bottom: 4px solid #ddd\">JO NAME|JOCODE</th>
                                    <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd; border-bottom: 4px solid #ddd\">DURATION IN LAST ZONE</th>
                                    <th style=\"font-size: 1.17em; border-collapse:collapse; border-bottom: 4px solid #ddd\">LATEST ZONE POSTING</th>
                                   
                                </tr>
                            </thead>";
    for($i=0;  $i < sizeof($data); $i++){
        // echo $data[$i]['current_zone_posting_details']."<br/>";
        
        // // 

        $content.="<tr>                       
                            <td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-bottom: 4px solid #ddd;\">".$data[$i]['sl_no']."</td>
                            <td align=\"left\" style=\"  font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-bottom: 4px solid #ddd;\">".$data[$i]['officer_name']."</td>
                            
                            <td align=\"left\" style=\"  font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-bottom: 4px solid #ddd;\">".$data[$i]['duration_in_last_zone']."</td>";
       
        $content.= "<td align=\"left\" style=\"  font-size: 1.17em; border-collapse:collapse;border-bottom: 4px solid #ddd;\">".$data[$i]['current_zone_posting_details']."</td>";
    
        $content.="</tr>
                        </tbody>
                            ";
       
    }
     $content.="</table>";
    //exit;

        $mpdf->SetHTMLFooter('<hr>Report Generated by the IIMS - Calcutta High Court on '.Carbon::now()->format('d-m-Y').'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{PAGENO}');


        $mpdf->WriteHTML($content);
        $mpdf->Output('cuurent_zonewise_posting_details.pdf','D');
    }
}