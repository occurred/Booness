
<%@ page import="fr.booness.Contact"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="contact.edit" default="Edit Contact" />
</title>

</head>
<body>
	<div class="body">
		<g:form action="save" method="post">
			<g:hiddenField name="id" value="${contactInstance?.id}" />
			<g:select name="compteid" from="${fr.booness.Compte.list()}" optionKey="id" value="${contactInstance?.compte}"/>
			
			<div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="linkToCompte" value="${message(code: 'update', 'default': 'Update')}" /></span>
                </div>
		</g:form>
	</div>
</body>
</html>
