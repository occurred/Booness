
<%@ page import="fr.booness.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="product.list" default="Product List" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="product.new" default="New Product" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="product.list" default="Product List" /></h1>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	    <g:sortableColumn property="id" title="Id" titleKey="product.id" />
                        
                   	    <g:sortableColumn property="name" title="Name" titleKey="product.name" />
                        
                   	    <g:sortableColumn property="description" title="Description" titleKey="product.description" />
                        
                   	    <g:sortableColumn property="photo" title="Photo" titleKey="product.photo" />
                        
                   	    <g:sortableColumn property="price" title="Price" titleKey="product.price" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productInstanceList}" status="i" var="productInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: productInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "description")}</td>
                        
                            <td><img alt="${fieldValue(bean: productInstance, field: "name")}" width="200px" src="<g:createLink controller='product' action='renderImage' id='${productInstance.id}'/>"/></td>
                        
                            <td>${fieldValue(bean: productInstance, field: "price")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
