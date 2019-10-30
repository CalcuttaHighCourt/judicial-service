select jo.officer_name,desig.designation_name,c.court_name,jop.from_date,jop.to_date
	from judicial_officers jo 
	
	INNER JOIN judicial_officer_postings jop ON jo.id=jop.judicial_officer_id
	INNER JOIN courts c ON c.id=jop.court_id
	INNER JOIN designations desig ON desig.id=jop.designation_id

	where from_date BETWEEN '2011-09-01' AND '2016-03-05'
	and to_date BETWEEN '2011-09-01' AND '2017-03-05' 
	or to_date is null 