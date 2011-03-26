package fr.booness

class Quote implements Serializable{
    String title
    Date dateCreated
    Boolean isPaid=false
    Affaire affaire

    static hasMany=[products:Product]
    static belongsTo=[affaire:Affaire]
    
    static constraints = {
        title()
        isPaid()
        dateCreated()
        
    }

    String toString(){
        return title
    }
}
