package booness

import fr.booness.*
import java.text.SimpleDateFormat
import java.io.*

class MailService {

    static transactional = true
    String descriptionSeparator = "@description@"
    String compteSeparator = "@compte@"
    String logSeparator = "@log@"
    SimpleDateFormat dfz = new SimpleDateFormat("yyyyMMdd'T'hhmmss'Z'")
    SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd'T'hhmmss")

    def parseCompte(mail) {
        //println mail

        println mail.count
        def parent = mail.parent
        def from=parent.from[0].address
        def subject = parent.subject
        User user=User.findByEmail(from)
        if(!user) return
        println user
        Log log=new Log(title:subject, description:"description", startDate:new Date(), endDate:new Date(System.currentTimeMillis()+3600000), allday:true)

        for(int i=0;i<mail.count;i++){
        
            def content=mail.getBodyPart(i)
            println content.contentType
            if(content.contentType.startsWith("multipart/ALTERNATIVE")){
                content=readString(content.getContentStream())
                Compte compte=extractCompteFromBody(content)

                println compte
                if(user && compte){
                    log.title=subject
                    log.description=extractDescriptionFromBody(content)
                    println log
                    compte.addToLogs(log)
                    user.addToLogs(log)
                }
            }
            if(content.contentType.startsWith("TEXT/PLAIN")){

                content.allHeaders.each{
                    println it.name
                    println it.value
                }
               
            
                println from
                println subject

                Compte compte=extractCompteFromBody(content.content)

                println compte
                if(user && compte){
                    log.title=subject
                    log.description=extractDescriptionFromBody(content.content)
                    println log
                    compte.addToLogs(log)
                    user.addToLogs(log)
                }
            }
            else if(content.getContentType().startsWith("TEXT/CALENDAR")){
                def cal=readString(content.content)
                //if(true) cal=cal.decodeBase64()
                //println cal
                boolean parse=false;
                cal.split("\n").each{line->
                    println line
                    if(line.startsWith("BEGIN:VEVENT")){
                        parse=true
                    }
                    else if(line.startsWith("END:VEVENT")){
                        parse=false
                    }
                    if(parse){
                        def val=line.split(":")
                        if(val.length==2){
                        
                            if(val[0].startsWith("DTSTART")){
                                log.startDate=val[1].endsWith("Z")?dfz.parse(val[1]):df.parse(val[1])
                            }
                            else if(val[0].startsWith("DTEND")){
                                log.endDate=val[1].endsWith("Z")?dfz.parse(val[1]):df.parse(val[1])
                            }
                        }
                    }
                    log.allday=false
                }
            }
        }
        log.save()
    }

    private String extractDescriptionFromBody(String body){
        String[] temp=body.split(descriptionSeparator);
        if(temp.length!=3) return ""
        else return temp[1]
    }

    private String extractTitleFromBody(String body){
       ""
    }

    private Compte extractCompteFromBody(String body){
        String[] temp=body.split(compteSeparator);
        if(temp.length<2) return null
        else return Compte.get(Long.parseLong(temp[1]))
    }

    private Log extractLogFromBody(String body){
        String[] temp=body.split(logSeparator);
        if(temp.length!=3) return null
        else return Log.get(Long.parseLong(temp[1]))
    }

    private String readString(InputStream ir){
        final char[] buffer = new char[0x10000]
        StringBuilder out = new StringBuilder()
        Reader r = new InputStreamReader(ir, "UTF-8")
        int read=r.read(buffer, 0, buffer.length)
        while(read>0) {
            out.append(buffer, 0, read);
            read = r.read(buffer, 0, buffer.length)
        }
        return out.toString()
    }
}
