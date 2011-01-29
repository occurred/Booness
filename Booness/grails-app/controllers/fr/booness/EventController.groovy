package fr.booness


class EventController {


    def scaffold=true
    
    def json={
        render createJSON()
    }

    private String createJSON(){
        def json="["
        Event.list().each{
            json+="{"
            json+="title:\""+it.title+"\","
            json+="start:'"+it.startDate+"',"
            json+="end:'"+it.endDate+"',"
            json+="allDay:"+it.allday+","
            if(it instanceof Log){
                json+="url:\"b/../log/show/"+it.id+"\","
                json+="className: 'event-log'"
            }
            else
                json+="url:\"b/..${controllerUri}/show/"+it.id+"\""
            json+="},"
        }
        json+="{}]"
        return json
    }
}
