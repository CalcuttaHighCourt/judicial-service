select acr.jo_code, jo.officer_name,acr.year,gd.grade_name,desig.designation_name from acr_histories acr
	left outer join judicial_officers jo on acr.judicial_officer_id=jo.id
	left outer join grade_details gd on gd.id=acr.grade_id
	left outer join judicial_officer_postings jop on jop.judicial_officer_id=jo.id
	left outer join designations desig on desig.id=jop.designation_id
	where desig.designation_name='District Judge Entry Level' ORDER BY jo.officer_name 