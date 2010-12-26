package fr.booness

class Quote implements Serializable{
    String title
    Date dateCreated
    Boolean isPaid=false

    static hasMany=[products:Product]
    static belongsTo=Affaire
    
    static constraints = {
        title()
        isPaid()
        dateCreated()
        
    }

    String toString(){
        return title
    }
}
