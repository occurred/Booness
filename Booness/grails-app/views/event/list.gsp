
<%@ page import="fr.booness.Event" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="event.list" default="Event List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="event.new" default="New Event" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="event.list" default="Event List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="title" title="Title" titleKey="event.title" />
                        
                   	    <g:sortableColumn property="type" title="Type" titleKey="event.type" />
                        
                   	    <g:sortableColumn property="allday" title="Allday" titleKey="event.allday" />
                        
                   	    <g:sortableColumn property="startDate" title="Start Date" titleKey="event.startDate" />
                        
                   	    <g:sortableColumn property="endDate" title="End Date" titleKey="event.endDate" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${eventInstanceList}" status="i" var="eventInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "title")}</g:link></td>
                        
                            <td>${eventInstance.type}</td>
                        
                            <td><g:formatBoolean boolean="${eventInstance.allday}" /></td>
                        
                            <td><g:formatDate date="${eventInstance.startDate}" /></td>
                        
                            <td><g:formatDate date="${eventInstance.endDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${eventInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
