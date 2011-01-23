package fr.booness

class Event {
    String title
    String description
    Date startDate
    Date endDate
    Boolean allday

    static constraints = {
        title()
        allday()
        startDate()
        endDate()
        description(size:0..1024)
    }

    public String toString(){
         title
    }
}
