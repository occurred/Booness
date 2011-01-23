package fr.booness

class Role {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}

    public String toString(){
        return authority
    }
}
