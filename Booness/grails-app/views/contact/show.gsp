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
    <p><g:message code="email"/> : ${contactInstance.email}</p>
    <p><g:message code="phone"/> : ${contactInstance.telephone}</p>
    <p>Description : ${contactInstance.description}</p>
    <iframe width="600" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=${contactInstance.street}+${contactInstance.zip}+${contactInstance.city}+${contactInstance.country}&amp;ie=UTF8&amp;z=14&amp;output=embed"></iframe><br /><small><a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=${contactInstance.street}+${contactInstance.zip}+${contactInstance.city}+${contactInstance.country}&amp;ie=UTF8&amp;z=14" style="color:#0000FF;text-align:left">View Larger Map</a></small>
  </body>
</html>
