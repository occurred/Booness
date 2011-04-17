
<%@ page import="fr.booness.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <resource:richTextEditor type="full"/>
        <title><g:message code="user.edit" default="Edit User" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="user.edit" default="Edit User" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${userInstance?.id}" />
                <g:hiddenField name="version" value="${userInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="user.username" default="Username" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${fieldValue(bean: userInstance, field: 'username')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="user.name" default="Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${fieldValue(bean: userInstance, field: 'name')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="initiales"><g:message code="user.initiales" default="Initiales" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'initiales', 'errors')}">
                                    <g:textField name="initiales" maxlength="2" value="${fieldValue(bean: userInstance, field: 'initiales')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="user.email" default="Email" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${fieldValue(bean: userInstance, field: 'email')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telephone"><g:message code="user.telephone" default="Telephone" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'telephone', 'errors')}">
                                    <g:textField name="telephone" value="${fieldValue(bean: userInstance, field: 'telephone')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bio"><g:message code="user.bio" default="Bio" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'bio', 'errors')}">
                                    <richui:richTextEditor name="bio" width="600" height="300" value="${userInstance.bio}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="token"><g:message code="user.token" default="Token" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'token', 'errors')}">
                                    <g:textField name="token" value="${fieldValue(bean: userInstance, field: 'token')}" />

                                </td>
                            </tr>
                  
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'update', 'default': 'Update')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
