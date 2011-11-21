package fr.booness

import java.text.SimpleDateFormat;

class Quote implements Serializable{
    String title
    Date dateCreated
	Date dateExecution
    String status = "En cours"
	String type = "devis"
    Affaire affaire
	Contact contact
	
	Integer remise1=0
	Integer remise2=0
	Integer remise1Section12=0
	Integer remise2Section12=0

    static hasMany=[products:ProductInsert]
    static belongsTo=[affaire:Affaire]
	static transients=['total', 'reference']
	
	Float getTotal(){
		Float tot=0;
		products.each{
			tot+=it.price*it.quantity
		}
		tot
	}
	
	String getReference(){
		String ref=type=="devis"?"D":"FT"
		ref+="-"+affaire.owner.initiales.toUpperCase()+"-"
		ref+=new SimpleDateFormat("yyMMdd").format(dateCreated)+"-"+id
		ref
	}
    
    static constraints = {
        title(blank:false)
		dateExecution()
        status(inList:["En cours", "Perdu", "Gagne"])
		type(inList:["devis", "fiche de transmission"])
		remise1(min:0,max:100)
		remise2(min:0,max:100)
		remise1Section12(min:0,max:100)
		remise2Section12(min:0,max:100)
    }

    String toString(){
        return title
    }
	
	
}
