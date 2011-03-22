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
    <h1>${contactInstance.name} [<a href="${createLink(controller:"contact", action:"edit", id:contactInstance.id)}"><g:message code="edit"/></a>]</h1>
    <p><b><g:message code="contact.post"/></b> : ${contactInstance.post}</p>
    <p><b><g:message code="contact.email"/></b> : ${contactInstance.email}</p>
    <p><b><g:message code="contact.telephone"/></b> : ${contactInstance.telephone}</p>
    <p><b>Description</b><br/>${contactInstance.description}</p>
    <p><b><g:message code="contact.address"/></b></p><div>${contactInstance.street}<br/>${contactInstance.extra}<br/>${contactInstance.zip} ${contactInstance.city}</div>

    <iframe width="600" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=fr&amp;mrt=loc&amp;geocode=&amp;q=${contactInstance.street}+${contactInstance.zip}+${contactInstance.city}+${contactInstance.country}&amp;ie=UTF8&amp;z=14&amp;output=embed"></iframe>
  </body>
</html>
