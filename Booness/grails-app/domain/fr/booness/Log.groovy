package fr.booness

class Log implements Serializable, Comparable{

    String title
    String content
    Compte compte
    User user
    Date dateCreated
    Date lastUpdated

    static belongsTo = [compte:Compte, user:User]

    static constraints = {
        title()
        content(size:0..4096)
    }

    String toString(){
        return title
    }

    int compareTo(Object other){
        return lastUpdated ? lastUpdated.compareTo(other.lastUpdated):-1
    }
}
