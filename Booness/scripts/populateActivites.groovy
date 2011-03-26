
import fr.booness.*
import java.text.SimpleDateFormat
import javax.swing.text.rtf.RTFEditorKit
import javax.swing.text.*

def df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.sss")
def activites=new File('scripts/activites.txt')
println activites.absolutePath
activites.splitEachLine('<;>') {fields ->
    //println fields
    def compteId=fields[25]
    def userId=fields[3]
    def date=fields[5].split(" ")[0]
    def timeStart=fields[9].split(" ")[1]
    def timeStop=fields[10].split(" ")[1]
    def allday=timeStart.startsWith("00:00")

    //println userId
    def compte=Compte.get(Long.parseLong(compteId))
    def user=User.get(Long.parseLong(userId))
    println compte
    println user

    def description=fields[19]
    /* if the description is a rtf doc ie starts with "{\rtf1" then extract text from it*/
    if(description.startsWith("{")){
        RTFEditorKit kit = new RTFEditorKit()
        Document doc = kit.createDefaultDocument()
        kit.read(new ByteArrayInputStream(description.getBytes()) , doc, 0)
        description = doc.getText(0, doc.getLength())
    }

    description = description.replaceAll("\n","<br/>")

    def log=new Log(title:"Visite", description:description, startDate:df.parse(date+" "+timeStart), endDate:df.parse(date+" "+timeStop), allday:allday)
    compte.addToLogs(log)
    user.addToLogs(log)
    log.save()
}
