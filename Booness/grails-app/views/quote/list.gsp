
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Devis</title>
    </head>
    <body>
        <div class="body">
	        <div id="navigation">
	        	<div id="action">
					Trier par 
					<div id="address" style="display: inline-block;"><g:sortableColumn property="dateExecution" title="Date d'Execution" titleKey="quote.dateExecution" /><g:if test="${params.sort=='dateExecution'}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'arrow_'+(params.order=='asc'?'up':'down')+'.png', plugin: 'famfamfam')}'/></g:if></div>
	        	</div>
	        </div>
	        <br/><br/>
	        <g:each in="${quoteInstanceList}" var="quote">
		        <div id="address" style="width:250;display: inline-block;">
			        <g:link action="show" id="${quote.id}">${quote.title}</g:link> par ${quote.affaire.owner.name}
			        <br/>
			        <b>${quote.affaire.name}</b> pour <b>${quote.affaire.compte.name}</b>
			        <br/>
			        Prix : ${quote.total} &euro;
		        </div>
	        </g:each>
	        
	        <div class="paginateButtons">
	        	<g:paginate total="${quoteInstanceTotal}" params="${params}" />
	        </div>
        </div>
    </body>
</html>

