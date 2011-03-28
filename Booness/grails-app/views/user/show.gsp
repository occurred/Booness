
<%@ page import="fr.booness.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="user.show" default="Show User" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="user.show" default="Show User" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${userInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.id" default="Id" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "id")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.username" default="Username" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.password" default="Password" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "password")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.name" default="Name" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "name")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.initiales" default="Initiales" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "initiales")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.email" default="Email" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.telephone" default="Telephone" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "telephone")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.bio" default="Bio" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "bio")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.accountExpired" default="Account Expired" />:</td>
                                
                                <td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.accountLocked" default="Account Locked" />:</td>
                                
                                <td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.affaires" default="Affaires" />:</td>
                                
                                <td  valign="top" style="text-align: left;" class="value">
                                    <ul>
                                    <g:each in="${userInstance?.affaires}" var="affaireInstance">
                                        <li><g:link controller="affaire" action="show" id="${affaireInstance.id}">${affaireInstance.encodeAsHTML()}</g:link></li>
                                    </g:each>
                                    </ul>
                                </td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.enabled" default="Enabled" />:</td>
                                
                                <td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.enabled}" /></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.logs" default="Logs" />:</td>
                                
                                <td  valign="top" style="text-align: left;" class="value">
                                    <ul>
                                    <g:each in="${userInstance?.logs}" var="logInstance">
                                        <li><g:link controller="log" action="show" id="${logInstance.id}">${logInstance.encodeAsHTML()}</g:link></li>
                                    </g:each>
                                    </ul>
                                </td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.passwordExpired" default="Password Expired" />:</td>
                                
                                <td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="user.authorities" default="Authorities" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: userInstance, field: "authorities")}</td>
                                
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
