package fr.booness

class Affaire implements Serializable {
    String name
    String description

    static hasMany = [quotes:Quote, files:StoredFile]
    static belongsTo = [User, Compte]
    
    static constraints = {
        name(blank:false)
        description(size:0..1024)
    }

    String toString(){
        return name;
    }
}
