
<%@ page import="fr.booness.Log" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="log.list" default="Log List" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="log.list" default="Log List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="title" title="Title" titleKey="log.title" />
                        
                   	    <g:sortableColumn property="type" title="Type" titleKey="log.type" />
                   	    
                   	    <g:sortableColumn property="startDate" title="Date"/>
                        
                   	    <g:sortableColumn property="compte" title="Compte" titleKey="log.compte" />
                        
                   	    <g:sortableColumn property="user" title="User" titleKey="log.user" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${logInstanceList}" status="i" var="logInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${logInstance.id}">${fieldValue(bean: logInstance, field: "title")}</g:link></td>
                        
                            <td>${logInstance.type}</td>
                        
                            <td>${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(logInstance.startDate)}</td>
                        
                            <td>${logInstance.compte}</td>
                        
                            <td>${logInstance.user}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${logInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
