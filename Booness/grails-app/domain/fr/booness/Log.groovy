package fr.booness

class Log implements Serializable, Comparable{

    String title
    String content
    Date dateCreated=new Date()

    static belongsTo = Compte

    static constraints = {
        title()
        content(size:0..4096)
    }

    String toString(){
        return title
    }

    int compareTo(Object other){
        return dateCreated.compareTo(other.dateCreated)
    }
}
