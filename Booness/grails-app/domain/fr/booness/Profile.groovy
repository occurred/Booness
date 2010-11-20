package fr.booness

class Profile implements Serializable{

    String name
    String email
    String telephone
    String bio

    static belongsTo = User

    static constraints = {
        name(nullable:true)
        email(email: true)
        telephone()
        bio(maxSize:1024)
    }

    String toString(){
        return name
    }
}
