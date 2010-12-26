

<%@ page import="fr.booness.Profile" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="show" action="show"><g:message code="default.show.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${profileInstance}">
            <div class="errors">
                <g:renderErrors bean="${profileInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${profileInstance?.id}" />
                <g:hiddenField name="version" value="${profileInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="profile.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${profileInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="profile.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${profileInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telephone"><g:message code="profile.telephone.label" default="Telephone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'telephone', 'errors')}">
                                    <g:textField name="telephone" value="${profileInstance?.telephone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bio"><g:message code="profile.bio.label" default="Bio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'bio', 'errors')}">
                                    <g:textArea name="bio" cols="40" rows="5" value="${profileInstance?.bio}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
