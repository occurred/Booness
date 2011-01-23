import fr.booness.*
import java.text.SimpleDateFormat

class BootStrap {
    def springSecurityService

    def init = { servletContext ->
        
        def userRole = Role.findByAuthority('ROLE_USER')?: new Role(authority: 'ROLE_USER').save(failOnError:true)

        def adminRole = Role.findByAuthority('ROLE_ADMIN')?: new Role(authority: 'ROLE_ADMIN').save(failOnError:true)

        def commercial = User.findByUsername('jerome')?: new User(
            username: 'jerome',
            password: springSecurityService.encodePassword('jerome'),
            enabled:true,
            name: 'Jerome Carlier',
            email: 'jerome@caleffi.fr',
            telephone: '+3334876345',
            bio: 'The founder of Caleffi.fr'
        ).save(failOnError: true)

        if(!commercial.authorities.contains(userRole)){
            UserRole.create(commercial, userRole)
        }

        if(!commercial.authorities.contains(adminRole)){
            UserRole.create(commercial, adminRole)
        }
        def user
        for(int i = 0 ; i< 10 ; i++){
            user = User.findByUsername('user'+i)?: new User(
                username: 'user'+i,
                password: springSecurityService.encodePassword('user'+i),
                enabled:true,
                name: 'John Doe '+i,
                email: 'user'+i+'@caleffi.fr',
                telephone: '+3334876345',
                bio: 'working at Caleffi France'
            ).save(failOnError: true)

            if(!user.authorities.contains(userRole)){
                UserRole.create(user, userRole)
            }
        }
        
        Compte idoine=new Compte(name:'Idoine Informatique', description:'Super client', street:'20 chemin des pales', zip:12390, city:'cortaillod', country:'Suisse')
        idoine.addToContacts(new Contact(name:'Gregoire Cario',email:'gregoire@idoine-informatique.ch',telephone:'+449837234',street:'20 chemin des pales', zip:12390, city:'cortaillod', country:'Suisse', description: 'He is a great guy'))
        def affaire = new Affaire(name:'super affaire', description:'ventes de pleins de tuyaux')
        def taffaire=new Affaire(name:'affaire 1', description:'ventes de pleins de tuyaux')
        idoine.addToAffaires(taffaire)
        user.addToAffaires(taffaire)

        taffaire=new Affaire(name:'affaire 2', description:'ventes de pleins de tuyaux')
        idoine.addToAffaires(taffaire)
        user.addToAffaires(taffaire)
        
        taffaire=new Affaire(name:'Archived affaire 3', description:'ventes de pleins de tuyaux', archived:true)
        idoine.addToAffaires(taffaire)
        user.addToAffaires(taffaire)
        Random r=new Random();


        idoine.addToLogs(new Log(user: commercial, compte:idoine, title:'premiere visite', description:'''ca s'est bien passe''', startDate:new Date(), endDate:new Date(3600000+System.currentTimeMillis()), allday:false))
        def df=new SimpleDateFormat("yyyy-MM-dd")
        new Event(title:'Reunion consultants debut d\'annee', description:'reunion de trois jours pour le bilan de l\'annee dernier et fixer les objectifs de cette annee', startDate:df.parse("2011-01-04"), endDate:df.parse("2011-01-06"), allday:true).save()
        new Event(title:'Reunion demonstration prototype', description:'Nouveau prototype pour gerer les clients de Calefi.fr', startDate:df.parse("2011-02-01"), endDate:df.parse("2011-02-01"), allday:true).save()
        println "ok"
        /*
        for(int i=2;i<3;i++){
            long randomTS=(long)(r.nextDouble()*100000000)+System.currentTimeMillis();
            println randomTS
            idoine.addToLogs(new Log(user: User.findByUsername('user'+(i%10)), compte:idoine, title:i+'eme visite', description:'''ca s'est pas trop bien passe''', startDate:new Date(), endDate:new Date(System.currentTimeMillis()+3600000l), allday:false))
        }
*/
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
