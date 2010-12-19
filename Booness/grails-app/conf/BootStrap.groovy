import fr.booness.*
class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        
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

        def user = User.findByUsername('user')?: new User(
            username: 'user',
            password: springSecurityService.encodePassword('user'),
            enabled:true,
            profile: new Profile(
                name: 'User Name',
                email: 'user@caleffi.fr',
                telephone: '+3334876345',
                bio: 'working at Caleffi France')
        ).save(failOnError: true)

        if(!user.authorities.contains(userRole)){
            UserRole.create(user, userRole)
        }

        Compte idoine=new Compte(name:'Idoine Informatique', description:'Super client')
        idoine.addToContacts(new Contact(name:'Gregoire Cario',email:'gregoire@idoine-informatique.ch',telephone:'+449837234',address:'en suisse', description: 'He is a great guy'))
        def affaire = new Affaire(name:'super affaire', description:'ventes de pleins de tuyaux')

        

        def p1=new Product(name:'evier 1', description:'bel evier en inox', price:500, photo:new byte[0])
        def p2=new Product(name:'evier 2', description:'bel evier en couleur', price:600, photo:new byte[0])
        def p3=new Product(name:'tuyau 1', description:'tuyau court en inox', price:50, photo:new byte[0])
        def p4=new Product(name:'tuyau 2', description:'tuyau long', price:80, photo:new byte[0])

        p1.save()
        p3.save()
        p2.save()
        p4.save()

        def devis=new Quote(name:'devis numero 1', isPaid:false, dateCreated:new Date())
        devis.addToProducts(p1)
        devis.addToProducts(p3)
        devis.save()

        //affaire.addToQuotes(devis)
        idoine.addToAffaires(affaire)
        commercial.addToAffaires(affaire)
        commercial.save()
        idoine.save()

    }
    
    def destroy = {
    }
}
