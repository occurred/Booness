

import fr.booness.*
import fr.booness.param.CompteType;
import fr.booness.param.ContactPost;

def file=new File('scripts/compte-contact.txt')
println file.absolutePath
def post=ContactPost.findByName("AUTRE")
println post
def type=CompteType.get(3)//modele
println type
file.splitEachLine(';') {fields ->
	def compte=Compte.get(Long.parseLong(fields[1]))
	def contact=Contact.get(Long.parseLong(fields[2]))


	if(compte!=null && contact!=null){
		println compte
		println contact
		compte.addToContacts(contact)
		compte.save(failOnError:true, flush:true)
	}
}

