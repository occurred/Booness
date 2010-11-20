import fr.booness.*
class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        //org.hsqldb.util.DatabaseManager.main()
        def userRole = Role.findByAuthority('ROLE_USER')?: new Role(authority: 'ROLE_USER').save(failOnError:true)

        def adminRole = Role.findByAuthority('ROLE_ADMIN')?: new Role(authority: 'ROLE_ADMIN').save(failOnError:true)

        def commercial = User.findByUsername('jerome')?: new User(
            username: 'jerome',
            password: springSecurityService.encodePassword('jerome'),
            enabled:true,
            profile: new Profile(
                name: 'Jerome Carlier',
                email: 'jerome@caleffi.fr',
                telephone: '+3334876345',
                bio: 'The founder of Caleffi.fr')
        ).save(failOnError: true)

        if(!commercial.authorities.contains(userRole)){
            UserRole.create(commercial, userRole)
        }

        if(!commercial.authorities.contains(adminRole)){
            UserRole.create(commercial, adminRole)
        }

        Compte idoine=new Compte(name:'Idoine Informatique', description:'Super client')
        idoine.addToContacts(new Contact(name:'Gregoire Cario',email:'gregoire@idoine-informatique.ch',telephone:'+449837234',address:'en suisse', description: 'He is a great guy'))
        def affaire = new Affaire(name:'super affaire', description:'avec pots de vin en prime')
        idoine.addToAffaires(affaire)
        commercial.addToAffaires(affaire)
        commercial.save()
        idoine.save()
    }
    
    def destroy = {
    }
}
