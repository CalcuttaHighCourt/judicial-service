select jo.jo_code,jo.officer_name,cc.court_complex_name
		from judicial_officer_posting_preferences jopp inner join judicial_officers jo on jo.id=jopp.judicial_officer_id
		inner join court_complexes cc on jopp.court_complex_id = cc.id 
		