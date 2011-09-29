
<%@ page import="fr.booness.Contact" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="contact.list" default="Contact List" /></title>
    </head>
    <body>
        <div class="body">
	        <div id="navigation">
	        	<div id="action">
					Trier par 
					<div id="address" style="display: inline-block;"><g:sortableColumn property="name" title="Name" titleKey="contact.name" /></div>
	        		<div id="address" style="display: inline-block;"><g:sortableColumn property="zip" title="Zip" titleKey="contact.zip" />	</div>
	        	</div>
	        </div>
	        <br/><br/>
	        
	        <g:render template="contactcard" collection="${contactInstanceList}" var="contact"/>
	        
            <div class="paginateButtons">
                <g:paginate total="${contactInstanceTotal}" params="${params}" />
            </div>
        </div>
    </body>
</html>
