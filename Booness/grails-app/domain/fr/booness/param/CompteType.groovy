package fr.booness.param

class CompteType {

    String name

    static constraints = {
        name(unique:true)
    }

    public String toString(){
        return name
    }
}
