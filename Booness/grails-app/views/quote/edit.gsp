<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:javascript library="prototype" />
<title>Creer un Devis</title>
<resource:autoComplete skin="default" remote="true" />

</head>
<body>
	<div id="profile" style="width: 700px;">
		<div class="login">
			<g:formRemote name="addProductForm" url="[action:'addProduct']" update="productList">
	  			<label>Ajouter une r&eacute;f&eacute;rence</label>
	  			<br/><br/>
	  			<div style="display:inline;">
	  				<richui:autoComplete style="width:500px;" name="product" action="${createLink(controller:'quote', action:'searchAjax')}" />
					<g:textField name="quantity" value="1"/>
				</div>
				<br/>
				<br/>
				<button style="padding: 10px;"  title="Ajouter" name="ajouter">Ajouter</button>
			</g:formRemote>
		</div>

		<br/>
		<div id="productList">
			<g:render template="productList" collection="${session.quote.products}" var="product"></g:render>
		</div>
		
		<g:form>
		Titre <g:field type="text" name="title" value="${session.quote.title}"/>
		Contact <g:select name="contact.id" from="${session.quote.affaire.compte.contacts}" optionKey="id" value="${session.quote.contact?.id}" />
		<g:hiddenField name="affaire.id" value="${session.quote.affaire.id}"/>
		<div class="buttons">
            <span class="button"><g:actionSubmit class="update" action="update" value="Mettre &agrave; Jour" /></span>
        </div>
		</g:form>
	</div>
</body>
</html>