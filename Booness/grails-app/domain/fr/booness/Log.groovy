package fr.booness

class Log extends Event{

    Compte compte
    User user
	String objectif
	Integer kilometres = 0

    static belongsTo = [compte:Compte, user:User]

    static constraints = {
		objectif(size:0..4096)
		kilometres(nullable:true, min:0)
    }

}
