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
    <p><g:message code="contact.post"/> : ${contactInstance.post}</p>
    <p><g:message code="contact.email"/> : ${contactInstance.email}</p>
    <p><g:message code="contact.telephone"/> : ${contactInstance.telephone}</p>
    <p>Description : ${contactInstance.description}</p>
    <iframe width="600" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=fr&amp;mrt=loc&amp;geocode=&amp;q=${contactInstance.street}+${contactInstance.zip}+${contactInstance.city}+${contactInstance.country}&amp;ie=UTF8&amp;z=14&amp;output=embed"></iframe>
  </body>
</html>
