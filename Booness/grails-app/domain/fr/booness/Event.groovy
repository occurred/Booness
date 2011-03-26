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
        description(size:0..4096)
    }

    static searchable=[only: ['title', 'description']]

    public String toString(){
         title
    }
}
