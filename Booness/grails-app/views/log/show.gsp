<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <title>${logInstance.title}</title>
    <meta content="main" name="layout"/>
  </head>
  <body>
    <h1>Compte : <a href="${createLink(controller:'compte', action:'show', id:logInstance.compte.id)}">${logInstance.compte.name}</a></h1><h1>${logInstance.title} [<a href="${createLink(action:'edit', id:logInstance.id)}">Editer</a>]</h1>
    <h2>${logInstance.startDate.toString().split(" ")[0]} <%if(!logInstance.allday){%> de ${logInstance.startDate.toString().split(" ")[1].substring(0,5)} a ${logInstance.endDate.toString().split(" ")[1].substring(0,5)}<%}%></h2>
    <div class="description">
      ${logInstance.description.decodeHTML()}
    </div>
  </body>
</html>
