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

        // Mobile No. 2
        if($jo_details['0']->mobile_no_2!=null)
            $mobile_no_2 = "| ".$jo_details['0']->mobile_no_2;
        else
            $mobile_no_2 = '';

        // Email ID 2
        if($jo_details['0']->email_id_2!=null)
            $email_id_2 = "| ".$jo_details['0']->email_id_2;
        else
            $email_id_2 = '';
        
        
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
                    
                        <td align=left style=\"padding-left: 8%;\"><h3>Email ID: ".$jo_details['0']->email_id_1." ".$email_id_2."</h3></td>
                    </tr>
                    <tr>
                        <td style=\"padding-top: 1%;\"><h3>Present Address: ".$jo_details['0']->present_address."</h3></td>
                    
                        <td align=left style=\"padding-left: 8%;\"><h3>Contact No: ".$jo_details['0']->mobile_no_1." ".$mobile_no_2."</h3></td>
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
                        <td style=\"padding-top: 1%;\"><h3>Recruitment Batch: </h3><h3>".$jo_details['0']->recruitment_batch_desc."</h3></td>
                        <td style=\"padding-top: 1%;\"><h3>Recruitment Batch Year: </h3><h3>".$jo_details['0']->recruitment_batch_year."</h3></td>
                    </tr>
                    <tr>
                        <td style=\"padding-top: 1%;\"><h3>Date of Birth: </h3><h3>".Carbon::parse($jo_details['0']->date_of_birth)->format('d-m-Y')."</h3></td>
                        <td style=\"padding-top: 1%;\"><h3>Date of Joining: </h3><h3>".Carbon::parse($jo_details['0']->date_of_joining)->format('d-m-Y')."</h3></td>
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

       $content.= "<tr>                            
                        <td align=left style=\"padding-top: 7%;\"><h2>Posting Details</h2></td>
                    </tr>
                    <tr>
                        <td colspan='6'><hr/></td>
                    </tr>
                </table>
                
                <table width=\"100%\" style=\"border: 4px solid #ddd;\">
                    <thead>
                        <tr>
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">Sl No.</th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">Posting Mode</th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">Posted As</th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">From Date</th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse;\">To Date</th>
                        </tr>
                    </thead>
                    <tbody>";

        $jo_postings = JudicialOfficerPosting::leftJoin('designations','judicial_officer_postings.designation_id','designations.id')
                                                ->join('modes','judicial_officer_postings.mode_id','modes.id')
                                                ->where('judicial_officer_id',$jo_details['0']->id)
                                                ->orderBy('from_date','asc')
                                                ->get();

        foreach($jo_postings as $key => $jo_posting){
            if($jo_posting->to_date==null)
                $to_date = "Till Date";
            else
                $to_date = Carbon::parse($jo_posting->to_date)->format('d-m-Y');

            if($jo_posting->designation_id !=null){
                $posted_as = $jo_posting->designation_name;
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
                            Carbon::parse($jo_posting->from_date)->format('d-m-Y').  
                        "</td>
                        <td align=\"left\" style=\"font-size: 1.17em; border-collapse:collapse; border-top: 4px solid #ddd;\">".
                            $to_date. 
                        "</td>
                    </tr>";
        }

        $content.="</tbody></table>";

        $mpdf->SetHTMLFooter('Report Generated by the IIMS - Calcutta High Court on '.Carbon::now());

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

    

    public function download_posting_preferences(){

        $mpdf = new \Mpdf\Mpdf(['format' => 'Legal']);

        $mpdf = new \Mpdf\Mpdf(['orientation' => 'L']);

        $judicial_officer_details['display_pref_for_jo'] = JudicialOfficer:: where('posting_preference_window_flag','=','Y')
                                                                            ->select('id','officer_name','jo_code','hometown','home_state_id','registration_no','profile_image')
                                                                            ->get();

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
                    $judicial_officer_details['posted_as'][$key]['0']['designation_name']="<strong>Currently Posted as</strong> ".$judicial_officer_details['posted_as'][$key]['0']['designation_name']." From ". Carbon::parse($judicial_officer_details['posted_as'][$key]['0']['from_date'])->format('d-m-Y')." And ".$judicial_officer_details['posted_as'][$key]['0']['additional_designation'];

                }
                else{
                    $judicial_officer_details['posted_as'][$key]['0']['designation_name']="<strong>Currently Posted as</strong> ".$judicial_officer_details['posted_as'][$key]['0']['designation_name']." From ". Carbon::parse($judicial_officer_details['posted_as'][$key]['0']['from_date'])->format('d-m-Y');

                } 

                // Posting details
                $str ="";

                foreach($zones as $key4=>$zone){
                    $judicial_officer_details['posting_details'][$key][$key4]=  JudicialOfficerPosting ::leftjoin('designations','judicial_officer_postings.designation_id','designations.id')
                                                        ->leftjoin('zones','judicial_officer_postings.zone_id','=','zones.id')                                                                                      
                                                        ->where([
                                                            ['judicial_officer_postings.judicial_officer_id','=',$station_pref->id],
                                                            ['judicial_officer_postings.zone_id','=',$zone->id]
                                                        ])
                                                        ->orderBy('judicial_officer_postings.from_date','ASC')
                                                        ->select('judicial_officer_postings.judicial_officer_id','designations.designation_name', 'judicial_officer_postings.additional_designation',
                                                                'judicial_officer_postings.deputation_designation','judicial_officer_postings.deputation_posting_place',
                                                                'judicial_officer_postings.from_date','judicial_officer_postings.to_date','zones.zone_name')
                                                        ->get();
                    if($key4==0)
                         $str.= "<strong>Zone ".$zone->zone_name." :</strong> ";
                    else
                        $str.= "<br><br>\n\n<strong>Zone ".$zone->zone_name." :</strong> ";


                    if(sizeof($judicial_officer_details['posting_details'][$key][$key4])>0){

                        foreach($judicial_officer_details['posting_details'][$key][$key4] as $key5=>$posting){
                            $str.= "<br>\n";
                            if($posting['to_date'] != null)
                                $posting['to_date'] = Carbon::parse($posting['to_date'])->format('d-m-Y');
                            else
                                $posting['to_date'] = "Till Date";

                                $posting['from_date'] = Carbon::parse($posting['from_date'])->format('d-m-Y');  

                            if($posting['designation_name']==null){
                                $str.= ($key5+1).". Deputed as ".$posting['deputation_designation']. "At ".$posting['deputation_posting_place']." From ".$posting['from_date']." To ".$posting['to_date'];
                            }
                            else if( $posting['additional_designation'] !=null){
                                $str.= ($key5+1).". Posted as ".$posting['designation_name']." From ".$posting['from_date']." To ".$posting['to_date']." And ".$posting['additional_designation'];
                            }
                            else{
                                $str.= ($key5+1).". Posted as ".$posting['designation_name']." From ".$posting['from_date']." To ".$posting['to_date'];
                            }
                        }
                    }
                    else{
                        $str.= "<br>\nYet To Be Posted in this zone ";
                    }

                    $diff_days = 0;
                    $zone_tenures = JoZoneTenure::where([ 
                                                            ['judicial_officer_id','=',$station_pref->id],
                                                            ['zone_id','=',$zone->id]
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
                            $tenure=$years." Y ".$months." M ".$days." D ";
                        }
                        else{
                            $tenure=$years." Y ".$days." D ";
                        }                                
                    }
                    else if($diff_days >= 30){

                        $months = floor($diff_days,12);
                        $days = fmod($diff_days,12);
                        $tenure=$months." M ".$days." D ";
                    }
                    else if($diff_days > 0){
                        $tenure=$diff_days." D ";
                    }
                    else
                        $tenure="Yet to be posted.";

                    $str1.="<br>\n Zone ".$zone->zone_name." : ".$tenure;
                    //Calculation and string creation for duration spend in a zone in Y-M-D format:end
                    $judicial_officer_details['zone_tenure'][$key][$key4]=$str1;

                }    
                $judicial_officer_details['posted_as'][$key]['0']['designation_name'].="<br><br>\n\n".$str;       

                // $str.= "<br>\n";
                $judicial_officer_details['home_state'][$key] = JudicialOfficer::join('states','judicial_officers.home_state_id','=','states.id')  
                                                                                ->where('judicial_officers.home_state_id','=',$station_pref->home_state_id)  
                                                                                ->select('state_name')->get();

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
                            $judicial_officer_details['spouse_details'][$key]['0']['designation_name']="Posted as ".$judicial_officer_details['spouse_details'][$key]['0']['designation_name']." From ". Carbon::parse($judicial_officer_details['posted_as'][$key]['0']['from_date'])->format('d-m-Y')." And ".$judicial_officer_details['spouse_details'][$key]['0']['additional_designation'];
                        }
                        else{
                            $judicial_officer_details['spouse_details'][$key]['0']['designation_name']="Posted as ".$judicial_officer_details['spouse_details'][$key]['0']['designation_name']." From ". Carbon::parse($judicial_officer_details['spouse_details'][$key]['0']['from_date'])->format('d-m-Y');
                        }
                    }
                }

            }

        }

        $content= "<table width=\"100%\" cellspacing=\"1\" cellpadding=\"2\" align=\"center\" border=\"0\">
                        <tr>                            
                            <td align=center style=\"padding-top: 7%;\"><h2>Posting Preference of Judicial Officers</h2></td>
                        </tr>
                        <tr>
                            <td><br></td>
                        </tr>
                    </table>
                    <table width=\"100%\" style=\"border: 4px solid #ddd;\">
                        <thead>
                            <tr>
                                <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">Sl No.</th>
                                <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">JO NAME</th>
                                <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">POSTED AS</th>
                                <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">STATION PREFERENCE</th>
                                <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">PREFERENCE REMARK</th>
                                <th style=\"font-size: 1.17em; border-collapse:collapse;\">OTHER INFO.</th>
                            </tr>
                        </thead>
                        <tbody>";

                
        for($i=0;  $i < sizeof($judicial_officer_details['display_pref_for_jo']); $i++){
            $content.="<tr>
                        <td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".($i+1)."</td>
                        <td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".$judicial_officer_details['display_pref_for_jo'][$i]['officer_name']."</td>
                        <td align=\"left\" style=\"  font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".$judicial_officer_details['posted_as'][$i]['0']['designation_name']."</td>";

            
            $content.="<td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">";
            if(sizeof($judicial_officer_details['preference_details'][$i]) > 0){
                for($j=0; $j<sizeof($judicial_officer_details['preference_details'][$i]); $j++)
                {   
                    $content.=($j+1).$judicial_officer_details['preference_details'][$i][$j]['station_name']."<br>";                      
                }
            }
            else{
                $content.="Station preference not yet given";
            }
            
            $content.="</td>";

            
            if(sizeof($judicial_officer_details['preference_details'][$i]) > 0)
                $content.="<td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".$judicial_officer_details['preference_details'][$i]['0']['remarks']."</td>";                    
            else                              
                $content.="<td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\"></td>";

            
            $content.="<td align=\"left\" style=\" width:auto; font-size: 1.17em; border-collapse:collapse; border-top: 4px solid #ddd;\"><strong>Zone-wise Posting history</strong>";
            for($j=0; $j<sizeof($judicial_officer_details['zone_tenure'][$i]); $j++){
                $content.=$judicial_officer_details['zone_tenure'][$i][$j];
            }
           
            $content.= "<br><br><strong>Hometown</strong> : ".$judicial_officer_details['display_pref_for_jo'][$i]['hometown'].", ".$judicial_officer_details['home_state']['0'][$i]['state_name'] ;
           
            if(sizeof($judicial_officer_details['practice_subdivision'][$i])>0){
                $content.="<br><br><strong>Place of Practice :</strong><br>";                
                for($j=0; $j < sizeof($judicial_officer_details['practice_subdivision'][$i]); $j++){
                    $content.=($j+1).". ".$judicial_officer_details['practice_subdivision'][$i][$j]['subdivision_name']."<br>";
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

            $content.="</td></tr>"; 
         }


        $content.="</tbody></table>";

        $mpdf->SetHTMLFooter('Report Generated by the IIMS - Calcutta High Court on '.Carbon::now());

        $mpdf->WriteHTML($content);
        $mpdf->Output('jo_posting_pref.pdf','D');
                
    }
}