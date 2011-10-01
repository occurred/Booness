
<%@ page import="fr.booness.Affaire" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <resource:richTextEditor type="full"/>
        <jq:resources/>
        <jqui:resources/>
        <title><g:message code="affaire.edit" default="Edit Affaire" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="affaire.edit" default="Edit Affaire" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:hasErrors bean="${affaireInstance}">
            <div class="errors">
                <g:renderErrors bean="${affaireInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${affaireInstance?.id}" />
                <g:hiddenField name="version" value="${affaireInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="affaire.name" default="Name" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: affaireInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${affaireInstance?.name}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="affaire.description" default="Description" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: affaireInstance, field: 'description', 'errors')}">
                                    <richui:richTextEditor name="description" width="600" height="300" value="${affaireInstance?.description}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="archived"><g:message code="affaire.archived" default="Archived" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: affaireInstance, field: 'archived', 'errors')}">
                                    <g:checkBox name="archived" value="${affaireInstance?.archived}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="compte"><g:message code="affaire.compte" default="Compte" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: affaireInstance, field: 'compte', 'errors')}">
                                    <g:select name="compte.id" from="${fr.booness.Compte.list()}" optionKey="id" value="${affaireInstance?.compte?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="owner"><g:message code="affaire.owner" default="Owner" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: affaireInstance, field: 'owner', 'errors')}">
                                    <g:select name="owner.id" from="${fr.booness.User.list()}" optionKey="id" value="${affaireInstance?.owner?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quotes"><g:message code="affaire.quotes" default="Quotes" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: affaireInstance, field: 'quotes', 'errors')}">
                                    
<ul>
<g:each in="${affaireInstance?.quotes}" var="quoteInstance">
    <li><g:link controller="quote" action="show" id="${quoteInstance.id}">${quoteInstance?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="quote" params="['affaire.id': affaireInstance?.id]" action="create"><g:message code="quote.new" default="New Quote" /></g:link>


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
