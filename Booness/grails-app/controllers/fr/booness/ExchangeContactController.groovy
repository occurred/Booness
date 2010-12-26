package fr.booness

import groovyx.net.ws.WSClient
import org.apache.cxf.service.model.BindingOperationInfo;


class ExchangeContactController {
	static WSClient ws=null
	def index = {
		if(ws==null){
			Map mapClient=[
						"https.truststore":"/usr/share/java/jdk/jre/lib/security/jssecacerts",
						"https.truststore.pass":"changeit",
						"https.keystore":"/usr/share/java/jdk/jre/lib/security/cacerts",
						"https.keystore.pass":"changeit"
					]
			
			ws=new WSClient("file:/home/ubuntu/NetBeansProjects/Booness/Services.wsdl", this.class.classLoader)
			ws.setSSLProperties(mapClient)
			
			
			ws.initialize()
		}
		def fi='''
    <FindItem xmlns="http://schemas.microsoft.com/exchange/services/2006/messages"
               xmlns:t="http://schemas.microsoft.com/exchange/services/2006/types"
              Traversal="Shallow">
      <ItemShape>
        <t:BaseShape>AllProperties</t:BaseShape>
      </ItemShape>
      <ParentFolderIds>
        <t:DistinguishedFolderId Id="inbox"/>
      </ParentFolderIds>
    </FindItem>
'''
		def findItem = createMessage("FindItemType")
		findItem.traversal=createStaticType("ItemQueryTraversalType").fromValue("Shallow")
		def itemShape = createType("ItemResponseShapeType") 
		itemShape.baseShape=createStaticType("DefaultShapeNamesType").fromValue("IdOnly")
		def parentFolderIds=createType("NonEmptyArrayOfBaseFolderIdsType")
		//System.out.println itemShape.getClass().methods
		def dfi=createType("DistinguishedFolderIdType")
		dfi.setId(createStaticType("DistinguishedFolderIdNameType").fromValue("inbox"))
		parentFolderIds.folderIdOrDistinguishedFolderId.add(dfi)
		
		findItem.parentFolderIds=parentFolderIds
		findItem.itemShape=itemShape
                
                def response=ws.client.invoke("FindItem", findItem)[0].responseMessages.createItemResponseMessageOrDeleteItemResponseMessageOrGetItemResponseMessage[0].getValue()
		render response.rootFolder.items
		
	}
	
	private Object createMessage(String type){
		return Thread.currentThread().getContextClassLoader().loadClass("com.microsoft.schemas.exchange.services._2006.messages."+type).newInstance()
	}
	
	private Object createType(String type){
		return Thread.currentThread().getContextClassLoader().loadClass("com.microsoft.schemas.exchange.services._2006.types."+type).newInstance()
	}
	
	private Object createStaticType(String type){
		return Thread.currentThread().getContextClassLoader().loadClass("com.microsoft.schemas.exchange.services._2006.types."+type)
	}
}
