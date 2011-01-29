package fr.booness

class User implements Serializable {

    String username
    String password
    String name
    String email
    String telephone
    String bio
    SortedSet logs
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static hasMany = [affaires:Affaire, logs:Log]

    static constraints = {
        username(blank: false, unique: true)
        password(blank: false, password:true)
        name(nullable:true)
        email(email: true)
        telephone()
        bio(maxSize:1024)
    }

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
