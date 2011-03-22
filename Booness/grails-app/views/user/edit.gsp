
<%@ page import="fr.booness.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="user.edit" default="Edit User" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="user.list" default="User List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="user.new" default="New User" /></g:link></span>
        </div>
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
                                    <g:textArea name="bio" rows="5" cols="40" value="${fieldValue(bean: userInstance, field: 'bio')}" />

                                </td>
                            </tr>

                            <sec:ifAllGranted roles="ROLE_ADMIN">

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accountExpired"><g:message code="user.accountExpired" default="Account Expired" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'accountExpired', 'errors')}">
                                    <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accountLocked"><g:message code="user.accountLocked" default="Account Locked" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'accountLocked', 'errors')}">
                                    <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />

                                </td>
                            </tr>

                            </sec:ifAllGranted>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="affaires"><g:message code="user.affaires" default="Affaires" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'affaires', 'errors')}">
                                    
<ul>
<g:each in="${userInstance?.affaires}" var="affaireInstance">
    <li><g:link controller="affaire" action="show" id="${affaireInstance.id}">${affaireInstance?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="affaire" params="['user.id': userInstance?.id]" action="create"><g:message code="affaire.new" default="New Affaire" /></g:link>


                                </td>
                            </tr>

                            <sec:ifAllGranted roles="ROLE_ADMIN">
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="user.enabled" default="Enabled" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${userInstance?.enabled}" />

                                </td>
                            </tr>
                            </sec:ifAllGranted>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="logs"><g:message code="user.logs" default="Logs" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'logs', 'errors')}">
                                    
<ul>
<g:each in="${userInstance?.logs}" var="logInstance">
    <li><g:link controller="log" action="show" id="${logInstance.id}">${logInstance?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="log" params="['user.id': userInstance?.id]" action="create"><g:message code="log.new" default="New Log" /></g:link>


                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwordExpired"><g:message code="user.passwordExpired" default="Password Expired" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'passwordExpired', 'errors')}">
                                    <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authorities"><g:message code="user.authorities" default="Authorities" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'authorities', 'errors')}">
                                    

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
