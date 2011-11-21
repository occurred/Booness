<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>${quoteInstance.title}</title>
</head>
<body>
<div id="header">
Offre de Prix <g:link controller="affaire" action="show" id="${quoteInstance.affaire.id}">${quoteInstance.affaire.name}</g:link>
<div id="action">
			<a href="${createLink(action:'edit', id:quoteInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
			<a target="_blank" href="${createLink(action:'printPdf', id:quoteInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'printer.png', plugin: 'famfamfam')}'/></a>
			<a href="${createLink(action:'delete', id:quoteInstance.id)}" onclick="return alert('Etes-vous sur de supprimer ce devis? Il ne sera pas possible de retourner en arriere...');"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'cancel.png', plugin: 'famfamfam')}'/></a>
</div>
</div>
  <div class="body">
  	<div id="rightCol">
  		<g:render template="/compte/compte" model="${[compte:quoteInstance.affaire.compte]}"></g:render>
  		<br/>
  		<g:render template="/compte/contact" model="${[contact:quoteInstance.contact]}"></g:render>
  		<br/>
  		<div id="address">
	  		<p>Date : ${java.text.DateFormat.getDateInstance(java.text.DateFormat.SHORT, java.util.Locale.FRANCE).format(quoteInstance.dateCreated).capitalize()}</p>
			<p>R&eacute;f&eacute;rence : ${quoteInstance.reference}</p>
	  		<p>Date d'execution : ${java.text.DateFormat.getDateInstance(java.text.DateFormat.SHORT, java.util.Locale.FRANCE).format(quoteInstance.dateExecution).capitalize()}</p>
			
	  		<strong>Remises</strong> ${quoteInstance.remise1} +  ${quoteInstance.remise2} <strong>Section 12</strong> ${quoteInstance.remise1Section12} +  ${quoteInstance.remise2Section12}
  		</div>
  	</div>
  	<div id="leftCol">
  	<div class="list">
  	<table>
  		<thead>
  		<tr>
  			<th>R&eacute;f&eacute;rence</th>
  			<th>Description</th>
  			<th>R&eacute;f&eacute;rence Thermador</th>
  			<th>Quantit&eacute;</th>
  			<th>Prix Indicatif</th>
  		</tr>
  		</thead>
  		<g:render template="product" collection="${quoteInstance.products}" var="insert"/>
  		<tr>
  			<td colspan="3"/> <td><strong>Total</strong></td><td>${String.format("%.2f",quoteInstance.total)}</td>
  		</tr>
  	</table>
  	</div>
  	<br/>
  	<g:each in="${quoteInstance.products}" var="product">
  		<div id="address">
  			${product.product.description}
  			<img alt="" src="${createLink(controller:'product', action:'imageUrl', id:product.product.id)}">
  		</div>
  	</g:each>
  	</div>
  
  </div>
</body>
</html>