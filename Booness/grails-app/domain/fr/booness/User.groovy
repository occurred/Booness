package fr.booness

class User implements Serializable {

    String username
    String password
    String name
    String initiales
    String email
    String telephone
	String fax="+33475841561"
    String bio
	String token
    Set logs
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static hasMany = [affaires:Affaire, logs:Log, personalEvents:Event]

    static constraints = {
        username(blank: false, unique: true)
        password(blank: false, password:true)
        name(nullable:true)
        initiales(maxSize:2, unique:true)
        email(email: true)
        telephone(nullable:true)
		fax(nullable:true)
        bio(nullable:true,maxSize:1024)
		token(unique:true)
    }

    static searchable=[only: ['name', 'bio']]

    static mapping = {
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    String toString(){
        return name
    }
}
