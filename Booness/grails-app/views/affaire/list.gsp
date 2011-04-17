
<%@ page import="fr.booness.Affaire" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="affaire.list" default="Affaire List" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="affaire.list" default="Affaire List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="name" title="Name" titleKey="affaire.name" />
                        
                   	    <g:sortableColumn property="archived" title="Archived" titleKey="affaire.archived" />
                        
                   	    <g:sortableColumn property="compte" title="Compte" titleKey="affaire.compte" />
                        
                   	    <g:sortableColumn property="owner" title="Owner" titleKey="affaire.owner" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${affaireInstanceList}" status="i" var="affaireInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${affaireInstance.id}">${fieldValue(bean: affaireInstance, field: "name")}</g:link></td>
                        
                            <td><g:formatBoolean boolean="${affaireInstance.archived}" /></td>
                        
                            <td>${affaireInstance.compte}</td>
                        
                            <td>${affaireInstance.owner}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${affaireInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
