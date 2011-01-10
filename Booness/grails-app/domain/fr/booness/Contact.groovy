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
        email(email:true)
        telephone()
        street()
        zip(min:0)
        city()
        country()
        description(maxSize: 1024)
    }

    String toString(){
        return name;
    }
}
