

import fr.booness.*

def file=new File('scripts/compte-contacts.txt')
println file.absolutePath
file.splitEachLine(';') {fields ->
    def compte=Compte.get(Long.parseLong(fields[1]))
    def contact=Contact.get(Long.parseLong(fields[2]))
    //println compte
    //println contact
    
    
    try{
        compte.addToContacts(contact)
        compte.save(failOnError:true, flush:true)
    }catch(Exception){
        println fields
    }
}
