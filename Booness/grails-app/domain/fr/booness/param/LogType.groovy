package fr.booness.param

class LogType {

    String name

    static constraints = {
        name(unique:true)
    }

    public String toString(){
        return name
    }
}
