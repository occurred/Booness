
<%@ page import="fr.booness.StoredFile" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'storedFile.label', default: 'StoredFile')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'storedFile.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'storedFile.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="path" title="${message(code: 'storedFile.path.label', default: 'Path')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${storedFileInstanceList}" status="i" var="storedFileInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${storedFileInstance.id}">${fieldValue(bean: storedFileInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: storedFileInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: storedFileInstance, field: "path")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${storedFileInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
