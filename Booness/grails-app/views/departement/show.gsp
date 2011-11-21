<%@ page import="fr.booness.Departement" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>${departementInstance.name}</title>
    </head>
    <body>
    <% def cl=fr.booness.Compte.findAllByZipLike(departementInstance.numero+"%") %>
    <table>
    <tr>
    <td valign="top">
    <div style="display: inline-block;position: fixed;" >
    	<h1>${departementInstance.name} [<a href="${createLink(action:'edit', id:departementInstance.id)}">Editer</a>]</h1>
    	<h3>Commercial : <b>${departementInstance.user?.name}</b> </h3>
    	<h3>${cl.size()} compte(s) [<a href="${createLink(controller:'compte', action:'list', params:['departementid':departementInstance.numero])}">Voir</a>]</h3>
    	<img width='400' alt='${departementInstance.name}' src='http://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/${departementInstance.name.replaceAll(" ","_")}-Position.svg/500px-${departementInstance.name.replaceAll(" ","_")}-Position.svg.png'/>
    </div>
    <div style="display: inline-block;width:400px;height:500px;"></div>
    </td>
    <td>
    <div style="display: inline-block;width:100%;" >
    	<g:render template="/compte/list" model="${[compteInstanceList:cl]}"/>
    </div>
    </td>
    </tr>
    </table>
    </body>
</html>
