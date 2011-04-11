package fr.booness


class EventController {

	def springSecurityService

	def scaffold=true

	static navigation = [
		title: 'Planning',
		group: 'admin',
		activePath: 'event'
	]

	def json={
		User principal = User.get(springSecurityService.principal.id)
		render createJSON(principal)
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
		render(contentType: 'text/calendar') {
			calendar {
				events {
					Log.findAllByUser(principal,[max:100, order:'desc', sort:'startDate']).each{
						event(start: it.startDate,
								end: it.endDate,
								description: convertHtmlToText(it.description),
								//describtion: it.description,
								summary: it.title)
					}
				}
			}
		}
	}
}
