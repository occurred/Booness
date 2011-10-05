
<%@ page import="fr.booness.Event" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <resource:richTextEditor type="full"/>
        <jq:resources/>
        <jqui:resources/>
        <title><g:message code="event.edit" default="Edit Event" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="event.edit" default="Edit Event" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${eventInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${eventInstance?.id}" />
                <g:hiddenField name="version" value="${eventInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="event.title" default="Title" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${eventInstance?.title}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="event.type" default="Type" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'type', 'errors')}">
                                    <g:select name="type.id" from="${fr.booness.param.LogType.list()}" optionKey="id" value="${eventInstance?.type?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="allday"><g:message code="event.allday" default="Allday" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'allday', 'errors')}">
                                    <g:checkBox name="allday" value="${eventInstance?.allday}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="event.startDate" default="Start Date" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'startDate', 'errors')}">
                                    <g:jqDatePicker name="startDate" value="${eventInstance?.startDate}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="event.endDate" default="End Date" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'endDate', 'errors')}">
                                    <g:jqDatePicker name="endDate" value="${eventInstance?.endDate}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="event.description" default="Description" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'description', 'errors')}">
                                    <richui:richTextEditor name="description" width="600" height="300" value="${eventInstance?.description}" />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'update', 'default': 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
