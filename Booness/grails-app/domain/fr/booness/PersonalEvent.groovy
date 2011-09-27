package fr.booness

class PersonalEvent extends Event{
	
	Boolean restricted=true
	
	static belongsTo=[user:User]

    static constraints = {
    }
}
