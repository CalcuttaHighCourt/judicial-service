SELECT  acr.jo_code, jo.officer_name,acr.year,gd.grade_name,desig.designation_name,c.court_name
        FROM acr_histories acr LEFT OUTER JOIN judicial_officers jo ON acr.judicial_officer_id=jo.id
        LEFT OUTER JOIN grade_details gd ON gd.id=acr.grade_id
        LEFT OUTER JOIN judicial_officer_postings jop ON jop.judicial_officer_id=jo.id
        LEFT OUTER JOIN courts c ON c.id=jop.court_id
	LEFT OUTER JOIN designations desig ON desig.id=jop.designation_id WHERE 1=1  AND jo.id =11 AND to_date is NULL ORDER BY jo.officer_name 