package fr.booness

class Contact {

    String name
    String post
    String email
    String telephone
    String mobile
    String fax
    String website
    String street
    String extra
    String zip
    String city
    String country
    String description

    static constraints = {
        name()
        post(inList:["Directeur", "Installateur", "Autre"])
        description(maxSize: 1024)
        email(nullable:true,email:true)
        website(nullable:true,url:true)
        telephone(nullable:true)
        mobile(nullable:true)
        fax(nullable:true)
        street(nullable:true)
        extra(nullable:true)
        zip(nullable:true)
        country(inList:["FR", "IT", "DE","ES", "BE","LU","CH", "UK"])
        city(nullable:true)
    }

    static searchable=[only: ['name', 'description']]

    String toString(){
        return name;
    }
}
