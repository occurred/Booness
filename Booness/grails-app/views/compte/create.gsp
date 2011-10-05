
<%@ page import="fr.booness.Compte" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="compte.create" default="Create Compte" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="compte.create" default="Create Compte" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${compteInstance}">
            <div class="errors">
                <g:renderErrors bean="${compteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        <style>
                        input {
                        width:100%;
                        }
                        </style>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="compte.name" default="Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${compteInstance?.name}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="compte.type" default="Type" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'type', 'errors')}">
                                    <g:select name="type.id" from="${fr.booness.param.CompteType.list()}" optionKey="id" value="${fr.booness.param.CompteType.findByName('Autre')?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="compte.email" default="Email" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${compteInstance?.email}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="website"><g:message code="compte.website" default="Website" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'website', 'errors')}">
                                    <g:textField name="website" value="${compteInstance?.website}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone"><g:message code="compte.phone" default="Phone" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'phone', 'errors')}">
                                    <g:textField name="phone" value="${compteInstance?.phone}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone2"><g:message code="compte.phone2" default="Phone2" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'phone2', 'errors')}">
                                    <g:textField name="phone2" value="${compteInstance?.phone2}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fax"><g:message code="compte.fax" default="Fax" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'fax', 'errors')}">
                                    <g:textField name="fax" value="${compteInstance?.fax}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="street"><g:message code="compte.street" default="Street" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'street', 'errors')}">
                                    <g:textField name="street" value="${compteInstance?.street}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="extra"><g:message code="compte.extra" default="Extra" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'extra', 'errors')}">
                                    <g:textField name="extra" value="${compteInstance?.extra}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zip"><g:message code="compte.zip" default="Zip" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'zip', 'errors')}">
                                    <g:textField name="zip" value="${compteInstance?.zip}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="compte.city" default="City" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${compteInstance?.city}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country"><g:message code="compte.country" default="Country" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'country', 'errors')}">
                                    <g:select name="country" from="${compteInstance.constraints.country.inList}" value="${compteInstance.country}" valueMessagePrefix="compte.country"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="compte.description" default="Description" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: compteInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" height="300" value="${compteInstance?.description}" />

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
