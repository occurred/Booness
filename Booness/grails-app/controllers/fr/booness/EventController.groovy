package fr.booness


class EventController {

	def springSecurityService

	def scaffold=true

	static navigation = [
		title: 'Planning',
		group: 'admin',
		action: 'list'
	]

	def json={
		User principal = User.get(springSecurityService.principal.id)
		render createJSON(principal)
	}
	
	def list={
		params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
		def c = Event.createCriteria()
		def results = c.list (params) {
			like("class", "%Event")
			order("startDate", "desc")
		}
		[eventInstanceList:results, eventInstanceTotal: results.totalCount]
	}

	private String createJSON(User user){
		def json="["
		boolean first=true
		Log.findAllByUser(user,[max:100, order:'desc', sort:'startDate']).each{
			if(first){
				first=false
				json+="{"
			}
			else {
				json+=",{"
			}

			json+="title:\""+it.title+"\","
			json+="start:'"+it.startDate+"',"
			json+="end:'"+it.endDate+"',"
			json+="allDay:"+it.allday+","
			json+="url:\"log/show/"+it.id+"\","
			json+="backgroundColor: 'green'"
			json+="}"
		}
		Event.findAll("from Event as b where b.class like '%Event' order by startDate").each{
			if(first){
				first=false
				json+="{"
			}
			else {
				json+=",{"
			}

			json+="title:\""+it.title+"\","
			json+="start:'"+it.startDate+"',"
			json+="end:'"+it.endDate+"',"
			json+="allDay:"+it.allday+","
			json+="url:\"${controllerName}/show/"+it.id+"\","
			json+="backgroundColor: 'blue'"
			json+="}"
		}
		json+="]"
		return json
	}

	private String convertHtmlToText( String html ) {
		String convertedString = html;
		convertedString = convertedString.replaceAll("<.*?>", "");  // strip all HTML tags
		convertedString = convertedString.replaceAll("&nbsp;", " ");  // convert &nbsp;
		convertedString = convertedString.replaceAll("&amp;", "&");  // convert &amp;
		convertedString = convertedString.trim(); // strip leading and trailing whitespace
		convertedString = convertedString.replaceAll("\n{2,}", "\n"); // collapse multipe empty lines
		return convertedString;
	}


	def ical={
		User principal = User.findByToken(params.token)
		render createIcal(principal)
	}

    private String createIcal(User user){
        def df=new java.text.SimpleDateFormat("yyyyMMdd'T'HHmmss")
        def ical='''BEGIN:VCALENDAR
X-WR-CALNAME:Booness
X-WR-CALDESC:GRAILS Plugin Calendar
PRODID:-//Francois-Xavier Thoorens/NONSGML Bennu 0.1//EN
VERSION:2.0
'''
        Log.findAllByUser(user,[max:100, order:'desc', sort:'startDate']).each{
            ical+="BEGIN:VEVENT\n"
            ical+="UID:"+user.name+it.id+"@grails\n"
            ical+="DTSTAMP:"+df.format(new Date())+"Z\n"
            ical+="SUMMARY:"+it.title+"\n"
            ical+="DTSTART:"+df.format(it.startDate)+"\n"
            ical+="DTEND:"+df.format(it.endDate)+"\n"
            ical+="DESCRIPTION:"+it.description+"\n"
            ical+="END:VEVENT\n"
        }

        Event.findAll("from Event as b where b.class like '%Event' order by startDate",[max:10]).each{
            ical+="BEGIN:VEVENT\n"
            ical+="UID:Event"+it.id+"@grails\n"
            ical+="DTSTAMP:"+df.format(new Date())+"Z\n"
            ical+="SUMMARY:"+it.title+"\n"
            ical+="DTSTART:"+df.format(it.startDate)+"\n"
            ical+="DTEND:"+df.format(it.endDate)+"\n"
            ical+="DESCRIPTION:"+it.description+"\n"
            ical+="END:VEVENT\n"
        }
        ical+="END:VCALENDAR\n"
        return ical
    }
}

