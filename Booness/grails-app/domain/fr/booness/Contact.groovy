package fr.booness

class Contact {

    String name
    String email
    String telephone
    String street
    Integer zip
    String city
    String country
    String description

    static constraints = {
        name()
        description(maxSize: 1024)
        email(email:true)
        telephone()
        street()
        zip(min:0)
        country(inList:["FR", "IT", "DE","ES", "BE","LU","CH", "UK"])
        city()
        
    }

    String toString(){
        return name;
    }
}
