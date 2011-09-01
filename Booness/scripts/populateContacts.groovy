
import fr.booness.*
import fr.booness.param.*
import java.text.SimpleDateFormat





def types=[:]
def t=new File('scripts/values.txt')
t.splitEachLine(';') {fields ->
	if(fields[2].equals("FctContact")){
        //println fields[0]+"->"+fields[1]
		types[fields[0]]=fields[1]
	}
}

types.each{k,v->
    new ContactPost(name:v).save()
}

ContactPost other=ContactPost.findByName("AUTRE")

println types

def civilites=[
"13":"Mademoiselle",
"14":"Madame",
"16":"Monsieur"
]



String reformatUrl(String url){
    if(!url.startsWith("http://")){
        url="http://"+url
    }
    return url;
}




String reformatPhone(String phone){
    if(phone.startsWith("(0)")){
        phone="+33"+phone.substring(3)
    }
    if(phone.startsWith("(01)")){
        phone="+331"+phone.substring(4)
    }
    if(phone.startsWith("(02)")){
        phone="+332"+phone.substring(4)
    }
    if(phone.startsWith("(03)")){
        phone="+333"+phone.substring(4)
    }
    if(phone.startsWith("(04)")){
        phone="+334"+phone.substring(4)
    }
    if(phone.startsWith("(05)")){
        phone="+335"+phone.substring(4)
    }
    if(phone.startsWith("(06)")){
        phone="+336"+phone.substring(4)
    }
    if(phone.startsWith("(09)")){
        phone="+339"+phone.substring(4)
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
contact.splitEachLine('<;>') {fields ->
    if(fields[0].size()==0){
		println "no more rows after "+index+"\n end of script"
		System.exit(0)
	}
    while(!(''+index).equals(fields[0])){
        new Contact(name:'to-delete', description:'', post:other, country:'FR').save(failOnError:true)
        index++
    }

    if(!Contact.get((long)index)){
        ContactPost post=ContactPost.findByName(types[fields[44]]?types[fields[44]]:"AUTRE")
        println fields[44]+"->"+post
        def c=new Contact(titre:civilites[fields[4]], name:fields[2]+" "+fields[1], post:post?post:other, description:fields[18], street:fields[7], extra:fields[8], zip:fields[9]?.replaceAll(" ",""), city:fields[10], country:'FR')
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
            new Contact(titre:civilites[fields[4]], name:fields[2]+" "+fields[1], post:post?post:other, description:fields[18], street:fields[7], extra:fields[8], zip:fields[9]?.replaceAll(" ",""), city:fields[10], country:'FR').save()

        }
    }
    index++

}

