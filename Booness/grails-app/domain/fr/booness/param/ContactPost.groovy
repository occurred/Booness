package fr.booness.param

class ContactPost {

    String name

    static constraints = {
        name(unique:true)
    }

    public String toString(){
        return name
    }
}
