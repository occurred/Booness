package fr.booness

class Contact {

    String name
    String email
    String telephone
    String address
    String description

    static constraints = {
        name()
        email(email:true)
        telephone()
        address()
        description(maxSize: 1024)
    }

    String toString(){
        return name;
    }
}
