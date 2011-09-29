package fr.booness

import java.util.Date;

class PersonalEvent implements Comparable {
    String title
    String description
    Date startDate
    Date endDate
    Boolean allday
	Boolean restricted=true
	
	static belongsTo=[user:User]

    static constraints = {
        title(nullable:true, blankable:true)
        restricted()
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
