
<%@ page import="fr.booness.Contact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="contact.list" default="Contact List" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="contact.list" default="Contact List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="name" title="Name" titleKey="contact.name" />
                        
                   	    <g:sortableColumn property="telephone" title="Telephone" titleKey="contact.telephone" />
                        
                   	    <g:sortableColumn property="mobile" title="Mobile" titleKey="contact.mobile" />
                        
                   	    <g:sortableColumn property="fax" title="Fax" titleKey="contact.fax" />
                        
                   	    <g:sortableColumn property="zip" title="Zip" titleKey="contact.zip" />
                        
                   	    <g:sortableColumn property="city" title="City" titleKey="contact.city" />
                        
                   	    <g:sortableColumn property="compte" title="Compte" titleKey="contact.compte" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contactInstanceList}" status="i" var="contactInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${contactInstance.id}">${fieldValue(bean: contactInstance, field: "name")}</g:link></td>
                        
                            <td>${fieldValue(bean: contactInstance, field: "telephone")}</td>
                        
                            <td>${fieldValue(bean: contactInstance, field: "mobile")}</td>
                        
                            <td>${fieldValue(bean: contactInstance, field: "fax")}</td>
                        
                            <td>${fieldValue(bean: contactInstance, field: "zip")}</td>
                        
                            <td>${fieldValue(bean: contactInstance, field: "city")}</td>
                        
                            <td>${fieldValue(bean: contactInstance, field: "compte")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${contactInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
