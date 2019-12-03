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

        $jo_details = JudicialOfficer::leftJoin('religions','judicial_officers.religion_id','religions.id')
                                        ->leftJoin('categories','judicial_officers.category_id','categories.id')
                                        ->join('states','judicial_officers.home_state_id','states.id')
                                        ->join('districts','judicial_officers.home_district_id','districts.id')
                                        ->where('registration_no',$request->registration_no)
                                        ->select('judicial_officers.*','states.state_name',
                                        'categories.category_name','districts.district_name', 'religions.religion_name')
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
            
        // Category
        if($jo_details['0']->category_name!=null)
            $category = $jo_details['0']->category_name;
        else
            $category = '<i style="font-weight:normal;">Not Available</i>';

        
        // Religion
        if($jo_details['0']->religion_name!=null)
            $religion = $jo_details['0']->religion_name;
        else
            $religion = '<i style="font-weight:normal;">Not Available</i>';

        // Identification Mark
        if($jo_details['0']->identification_mark!=null)
            $identification_mark = $jo_details['0']->identification_mark;
        else
            $identification_mark = '<i style="font-weight:normal;">Not Available</i>';

        // Blood Group
        if($jo_details['0']->blood_group!=null)
            $blood_group = $jo_details['0']->blood_group;
        else
            $blood_group = '<i style="font-weight:normal;">Not Available</i>';

        // Aadhaar
        if($jo_details['0']->aadhaar_no!=null)
            $aadhaar_no = $jo_details['0']->aadhaar_no;
        else
            $aadhaar_no = '<i style="font-weight:normal;">Not Available</i>';

        // PAN
        if($jo_details['0']->pan_no!=null)
            $pan_no = $jo_details['0']->pan_no;
        else
            $pan_no = '<i style="font-weight:normal;">Not Available</i>';

        // GPF
        if($jo_details['0']->gpf_no!=null)
            $gpf_no = $jo_details['0']->gpf_no;
        else
            $gpf_no = '<i style="font-weight:normal;">Not Available</i>';

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
                    <tr>                            
                        <td align=left style=\"padding-top: 7%;\"><h2>Basic Details</h2></td>
                    </tr>
                    <tr>
                        <td colspan='6'><hr/></td>
                    </tr>
                    <tr>
                        <td style=\"padding-top: 1%;\"><h3>Gender: ".$gender."</h3></td>
                    
                        <td align=left><h3>Category: ".$category."</h3></td>

                        <td align=left><h3>Aadhar No: ".$aadhaar_no."</h3></td>
                    </tr>
                    <tr>
                        <td style=\"padding-top: 1%;\"><h3>Date of Birth: ".Carbon::parse($jo_details['0']->date_of_birth)->format('d-m-Y')."</h3></td>

                        <td align=left><h3>Religion: ".$religion."</h3></td>

                        <td align=left><h3>PAN No: ".$pan_no."</h3></td>
                    </tr>
                    <tr>
                        <td style=\"padding-top: 1%;\"><h3>Guardian's Name: ".$jo_details['0']->guardian_name." ( ".$jo_details['0']->gurdian_relation." )</h3></td>

                        <td align=left><h3>Blood Group: ".$blood_group."</h3></td>

                        <td align=left><h3>GPF A/C No: ".$gpf_no."</h3></td>
                    </tr>
                    <tr>                            
                        <td align=left style=\"padding-top: 7%;\"><h2>Qualification Details</h2></td>
                    </tr>
                    <tr>
                        <td colspan='6'><hr/></td>
                    </tr>               
                ";
      
        $jo_qualifications = JudicialOfficerQualification::join('qualifications','judicial_officer_qualifications.qualification_id','qualifications.id')                    
                                                        ->where('judicial_officer_id',$jo_details['0']->id)
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

       $content.="<tr>                            
                    <td align=left style=\"padding-top: 7%;\"><h2>Place of Practice</h2></td>
                </tr>
                <tr>
                    <td colspan='6'><hr/></td>
                </tr>";

                $jo_legal_practices = JoLegalExperience::join('subdivisions','jo_legal_experiences.subdivision_id','subdivisions.id')                    
                                                        ->where('judicial_officer_id',$jo_details['0']->id)
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
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">Designation</th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">Posting Mode</th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">Place of Posting</th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;\">From Date</th>
                            <th style=\"font-size: 1.17em; border-collapse:collapse;\">To Date</th>
                        </tr>
                    </thead>
                    <tbody>";

        $jo_postings = JudicialOfficerPosting::join('designations','judicial_officer_postings.designation_id','designations.id')
                                                ->join('modes','judicial_officer_postings.mode_id','modes.id')
                                                ->join('courts','judicial_officer_postings.court_id','courts.id')
                                                ->orderBy('from_date','asc')
                                                ->get();

        foreach($jo_postings as $key => $jo_posting){
            if($jo_posting->to_date==null)
                $to_date = "Till Date";
            else
                $to_date = Carbon::parse($jo_posting->to_date)->format('d-m-Y');

            $content.="<tr>
                        <td align=\"center\" style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            ++$key.  
                        "</td>
                        <td align=\"center\" style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            $jo_posting->designation_name.  
                        "</td>
                        <td align=\"center\" style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            $jo_posting->posting_mode.  
                        "</td>
                        <td align=\"center\" style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            $jo_posting->court_name.  
                        "</td>
                        <td align=\"center\" style=\"font-size: 1.17em; border-collapse:collapse; border-right: 4px solid #ddd;border-top: 4px solid #ddd;\">".
                            Carbon::parse($jo_posting->from_date)->format('d-m-Y').  
                        "</td>
                        <td align=\"center\" style=\"font-size: 1.17em; border-collapse:collapse; border-top: 4px solid #ddd;\">".
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
