package fr.booness

import fr.booness.param.LogType

class Event implements Comparable {
    String title
    LogType type
    String description
    Date startDate
    Date endDate
    Boolean allday

    static constraints = {
        title(nullable:false, blank:false)
        type()
        allday()
        startDate()
        endDate()
        description(size:0..4096)
    }

    static searchable=[only: ['title', 'description']]

    public String toString(){
         title
    }

    public int compareTo(Object that){
        return -startDate.compareTo(that.startDate)
    }
}
