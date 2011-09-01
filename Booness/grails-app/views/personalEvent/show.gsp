
<%@ page import="fr.booness.Event" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>${eventInstance.type} - ${eventInstance.title}</title>
    </head>
    <body>
    <h1>${eventInstance.title} [<a href="${createLink(action:'edit', id:eventInstance.id)}">Editer</a>]</h1>
    <h2>${eventInstance.startDate.toString().split(" ")[0]} <%if(!eventInstance.allday){%> de ${eventInstance.startDate.toString().split(" ")[1].substring(0,5)} a ${eventInstance.endDate.toString().split(" ")[1].substring(0,5)}<%}%></h2>
    <div class="description">
      ${eventInstance.description.decodeHTML()}
    </div>
    </body>
</html>
