
<%@ page import="fr.booness.Departement" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>${departementInstance.name}</title>
    </head>
    <body>
    <h1>${departementInstance.name} [<a href="${createLink(action:'edit', id:departementInstance.id)}">Editer</a>]</h1>
    <%
    def count=fr.booness.Compte.withCriteria{
            projections {
                count('id')
            }
            like("zip",departementInstance.numero+"%")
        }[0]
    %>
    Commercial referent : ${departementInstance.user?.name} <br/>

    Il y a ${count} compte(s) dans ce departement [<a href="${createLink(controller:'compte', action:'list', params:['departementid':departementInstance.id])}">Voir</a>]
    </body>
</html>
