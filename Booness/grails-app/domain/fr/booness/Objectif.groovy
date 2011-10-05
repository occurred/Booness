package fr.booness

class Objectif implements Comparable<Objectif>{
	Integer year
	Integer ca
	Integer visites
	Integer affaires
	
	static belongsTo = [user:User]
	
    static constraints = {
		year(min:1900)
		ca(min:0)
		visites(min:0)
		affaires(min:0)
    }
	
	public int compareTo(Objectif that){
		return that.year-this.year
	}
	
}
