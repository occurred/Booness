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
        title(nullable:true, blankable:true)
        type()
        allday()
        startDate()
        endDate()
        description(size:0..9192)
    }

    static searchable=[only: ['title', 'description']]

    public String toString(){
         title
    }

    public int compareTo(Object that){
        return -startDate.compareTo(that.startDate)
    }
}

