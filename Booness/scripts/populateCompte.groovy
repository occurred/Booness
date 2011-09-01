import fr.booness.param.CompteType;


import fr.booness.*
import fr.booness.param.*
import java.text.SimpleDateFormat

def types=[:]

def translationType=[

"ARCHITECTE":"DONNEUR D'ORDRES",
"AUTRE":"AUTRE",
"BAILLEUR SOCIAL":"DONNEUR D'ORDRES",
"BUREAU D'ETUDES":"BUREAU D'ETUDES",
"CONSTRUCTEUR":"AUTRE",
"ECONOMISTE":"AUTRE",
"ENTREPRISE":"INSTALLATEUR",
"ENTREPRISE GENERALE":"INSTALLATEUR",
"ETABLISSEMENT DE SANTE":"HOPITAUX",
"ETABLISSEMENT SCOLAIRE":"AUTRE",
"SOCIETE DE MAINTENANCE":"INSTALLATEUR",
"EXPLOITANT":"EXPLOITANT",
"FABRICANT":"EXPLOITANT",
"GROSSISTE":"GROSSISTE",
"HOPITAL":"HOPITAUX",
"INSTALLATEUR":"INSTALLATEUR",
"MAIRIE":"DONNEUR D'ORDRES",
"MAITRE D OEUVRES":"DONNEUR D'ORDRES",
"MINISTERE  DE LA DEFENSE":"DONNEUR D'ORDRES",
"NEGOCE":"GROSSISTE",
"PRESSE":"AUTRE",
"PRESTATAIRE  DE SERVICE":"INSTALLATEUR",
"PROMOTEUR":"DONNEUR D'ORDRES",
"PROMOTEUR  / BAILLEUR SOCIALE":"DONNEUR D'ORDRES",
"SNCF":"DONNEUR D'ORDRES",
"STE DE MAINTENANCE":"INSTALLATEUR",
"SYSTEMISTE":"AUTRE"
]


def t=new File('scripts/values.txt')
t.splitEachLine(';') {fields ->
	if(fields[2].equals("TypeEntrep")){
		types[fields[0]]=translationType[fields[1]]
	}
}

println types

def ctypes=["BUREAU D'ETUDES","EXPLOITANT","GROSSISTE","INSTALLATEUR","HOPITAUX","DONNEUR D'ORDRES","AUTRE"]

ctypes.each{
	new fr.booness.param.CompteType(name:it).save()
}

def getType(String typeid){
    return CompteType.findByName(types[typeid])
}

String reformatUrl(String url){
    if(url.contains('@')) return null
    if(url.contains(' ')){
        String[] temp= url.split(' ')
        url=temp[temp.length-1]
    }
    if(!url.startsWith("http://")){
        url="http://"+url
    }
    if(url.startsWith("http://http:/")){
        url="http://"+url.substring(13)
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

String reformatZip(String zip){
	String out=zip?.replaceAll(" ","")
	if(out?.length()==4) out="0"+out
	out
}

def compte=new File('scripts/compte.txt')
println compte.absolutePath

int index=1
CompteType other=CompteType.findByName("AUTRE")

compte.splitEachLine(';') {fields ->
	if(fields[0].size()==0){
		println "no more rows after "+index+"\n end of script"
		System.exit(0)
	}
    while(index<Integer.parseInt(fields[0])){
        new Compte(name:'to-delete'+index, description:'', type:other, zip:'', extra:'', street:'', city:'', country:'FR').save(failOnError:true)
        index++
    }


    if(!Compte.get((long)index)){
        if(Compte.findByName(fields[2])){
            fields[2]=fields[2]+" -- Doublon -- "+index
    }

	        println index+" -- "+Integer.parseInt(fields[0])

	        def ct=other
	        if(types[fields[15]]!=null) ct=CompteType.findByName(types[fields[15]])
	        if(ct==[null] || ct==null) ct=other

            def c=new Compte(name:fields[2], type:ct, description:fields[11], street:fields[5], extra:fields[6], zip:reformatZip(fields[7]), city:fields[8], country:'FR')
            if(fields[4]?.size()){
                c.website=reformatUrl(fields[4])
            }
            if(fields[9]?.size()){
                c.phone=reformatPhone(fields[9])
            }
	        if(fields[20]?.size()){
		        c.phone2=reformatPhone(fields[20])
	        }
            if(fields[3]?.size()){
                c.email=fields[3]
            }

            c.save(failOnError:true)

    }
    index++

    //println fields
}

