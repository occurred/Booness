package fr.booness

class Log extends Event{

    Compte compte
    User user
	String objectif

    static belongsTo = [compte:Compte, user:User]

    static constraints = {
    }

}
