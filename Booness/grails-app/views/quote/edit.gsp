<%@page import="fr.booness.Quote"%>
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
				<button style="padding: 10px;"  title="Ajouter" name="ajouter">Ajouter</button>
			</g:formRemote>
		</div>

		<br/>
		<div id="productList">
			<g:render template="productList" collection="${session.quote.products}" var="product"></g:render>
		</div>
		<br/>
		<g:form>
		<g:hiddenField type="text" name="title" value="Devis"/>
		<div class="list">
		<table style="table-layout: fixed;">
			<thead>
				<tr>
					<th>Remise 1</th>
					<th>Remise 2</th>
					<th>Section 12 Remise 1</th>
					<th>Section 12 Remise 2</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><g:field style="width:100%;" type="int" style="width:50px;" name="remise1" value="${session.quote.remise1}"/></td>
					<td><g:field type="int" style="width:50px;" name="remise2" value="${session.quote.remise2}"/></td>
					<td><g:field type="int" style="width:50px;" name="remise1" value="${session.quote.remise1Section12}"/></td>
					<td><g:field type="int" style="width:50px;" name="remise1" value="${session.quote.remise2Section12}"/></td>
				</tr>
			</tbody>
		</table>
		</div>
		<h1>Statut</h1>
		<br/>
		<g:select name="status" from="${fr.booness.Quote.constraints.status.inList}"/>
		<h1>Type</h1>
		<br/>
		<g:select name="type" from="${fr.booness.Quote.constraints.type.inList}"/>
		<h1>Date d'execution</h1>
		<br/><g:jqDatePicker name="dateExecution" value="${session.quote.dateExecution}" precision="blob"/>
		<h1>Contact</h1>
		<br/><g:select name="contact.id" from="${session.quote.affaire.compte.contacts}" optionKey="id" value="${session.quote.contact?.id}" />
		<g:hiddenField name="affaire.id" value="${session.quote.affaire.id}"/>
		<div class="buttons">
            <span class="button"><g:actionSubmit class="update" action="update" value="Mettre &agrave; Jour" /></span>
        </div>
		</g:form>
	</div>
</body>
</html>