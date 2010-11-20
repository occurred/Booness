package fr.booness

import groovyx.net.ws.WSClient


class ExchangeContactController {

    def index = {
        Map mapClient=[
                        "https.truststore":"/usr/share/java/jdk/jre/lib/security/jssecacerts",
                        "https.truststore.pass":"changeit",
                        "https.keystore":"/usr/share/java/jdk/jre/lib/security/cacerts",
                        "https.keystore.pass":"changeit"
        ]

        def proxy=new WSClient("https://mail.idoine-intranet.ch:443/ews/services.wsdl", this.class.classLoader)
        proxy.setSSLProperties(mapClient)
        //proxy.setConnectionTimeout(10000)
        proxy.setBasicAuthentication("","")
        System.out.println proxy
        proxy.initialize()
        
    }
}
