package fr.booness

class Departement {
    String name
    String numero
    
    static belongsTo = User

    static constraints = {
        name()
        numero()
    }
}
