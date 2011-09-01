
import fr.booness.*
import java.text.SimpleDateFormat
import javax.swing.text.rtf.RTFEditorKit
import javax.swing.text.*

def ltypes=[
			1:"VISITE",
			2:"SUIVI",
			3:"RELANCE",
			4:"SAISIE FRAIS",
			5:"VACANCES",
			6:"PRISE DE RENDEZ-VOUS"
		]



ltypes.each{k,v->
	def lt=fr.booness.param.LogType.get((Long)k)
	if(lt){
		lt.name=v
		lt.save()
	}
	else new fr.booness.param.LogType(name:v).save()
}

def atcom=[:]
def ac=new File('scripts/activite-compte.txt')
ac.splitEachLine(';') {fields ->
	atcom[fields[0]]=fields[1]
}
def vacances=fr.booness.param.LogType.findByName("VACANCES")
def df=new SimpleDateFormat("MM/dd/yyyy HH:mm:ss a")
def activites=new File('scripts/activites.txt')
println activites.absolutePath
long index=1
activites.splitEachLine('<;>') {fields ->
	println index
    if(fields[0].size()==0){
		println "no more rows after "+index+"\n end of script"
		System.exit(0)
	}
    while(index<Long.parseLong(fields[0])){
        def log=new Log(title:"to-delete", objectif:"description", type:vacances, description:"", startDate:new Date(), endDate:new Date(), allday:true)
        def compte=Compte.get(3) //modele
        def user =User.get(1) //jeanpierre
        compte.addToLogs(log)
        user.addToLogs(log)
        log.save(failOnError:true)
        index++
    }
	if(!Log.get(index)){
		def compteId=fields[25]
		def userId=fields[3]
		def date=fields[5].split(" ")[0]
        def ttemp=fields[9].split(" ")
		def timeStart=ttemp[1]+" "+ttemp[2]
        ttemp=fields[10].split(" ")
		def timeStop=ttemp[1]+" "+ttemp[2]
        println date+" "+timeStart+"->"+df.parse(date+" "+timeStart).toString()
		Boolean allday=timeStart.startsWith("12:00:00 AM") && timeStop.startsWith("12:00:00 AM")

		//println userId

		def compte=null
		if(atcom[""+index]!=null){
			compte=Compte.get(Long.parseLong(atcom[""+index]))
		}
		else compte=Compte.get(3) //modele
		def user=User.get(Long.parseLong(userId))
		println compte
		println user

		def objectif=fields[19]
		/* if the description is a rtf doc ie starts with "{\rtf1" then extract text from it*/
		if(objectif.startsWith("{")){
			RTFEditorKit kit = new RTFEditorKit()
			Document doc = kit.createDefaultDocument()
			kit.read(new ByteArrayInputStream(objectif.getBytes()) , doc, 0)
			objectif = doc.getText(0, doc.getLength())
		}

		objectif = objectif.replaceAll("\n","<br/>")

		def description = fields[12].replaceAll("%;%","<br/>")
        if(objectif==null || objectif.size()==0) objectif=fr.booness.param.LogType.get(Long.parseLong(fields[2])).name
		def log=new Log(title:objectif.size()<128?objectif:fr.booness.param.LogType.get(Long.parseLong(fields[2])).name, objectif:description, type:fr.booness.param.LogType.get(Long.parseLong(fields[2])), description:objectif, startDate:df.parse(date+" "+timeStart), endDate:df.parse(date+" "+timeStop), allday:allday)
		compte.addToLogs(log)
		user.addToLogs(log)
		log.save(failOnError:true)
	}
	index++
}

