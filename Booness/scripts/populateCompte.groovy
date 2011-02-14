
import fr.booness.*
import java.text.SimpleDateFormat

String getType(String typeid){
    if(!typeid) return "Autre"
    if(typeid.equals('0')) return "Bureau d'Etude"
    if(typeid.equals('1')) return "Installateur"
    if(typeid.equals('2')) return "Entreprise"
    return "Autre"
}

String reformatUrl(String url){
    if(!url.startsWith("http://")){
        url="http://"+url
    }
    return url;
}
String reformatPhone(String phone){
    if(phone.startsWith("(0)")){
        phone=phone.replaceFirst("(0)","+33")
    }
    if(phone.startsWith("(01)")){
        phone=phone.replaceFirst("(01)","+331")
    }
    if(phone.startsWith("(02)")){
        phone=phone.replaceFirst("(02)","+332")
    }
    if(phone.startsWith("(03)")){
        phone=phone.replaceFirst("(03)","+333")
    }
    if(phone.startsWith("(04)")){
        phone=phone.replaceFirst("(04)","+334")
    }
    if(phone.startsWith("(05)")){
        phone=phone.replaceFirst("(05)","+335")
    }
    if(phone.startsWith("(06)")){
        phone=phone.replaceFirst("(06)","+336")
    }
    if(phone.startsWith("(09)")){
        phone=phone.replaceFirst("(09)","+339")
    }
    if(phone.startsWith("00")){
        phone=phone.replaceFirst("00","+")
    }
    if(phone.startsWith("0")){
        phone=phone.replaceFirst("0","+33")
    }
    phone=phone.replaceAll(" ","")
}



def compte=new File('scripts/compte.txt')
println compte.absolutePath
int index=1
compte.splitEachLine(';') {fields ->
    while(!(''+index).equals(fields[0])){
        new Compte(name:'to-delete', description:'', type:'Autre', zip:'', extra:'', street:'', city:'', country:'FR').save(failOnError:true)
        index++
    }
    index++
    def c=new Compte(name:fields[2], type:getType(fields[15]), description:fields[11], street:fields[5], extra:fields[6], zip:fields[7]?.replaceAll(" ",""), city:fields[8], country:'FR')
    if(fields[4]?.size()){
        c.website=reformatUrl(fields[4])
    }
    if(fields[9]?.size()){
        c.phone=reformatPhone(fields[9])
    }
    if(fields[3]?.size()){
        c.email=fields[3]
    }
    try{
        c.save(failOnError:true)
    }catch(Exception e){
        println fields
        e.printStackTrace()
    }

    //println fields
}

/*
Compte idoine=new Compte(name:'Idoine Informatique', type:"Entreprise", description:'Super client', street:'7 chemin des pales', extra:'', zip:'2016', city:'Cortaillod', country:'CH')
idoine.addToContacts(new Contact(name:'Gregoire Cario', post:'Directeur', email:'gregoire@idoine-informatique.ch',telephone:'+449837234',street:'7 chemin des pales', extra:'', zip:'2106', city:'Cortaillod', country:'CH', description: 'Services Informatiques de Qualite'))
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
 */
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
/*
def devis=new Quote(name:'devis numero 1', isPaid:false, dateCreated:new Date())
devis.addToProducts(p1)
devis.addToProducts(p3)
devis.save()

//affaire.addToQuotes(devis)
idoine.addToAffaires(affaire)
commercial.addToAffaires(affaire)
commercial.save()
idoine.save()
 */