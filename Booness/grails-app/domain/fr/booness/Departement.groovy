package fr.booness


class Departement {
    String name
    String numero
    User user
    
    static belongsTo = User

    static constraints = {
        name(blank:false)
        numero()
		user(nullable:true)
    }

}
