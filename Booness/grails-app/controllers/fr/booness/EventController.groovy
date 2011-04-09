package fr.booness


class EventController {

    def springSecurityService
    
    def scaffold=true

    static navigation = [
        title: 'Planning',
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

    def ical={
         User principal = User.get(springSecurityService.principal.id)
        render createIcal(principal)
    }

    private String createIcal(User user){
        def df=new java.text.SimpleDateFormat("yyyyMMdd'T'HHmmss")
        def ical='''BEGIN:VCALENDAR
X-WR-CALNAME:Caleffi
X-WR-CALDESC:Caleffi Booness Application
PRODID:-//Booness/NONSGML Bennu 0.1//EN
VERSION:2.0
'''
        Log.findAllByUser(user,[max:100, order:'desc', sort:'startDate']).each{
            ical+="BEGIN:VEVENT\n"
            ical+="UID:"+it.id+"@Caleffi@Booness\n"
            ical+="DTSTAMP:"+df.format(new Date())+"Z\n"
            ical+="SUMMARY:"+it.title+"\n"
            ical+="DTSTART:"+df.format(it.startDate)+"\n"
            ical+="DTEND:"+df.format(it.endDate)+"\n"
            ical+="DESCRIPTION:a\n"
            ical+="END:VEVENT\n"
        }
        ical+="END:VCALENDAR\n"
        return ical
    }
}
