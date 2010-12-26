package fr.booness

class Compte implements Serializable {

    String name
    String description

    static hasMany = [affaires:Affaire, contacts:Contact, logs:Log]

    static constraints = {
        name(nullable:false, blank:false, unique:true)
        description(size:0..1024)
    }

    String toString(){
        return name
    }
}
