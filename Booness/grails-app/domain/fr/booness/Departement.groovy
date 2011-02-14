package fr.booness

class Departement {
    String name
    
    static belongsTo = User

    static constraints = {
        name()
    }


    private String[] getDepartementList(){
        list=[]
        for(int i=1;i<100;i++)
            list<<''+i
        list
    }
}
