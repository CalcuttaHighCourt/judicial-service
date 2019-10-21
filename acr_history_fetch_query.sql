select acr.jo_code, jo.officer_name,acr.year,gd.grade_name,desig.designation_name from acr_histories acr
	join judicial_officers jo on acr.judicial_officer_id=jo.id
	join grade_details gd on gd.id=acr.grade_id
	join judicial_officer_postings jop on jop.judicial_officer_id=jo.id
	join designations desig on desig.id=jop.designation_id
	