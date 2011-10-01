package fr.booness

class Affaire {
    String name
    String description
    Boolean archived=false
	Date dateCreated

    Compte compte
    User owner

    static hasMany = [quotes:Quote]
    static belongsTo = [owner:User, compte:Compte]
    
    static constraints = {
        name(blank:false)
        description(nullable:true,size:0..1024)
		archived()
		dateCreated(nullable:true)
    }

    static searchable=[only: ['name', 'description']]

    String toString(){
        return name;
    }
}
