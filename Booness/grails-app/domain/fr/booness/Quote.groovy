package fr.booness

class Quote {
    String title
    Date dateCreated
    Boolean isPaid

    static hasMany=[products:Product]
    static belongsTo=Affaire
    
    static constraints = {
        
    }
}
