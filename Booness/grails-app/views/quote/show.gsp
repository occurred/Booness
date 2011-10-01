<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>${quoteInstance.title}</title>
</head>
<body>
<div id="header">
Offre de Prix Installateur
<div id="action">
			<a href="${createLink(action:'edit', id:quoteInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
			<a target="_blank" href="${createLink(action:'print', id:quoteInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'printer.png', plugin: 'famfamfam')}'/></a>
		</div>
</div>
  <div class="body">
  	<div id="rightCol">
  		<g:render template="/compte/compte" model="${[compte:quoteInstance.affaire.compte]}"></g:render>
  		<br/>
  		<g:render template="/compte/contact" model="${[contact:quoteInstance.contact]}"></g:render>
  	</div>
  	<div id="leftCol">
  	<h2>Le ${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(quoteInstance.dateCreated).capitalize()}</h2>
	<h2>R&eacute;f&eacute;rence : ${quoteInstance.affaire.compte.name.toUpperCase()}-${quoteInstance.affaire.owner.initiales.toUpperCase()}-${quoteInstance.version}</h2>			
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
  			<td colspan="3"/><td>Total</td><td>${String.format("%.2f",total)}</td>
  		</tr>
  	</table>
  	</div>
  	</div>
  
  </div>
</body>
</html>