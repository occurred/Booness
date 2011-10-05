
<%@ page import="fr.booness.Event" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <jq:resources/>
        <jqui:resources/>
        <title>&Eacute;v&eacute;nement Personel</title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${eventInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="personalEvent.title" default="Title" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${eventInstance?.title}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="allday"><g:message code="personalEvent.allday" default="Allday" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'allday', 'errors')}">
                                    <g:checkBox name="allday" value="${eventInstance?.allday}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="restricted"><g:message code="personalEvent.restricted" default="Priv&eacute;" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'restricted', 'errors')}">
                                    <g:checkBox name="restricted" value="${eventInstance?.restricted}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate"><g:message code="personalEvent.startDate" default="Start Date" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'startDate', 'errors')}">
                                    <g:jqDatePicker name="startDate" value="${eventInstance?.startDate}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate"><g:message code="personalEvent.endDate" default="End Date" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'endDate', 'errors')}">
                                    <g:jqDatePicker name="endDate" value="${eventInstance?.endDate}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="personalEvent.description" default="Description" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" width="600" height="300" value="${eventInstance?.description}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'create', 'default': 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
