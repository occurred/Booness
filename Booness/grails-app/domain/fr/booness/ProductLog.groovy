package fr.booness

class ProductLog {
	
	String description
	Date dateCreated

    static constraints = {
		description(maxSize:100000)
    }
}
