package fr.booness

class Compte implements Serializable {

    String name
    String street
    Integer zip
    String city
    String country
    String description
    SortedSet logs

    static hasMany = [affaires:Affaire, contacts:Contact, logs:Log]

    static constraints = {
        name(nullable:false, blank:false, unique:true)
        description(size:0..1024)
        street()
        zip(min:0)
        country(inList:["FR", "IT", "DE","ES", "BE","LU","CH", "UK"])
        city()
    }

    String toString(){
        return name
    }
}
