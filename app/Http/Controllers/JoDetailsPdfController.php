<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\JudicialOfficer;
use App\JudicialOfficerQualification;
use App\JoLegalExperience;
use App\JudicialOfficerPosting;
use App\JoReporting;
use App\JoZoneTenure;
use App\State;
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
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">Designation</th>
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

            $content.="<tr>
                        <td align=\"left\" style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            ++$key.  
                        "</td>
                        <td align=\"left\" style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            $jo_posting->posting_mode.  
                        "</td>
                        <td align=\"left\" style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            $jo_posting->designation_name.  
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
}
