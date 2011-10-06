<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <title>${affaireInstance.name}</title>
    <meta content="main" name="layout"/>
  <fullcal:resources theme="smoothness"/>
  <jqui:resources/>

</head>
<body>
  <div id="header">
	  ${affaireInstance.name}
	  <div id="action">
	  		<a href="${createLink( action:'edit', id:affaireInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
	  </div>
  </div>
  
  <div id="rightCol">
  <g:render template="/compte/compte" model="${[compte:affaireInstance.compte]}"></g:render>
  </div>
  
  <div id="leftCol">
  <h2>${affaireInstance.description}</h2>
  <div class="small">par ${affaireInstance.owner}</div>
  <br/>
  
  <g:each in="${affaireInstance.quotes}" var="quote">
  	<div id="address">
  		<div id="action" affaire>
  			<a href="${createLink(controller:'quote', action:'edit', id:quote.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
  			<a href="${createLink(controller:'quote', action:'show', id:quote.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'application_go.png', plugin: 'famfamfam')}'/></a>
  		</div>
  		<h2>${quote.title} ${quote.total} &euro;</h2>
  	</div>
  </g:each>
  </div>
</body>
</html>
