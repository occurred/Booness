package fr.booness

class Parameters {
	
	String name
	String value

    static constraints = {
		name()
		value(maxSize:4096)
    }
}
