<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:javascript library="prototype" />
<jq:resources/>
<jqui:resources/>
<script type="text/javascript">
jQuery.noConflict();
</script>
<title>Creer un Devis</title>
<resource:autoComplete skin="default" remote="true" />

</head>
<body>
	<div id="profile" style="width: 700px;">
		<div class="login">
			<g:formRemote name="addProductForm" url="[action:'addProduct']" update="productList">
	  			<label>Ajouter une r&eacute;f&eacute;rence</label>
	  			<br/><br/>
	  			<div id="aligned">
	  				<g:textField style="width:100px;" name="quantity" value="1"/>
					X
	  				<richui:autoComplete style="width:500px;" name="product" action="${createLink(controller:'quote', action:'searchAjax')}" />
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
		<h1>Nom de l'Affaire</h1> 
		<br/><g:field type="text" name="title" value="${session.quote.title}"/>
		<h1>Remises (1, 2, 1 section 12, 2 section 12)</h1>
		<br/>
		<div id="aligned">
		<g:field type="int" style="width:50px;" name="remise1" value="${session.quote.remise1}"/>
		<g:field type="int" style="width:50px;" name="remise2" value="${session.quote.remise2}"/> 
		<g:field type="int" style="width:50px;" name="remise1Section12" value="${session.quote.remise1Section12}"/> 
		<g:field type="int" style="width:50px;" name="remise2Section12" value="${session.quote.remise2Section12}"/> 
		</div>
		
		<h1>Statut</h1>
		<br/>
		<g:select name="status" from="${fr.booness.Quote.constraints.status.inList}"/>
		<h1>Type</h1>
		<br/>
		<g:select name="type" from="${fr.booness.Quote.constraints.type.inList}"/>
		<h1>Date d'execution</h1>
		<br/><g:jqDatePicker name="dateExecution" value="${new Date()}" precision="blob"/>
		<h1>Contact</h1>
		<br/><g:select name="contact.id" from="${fr.booness.Affaire.get(Long.parseLong(params.affaire.id)).compte.contacts}" optionKey="id" value="${session.quote.contact}" />
		<g:hiddenField name="affaire.id" value="${params.affaire.id}"/>
		<div class="buttons">
            <span class="button"><g:actionSubmit class="save" action="save" value="Sauvegarder" /></span>
        </div>
		</g:form>
	</div>
</body>
</html>