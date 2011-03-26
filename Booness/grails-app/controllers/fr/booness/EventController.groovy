package fr.booness


class EventController {

    def springSecurityService
    
    def scaffold=true

    static navigation = [
        title: 'Calendrier',
        group: 'admin'
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
            json+="className: 'event-log'"
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
            json+="url:\"${controllerName}/show/"+it.id+"\""
            json+="}"
        }
        json+="]"
        return json
    }
}
