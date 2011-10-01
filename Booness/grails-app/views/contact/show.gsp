<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta content="main" name="layout"/>
    <title>${contactInstance.name}</title>

  </head>
  <body>
  <div id="profile" style="font-size: large;width: 350px;">
<div id="action">
		<a href="${createLink(controller:'contact', action:'edit', id:contactInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
</div>
	
	${contactInstance.name} <span class="small">${contactInstance.post} </span><br/>
	<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'telephone.png', plugin: 'famfamfam')}'/>
	 ${contactInstance.telephone}
	 <br/>
	 
	 <img id="famfamfam" src='${resource(dir: 'images/icons', file: 'phone.png', plugin: 'famfamfam')}'/>
	 ${contactInstance.mobile}
	 <br/> 
	 
	 <img id="famfamfam" src='${resource(dir: 'images/icons', file: 'printer.png', plugin: 'famfamfam')}'/>
	 ${contactInstance.fax}
	 <br/>
	 
	 <img id="famfamfam" src='${resource(dir: 'images/icons', file: 'email.png', plugin: 'famfamfam')}'/>
	<a href="mailto:${contactInstance.email}">${contactInstance.email}</a><br/>
	<div style="text-align: center;">
	<g:if test="${contactInstance.compte}"><g:render template="/compte/comptecard" model="${[compte:contactInstance.compte]}"></g:render></g:if>
	<g:else>
	<div id="address"><a href="${createLink(action:'linkToCompte', id:contactInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'add.png', plugin: 'famfamfam')}'/>Associer un compte</a></div>
	</g:else>
	<div id="address" style="text-align: left">${contactInstance.description.replaceAll('\n','<br/>')}</div>
	</div>
</div>



   
   </body>
</html>
