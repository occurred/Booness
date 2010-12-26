package fr.booness

class User implements Serializable {

	String username
	String password
        Profile profile
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

        static hasMany = [affaires:Affaire]

	static constraints = {
		username blank: false, unique: true
		password blank: false, password:true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

        String toString(){
            return username
        }
}
