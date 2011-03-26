package fr.booness

class Log extends Event{

    Compte compte
    User user

    static belongsTo = [compte:Compte, user:User]

    static constraints = {
    }
    

}
