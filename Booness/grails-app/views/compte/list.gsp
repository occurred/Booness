
<%@ page import="fr.booness.Compte" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="compte.list" default="Compte List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="compte.new" default="New Compte" /></g:link></span>
        </div>
        <div class="body">
            <g:if test="${!params.full}"><h1>Liste de mes comptes [<a href="${createLink(action:'list', params:[full:"1"])}">Voir tous les comptes</a>]</h1></g:if>
            <g:else><h1>Liste de tous les comptes [<a href="${createLink(action:'list')}">Voir mes comptes</a>]</h1></g:else>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="name" title="Name" titleKey="compte.name" />
                        
                   	    <g:sortableColumn property="type" title="Type" titleKey="compte.type" />
                        
                   	    <g:sortableColumn property="phone" title="Phone" titleKey="compte.phone" />
                        
                   	    <g:sortableColumn property="zip" title="Zip" titleKey="compte.zip" />
                        
                   	    <g:sortableColumn property="city" title="City" titleKey="compte.city" />
                        
                   	    <g:sortableColumn property="logs" title="Logs" titleKey="compte.logs" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${compteInstanceList}" status="i" var="compteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${compteInstance.id}">${fieldValue(bean: compteInstance, field: "name")}</g:link></td>
                        
                            <td>${compteInstance.type}</td>
                        
                            <td>${compteInstance.phone}</td>
                        
                            <td>${compteInstance.zip}</td>
                        
                            <td>${compteInstance.city}</td>
                        
                            <td>${compteInstance.logs.size()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${compteInstanceTotal}" params="${params}" />
            </div>
        </div>
    </body>
</html>
