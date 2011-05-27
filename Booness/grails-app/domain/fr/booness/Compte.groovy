package fr.booness

import fr.booness.param.CompteType

class Compte {

    String name
    CompteType type
    String street
    String extra
    String zip
    String city
    String country="FR"
    String description
    String website
    String phone
    String phone2
    String fax
    String email
    SortedSet logs

    static hasMany = [affaires:Affaire, logs:Log, contacts:Contact]


    static mapping ={
        logs sort:'startDate'
    }

    static constraints = {
        name(unique:true, nullable:false, blank:false)
        type()
        email(nullable:true, mail:true)
        website(nullable:true, url:true)
        phone(nullable:true)
        phone2(nullable:true)
        fax(nullable:true)
        street()
        extra(nullable:true)
        zip()
        city()
        country(inList:["FR", "IT", "DE","ES", "BE","LU","CH", "UK"])
        description(size:0..8192)
    }

    static searchable=[only: ['name', 'description', 'city', 'phone', 'phone2', 'fax']]

    String toString(){
        return name
    }
}
