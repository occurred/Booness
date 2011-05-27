package fr.booness

class Parameters {
	
	String compteRepository

    static constraints = {
		compteRepository(url:true)
    }
}
