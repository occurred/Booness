
import fr.booness.*
import java.text.SimpleDateFormat

String getPost(String typeid){
    if(!typeid) return "Autre"
    if(typeid.equals('kjh0')) return "Bureau d'Etude"
    if(typeid.equals('lkj1')) return "Installateur"
    if(typeid.equals('lkj2')) return "Entreprise"
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



def contact=new File('scripts/contacts.txt')
println contact.absolutePath
int index=1
contact.splitEachLine(';') {fields ->
    while(!(''+index).equals(fields[0])){
        new Contact(name:'to-delete', description:'', post:'Autre', country:'FR').save(failOnError:true)
        index++
    }
    index++
    def c=new Contact(name:fields[2]+" "+fields[1], post:getPost(fields[15]), description:fields[18], street:fields[7], extra:fields[8], zip:fields[9]?.replaceAll(" ",""), city:fields[10], country:'FR')
    if(fields[6]?.size()){
        c.website=reformatUrl(fields[6])
    }
    if(fields[14]?.size()){
        c.telephone=reformatPhone(fields[14])
    }
    if(fields[16]?.size()){
        c.mobile=reformatPhone(fields[16])
    }
    if(fields[17]?.size()){
        c.fax=reformatPhone(fields[17])
    }
    if(fields[5]?.size()){
        c.email=fields[5].replaceAll(" ","")
    }
    try{
        c.save(failOnError:true)
    }catch(Exception e){
        println fields
        println e
        new Contact(name:fields[2]+" "+fields[1], post:getPost(fields[15]), description:fields[18], street:fields[7], extra:fields[8], zip:fields[9]?.replaceAll(" ",""), city:fields[10], country:'FR').save();

    }

}
