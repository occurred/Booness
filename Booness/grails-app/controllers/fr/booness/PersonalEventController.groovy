package fr.booness

import grails.plugins.springsecurity.Secured


class PersonalEventController {

    def springSecurityService
	
	def scaffold=true

    static navigation = [
        title: 'Calendrier\nPersonnel',
        group: 'user',
        action: 'list'
    ]

	@Secured(['ROLE_USER'])
	def json={
		
		if(!params.start){
			params.start=(long)((System.currentTimeMillis()-13600000*24*30)/1000)
		}
		if(!params.end){
			params.end=(long)((System.currentTimeMillis()+13600000*24*30)/1000)
		}
		println params
        User principal = User.get(springSecurityService.principal.id)
        render(text:createJSON(new Date(Long.parseLong(params.start+"000")),new Date(Long.parseLong(params.end+"000")), principal),contentType:"text/html")
    }


    @Secured(['ROLE_USER'])
	private String createJSON(Date start, Date end, User user){
        def json="["
        boolean first=true
        def results=user.personalEvents
		results.each{
			println it
            if(first){
                first=false
                json+="{"
            }
            else {
                json+=",{"
            }
			json+="\"id\":"+it.id+","
            json+="\"title\":\""+it.title.replaceAll("\"","'")+"\","
            json+="\"start\":\""+it.startDate+"\","
            json+="\"end\":\""+it.endDate+"\","
            json+="\"allDay\":"+it.allday+","
            json+="\"url\":\"show/"+it.id+"\","
            json+="\"backgroundColor\": \"green\""
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
        convertedString = convertedString.replaceAll("\n{2,}", "\n"); // collapse multiple empty lines
        return convertedString;
    }


    def ical={
        User principal = User.findByToken(params.token)
        render createIcal(principal)
    }

    private String createIcal(User user){
        def df=new java.text.SimpleDateFormat("yyyyMMdd'T'HHmmss")
        def ical='''BEGIN:VCALENDAR
X-WR-CALNAME:Caleffi
METHOD:PUBLISH
X-WR-CALDESC:GRAILS Plugin Calendar
PRODID:-//SIGMEUS/NONSGML Bennu 0.1//EN
VERSION:2.0
'''
        user.personalEvents.each{
            ical+="BEGIN:VEVENT\n"
            ical+="UID:"+user.name+it.id+"@grails\n"
            ical+="DTSTAMP:"+df.format(new Date())+"Z\n"
            ical+="SUMMARY:"+it.title+" - "+it.compte.name+"\n"
            ical+="DTSTART:"+df.format(it.startDate)+"\n"
            ical+="DTEND:"+df.format(it.endDate)+"\n"
			ical+="DESCRIPTION:"+it.description.replaceAll("<br/>","\\\\n").replaceAll("\n","\\\\n").replaceAll(",","\\\\,").replaceAll(";","\\\\;")+"\n"
            ical+="LOCATION:"+it.compte.street+" "+it.compte.city+"\n"
            ical+="X-ALT-DESC;FMTTYPE=text/html:"+it.description.replaceAll("\n","\\\\n").replaceAll(",","\\\\,").replaceAll(";","\\\\;")+"\n"
            ical+="END:VEVENT\n"
        }
        ical+="END:VCALENDAR\n"
        return ical
    }

	@Secured(['ROLE_USER'])
	def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	@Secured(['ROLE_USER'])
    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        def results = User.get(springSecurityService.principal.id).personalEvents
        [eventInstanceList:results, eventInstanceTotal: results.size()]
    }

    @Secured(['ROLE_USER'])
    def create = {
        def eventInstance = new PersonalEvent()
        eventInstance.properties = params
		if(eventInstance.startDate!=eventInstance.startDate){
			eventInstance.allday=true;
		}
        return [eventInstance: eventInstance]
    }

    @Secured(['ROLE_USER'])
    def save = {
        def eventInstance = new PersonalEvent(params)
		User user= User.get(springSecurityService.principal.id)
		user.addToPersonalEvents(eventInstance)
		eventInstance.user=user
		
        if (!eventInstance.hasErrors() && eventInstance.save()) {
            flash.message = "event.created"
            flash.args = [eventInstance.id]
            flash.defaultMessage = "Event ${eventInstance.id} created"
            redirect(action: "show", id: eventInstance.id)
        }
        else {
            render(view: "create", model: [eventInstance: eventInstance])
        }
    }

    @Secured(['ROLE_USER'])
	def show = {
        def eventInstance = PersonalEvent.get(params.id)
		println eventInstance
        if (!eventInstance) {
            flash.message = "event.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Event not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [eventInstance: eventInstance]
        }
    }

    @Secured(['ROLE_USER'])
    def edit = {
        def eventInstance = PersonalEvent.get(params.id)
        if (!eventInstance) {
            flash.message = "event.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Event not found with id ${params.id}"
            redirect(action: "list")
        }
		if(!eventInstance.user){
			eventInstance.user=User.get(9)
		}
		else if(eventInstance.user.id!=springSecurityService.principal.id){
			flash.message = "Vous ne pouvez pas editer un evenement qui ne vous appartient pas !"
			redirect(action: "index")
		}
        else {
            return [personalEventInstance: eventInstance]
        }
    }

    @Secured(['ROLE_ADMIN'])
    def update = {
        def eventInstance = PersonalEvent.get(params.id)
		if(eventInstance.user.id!=springSecurityService.principal.id){
			flash.message = "Vous ne pouvez pas editer un evenement qui ne vous appartient pas !"
			redirect(action: "index")
		}
        if (eventInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (eventInstance.version > version) {
                    eventInstance.errors.rejectValue("version", "event.optimistic.locking.failure", "Another user has updated this Event while you were editing")
                    render(view: "edit", model: [eventInstance: eventInstance])
                    return
                }
            }
            eventInstance.properties = params
            if (!eventInstance.hasErrors() && eventInstance.save()) {
                flash.message = "event.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Event ${params.id} updated"
                redirect(action: "show", id: eventInstance.id)
            }
            else {
                render(view: "edit", model: [eventInstance: eventInstance])
            }
        }
        else {
            flash.message = "event.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Event not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    @Secured(['ROLE_USER'])
    def delete = {
        def eventInstance =PersonalEvent.get(params.id)
		println eventInstance
        if (eventInstance) {
			if(eventInstance.user.id!=springSecurityService.principal.id){
				flash.message = "Vous ne pouvez pas supprimer un evenement qui ne vous appartient pas!"
				redirect(action: "index")
			}
            try {
                eventInstance.delete()
                flash.message = "event.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Event ${params.id} deleted"
                redirect(action: "list")
            }
            catch (Exception e) {
				println e
                flash.message = "event.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Event ${params.id} could not be deleted"
                //redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "event.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Event not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}

