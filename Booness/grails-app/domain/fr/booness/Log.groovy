package fr.booness

class Log extends Event implements Serializable{

    Compte compte
    User user

    static belongsTo = [compte:Compte, user:User]

    static constraints = {
    }

}
