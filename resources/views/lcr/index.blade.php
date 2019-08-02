<?php

use App\Http\Controllers\PageController;
?>
@extends('layouts.app')
{{--@include('services.display_board.display_board_block')--}}
<?php
$calendar_display = "month";
?>



@section('title', 'Lower Court Records')

@section('page_heading')
Lower Court Records
@endsection



@section('left_main_content')
<div class="panel custom-panel">
    <div class="col-sm-12">
        <div id="info-panel" class="panel panel-default">
            <!-- IIIIIIIIIII -->
            <div id="info-panel-heading" class="panel-heading">REQUEST LOWER COURT RECORD</div>
            <!-- IIIIIIIIIII -->
            <div class="panel-body">

                <!-- Lower Court Request Form -->
                <div id="lcr-form" class="form-horizontal">
                    {{ csrf_field() }}
                    <div class="col-md-12">Court Selection</div>
                    <div id="court_selection" class="form-group our-form-group">
                        <div class="col-md-4">
                            <select id="dist_name" type="text" class="form-control info-form-control" name="dist_name"> 
                                <option value="">Select District</option>
                                <option value="303">24 PARAGANAS NORTH</option>
                                <!-- <option value="304">24 PARAGANAS SOUTH</option> 
                                <option value="664">ALIPURDUAR</option> 
                                <option value="305">BANKURA</option> 
                                <option value="307">BIRBHUM</option> 
                                <option value="308">COOCHBEHAR</option> 
                                <option value="309">DARJEELING</option> 
                                <option value="310">DINAJPUR DAKSHIN</option> 
                                <option value="311">DINAJPUR UTTAR</option> 
                                <option value="312">HOOGHLY</option> 
                                <option value="313">HOWRAH</option> 
                                <option value="314">JALPAIGURI</option> 
                                <option value="703">JHARGRAM</option> 
                                <option value="702">KALIMPONG</option> 
                                <option value="315">KOLKATA</option> 
                                <option value="316">MALDAH</option> 
                                <option value="317">MEDINIPUR EAST</option> 
                                <option value="318">MEDINIPUR WEST</option> 
                                <option value="319">MURSHIDABAD</option> 
                                <option value="320">NADIA</option> 
                                <option value="704">PASCHIM BARDHAMAN</option>
                                <option value="306">PURBA BARDHAMAN</option>
                                <option value="321">PURULIA</option>
                                -->
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select id="courtcomplex" type="text" class="form-control info-form-control" name="courtcomplex"> 
                                <option value="">Court Complex</option>
                                <option value="1">BARRACKPUR COURT COMPLEX</option>
                                <option value="2">BASIRHAT COURT COMPLEX</option>
                                <option value="3">BIDHANAGAR COURT COMPLEX</option>
                                <option value="4">BONGAO COURT COMPLEX</option>
                                <option value="5">JUVENILE COURT COMPLEX SALT LAKE</option>
                                <option value="6">BARASAT DISTRICT COURT COMPLEX</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select id="lowercourt" type="text" class="form-control info-form-control" name="lowercourt"> 
                                <option value="">Select Court</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">High Court Case Records</div>
                    <div id="hc_case_selection" class="form-group our-form-group">
                        <div class="col-md-4">
                            <select id="hc_case_type" type="text" class="form-control info-form-control" name="hc_case_type"> 
                                <option value="">Select Case Type</option>
                                <option value="AA" >AA | ARBRITATION APPL.</option>
                                <option value="ABWA" >ABWA | APPL.UND.BENGAL WAKFS ACT</option>
                                <option value="AC" >AC | AWARD CASES</option>
                                <option value="ACA" >ACA | APPL.UNDER CHARTERED ACCOUNTANTS ACT, 1949</option>
                                <option value="ACO" >ACO | PETITION IN COMPANY APPEAL</option>
                                <option value="ACR" >ACR | APPL.UND.CHARITABLE &amp; RELIGIOUS TRUST ACT</option>
                                <option value="ACRP" >ACRP | APPL.UND.SEC.151 OF THE CR.P.C.</option>
                                <option value="ACWA" >ACWA | APPL.UND.SEC 21 COST&amp;WORKS ACCOUNTACTS ACT, 1959</option>
                                <option value="AED" >AED | APPL. U/S. 64 OF ESTATE DUTY ACT, 1953</option>
                                <option value="AET" >AET | APPL. U/S 25 OF EXPENDITURE TAX ACT, 1957</option>
                                <option value="AFP" >AFP | APPL.FOR LEAVE TO SUE AS AN INDIGENT PERSON</option>
                                <option value="AGA" >AGA | APPL.UND.SEC.25 OF ADMINISTRATOR GENERALS&#039; ACT</option>
                                <option value="AGL" >AGL | APPL.FOR APPOINTMENT OF GUARDIAN-AD-LITEM</option>
                                <option value="AGT" >AGT | APPL. U/S 26 GIFT TAX ACT, 1958</option>
                                <option value="AGWA" >AGWA | APPL.UND.GUARDIANS &amp; WARDS ACT</option>
                                <option value="AHC" >AHC | HABEAS CORPUS</option>
                                <option value="AID" >AID | APPL. UNDER PATENTS &amp; DESIGNS ACT, 1970</option>
                                <option value="AIDR" >AIDR | APPL.UND.INDUSTRIAL DEVELOPMENT REGULATION ACT</option>
                                <option value="AIFC" >AIFC | APPL.UND.INDUSTRIAL FINANCE CORP. ACT</option>
                                <option value="AIRB" >AIRB | APPN.RECON.BANK OF I</option>
                                <option value="ALP" >ALP | APPL.UND.CLAUSE 13 OF LETTERS PATENT</option>
                                <option value="ALPII" >ALPII | APPL.UND.CLAUSE 17 L</option>
                                <option value="ALPITL" >ALPITL | APPL.CLAUSE-17 LP</option>
                                <option value="ALP.ITL" >ALP.ITL | APPL. UNDER CLAUSE 17 OF THE LETTERS PATENT</option>
                                <option value="AOR" >AOR | CALCUTTA OFFICIAL RECEIVER&#039;S ACT 1938</option>
                                <option value="AORC" >AORC | APPLICATION OMNIBUS RESIDUARY CLASS</option>
                                <option value="AOT" >AOT | APPL.UND.OFFICIAL TRUSTEES ACT</option>
                                <option value="AP" >AP | ARBITRATION PETITION</option>
                                <option value="APD" >APD | APPEAL FROM DECREE</option>
                                <option value="APDT" >APDT | APP. FR. DECR. TEND.</option>
                                <option value="APO" >APO | APPEAL FROM ORDER</option>
                                <option value="APOT" >APOT | TEMP APO</option>
                                <option value="AS" >AS | ADMIRALITY  SUITS</option>
                                <option value="ASCI" >ASCI | APPL.FOR LEAVE TO APPEAL TO THE SUPREME COURT OF INDIA</option>
                                <option value="ASFC" >ASFC | APPL.UND.STAE FINANCIAL CORP. ACT</option>
                                <option value="ASM" >ASM | APPL.SANCHAITA MATTERS</option>
                                <option value="AST" >AST | TEMPORARY NUMBER</option>
                                <option value="ASTA" >ASTA | APPELLATE SIDE TENDER APPLICATION</option>
                                <option value="ATA" >ATA | APPL.UNDER TRUST ACT</option>
                                <option value="ATM" >ATM | APPL.UND.TRADE&amp;MERCHANDISE MARKS, ACT</option>
                                <option value="AUDA" >AUDA | APPL.UND.UNCLAIMED DEPOSITS ACT</option>
                                <option value="AWT" >AWT | APPL. U/S 27 OF WEALTH TAX ACT, 1957</option>
                                <option value="BBA" >BBA | APPL.UND.BANKERS BOOKS EVIDENCE ACT, 1891</option>
                                <option value="BIFR" >BIFR | BIFR</option>
                                <option value="CA" >CA | COMPANY APPLICATION</option>
                                <option value="CAA" >CAA | COMMISSIONER OF PATENT APPEAL</option>
                                <option value="CAN" >CAN | CIVIL APPLICATION</option>
                                <option value="CC" >CC | CONTEMPT OF COURT CASES</option>
                                <option value="CCGAT" >CCGAT | CUSTOMS/EXC/GOLD227</option>
                                <option value="CEXA" >CEXA | APPL.UND.CENTRAL EXCISE ACT</option>
                                <option value="CHS" >CHS | CHAMBER SUMMONS</option>
                                <option value="CO" >CO | CIVIL ORDER/MISC.CAS</option>
                                <option value="CO.CT" >CO.CT | CO(CENTRAL ADMIN TRI</option>
                                <option value="COLRT" >COLRT | WB LAND RE&amp;TEN.227</option>
                                <option value="CO.ST" >CO.ST | CO(STATE ADMIN TRIBN</option>
                                <option value="COT" >COT | CROSS OBJECTION APPE</option>
                                <option value="CO.TT" >CO.TT | CO(W.B. TAX TRIBUNAL</option>
                                <option value="CP" >CP | COMPANY PETITIONS</option>
                                <option value="CPA" >CPA | COMMISSIONER OF PATE</option>
                                <option value="CPAN" >CPAN | CONTEMPT APPLICATION</option>
                                <option value="CR" >CR | CIVIL REVISION</option>
                                <option value="CRA" >CRA | CRIMINAL APPEAL &lt;or&gt; COPYRIGHT APPEAL</option>
                                <option value="CRAN" >CRAN | CRIMINAL APPLICATION</option>
                                <option value="CRC" >CRC | CIVIL REVI. CONTEMPT</option>
                                <option value="CRCC" >CRCC | CRIMINAL CONTEMPT</option>
                                <option value="CRLCP" >CRLCP | CRIMINAL(CONTEMPT)</option>
                                <option value="CRM" >CRM | CRIMINAL MISC. CASE(BAIL APPLICATION)</option>
                                <option value="CRMSPL" >CRMSPL | CRIMINAL MISC. CASE(SPL. LEAVE PETITION)</option>
                                <option value="CRR" >CRR | CRIMINAL REVISION</option>
                                <option value="CS" >CS | CIVIL SUITS</option>
                                <option value="CS(O)" >CS(O) | CIVIL SUIT(OLD)</option>
                                <option value="CSOS" >CSOS | CIVIL SUIT ORIGINATING SUMMONS</option>
                                <option value="CUSTA" >CUSTA | APPL.UND.CUSTOMS ACT</option>
                                <option value="DM" >DM | UND.CHAPTER V OF O.S. RULES</option>
                                <option value="DR" >DR | DEATH REFERENCE</option>
                                <option value="DVW" >DVW | PROTECTION OF WOMEN AGAINST DOMESTIC VIOLENCE ACT, 2005</option>
                                <option value="EC" >EC | EXECUTION CASES</option>
                                <option value="EOPLA" >EOPLA | EXTRA ORDINARY PROBATE PROCEEDINGS</option>
                                <option value="EOS" >EOS | EXTRA ORDINARY SUITS</option>
                                <option value="EP" >EP | ELEC.PET.(PEOPLES REPRESENTATION ACT, 1951)</option>
                                <option value="FA" >FA | CIVIL FIRST APPEAL</option>
                                <option value="FAT" >FAT | TENDER FIRST APPEAL</option>
                                <option value="FCA" >FCA | FAMILY COURT APPEAL</option>
                                <option value="FEA" >FEA | FOREIGN EXCHANGE APPEAL</option>
                                <option value="FERA" >FERA | APPL.UND.FOREIGN EXCHANGE REGULATION ACT</option>
                                <option value="FMA" >FMA | C. APPEAL FROM ORDER</option>
                                <option value="FMAT" >FMAT | ADMS. C. APPL ORDER</option>
                                <option value="GA" >GA | GOVT. APPEAL &lt;or&gt; GENERAL APPLICATION</option>
                                <option value="GCAL" >GCAL | APPL.UND.GOLD CONTROL ACT</option>
                                <option value="IC" >IC | INSOLVENCY CASES</option>
                                <option value="ICA" >ICA | APPL.UNDER INDIAN COMPANIES ACT, 1913</option>
                                <option value="IP" >IP | IT.PET.256(2)IT&#039;61</option>
                                <option value="IRD" >IRD | TEMP D</option>
                                <option value="IRE" >IRE | TEMP E</option>
                                <option value="IRH" >IRH | TEMP H</option>
                                <option value="ITA" >ITA | INCOME TAX APPEAL</option>
                                <option value="ITAT" >ITAT | INCOME TAX APPEAL TENDERED</option>
                                <option value="ITP" >ITP | INCOME TAX PET.(U/S. 256 (2) OF I.T. ACT, 1961)</option>
                                <option value="ITR" >ITR | INCOMETAX REF.SEC.256 (1) OF I.T. ACT, 1961</option>
                                <option value="LM" >LM | LUNATIC MATTERS</option>
                                <option value="LPA" >LPA | LETTERS PATENT APPEAL</option>
                                <option value="MA" >MA | MANDAMUS APPEAL</option>
                                <option value="MAT" >MAT | TENDER OF MAND APPL</option>
                                <option value="MM" >MM | MISFEAOUCE MATTERS</option>
                                <option value="MS" >MS | MATRIMONIAL SUITS</option>
                                <option value="NM" >NM | NOTICE OF MOTION</option>
                                <option value="OCO" >OCO | ORIGINAL SIDE CROSS OBJECTION</option>
                                <option value="OCOT" >OCOT | ORIGINAL SIDE CROSS OBJECTION TENDER</option>
                                <option value="OTS" >OTS | ORDINANCE TRANSFER SUITS</option>
                                <option value="PLA" >PLA | APPL.FOR PROBATE &amp; LETTERS OF ADMINISTRATION</option>
                                <option value="PLR" >PLR | UND.CHPT.XXXI-A OF O.S. RULES</option>
                                <option value="PMS" >PMS | PARSI MATRIMONIAL SUITS</option>
                                <option value="REF" >REF | REFERENCE CASE</option>
                                <option value="RVW" >RVW | REVIEW</option>
                                <option value="RVWO" >RVWO | MEMORANDUM OF REVIEWS</option>
                                <option value="SA" >SA | CIVIL SECOND APPEAL</option>
                                <option value="SALT" >SALT | APPL.UND.SALT ACT</option>
                                <option value="SANA" >SANA | SANCHAITA APPEAL</option>
                                <option value="SAT" >SAT | TNDER SECOND APPEAL</option>
                                <option value="SCO" >SCO | SPECIAL CASE FOR OPINION OF COURT</option>
                                <option value="SESS" >SESS | SESSIONS CASES</option>
                                <option value="SMA" >SMA | SECOND MISC APPEAL</option>
                                <option value="SMAT" >SMAT | SEC.MISC.APPEAL TEND</option>
                                <option value="SRC" >SRC | SPECIAL REFERENCE CASE(C)</option>
                                <option value="SRCR" >SRCR | SPECIAL REFERENCE CASE(CR)</option>
                                <option value="SS" >SS | SPECIAL SUITS(SEC 20 OF THE ARBITRATION ACT, 1940</option>
                                <option value="T" >T | TENDER NUMBER &lt;or&gt; TEMP A(1)</option>
                                <option value="TA" >TA | APPLICATION TENDER</option>
                                <option value="TBCS" >TBCS | TRANSFERRED BANKING COMPANIES SUITS</option>
                                <option value="TCS" >TCS | TRANSFERRED COMPANY SUITS</option>
                                <option value="TMA" >TMA | TRADE MARK APPEAL</option>
                                <option value="TS" >TS | TESTAMENTERY SUITS</option>
                                <option value="TUA" >TUA | TRADE UNION APPEAL</option>
                                <option value="WCGAT" >WCGAT | CUSTOMS/EXC/GOLD226</option>
                                <option value="WP" >WP | WRIT PETITION</option>
                                <option value="WPCR" >WPCR | WRIT PETITION(CIVIL RULE)</option>
                                <option value="WPCRC" >WPCRC | WP CIVIL RULE CONT.</option>
                                <option value="WP.CT" >WP.CT | WP(CENTRAL ADMIN TRIBUNAL)</option>
                                <option value="WPDRT" >WPDRT | DEBT APPL. TRIBUNAL</option>
                                <option value="WPLRT" >WPLRT | WB LAND RE&amp;TEN.226</option>
                                <option value="WP.ST" >WP.ST | WP(STATE ADMIN TRIBUNAL)</option>
                                <option value="WP.TT" >WP.TT | WP(WB TAX TRIBUNAL)</option>
                                <option value="WP.WT" >WP.WT | WAKF TRIBUNAL (227)</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <input id="caseno" type="text" class="form-control info-form-control" name="caseno" placeholder="Enter Case No.">
                        </div>
                        <div class="col-md-4">
                            <select id="year" type="text" class="form-control info-form-control" name="year"> 
                                <option value="">Select Year</option>
                                @for($year=date('Y');$year>=1900;$year--){
                                "<option value='{{$year}}'>{{$year}}</option>
                                }
                                @endfor
                            </select>
                        </div>
                    </div>


                    <div class="col-md-12">Lower Court Case Records</div>
                    <div id="lower_case_selection" class="form-group our-form-group col-md-10" style="float:left;">
                        <div class="col-md-4" style="margin-bottom:10px;">
                            <select id="lc_case_type" type="text" class="form-control info-form-control" name="lc_case_tye"> 
                                <option value="">Select Case Type</option>
                                <option value="52">Act 39</option><option value="1">Act Viii Miscellaneous Case</option><option value="51">Act Xiv</option><option value="58">Bail</option><option value="59">CEX - Excise Case</option><option value="3">Civil Appeal</option><option value="4">Civil Execution</option><option value="5">Civil Misc</option><option value="6">Civil Revision</option><option value="7">Complaint Case</option><option value="55">C R Case</option><option value="8">Criminal Appeal</option><option value="9">Criminal Case</option><option value="11">Criminal Misc Case</option><option value="12">Criminal Revision</option><option value="10">Crl. Execution - Criminal Execution</option><option value="23">Divorce On Mutual Consent - Matri Suit Divorce Mutual Cons</option><option value="13">Electricity Act</option><option value="14">Estate Acquisition Appeal</option><option value="16">Gr Case</option><option value="17">Hindu Adapt. and Maint Act - Hindu Adapt. and Maint Case</option><option value="18">Insolvancy Petition</option><option value="19">L A C - Land Acquisition Cases</option><option value="20">L A Ex. - Land Acquisition Execution</option><option value="53">L A Suit</option><option value="21">M A C C - M.A.C.C</option><option value="22">M A C C Ex. - MACC Execution</option><option value="36">Maintenance Case - MR case for Maintenance</option><option value="24">Matrimonial Suit</option><option value="25">Mc - Misc Case</option><option value="54">M C Case</option><option value="29">Misc. Appeal</option><option value="26">Misc Case (pre-emption)</option><option value="30">Misc. Criminal Revision</option><option value="27">Misc Crl Case - Misc Criminal Case</option><option value="31">Misc. Execution Case</option><option value="57">Misc Petition (156) - Misc Petition</option><option value="28">Mjc - Misc Judicial Case</option><option value="32">Money Appeal</option><option value="33">Money Execution</option><option value="34">Money Suit</option><option value="35">M V Act - Motor Vehicle Case</option><option value="37">N D P S Case - NDPS Case</option><option value="38">NGR Case</option><option value="39">Other Appeal</option><option value="40">Other Suit</option><option value="41">Probate Suit</option><option value="15">S C C Ex. - Execution</option><option value="42">S C C Suit - SCC SUIT</option><option value="43">Sessions Case</option><option value="44">Sessions Trial</option><option value="45">Special Court Cases</option><option value="46">Succession Case</option><option value="47">Title Appeal</option><option value="48">Title Execution</option><option value="49">Title Suit</option><option value="50">Trust Suit</option>
                            </select>
                        </div>

                        <div class="col-md-4" style="margin-bottom:10px;">
                            <input id="lccaseno" type="text" class="form-control info-form-control" name="lccaseno" 
                                   placeholder="Enter Case No.">
                        </div>
                        <div class="col-md-4" style="margin-bottom:10px;">
                            <select id="lccaseyear" type="text" class="form-control info-form-control" name="lccaseyear"> 
                                <option value="">Select Year</option>
                                @for($year=date('Y');$year>=1900;$year--){
                                <option value='{{$year}}'>{{$year}}</option>
                                }
                                @endfor
                            </select>
                        </div>
                    </div><!-- lower_case_section ends -->
					<div class="col-md-2">
						<div class="col-md-6">
                            <button id="addrow" class="btn btn-success">+</button>
                        </div>
                        <div class="col-md-6">
                            <button id="removerow" class="btn btn-danger">-</button>
                        </div>
					</div>
                    <br>
                    <div id="buttonset" class="form-group our-form-group">
                        <div class="col-md-4">
                            <input type="text" id="lcrrequired" class="form-control info-form-control" placeholder="LCR Required Within This Date">
                        </div>
                        <div class="col-md-4">
                            <button id="request" class="btn btn-success" style="width:100%;">REQUEST LOWER COURT RECORD</button>
                        </div>
                        <div class="col-md-4">
                            <button id="reset" class="btn btn-danger" style="width:100%;">RESET ALL FIELDS</button>
                        </div>
                    </div>
                </div><!-- Lower Court Request Form ENDS -->
            </div>
        </div>
    </div>
</div>





@endsection

@section('right_sidebar_content')


@endsection
@include('layouts.2_column_content')


@section('main_container')
@yield('2_column_content')
@endsection

@section('body_attributes')
@endsection

@section('end_scripts_1')
<script>
    $('#lcrrequired').datepicker({
        format: "dd-mm-yyyy",
        weekStart: 1,
        todayBtn: "linked",
        clearBtn: true,
        daysOfWeekHighlighted: "0,6",
        autoclose: true,
        todayHighlight: true,
        toggleActive: false,
        startDate: '+0d'
    });
	
var i = 0;
    $("#addrow").on("click",function(){
		i++;
		$("#lower_case_selection").append('<div class="col-md-4 '+i+'" style="margin-bottom:10px;"><select id="lc_case_type'+i+'" type="text" class="form-control info-form-control" name="lc_case_tye"> <option value="">Select Case Type</option><option value="52">Act 39</option><option value="1">Act Viii Miscellaneous Case</option><option value="51">Act Xiv</option><option value="58">Bail</option><option value="59">CEX - Excise Case</option><option value="3">Civil Appeal</option><option value="4">Civil Execution</option><option value="5">Civil Misc</option><option value="6">Civil Revision</option><option value="7">Complaint Case</option><option value="55">C R Case</option><option value="8">Criminal Appeal</option><option value="9">Criminal Case</option><option value="11">Criminal Misc Case</option><option value="12">Criminal Revision</option><option value="10">Crl. Execution - Criminal Execution</option><option value="23">Divorce On Mutual Consent - Matri Suit Divorce Mutual Cons</option><option value="13">Electricity Act</option><option value="14">Estate Acquisition Appeal</option><option value="16">Gr Case</option><option value="17">Hindu Adapt. and Maint Act - Hindu Adapt. and Maint Case</option><option value="18">Insolvancy Petition</option><option value="19">L A C - Land Acquisition Cases</option><option value="20">L A Ex. - Land Acquisition Execution</option><option value="53">L A Suit</option><option value="21">M A C C - M.A.C.C</option><option value="22">M A C C Ex. - MACC Execution</option><option value="36">Maintenance Case - MR case for Maintenance</option><option value="24">Matrimonial Suit</option><option value="25">Mc - Misc Case</option><option value="54">M C Case</option><option value="29">Misc. Appeal</option><option value="26">Misc Case (pre-emption)</option><option value="30">Misc. Criminal Revision</option><option value="27">Misc Crl Case - Misc Criminal Case</option><option value="31">Misc. Execution Case</option><option value="57">Misc Petition (156) - Misc Petition</option><option value="28">Mjc - Misc Judicial Case</option><option value="32">Money Appeal</option><option value="33">Money Execution</option><option value="34">Money Suit</option><option value="35">M V Act - Motor Vehicle Case</option><option value="37">N D P S Case - NDPS Case</option><option value="38">NGR Case</option><option value="39">Other Appeal</option><option value="40">Other Suit</option><option value="41">Probate Suit</option><option value="15">S C C Ex. - Execution</option><option value="42">S C C Suit - SCC SUIT</option><option value="43">Sessions Case</option><option value="44">Sessions Trial</option><option value="45">Special Court Cases</option><option value="46">Succession Case</option><option value="47">Title Appeal</option><option value="48">Title Execution</option><option value="49">Title Suit</option><option value="50">Trust Suit</option></select></div><div class="col-md-4 '+i+'" style="margin-bottom:10px;"><input id="lccaseno'+i+'" type="text" class="form-control info-form-control" name="lccaseno"  placeholder="Enter Case No."></div><div class="col-md-4 '+i+'" style="margin-bottom:10px;"><select id="lccaseyear'+i+'" type="text" class="form-control info-form-control" name="lccaseyear"> <option value="">Select Year</option>@for($year=date("Y");$year>=1900;$year--){<option value="{{$year}}">{{$year}}</option>}@endfor</select></div>');
    });

	
	$("#removerow").on("click",function () {
		if(i!=0){
		$('.'+i).remove();
		i--;
		}
    });
</script>
@endsection