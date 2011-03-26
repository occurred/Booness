package fr.booness

class Compte implements Serializable {

    String name
    String type
    String street
    String extra
    String zip
    String city
    String country
    String description
    String website
    String phone
    String email
    Set logs

    static hasMany = [affaires:Affaire, contacts:Contact, logs:Log]

    static constraints = {
        name(nullable:false, blank:false)
        type(inList:["Bureau d'Etude", "Installateur", "Entreprise", "Grossiste", "Fabricant", "Architecte", "Explotant", "Constructeur", "Negoce", "Autre"])
        description(size:0..1024)
        website(nullable:true, url:true)
        email(nullable:true, mail:true)
        phone(nullable:true)
        street()
        extra(nillable:true)
        zip()
        country(inList:["FR", "IT", "DE","ES", "BE","LU","CH", "UK"])
        city()
    }

    static searchable=[only: ['name', 'description']]

    String toString(){
        return name
    }
}
