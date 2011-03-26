package fr.booness

class Affaire implements Serializable {
    String name
    String description
    Boolean archived=false

    Compte compte
    User owner

    static hasMany = [quotes:Quote]
    static belongsTo = [owner:User, compte:Compte]
    
    static constraints = {
        name(blank:false)
        description(size:0..1024)
        archived()
    }

    static searchable=[only: ['name', 'description']]


    String toString(){
        return name;
    }
}
