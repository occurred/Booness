
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Affaires</title>
    </head>
    <body>
        <div class="body">
	        
	        <br/><br/>
	        <g:each in="${affaireInstanceList}" var="affaire">
		        <div id="address" style="width:250;display: inline-block;">
			        <g:link action="show" id="${affaire.id}">${affaire.name}</g:link> par ${affaire.owner.name}
			        <br/>
			        ${affaire.quotes?.size()} Devis
		        </div>
	        </g:each>
	        
	        <div class="paginateButtons">
	        	<g:paginate total="${affaireInstanceTotal}" params="${params}" />
	        </div>
        </div>
    </body>
</html>

